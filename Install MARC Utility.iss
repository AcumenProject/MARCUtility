; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8C809EDC-BCA5-4434-9FEC-5CDE9B1EFD1D}
AppName=MARC Utility
AppVerName=MARC Utility 0.5.0.16
AppPublisher=University of Alabama Libraries
AppPublisherURL=http://lb-416-003.lib.ua-net.ua.edu/notes/?f=MARC%20Utility.txt
AppSupportURL=http://lb-416-003.lib.ua-net.ua.edu/notes/?f=MARC%20Utility.txt
AppUpdatesURL=http://lb-416-003.lib.ua-net.ua.edu/notes/?f=MARC%20Utility.txt
DefaultDirName={pf}\MARC Utility
DefaultGroupName=MARC Utility
OutputDir=C:\Documents and Settings\taloewald\Desktop\Utilities\MARC Utility
OutputBaseFilename=Install MARC Utility
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Documents and Settings\taloewald\Desktop\Utilities\MARC Utility\Builds - MARC Utility.rbvcp\Windows\MARC Utility\MARC Utility.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\taloewald\Desktop\Utilities\MARC Utility\Builds - MARC Utility.rbvcp\Windows\MARC Utility\MARC Utility Libs\*"; DestDir: "{app}\MARC Utility Libs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Documents and Settings\taloewald\Desktop\Utilities\MARC Utility\Voyager Macros\*"; DestDir: "{app}\Voyager Macros"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\MARC Utility"; Filename: "{app}\MARC Utility.exe"
Name: "{group}\{cm:ProgramOnTheWeb,MARC Utility}"; Filename: "http://lb-416-003.lib.ua-net.ua.edu/notes/?f=MARC%20Utility.txt"
Name: "{group}\{cm:UninstallProgram,MARC Utility}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\MARC Utility"; Filename: "{app}\MARC Utility.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\MARC Utility"; Filename: "{app}\MARC Utility.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\MARC Utility.exe"; Description: "{cm:LaunchProgram,MARC Utility}"; Flags: nowait postinstall skipifsilent

