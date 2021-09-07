@echo off
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
CSCRIPT //nologo "%TempVBSFile%"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
taskkill /f /im explorer.exe >nul 2>&1
GOTO Activation
:Activation
wmic os get Caption | findstr /b /c:"Microsoft Windows 10" > winedition
set /p edition=<winedition
del winedition
cd /d "C:\Windows\System32"
if "%edition%" == "Microsoft Windows 10 Pro" goto Professional
if "%edition%" == "Microsoft Windows 10 Pro N" goto ProfessionalN
if "%edition%" == "Microsoft Windows 10 Enterprise" goto Enterprise
if "%edition%" == "Microsoft Windows 10 Enterprise N" goto Enterprise N
if "%edition%" == "Microsoft Windows 10 Home" goto Home/Core
if "%edition%" == "Microsoft Windows 10 Home (Country Specific)" goto Home/Core (Country Specific)
if "%edition%" == "Microsoft Windows 10 Home (Single Language)" goto Home/Core (Single Language)
if "%edition%" == "Microsoft Windows 10 Home N" goto Home/Core N
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Professional
cscript slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Professional N
cscript slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Enterprise
cscript slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Enterprise N
cscript slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core
cscript slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
set add_gpedit=1
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core (Country Specific)
cscript slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
set add_gpedit=1
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core (Single Language)
cscript slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
set add_gpedit=1
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core N
cscript slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul 2>&1
ECHO šrn Anahtar BaŸaryla Yklendi.!
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
ECHO Anahtar Y”netim Servisi Makine Ad BaŸaryla Ayarland.!
cscript slmgr.vbs /ato >nul 2>&1
ECHO Anahtar BaŸaryla EtkinleŸtirildi.!
set add_gpedit=1
GOTO UWP-Remove

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:UWP-Remove
takeown /F "C:\Program Files\WindowsApps\*" /R /D Y >nul 2>&1
icacls "C:\Program Files\WindowsApps\*" /inheritance:d /GRANT:r %username%:(F) /T /C >nul 2>&1
ECHO UWP ˜zinleri Ayarland.!
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.BingNews_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Bing News Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.BingWeather_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Bing Weather Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.549981C3F5F10_*") do rd /s /q "%%~G"
ECHO Cortana Kaldrld.!


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.GamingApp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.GamingApp_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Gaming App Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.GetHelp_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Get Help Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Getstarted_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Get Started Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MicrosoftOfficeHub_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Microsoft Office Hub Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MicrosoftSolitaireCollection_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Microsoft Solitaire Collection Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Paint* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Paint_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Microsoft Paint Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.People_*") do rd /s /q "%%~G" >nul 2>&1
ECHO KiŸiler Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.ScreenSketch_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Ekran Alnts Arac Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Todos_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Microsoft TODOS Kaldrld.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Windows.Photos_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Foto§raflar Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsAlarms_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Alarmlar ve Saat Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"  >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsCamera_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Kamera Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.windowscommunicationsapps_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Posta ve Takvim Kaldrld.!

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Geri Bildirim Merkezi Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsMaps_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Haritalar Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsSoundRecorder_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Ses Kaydedici Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Xbox.TCUI_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Xbox.TCUI Kaldrld.!
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Xbox Game Overlay Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxGamingOverlay_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Xbox Gaming Overlay Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxIdentityProvider_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Xbox Identity Provider Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxSpeechToTextOverlay_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Xbox Speech-to-Text Overlay Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.YourPhone_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Telefonunuz Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.ZuneMusic_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Groove Mzik Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.ZuneVideo_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Filmler ve TV Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Microsoft3DViewer_*") do rd /s /q "%%~G" >nul 2>&1
REG Delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\Namespace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f >nul 2>&1
REG Delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\Namespace{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f >nul 2>&1
ECHO 3B G”rntleyici Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MixedReality.Portal_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Mixed Reality Portal Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.SkypeApp_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Skype Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxApp_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Xbox Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Office.OneNote_*") do rd /s /q "%%~G" >nul 2>&1
ECHO One Note Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MicrosoftStickyNotes_*") do rd /s /q "%%~G" >nul 2>&1
ECHO YapŸkan Notlar Kaldrld.!

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MSPaint_*") do rd /s /q "%%~G" >nul 2>&1
ECHO Paint3D Kaldrld.!


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

taskkill /f /im OneDrive.exe >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
rd "%UserProfile%\OneDrive" /s /q >nul 2>&1
rd "%LocalAppData%\Microsoft\OneDrive" /s /q >nul 2>&1
rd "%ProgramData%\Microsoft OneDrive" /s /q >nul 2>&1
rd "C:\OneDriveTemp" /s /q >nul 2>&1
del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q >nul 2>&1
REG Delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >nul 2>&1
REG Delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f >nul 2>&1
REG ADD "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f >nul 2>&1
ECHO OneDrive Kaldrld.!
if "%add_gpedit%" == "1" GOTO AddGpedit
if NOT "%add_gpedit%" == "1" GOTO Windows-Update

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:AddGpedit
pushd "%Temp%"
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
cd /d "%Temp%"
for /f %%i in ('findstr /i . %Temp%\List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" >nul 2>&1
ECHO Yerel Grup ˜lkesi Dzenleyici Eklendi.!
GOTO Windows-Update

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:Windows-Update
curl --output %Temp%\GroupPolicy.zip https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/GroupPolicy.zip?inline=false  >nul 2>&1
setlocal
cd /d %~dp0
Call :UnZipFile "%Temp%" "%Temp%\GroupPolicy.zip"
exit /b
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
Xcopy /E /I %Temp%\GroupPolicy C:\Windows\System32\GroupPolicy >nul 2>&1
rmdir /s /q %Temp%\GroupPolicy >nul 2>&1
del /s /q %Temp%\GroupPolicy.zip >nul 2>&1
net stop wuauserv >nul 2>&1
del /f /s /q %Windir%\SoftwareDistribution >nul 2>&1
net start wuauserv >nul 2>&1
ECHO Windows Update Ayarlar Uyguland.!
GOTO Service-And-Telemetry

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Service-And-Telemetry
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "TrkWks" >nul 2>&1
sc config "TrkWks" start= demand >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "FDResPub" >nul 2>&1
sc config "FDResPub" start= demand >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "iphlpsvc" >nul 2>&1
sc config "iphlpsvc" start= disabled >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "MapsBroker" >nul 2>&1
sc config "MapsBroker" start= disabled >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "DPS" >nul 2>&1
sc config "DPS" start= disabled >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "WerSvc" >nul 2>&1
sc config "WerSvc" start= disabled >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "TabletInputService" >nul 2>&1
sc config "TabletInputService" start= disabled >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "dmwappushsvc" >nul 2>&1
sc config "dmwappushsvc" start= disabled >nul 2>&1
sc delete dmwappushsvc >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "diagtrack" >nul 2>&1
sc config "diagtrack" start= disabled >nul 2>&1
sc delete diagtrack >nul 2>&1
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
ECHO Telemetry ve Servisler Ayarland.!
GOTO Cplusplus

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Cplusplus

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))
:::::::_32-BIT_:::::::

curl --output %Temp%\2005_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2005_x86.exe >nul 2>&1
start /wait %Temp%\2005_x86.exe /q >nul 2>&1
del /s /q %Temp%\2005_x86.exe >nul 2>&1
ECHO Visual C++ 2005 32Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2008_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2008_x86.exe >nul 2>&1
start /wait %Temp%\2008_x86.exe /q >nul 2>&1
del /s /q %Temp%\2008_x86.exe >nul 2>&1
ECHO Visual C++ 2008 32Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2010_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2010_x86.exe >nul 2>&1
start /wait %Temp%\2010_x86.exe /q >nul 2>&1
del /s /q %Temp%\2010_x86.exe >nul 2>&1
ECHO Visual C++ 2010 32Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2012_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2012_x86.exe >nul 2>&1
start /wait %Temp%\2012_x86.exe /q >nul 2>&1
del /s /q %Temp%\2012_x86.exe >nul 2>&1
ECHO Visual C++ 2012 32Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2013_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2013_x86.exe >nul 2>&1
start /wait %Temp%\2013_x86.exe /q >nul 2>&1
del /s /q %Temp%\2013_x86.exe >nul 2>&1
ECHO Visual C++ 2013 32Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2015-9_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2015_2017_2019_x86.exe >nul 2>&1
start /wait %Temp%\2015-9_x86.exe /q >nul 2>&1
del /s /q %Temp%\2015-9_x86.exe >nul 2>&1
ECHO Visual C++ 2015 32Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if "%IS_X64%" == "1" goto X64
if NOT "%IS_X64%" == "1" goto END
:::::::_64-BIT_:::::::
:X64
curl --output %Temp%\2005_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2005_x64.exe >nul 2>&1
start /wait %Temp%\2005_x64.exe /q >nul 2>&1
del /s /q %Temp%\2005_x64.exe >nul 2>&1
ECHO Visual C++ 2005 64Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2008_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2008_x64.exe >nul 2>&1
start /wait %Temp%\2008_x64.exe /q >nul 2>&1
del /s /q %Temp%\2008_x64.exe >nul 2>&1
ECHO Visual C++ 2008 64Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2010_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2010_x64.exe >nul 2>&1
start /wait %Temp%\2010_x64.exe /q >nul 2>&1
del /s /q %Temp%\2010_x64.exe >nul 2>&1
ECHO Visual C++ 2010 64Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2012_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2012_x64.exe >nul 2>&1
start /wait %Temp%\2012_x64.exe /q >nul 2>&1
del /s /q %Temp%\2012_x64.exe >nul 2>&1
ECHO Visual C++ 2012 64Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2013_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2013_x64.exe >nul 2>&1
start /wait %Temp%\2013_x64.exe /q >nul 2>&1
del /s /q %Temp%\2013_x64.exe >nul 2>&1
ECHO Visual C++ 2013 64Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl --output %Temp%\2015-9_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2015_2017_2019_x64.exe >nul 2>&1
start /wait %Temp%\2015-9_x64.exe /q >nul 2>&1
del /s /q %Temp%\2015-9_x64.exe >nul 2>&1
ECHO Visual C++ 2013 64Bit Kuruldu.!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GOTO END

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:END
ECHO Visual C++ Paketleri Kuruldu
ECHO ˜Ÿlemler Tamamland. Herhangi bir tuŸa basarak Sistemi Yeniden BaŸlatn.!
pause >nul 2>&1
shutdown.exe /r /t 00