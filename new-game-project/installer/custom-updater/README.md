# Starhaul Custom Updater

This folder contains a custom Windows installer and auto-updater for Starhaul.

It is separate from the older Inno Setup files in `installer\`.

## What To Commit

Commit this folder and the manifest generator script in `tools\`.

Do not commit exported builds or generated zip files.

## What You Upload For Each Playtest Build

Upload these two files somewhere your testers can download them:

- `starhaul_windows_build.zip`
- `manifest.json`

The zip must contain the full Godot Windows export, including:

- `starhaul_windows.exe`
- `starhaul_windows.pck`
- any extra DLLs or exported files

## Files

- `GameInstaller.ps1`
  Installs the latest hosted Starhaul build.
- `Launch-Starhaul.ps1`
  Checks for updates, installs them, and launches the game.
- `lib\GameInstall.Common.ps1`
  Shared install and update logic.
- `templates\manifest.example.json`
  Example manifest shape.
- `..\..\tools\New-StarhaulReleaseManifest.ps1`
  Generates a real `manifest.json` from your build zip.

## Setup

This updater is configured to read the live manifest from:

- `https://conner-designs.github.io/starhaul/manifest.json`

Release packages are expected to live on GitHub Releases using this pattern:

- `https://github.com/conner-designs/starhaul/releases/download/vX.Y.Z/starhaul_windows_build.zip`

Prepare a release package and manifest with:

```powershell
.\new-game-project\tools\Prepare-StarhaulGitHubRelease.ps1 `
  -Version "0.1.0" `
  -Tag "v0.1.0"
```

That script will:

- create `new-game-project\builds\release\starhaul_windows_build.zip`
- generate `docs\manifest.json`
- point the manifest at the matching GitHub Release asset URL

Repo-side setup included in this project:

- `docs\manifest.json`
- `docs\index.html`
- `.github\workflows\deploy-pages.yml`

Important:

- GitHub Pages still needs to be enabled for this repo if it is not already
- the release zip still needs to be uploaded to a GitHub Release for each version
