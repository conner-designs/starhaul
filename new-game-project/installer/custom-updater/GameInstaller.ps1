Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$GameName = "Starhaul"
$Publisher = "Conner Designs"
$ManifestUrl = "https://conner-designs.github.io/starhaul/manifest.json"
$EntryExecutable = "starhaul_windows.exe"

$commonPath = Join-Path $PSScriptRoot "lib\GameInstall.Common.ps1"
. $commonPath

$paths = Get-InstallPaths -Publisher $Publisher -GameName $GameName

function Copy-InstallerFiles {
    param([Parameter(Mandatory = $true)][object]$Paths)

    Ensure-Directory -Path $Paths.Root

    $libSource = Join-Path $PSScriptRoot "lib"
    $libTarget = Join-Path $Paths.Root "lib"

    if (Test-Path -LiteralPath $libTarget) {
        Remove-Item -LiteralPath $libTarget -Recurse -Force
    }

    Copy-Item -LiteralPath $libSource -Destination $libTarget -Recurse -Force
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot "Launch-Starhaul.ps1") -Destination $Paths.LauncherPath -Force
}

function Install-Game {
    param(
        [Parameter(Mandatory = $true)][System.Windows.Forms.Label]$StatusLabel,
        [Parameter(Mandatory = $true)][System.Windows.Forms.Button]$InstallButton,
        [Parameter(Mandatory = $true)][System.Windows.Forms.Form]$Form
    )

    $InstallButton.Enabled = $false
    $StatusLabel.Text = "Downloading latest release..."
    $Form.Refresh()

    $manifest = Get-RemoteManifest -ManifestUrl $ManifestUrl

    $StatusLabel.Text = "Installing files..."
    $Form.Refresh()

    $config = Install-ManifestRelease `
        -Manifest $manifest `
        -Paths $paths `
        -Publisher $Publisher `
        -GameName $GameName `
        -ManifestUrl $ManifestUrl

    Copy-InstallerFiles -Paths $paths

    $launcher = "powershell.exe"
    $launcherArgs = "-ExecutionPolicy Bypass -File `"$($paths.LauncherPath)`""
    $desktop = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktop "$GameName.lnk"
    $exePath = Get-ResolvedEntryExecutablePath -GamePath $paths.GamePath -EntryExecutable $config.entryExecutable

    New-DesktopShortcut `
        -ShortcutPath $shortcutPath `
        -TargetPath $launcher `
        -Arguments $launcherArgs `
        -WorkingDirectory $paths.Root `
        -IconLocation $exePath

    $StatusLabel.Text = "Installed $GameName $($config.installedVersion)"
    [System.Windows.Forms.MessageBox]::Show(
        "$GameName has been installed successfully.",
        "$GameName Installer",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information
    ) | Out-Null
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "$GameName Installer"
$form.StartPosition = "CenterScreen"
$form.Size = New-Object System.Drawing.Size(480, 240)
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

$title = New-Object System.Windows.Forms.Label
$title.Text = "Install $GameName"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 15, [System.Drawing.FontStyle]::Bold)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(24, 20)
$form.Controls.Add($title)

$body = New-Object System.Windows.Forms.Label
$body.Text = "This installs the latest hosted Starhaul build and creates a desktop shortcut with automatic updates."
$body.Size = New-Object System.Drawing.Size(420, 48)
$body.Location = New-Object System.Drawing.Point(24, 60)
$form.Controls.Add($body)

$pathLabel = New-Object System.Windows.Forms.Label
$pathLabel.Text = "Install location: $($paths.Root)"
$pathLabel.Size = New-Object System.Drawing.Size(420, 40)
$pathLabel.Location = New-Object System.Drawing.Point(24, 108)
$form.Controls.Add($pathLabel)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready."
$statusLabel.Size = New-Object System.Drawing.Size(420, 24)
$statusLabel.Location = New-Object System.Drawing.Point(24, 148)
$form.Controls.Add($statusLabel)

$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "Install"
$installButton.Size = New-Object System.Drawing.Size(100, 32)
$installButton.Location = New-Object System.Drawing.Point(260, 176)
$form.Controls.Add($installButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "Cancel"
$cancelButton.Size = New-Object System.Drawing.Size(100, 32)
$cancelButton.Location = New-Object System.Drawing.Point(368, 176)
$cancelButton.Add_Click({ $form.Close() })
$form.Controls.Add($cancelButton)

$installButton.Add_Click({
    try {
        Install-Game -StatusLabel $statusLabel -InstallButton $installButton -Form $form
        $installButton.Enabled = $true
    }
    catch {
        $installButton.Enabled = $true
        $statusLabel.Text = "Install failed."
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed.`r`n`r`n$($_.Exception.Message)",
            "$GameName Installer Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        ) | Out-Null
    }
})

[void]$form.ShowDialog()
