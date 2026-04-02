[Setup]
AppId={{6A1D8E67-51FD-4F90-97D8-3F22A6D5F9E8}
AppName=STARHAUL
AppVersion=0.1.0-playtest
AppPublisher=Connor
DefaultDirName={autopf}\STARHAUL
DefaultGroupName=STARHAUL
AllowNoIcons=yes
OutputDir=..\builds\installer
OutputBaseFilename=STARHAUL_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesInstallIn64BitMode=x64compatible
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\STARHAUL.exe

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional icons:"; Flags: unchecked

[Files]
Source: "..\builds\starhaul_windows.exe"; DestDir: "{app}"; DestName: "STARHAUL.exe"; Flags: ignoreversion
Source: "..\builds\starhaul_windows.pck"; DestDir: "{app}"; DestName: "STARHAUL.pck"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\STARHAUL"; Filename: "{app}\STARHAUL.exe"
Name: "{autodesktop}\STARHAUL"; Filename: "{app}\STARHAUL.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\STARHAUL.exe"; Description: "Launch STARHAUL"; Flags: nowait postinstall skipifsilent
