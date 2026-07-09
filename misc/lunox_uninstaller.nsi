; Lunox Standalone Uninstaller
; Wipes a Lunox install clean: install dir, Start Menu shortcuts, Desktop
; shortcut. Works even if the original install's own uninstall.exe was lost.

Name "Lunox Uninstaller"
OutFile "Lunox-Uninstaller.exe"
InstallDir "$LOCALAPPDATA\Lunox"
RequestExecutionLevel user
SetCompressor /SOLID lzma
Icon "luanti-icon.ico"
UninstallIcon "luanti-icon.ico"

VIAddVersionKey "ProductName" "Lunox Uninstaller"
VIAddVersionKey "CompanyName" "Lunox community"
VIAddVersionKey "FileDescription" "Standalone Lunox uninstaller"
VIProductVersion "0.0.0.0"
VIFileVersion "0.0.0.0"

Page instfiles

Section "Uninstall Lunox"
	DetailPrint "Removing Lunox from $INSTDIR ..."
	RMDir /r "$INSTDIR"

	Delete "$SMPROGRAMS\Lunox\Lunox.lnk"
	Delete "$SMPROGRAMS\Lunox\Uninstall Lunox.lnk"
	RMDir "$SMPROGRAMS\Lunox"
	Delete "$DESKTOP\Lunox.lnk"

	MessageBox MB_OK|MB_ICONINFORMATION \
		"Lunox has been completely removed from your computer.$\r$\n$\r$\n\
People uninstall apps just like you but we dont judge, no questions just happy you have opened it once even if it was a one sec$\r$\n$\r$\n\
By Onyxl"
SectionEnd
