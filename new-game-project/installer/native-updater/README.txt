Starhaul native installer/bootstrap

This replaces the raw PowerShell-facing installer flow with a native Windows EXE.

Files:
- StarhaulBootstrap.cs
- build_native_installer.ps1

What it does:
- install latest release from the live manifest
- create a desktop shortcut
- use the same EXE as the launcher with --launch
- check for updates on launch
- install updates from GitHub Releases
- launch the game

Build:
powershell -ExecutionPolicy Bypass -File .\new-game-project\installer\native-updater\build_native_installer.ps1

Output:
- new-game-project\installer\native-updater\StarhaulInstaller.exe

Installer source URLs:
- manifest: https://conner-designs.github.io/starhaul/manifest.json
- release zips: GitHub Releases
