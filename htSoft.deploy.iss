; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define projectPath "c:\opt\src\htSoft\"
#define deployPath "c:\opt\build\htSoft\deploy"
#define outPath "c:\opt\htSoftDistro\"

#define MyAppName "Hardness Tester Software"
#define MyAppVersion "1.0 rc"
#define MyAppPublisher "Mubatec GmbH."
#define MyAppURL "http://www.mubatec.de"
#define MyAppExeName "htSoft.exe"
#define BuildNum Int(ReadIni(outPath + "\\BuildInfo.ini","Info","Build","0"))
#expr BuildNum = BuildNum + 1
#expr WriteIni(outPath + "\\BuildInfo.ini","Info","Build", BuildNum)
#define BuildDate GetDateTimeString('yyyy.mm.dd', '', '');

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3616CE8A-E9F8-4C97-88E9-66F42716D4EF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Mubatec Hardness Tester Software
DefaultGroupName={#MyAppName}
OutputDir={#outPath}
OutputBaseFilename=htSoft installer {#BuildNum} {#BuildDate}
SetupIconFile={#projectPath}\resources\icon.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; OnlyBelowVersion: 0,6.1

[Files]
Source: {#deployPath}\*.exe; DestDir: "{app}"; Flags: ignoreversion
Source: {#deployPath}\*.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#deployPath}\platforms\*.dll; DestDir: "{app}\platforms"; Flags: ignoreversion
Source: {#deployPath}\imageformats\*.dll; DestDir: "{app}\imageformats"; Flags: ignoreversion
Source: {#deployPath}\libfem.dll; DestDir: "{app}"; Flags: ignoreversion
Source: {#deployPath}\..\femGrids\setka6.st; DestDir: "{app}\femGrids"; Flags: ignoreversion
Source: {#deployPath}\..\femGrids\setka9.st; DestDir: "{app}\femGrids"; Flags: ignoreversion
; FANN stuff
Source: {#deployPath}\fann.ini; DestDir: "{app}"; Flags: ignoreversion
Source: {#deployPath}\ann05_5_2.fann; DestDir: "{app}"; Flags: ignoreversion
;Source: {#fannDir}\bin\libdoublefann.dll; DestDir: "{app}"; Flags: ignoreversion
;Source: {#fannDir}\bin\libfann.dll; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Dirs]
Name: "{sd}\htData"; Flags: uninsneveruninstall

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent