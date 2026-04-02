STARHAUL Inno Setup installer

Files:
- STARHAUL.iss: main installer script
- build_installer.ps1: wrapper that runs the Inno compiler

Expected export files:
- builds\starhaul_windows.exe
- builds\starhaul_windows.pck

How to use:
1. Install Inno Setup 6.
2. Export the latest Windows build from Godot.
3. Run:
   powershell -ExecutionPolicy Bypass -File .\installer\build_installer.ps1

The installer will be written to:
- builds\installer\STARHAUL_Setup.exe

Notes:
- Desktop shortcut is optional during install.
- The installer currently uses the exported EXE + PCK pair.
- AppVersion in STARHAUL.iss is easy to update before each release.
