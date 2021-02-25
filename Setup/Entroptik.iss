; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Entroptik"
#define MyAppVersion "2.1"
#define MyAppPublisher "bradmartin333"
#define MyAppURL "https://github.com/bradmartin333"
#define MyAppExeName "Entroptik.exe"
#define MyAppAssocName MyAppName + " Workspace"
#define MyAppAssocExt ".ew"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C8376C65-2716-4DDA-8687-D26232BEC1BF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
OutputDir=C:\Repos\Entroptik\Setup
OutputBaseFilename=EntroptikSetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\Entroptik.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\Entroptik.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\Entroptik.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\Entroptik.runtimeconfig.dev.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\Entroptik.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\MathNet.Numerics.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Repos\Entroptik\Entroptik\bin\Release\net5.0-windows\Tips.txt"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

