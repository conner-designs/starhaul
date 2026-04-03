Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$GameName = "Starhaul"
$Publisher = "Conner Designs"
$ManifestUrl = "https://conner-designs.github.io/starhaul/manifest.json"
$EntryExecutable = "starhaul_windows.exe"

$commonPath = Join-Path $PSScriptRoot "lib\GameInstall.Common.ps1"
. $commonPath

try {
    $paths = Get-InstallPaths -Publisher $Publisher -GameName $GameName
    $config = Read-InstallConfig -ConfigPath $paths.ConfigPath
    $manifest = Get-RemoteManifest -ManifestUrl $ManifestUrl

    $needsUpdate = Test-IsUpdateRequired -Manifest $manifest -Config $config
    if ($needsUpdate) {
        $config = Install-ManifestRelease `
            -Manifest $manifest `
            -Paths $paths `
            -Publisher $Publisher `
            -GameName $GameName `
            -ManifestUrl $ManifestUrl
    }

    $entryExecutable = if ($config -and $config.entryExecutable) { $config.entryExecutable } else { $EntryExecutable }
    $gameExe = Get-ResolvedEntryExecutablePath -GamePath $paths.GamePath -EntryExecutable $entryExecutable

    Start-Process -FilePath $gameExe -WorkingDirectory (Split-Path -Parent $gameExe) | Out-Null
}
catch {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show(
        "Failed to launch or update $GameName.`r`n`r`n$($_.Exception.Message)",
        "$GameName Launcher Error",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Error
    ) | Out-Null
    exit 1
}
