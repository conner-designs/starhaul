Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-InstallPaths {
    param(
        [Parameter(Mandatory = $true)][string]$Publisher,
        [Parameter(Mandatory = $true)][string]$GameName
    )

    $root = Join-Path $env:LOCALAPPDATA "Games\$Publisher\$GameName"
    $configPath = Join-Path $root "install-config.json"
    $gamePath = Join-Path $root "current"
    $stagingPath = Join-Path $root "staging"
    $downloadPath = Join-Path $root "downloads"
    $launcherPath = Join-Path $root "Launch-Starhaul.ps1"

    [pscustomobject]@{
        Root         = $root
        ConfigPath   = $configPath
        GamePath     = $gamePath
        StagingPath  = $stagingPath
        DownloadPath = $downloadPath
        LauncherPath = $launcherPath
    }
}

function Ensure-Directory {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function Read-InstallConfig {
    param([Parameter(Mandatory = $true)][string]$ConfigPath)

    if (-not (Test-Path -LiteralPath $ConfigPath)) {
        return $null
    }

    Get-Content -LiteralPath $ConfigPath -Raw | ConvertFrom-Json
}

function Write-InstallConfig {
    param(
        [Parameter(Mandatory = $true)][string]$ConfigPath,
        [Parameter(Mandatory = $true)][object]$Config
    )

    $json = $Config | ConvertTo-Json -Depth 10
    Set-Content -LiteralPath $ConfigPath -Value $json -Encoding UTF8
}

function Get-RemoteManifest {
    param([Parameter(Mandatory = $true)][string]$ManifestUrl)

    $response = Invoke-WebRequest -Uri $ManifestUrl -UseBasicParsing
    $response.Content | ConvertFrom-Json
}

function Get-FileSha256Hex {
    param([Parameter(Mandatory = $true)][string]$Path)

    (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash.ToLowerInvariant()
}

function Download-ReleasePackage {
    param(
        [Parameter(Mandatory = $true)][string]$PackageUrl,
        [Parameter(Mandatory = $true)][string]$DestinationPath
    )

    Invoke-WebRequest -Uri $PackageUrl -OutFile $DestinationPath -UseBasicParsing
}

function Expand-ReleasePackage {
    param(
        [Parameter(Mandatory = $true)][string]$ZipPath,
        [Parameter(Mandatory = $true)][string]$DestinationPath
    )

    if (Test-Path -LiteralPath $DestinationPath) {
        Remove-Item -LiteralPath $DestinationPath -Recurse -Force
    }

    New-Item -ItemType Directory -Path $DestinationPath | Out-Null
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $DestinationPath -Force
}

function Get-ResolvedEntryExecutablePath {
    param(
        [Parameter(Mandatory = $true)][string]$GamePath,
        [Parameter(Mandatory = $true)][string]$EntryExecutable
    )

    $directPath = Join-Path $GamePath $EntryExecutable
    if (Test-Path -LiteralPath $directPath) {
        return $directPath
    }

    $match = Get-ChildItem -LiteralPath $GamePath -Recurse -File |
        Where-Object { $_.Name -ieq $EntryExecutable } |
        Select-Object -First 1

    if ($null -eq $match) {
        throw "Entry executable '$EntryExecutable' was not found under '$GamePath'."
    }

    $match.FullName
}

function Install-ManifestRelease {
    param(
        [Parameter(Mandatory = $true)][object]$Manifest,
        [Parameter(Mandatory = $true)][object]$Paths,
        [Parameter(Mandatory = $true)][string]$Publisher,
        [Parameter(Mandatory = $true)][string]$GameName,
        [Parameter(Mandatory = $true)][string]$ManifestUrl
    )

    Ensure-Directory -Path $Paths.Root
    Ensure-Directory -Path $Paths.DownloadPath

    $zipName = "release-$($Manifest.version).zip"
    $zipPath = Join-Path $Paths.DownloadPath $zipName

    Download-ReleasePackage -PackageUrl $Manifest.packageUrl -DestinationPath $zipPath

    $actualHash = Get-FileSha256Hex -Path $zipPath
    $expectedHash = $Manifest.sha256.ToLowerInvariant()
    if ($actualHash -ne $expectedHash) {
        throw "SHA-256 mismatch. Expected '$expectedHash' but got '$actualHash'."
    }

    Expand-ReleasePackage -ZipPath $zipPath -DestinationPath $Paths.StagingPath

    if (Test-Path -LiteralPath $Paths.GamePath) {
        Remove-Item -LiteralPath $Paths.GamePath -Recurse -Force
    }

    Move-Item -LiteralPath $Paths.StagingPath -Destination $Paths.GamePath

    $config = [pscustomobject]@{
        publisher        = $Publisher
        gameName         = $GameName
        installedVersion = $Manifest.version
        manifestUrl      = $ManifestUrl
        entryExecutable  = $Manifest.entryExecutable
        lastUpdatedUtc   = [DateTime]::UtcNow.ToString("o")
    }

    Write-InstallConfig -ConfigPath $Paths.ConfigPath -Config $config
    $config
}

function Test-IsUpdateRequired {
    param(
        [Parameter(Mandatory = $true)][object]$Manifest,
        [Parameter()][object]$Config
    )

    if ($null -eq $Config) {
        return $true
    }

    if ([string]::IsNullOrWhiteSpace($Config.installedVersion)) {
        return $true
    }

    try {
        $remoteVersion = [Version]$Manifest.version
        $localVersion = [Version]$Config.installedVersion
        return $remoteVersion -gt $localVersion
    }
    catch {
        return $Manifest.version -ne $Config.installedVersion
    }
}

function New-DesktopShortcut {
    param(
        [Parameter(Mandatory = $true)][string]$ShortcutPath,
        [Parameter(Mandatory = $true)][string]$TargetPath,
        [Parameter(Mandatory = $true)][string]$Arguments,
        [Parameter(Mandatory = $true)][string]$WorkingDirectory,
        [Parameter()][string]$IconLocation
    )

    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $TargetPath
    $shortcut.Arguments = $Arguments
    $shortcut.WorkingDirectory = $WorkingDirectory

    if ($IconLocation) {
        $shortcut.IconLocation = $IconLocation
    }

    $shortcut.Save()
}
