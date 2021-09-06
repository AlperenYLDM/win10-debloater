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
SET title=WÝNDOWS10 TWEAKER BY MAJORASTRON
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%00\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
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
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.echo Product Key Activated Successfully.
echo %print%
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Professional N
cscript slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Enterprise
cscript slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Enterprise N
cscript slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core
cscript slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
set add_gpedit=1
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core (Country Specific)
cscript slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
set add_gpedit=1
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core (Single Language)
cscript slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
set add_gpedit=1
GOTO UWP-Remove
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Home/Core N
cscript slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%01\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=Product Key Installed Successfully.
echo %print%
cscript slmgr.vbs /skms kms.lotro.cc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%02\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Key Management Service Machine Name Set Successfully.
echo %print%
cscript slmgr.vbs /ato >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%03\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Product Key Activated Successfully.
echo %print%
set add_gpedit=1
GOTO UWP-Remove

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:UWP-Remove
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%04\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Setting Permissions for UWP Apps.
echo %print%
takeown /F "C:\Program Files\WindowsApps\*" /R /D Y >nul 2>&1
icacls "C:\Program Files\WindowsApps\*" /inheritance:d /GRANT:r %username%:(F) /T /C >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%05\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Permissions Set for UWP Apps.
echo %print%
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.BingNews_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #******\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%06\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Bing News Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.BingWeather_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*******\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%07\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Bing Weather Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.549981C3F5F10_*") do rd /s /q "%%~G"
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #********\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%08\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Cortana Removed..
echo %print%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.GamingApp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.GamingApp_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*********\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%09\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Gaming App Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.GetHelp_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**********\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%10\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Gaming App Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Getstarted_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%12\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Get Started Removed..
echo %print%
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MicrosoftOfficeHub_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*************\\\\\\\\\\\\\\\\\\\\\\\\\\\\%%13\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Office Hub Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MicrosoftSolitaireCollection_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***************\\\\\\\\\\\\\\\\\\\\\\\\\\%%14\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Microsoft Solitaire Collection Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Paint* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Paint_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************\\\\\\\\\\\\\\\\\\\\\\\\\%%15\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Paint Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.People_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************\\\\\\\\\\\\\\\\\\\\\\\\%%16\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.People App Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.ScreenSketch_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #******************\\\\\\\\\\\\\\\\\\\\\\\%%17\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Snipping Tool Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Todos_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*******************\\\\\\\\\\\\\\\\\\\\\\%%18\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Todos Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Windows.Photos_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #********************\\\\\\\\\\\\\\\\\\\\\%%19\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Photos Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsAlarms_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*********************\\\\\\\\\\\\\\\\\\\\%%20\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Alarms and Clock Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"  >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsCamera_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**********************\\\\\\\\\\\\\\\\\\\%%21\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Camera Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.windowscommunicationsapps_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***********************\\\\\\\\\\\\\\\\\\%%22\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Mail and Calender Removed..
echo %print%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #************************\\\\\\\\\\\\\\\\\%%23\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Feedback Center Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsMaps_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*************************\\\\\\\\\\\\\\\\%%24\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Maps Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.WindowsSoundRecorder_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**************************\\\\\\\\\\\\\\\%%25\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Voice Recorder Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Xbox.TCUI_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***************************\\\\\\\\\\\\\\%%26\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Xbox.TCUI Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************\\\\\\\\\\\\\%%27\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Xbox Game Bar Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxGamingOverlay_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************\\\\\\\\\\\\%%28\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Xbox Game Bar Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxIdentityProvider_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #******************************\\\\\\\\\\\%%29\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Xbox Identity Provider Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxSpeechToTextOverlay_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*******************************\\\\\\\\\\%%30\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Xbox Speech To Text Overlay Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.YourPhone_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #********************************\\\\\\\\\%%31\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Your Phone Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.ZuneMusic_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*********************************\\\\\\\\%%32\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Groove Music Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.ZuneVideo_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**********************************\\\\\\\%%33\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Movies and TV Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Microsoft3DViewer_*") do rd /s /q "%%~G" >nul 2>&1
REG Delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\Namespace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f >nul 2>&1
REG Delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\Namespace{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***********************************\\\\\\%%34\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.3D Viewer Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MixedReality.Portal_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #************************************\\\\\%%35\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Mixed Reality Portal Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.SkypeApp_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*************************************\\\\%%36\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Skype Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.XboxApp_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #**************************************\\\%%37\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Xbox Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.Office.OneNote_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #***************************************\\%%38\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.One Note Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MicrosoftStickyNotes_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%39\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Sticky Notes Removed..
echo %print%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

powershell -command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage" >nul 2>&1
for /d %%G in ("C:\Program Files\WindowsApps\Microsoft.MSPaint_*") do rd /s /q "%%~G" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%40\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Paint3D Removed..
echo %print%


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
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%41\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.OneDrive Removed..
echo %print%
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
GOTO Windows-Update

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:Windows-Update
curl --output %Temp%\  >nul 2>&1
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
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%42\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Windows Update Settings Applied..
echo %print%
GOTO Service-And-Telemetry

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Service-And-Telemetry
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%43\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "TrkWks" >nul 2>&1
sc config "TrkWks" start= demand >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%44\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "FDResPub" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%45\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
sc config "FDResPub" start= demand >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%46\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "iphlpsvc" >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%47\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
sc config "iphlpsvc" start= disabled >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #****************************************\%%48\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "MapsBroker" >nul 2>&1
sc config "MapsBroker" start= disabled >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%49\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "DPS" >nul 2>&1
sc config "DPS" start= disabled >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%50\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "WerSvc" >nul 2>&1
sc config "WerSvc" start= disabled >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%51\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "TabletInputService" >nul 2>&1
sc config "TabletInputService" start= disabled >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%52*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sc stop "dmwappushsvc" >nul 2>&1
sc config "dmwappushsvc" start= disabled >nul 2>&1
sc delete dmwappushsvc >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%53**\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sc stop "diagtrack" >nul 2>&1
sc config "diagtrack" start= disabled >nul 2>&1
sc delete diagtrack >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%54***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%55***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Services and Telemetry Settings Applied..
echo %print%
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
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%56***\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2008_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2008_x86.exe >nul 2>&1
start /wait %Temp%\2008_x86.exe /q >nul 2>&1
del /s /q %Temp%\2008_x86.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%57****\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2010_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2010_x86.exe >nul 2>&1
start /wait %Temp%\2010_x86.exe /q >nul 2>&1
del /s /q %Temp%\2010_x86.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%58*****\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2012_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2012_x86.exe >nul 2>&1
start /wait %Temp%\2012_x86.exe /q >nul 2>&1
del /s /q %Temp%\2012_x86.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%59******\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2013_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2013_x86.exe >nul 2>&1
start /wait %Temp%\2013_x86.exe /q >nul 2>&1
del /s /q %Temp%\2013_x86.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%65************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2015-9_x86.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2015_2017_2019_x86.exe >nul 2>&1
start /wait %Temp%\2015-9_x86.exe /q >nul 2>&1
del /s /q %Temp%\2015-9_x86.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%70*****************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.32Bit Visual C Runtimes Installed..
echo %print%
if "%IS_X64%" == "1" goto X64
if NOT "%IS_X64%" == "1" goto END
:::::::_64-BIT_:::::::
:X64
curl --output %Temp%\2005_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2005_x64.exe >nul 2>&1
start /wait %Temp%\2005_x64.exe /q >nul 2>&1
del /s /q %Temp%\2005_x64.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%75**********************\\\\\\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2008_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2008_x64.exe >nul 2>&1
start /wait %Temp%\2008_x64.exe /q >nul 2>&1
del /s /q %Temp%\2008_x64.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%80***************************\\\\\\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2010_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2010_x64.exe >nul 2>&1
start /wait %Temp%\2010_x64.exe /q >nul 2>&1
del /s /q %Temp%\2010_x64.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%85********************************\\\\\\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2012_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2012_x64.exe >nul 2>&1
start /wait %Temp%\2012_x64.exe /q >nul 2>&1
del /s /q %Temp%\2012_x64.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%90*************************************\\\\\\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2013_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2013_x64.exe >nul 2>&1
start /wait %Temp%\2013_x64.exe /q >nul 2>&1
del /s /q %Temp%\2013_x64.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%95******************************************\\\\\\\#
echo #---------------------------------------------------------------------------------------------#
echo %print%
curl --output %Temp%\2015-9_x64.exe https://gitlab.com/A.Alperen.YLDM/windows10-my-GPO/-/raw/main/vcredist2015_2017_2019_x64.exe >nul 2>&1
start /wait %Temp%\2015-9_x64.exe /q >nul 2>&1
del /s /q %Temp%\2015-9_x64.exe >nul 2>&1
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%99************************************************\#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.64Bit Visual C Runtimes Installed..
echo %print%
GOTO END

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:END
cls
echo %title%
echo #---------------------------------------------------------------------------------------------#
echo #*****************************************%%100************************************************#
echo #---------------------------------------------------------------------------------------------#
SET print=%print% & echo.Transactions Completed. Reboot system by pressing any Key Installed..
echo %print%
pause >nul 2>&1
shutdown.exe /r /t 00