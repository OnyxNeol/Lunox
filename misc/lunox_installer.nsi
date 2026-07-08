; Lunox Windows Installer
; Built with NSIS (makensis). Installs a portable Lunox build into
; %LOCALAPPDATA%\Lunox, adds Start Menu + Desktop shortcuts, and an uninstaller.
; Expects to be run from a directory that contains a "Lunox\" folder
; (the extracted contents of Lunox-windows-x64.zip) plus "luanti-icon.ico".

!ifndef VERSION_STRING
!define VERSION_STRING "0.0.0"
!endif

Name "Lunox"
OutFile "Lunox-windows-setup.exe"
InstallDir "$LOCALAPPDATA\Lunox"
RequestExecutionLevel user
SetCompressor /SOLID lzma
Icon "luanti-icon.ico"
UninstallIcon "luanti-icon.ico"

VIAddVersionKey "ProductName" "Lunox"
VIAddVersionKey "CompanyName" "Lunox community"
VIAddVersionKey "FileDescription" "Lunox installer"
VIAddVersionKey "FileVersion" "${VERSION_STRING}"
VIProductVersion "0.0.0.0"
VIFileVersion "0.0.0.0"

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "Install"
	SetOutPath "$INSTDIR"
	File /r "Lunox\*.*"

	CreateDirectory "$SMPROGRAMS\Lunox"
	CreateShortCut "$SMPROGRAMS\Lunox\Lunox.lnk" "$INSTDIR\bin\luanti.exe" "" "$INSTDIR\bin\luanti.exe" 0
	CreateShortCut "$SMPROGRAMS\Lunox\Uninstall Lunox.lnk" "$INSTDIR\uninstall.exe"
	CreateShortCut "$DESKTOP\Lunox.lnk" "$INSTDIR\bin\luanti.exe" "" "$INSTDIR\bin\luanti.exe" 0

	WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
	RMDir /r "$INSTDIR"
	Delete "$SMPROGRAMS\Lunox\Lunox.lnk"
	Delete "$SMPROGRAMS\Lunox\Uninstall Lunox.lnk"
	RMDir "$SMPROGRAMS\Lunox"
	Delete "$DESKTOP\Lunox.lnk"
SectionEnd
