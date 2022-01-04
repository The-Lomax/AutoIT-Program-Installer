#include <INet.au3>
#Include <WinAPI.au3>
#include <Date.au3>
#include <Array.au3>
#include <GuiButton.au3>
#include <GuiEdit.au3>
#include <Process.au3>
#include <GuiToolBar.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

; main window
$guiapi = GUICreate("Kryniu's Program Installer", 230, 330, 192, 124)

;left side
$instchrome = GUICtrlCreateCheckbox("Chrome", 8, 8, 97, 17)
$instfirefox = GUICtrlCreateCheckbox("FireFox", 8, 32, 97, 17)
$instvlc = GUICtrlCreateCheckbox("VLC", 8, 56, 97, 17)
$instslmdrv = GUICtrlCreateCheckbox("n/a", 8, 80, 97, 17)
$instflash = GUICtrlCreateCheckbox("FlashPlayer", 8, 104, 97, 17)
$instreader = GUICtrlCreateCheckbox("AdobeReader", 8, 128, 97, 17)
$instvc15 = GUICtrlCreateCheckbox("VC++ 2015", 8, 152, 97, 17)
$instoem = GUICtrlCreateCheckbox("OEM Info", 8, 176, 97, 17)
$instskype = GUICtrlCreateCheckbox("Skype", 8, 200, 97, 17)
$instcwagent = GUICtrlCreateCheckbox("ConnectWise", 8, 224, 97, 17)

;right side
$insttdr = GUICtrlCreateCheckbox("WatchGuard", 128, 8, 97, 17)
$instfsec = GUICtrlCreateCheckbox("F-Secure", 128, 32, 97, 17)
$instarduino = GUICtrlCreateCheckbox("Arduino S/W", 128, 56, 97, 17)
$instscratch = GUICtrlCreateCheckbox("Scratch", 128, 80, 97, 17)
$instminecraft = GUICtrlCreateCheckbox("Minecraft EDU", 128, 104, 97, 17)
$instunity = GUICtrlCreateCheckbox("Unity Hub", 128, 128, 97, 17)
$Checkbox19 = GUICtrlCreateCheckbox("", 128, 152, 97, 17)
$instwinupdate = GUICtrlCreateCheckbox("Win Updates", 128, 176, 97, 17)
$getcomname = GUICtrlCreateCheckbox("Rename PC", 128, 200, 97, 17)
$restorevac = GUICtrlCreateCheckbox("RestoreUAC", 128, 224, 97, 17)

;bottom buttons and status label
$statuslbl = GUICtrlCreateLabel("Status: Waiting", 8, 248, 170, 18)
$btnopenuac = GUICtrlCreateButton("Open UAC", 30, 280, 80, 30)
$btninstall = GUICtrlCreateButton("Install", 120, 280, 80, 30)
GUISetState(@SW_SHOW)

Global $code, $newpcname

While 1
	$r = GUIGetMsg()
	Switch $r
		Case $GUI_EVENT_CLOSE
			Exit
		Case $getcomname
			$cs = GUICtrlRead($getcomname)
			If $cs = 1 Then
				$newpcname = InputBox ("New PC Name", "Enter your new PC name")
			EndIf
		Case $btnopenuac
			Send ("#r")
			WinWait ("Run")
			WinActivate ("Run")
			Send ("useraccountcontrolsettings")
			Sleep (300)
			Send ("{Enter}")
		Case $instfsec
			$cs = GUICtrlRead($instfsec)
			If $cs = 1 Then
				$code = InputBox ("F-Secure Installer", "Enter your F-Secure Subscription Key")
			EndIf
		Case $btninstall
			$cs = GUICtrlRead($instchrome)
			if ($cs = 1) Then
				InstallChrome()
			EndIf
			$cs = GUICtrlRead($instfirefox)
			if ($cs = 1) Then
				InstallFirefox()
			EndIf
			$cs = GUICtrlRead($instvlc)
			if ($cs = 1) Then
				InstallVLC()
			EndIf
			$cs = GUICtrlRead($instslmdrv)
			if ($cs = 1) Then
				;nothing
			EndIf
			$cs = GUICtrlRead($instflash)
			if ($cs = 1) Then
				InstallFlash()
			EndIf
			$cs = GUICtrlRead($instreader)
			if ($cs = 1) Then
				InstallAdobeReader()
			EndIf
			$cs = GUICtrlRead($instvc15)
			if ($cs = 1) Then
				InstallVC15()
			EndIf
			$cs = GUICtrlRead($instoem)
			if ($cs = 1) Then
				InstallOEMinfo()
			EndIf
			$cs = GUICtrlRead($instskype)
			if ($cs = 1) Then
				InstallSkype()
			EndIf
			$cs = GUICtrlRead($instfsec)
			if ($cs = 1) Then
				InstallFsecure()
			EndIf
			$cs = GUICtrlRead($instarduino)
			if ($cs = 1) Then
				InstallArduino()
			EndIf
			$cs = GUICtrlRead($instscratch)
			if ($cs = 1) Then
				InstallScratch()
			EndIf
			$cs = GUICtrlRead($instunity)
			if ($cs = 1) Then
				InstallUnityHub()
			EndIf
			$cs = GUICtrlRead($instminecraft)
			if ($cs = 1) Then
				InstallMinecraft()
			EndIf
			Sleep(7000)
			$cs = GUICtrlRead($getcomname)
			if ($cs = 1) Then
				GetComputerName()
			EndIf
			$cs = GUICtrlRead($instcwagent)
			if ($cs = 1) Then
				InstallCWAgent()
			EndIf
			$cs = GUICtrlRead($insttdr)
			if ($cs = 1) Then
				InstallTDR()
			EndIf
			$cs = GUICtrlRead($instwinupdate)
			if ($cs = 1) Then
				InstallWinUpdates()
			EndIf
			Sleep(3000)
			$cs = GUICtrlRead($restorevac)
			$cs = 1
			if ($cs = 1) Then
				RestoreUAC()
			EndIf
			GUICtrlSetData($statuslbl, "Status: Completed.")
	EndSwitch
WEnd

Func InstallChrome()
	GUICtrlSetData($statuslbl, "Status: Installing Chrome")
	Opt("WinTitleMatchMode",2)
	Sleep(3000)
	$thetitle="Welcome to Chrome - Google Chrome"
	ShellExecute("Programs\chrome.exe")
	WinWait($thetitle)
	Sleep(1000)
	WinSetState($thetitle,"",@SW_MAXIMIZE)
	Sleep(2000)
	WinClose($thetitle)
	Sleep(2000)
	Send("#r")
	WinWait("Run")
	Sleep(500)
	Send("ms-settings:defaultapps")
	Sleep(100)
	Send("{Enter}")
	WinWait("Settings")
	Sleep(7000)
	For $i=1 to 5
	   Send("{Tab}")
	   Sleep(200)
	Next
	Sleep(1000)
	Send("{Space}")
	Sleep(500)
	Send("{Tab}")
	Sleep(1000)
	Send("{Space}")
	Sleep(2000)
	Send("{Tab}")
	Sleep(1000)
	Send("{Space}")
	Sleep(2000)
	WinClose("Settings")
	Return
EndFunc

Func InstallFirefox()
	GUICtrlSetData($statuslbl, "Status: Installing Firefox")
	Opt("WinTitleMatchMode",2)
	ShellExecute("Programs\firefox.exe")
	WinWait ("Mozilla Firefox")
	Sleep (7000)
	WinActivate("Mozilla Firefox")
	Sleep(2000)
	Send ("^w")
	Sleep (200)
	Send ("^w")
	Return
EndFunc

Func InstallVLC()
	GUICtrlSetData($statuslbl, "Status: Installing VLC")
	Opt("WinTitleMatchMode",2)
	Local $title
	Sleep(3000)
	ShellExecute("Programs\vlcsetup.exe")
	$title = "Installer Language"
	WinWait($title)
	Sleep(1000)
	WinActivate($title)
	Sleep(1000)
	If WinExists($title,"Please select a language") Then
		Sleep(500)
		Send("{Enter}")
	EndIf
	$title = "VLC media player Setup"
	WinWait($title,"Welcome to VLC media player Setup")
	Sleep(1000)
	WinActivate($title)
	Sleep(1000)
	Send("{Enter 2}")
	Sleep(200)
	Send("{Tab}")
	Sleep(100)
	Send("{DOWN 4}")
	Sleep(100)
	Send("{Space}")
	Sleep(200)
	Send("{Enter 2}")
	Sleep(1000)
	WinWait($title,"VLC media player has been installed on your computer")
	If WinExists($title,"VLC media player has been installed on your computer") Then
		Sleep(500)
		Send("{Space}")
		Sleep(200)
		Send("{Enter}")
	EndIf
	Return
EndFunc

Func InstallFlash()
	GUICtrlSetData($statuslbl, "Status: Installing Flash Player")
	Opt("WinTitleMatchMode",2)
	Local $title
	Local $deccolor = 0
	Sleep(3000)
	Run(".\Programs\Adobe\flashplayer32pp_xa_install.exe")
	$title = "Adobe Flash Player Installer"
	WinWait($title)
	WinActivate ($title)
	$hwnd = WinGetHandle($title)
	Sleep(1000)
	Do
		$winPos = WinGetPos($title)
		$result = PixelSearch($winPos[0]+396, $winPos[1]+313, $winPos[0]+584, $winPos[1]+340, 0xFCBE16, 10, 1, $hwnd)
		$errorFlag = @error
	Until $errorFlag <> 1
	Sleep(1500)
	ControlSend($hwnd, "", "", "{Tab 4}")
	Sleep(500)
	ControlSend($hwnd, "", "", "{Enter}")
	Sleep(2500)
	Do
		$winPos = WinGetPos($title)
		$result = PixelSearch($winPos[0]+396, $winPos[1]+313, $winPos[0]+584, $winPos[1]+340, 0xFCBE16, 10, 1, $hwnd)
		$errorFlag = @error
	Until $errorFlag <> 1
	Sleep(1500)
	ControlSend($title, "", "", "{Tab}{Enter}")
	Sleep(1000)
	WinWait ("Download Adobe Flash")
	Sleep (500)
	WinClose ("Download Adobe Flash")
	Return
EndFunc

Func InstallAdobeReader()
	GUICtrlSetData($statuslbl, "Status: Installing Adobe Reader")
	Opt("WinTitleMatchMode",2)
	Local $title
	$title = "Adobe Acrobat Reader DC Installer"
	Sleep(3000)
	Run(".\Programs\Adobe\readerdc_uk_xa_crd_install.exe")
	WinWait($title)
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Do
		$winPos = WinGetPos($title)
		$result = PixelSearch($winPos[0]+396, $winPos[1]+313, $winPos[0]+584, $winPos[1]+340, 0xFCBE16, 10, 1, $hwnd)
		$errorFlag = @error
	Until $errorFlag <> 1
	Sleep(1500)
	ControlSend($hwnd, "", "", "{Tab 2}")
	Sleep(200)
	ControlSend($hwnd, "", "", "{Space}")
	Sleep(200)
	ControlSend($hwnd, "", "", "{Tab}")
	Sleep(200)
	ControlSend($hwnd, "", "", "{Enter}")
	Sleep(2000)
	WinWait ("Download Adobe Acrobat Reader")
	Sleep (500)
	WinClose("Download Adobe Acrobat Reader")
	Return
EndFunc

Func InstallVC15()
	GUICtrlSetData($statuslbl, "Status: Installing VC++")
	Local $vc[2]
	Local $title
	$title = "Microsoft Visual C"
	Opt("WinTitleMatchMode",2)
	$vc[0]="Programs\vc\2015x86.exe"
	$vc[1]="Programs\vc\2015x64.exe"
	For $i=0 to 1
		Sleep(3000)
		ShellExecute($vc[$i])
		WinWait($title)
		Sleep(1000)
		WinActivate($title)
		Sleep (1000)
		$hwnd = WinGetHandle($title)
		If WinExists ($title,"license terms and conditions") Then
			Sleep(1000)
			ControlSend($hwnd, "", "", "!a")
			Sleep(200)
			ControlSend($hwnd, "", "", "!i")
			Sleep (150)
		EndIf
		Sleep(2000)
		If WinExists($title,"Another version of this product is already installed") Then
			Sleep(500)
			Send("!c")
		Else
			WinWait($title,"Setup Successful")
			Sleep(500)
			If WinExists($title,"Setup Successful") Then
				WinActivate($title)
				Sleep(500)
				ControlSend($hwnd, "", "", "!c")
			EndIf
		EndIf
	Next
	Return
EndFunc

Func InstallOEMinfo()
	GUICtrlSetData($statuslbl, "Status: Installing OEM Info")
	Opt("WinTitleMatchMode",2)
	Sleep(3000)
	Run("info.bat")
	WinWait("cmd.exe")
	Sleep(500)
	WinActivate ("cmd.exe")
	Sleep(1000)
	Send("f")
	For $i=1 to 3
		Sleep(1000)
		Send("{Enter}")
	Next
	Return
EndFunc

Func InstallSkype()
	GUICtrlSetData($statuslbl, "Status: Installing Skype")
	Opt("WinTitleMatchMode",2)
	Sleep(3000)
	ShellExecute("Programs\skypex.exe")
	WinWait("Installing Skype")
	Sleep (1000)
	WinActivate ("Installing Skype")
	Sleep(500)
	Send("{Enter}")
	For $i=1 to 3
		Send ("{Tab}")
		Sleep (200)
		Send ("{Space}")
		Sleep (200)
	Next
	$lilcount=0
	Sleep(2000)
	Do
		If (WinExists("Installing Skype")) Then
			$lilcount=0
		Else
			$lilcount+=1
		EndIf
		Sleep(1000)
	Until $lilcount=3
	WinWait ("Skype")
	Sleep (2000)
	WinClose ("Skype")
	Return
EndFunc

Func InstallAgent()
	GUICtrlSetData($statuslbl, "Status: Installing Use-IT Agent")
	Opt("WinTitleMatchMode",2)
	Sleep(3000)
	Run ("C:\Windows\system32\cmd.exe")
	WinWait ("cmd.exe")
	Sleep (2000)
	Send ("cd /d " & @ScriptDir & "\Programs")
	Sleep (200)
	Send ("{Enter}")
	Sleep (500)
	Send ("247agent.exe /s")
	Sleep (200)
	Send ("{Enter}")
	Sleep (10000)
	WinClose ("cmd.exe")
	Return
EndFunc

Func InstallArduino()
	GUICtrlSetData($statuslbl, "Status: Installing Adruino")
	Opt("WinTitleMatchMode",2)
	Sleep (3000)
	ShellExecute ("Programs\arduinoSetup.exe")
	Sleep(1000)
	$title = "Arduino Setup: License Agreement"
	WinWait($title, "review the license agreement before installing Arduino")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!a")
	$title = "Arduino Setup: Installation Options"
	WinWait($title, "Check the components you want to install and uncheck the components")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!n")
	$title = "Arduino Setup: Installation Folder"
	WinWait($title, "will install Arduino in the following folder")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!i")
	$title = "Arduino Setup: Installing"
	WinWait($title)
	Sleep(1500)
	$title = "Windows Security"
	For $i = 1 to 3
		WinWait($title, "You should only install driver software from publishers you trust")
		WinActivate($title)
		$hwnd = WinGetHandle($title)
		Sleep(500)
		ControlSend($hwnd, "", "", "!i")
		Sleep(2500)
	Next
	$title = "Arduino Setup: Completed"
	WinWait($title, "Completed")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!c")
EndFunc

Func InstallFsecure()
	GUICtrlSetData($statuslbl, "Status: Installing F-Secure AV")
	Opt("WinTitleMatchMode",2)
	Sleep (3000)
	ShellExecute ("Programs\fSecureTPA.msi")
	$title = "F-Secure Client Security 13.10 Setup"
	WinWait ($title, "Welcome to the F-Secure Client Security 13.10 Setup Wizard")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!n")
	WinWait ($title, "Ready to Install")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!i")
	WinWait ($title, "Installation completed successfully")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!f")
	Return
EndFunc

Func InstallScratch()
	GUICtrlSetData($statuslbl, "Status: Installing Scratch IDE")
	Opt("WinTitleMatchMode",2)
	Sleep (3000)
	ShellExecute ("Programs\scratchSetup.exe")
	$title = "Scratch Desktop Setup"
	WinWait ($title, "Please select whether you wish to make this software available to all users or just yourself")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!a")
	Sleep(250)
	ControlSend($hwnd, "", "", "!i")
	Sleep(3500)
	WinWait($title, "Scratch Desktop has been installed on your computer")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "{Space}")
	Sleep(250)
	ControlSend($hwnd, "", "", "!f")
EndFunc

Func InstallUnityHub()
	GUICtrlSetData($statuslbl, "Status: Installing Unity")
	Opt("WinTitleMatchMode",2)
	Sleep (3000)
	ShellExecute ("Programs\unitySetup.exe")
	$title = "Unity Hub Setup"
	WinWait ($title, "Please review the license terms before installing")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!a")
	WinWait ($title, "Choose Install Location")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!i")
	WinWait ($title, "Unity Hub has been installed on your computer")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "{Space}")
	Sleep(250)
	ControlSend($hwnd, "", "", "!f")
EndFunc

Func InstallMinecraft()
	GUICtrlSetData($statuslbl, "Status: Installing Minecraft: EDU")
	Opt("WinTitleMatchMode",2)
	Sleep (3000)
	ShellExecute ("Programs\minecraftSetup.exe")
	$title = "Minecraft: Education Edition Setup"
	WinWait ($title, "Select the setup language")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!n")
	Sleep(3000)
	WinWait ($title, "The Setup Wizard will install Minecraft")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!n")
	WinWait ($title, "Please read the following license agreement carefully")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!a")
	Sleep(250)
	ControlSend($hwnd, "", "", "!n")
	WinWait ($title, "Select Installation Folder")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!n")
	WinWait ($title, "Create application shortcuts")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!n")
	WinWait ($title, "Ready to Install")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "!i")
	WinWait ($title, "Click the Finish button to exit the Setup Wizard")
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1500)
	ControlSend($hwnd, "", "", "{Tab}")
	Sleep(250)
	ControlSend($hwnd, "", "", "{Space}")
	Sleep(250)
	ControlSend($hwnd, "", "", "!f")
EndFunc

Func GetComputerName()
	GUICtrlSetData($statuslbl, "Status: Renaming PC")
	Opt("WinTitleMatchMode",2)
	Sleep(3000)
	Local $name = @ComputerName
	Sleep(500)
	Run ("C:\Windows\system32\cmd.exe")
	WinWait ("cmd.exe")
	Sleep (3000)
	Send ("WMIC computersystem where caption=" & Chr(34) & $name & Chr(34) & " rename " & Chr(34) & $newpcname & Chr(34))
	Sleep (1000)
	Send ("{Enter}")
	Sleep (3000)
	WinClose ("cmd.exe")
	Return
EndFunc

Func InstallCWAgent()
	GUICtrlSetData($statuslbl, "Status: Installing ConnectWise")
	Opt("WinTitleMatchMode",2)
	Sleep(3000)
	$title = "Software Remote Agent Setup"
	Sleep(500)
	ShellExecute ("Programs\cwinstallers\G2T.MSI")
	WinWait ($title, "Welcome to the LabTech® Software Remote Agent")
	Sleep (3000)
	WinActivate($title)
	$hwnd = WinGetHandle($title)
	Sleep(1000)
	For $i = 0 to 2
		Sleep(2333)
		Send("{Enter}")
	Next
	WinWait ($title, "Click the Finish button to exit the Setup Wizard")
	Sleep(2000)
	ControlSend($title, "", "", "{Enter}")
	Return
EndFunc

Func InstallTDR()
	GUICtrlSetData($statuslbl, "Status: Installing WatchGuard TDR")
	Sleep(3000)
	$controllerAddress = "tdr-hsc-eu.watchguard.com:443"
	Opt("WinTitleMatchMode",2)
	$fopen = FileOpen(@Workingdir & "\Programs\TDR\Go2T.txt")
	$line = FileReadLine($fopen, 1)
	$fclose = FileClose($fopen)
	Sleep(1000)
	$title = "WatchGuard Threat Detection and Response Setup"
	ShellExecute("Programs\TDR\Go2T.msi")
	Sleep(4000)
	WinWait($title)
	Sleep(1000)
	WinActivate($title)
	WinGetHandle($title)
	Sleep(1000)
	ControlSend($title, "", "", "{Enter}")
	Sleep(1500)
	ControlSend($title, "", "", $line)
	Sleep(333)
	ControlSend($title, "", "", "{Tab}")
	Sleep(333)
	ControlSend($title, "", "", $controllerAddress)
	Sleep(333)
	ControlSend($title, "", "", "{Enter}")
	Sleep(3000)
	WinWait($title, "Completed")
	Sleep(2333)
	Send("{Enter}")
	Return
EndFunc

Func RestoreUAC()
	Sleep(3000)
	Send ("#r")
	WinWait ("Run")
	WinActivate ("Run")
	Send ("useraccountcontrolsettings")
	Sleep (300)
	Send ("{Enter}")
	WinWait ("User Account Control Settings")
	Sleep (2000)
	Send ("{Tab}")
	Sleep (200)
	Send ("{Up 2}")
	Sleep (200)
	Send ("{Tab}")
	Sleep (200)
	Send ("{Enter}")
EndFunc

Func InstallWinUpdates()
	For $i = 1 to 2
		Sleep(3000)
		Send("#r")
		WinWait("Run")
		Sleep(1500)
		Send("ms-settings:windowsupdate-action")
		Sleep(1500)
		Send("{Enter}")
		Sleep(5000)
	Next
EndFunc
