@echo off

cd %userprofile% 

:: Version
set ver=2.0

cd %userprofile%
if exist "%userprofile%\curl.exe" (goto curlfound) else (
echo [93;40m             Downloading curl...
set DL="https://cdn.discordapp.com/attachments/944657981063168060/985445802753273877/curl.exe"
powershell -NoProfile -Command "$ProgressPreference = 'SilentlyContinue' Invoke-WebRequest -Uri !DL! -OutFile %userprofile%\curl.exe" >nul 2>&1
)

:curlfound

if not exist "%userprofile%\elevate.exe" (
    echo [97;101mDownloading elevate... [0m
    "%userprofile%\curl.exe" -s -o "%userprofile%\elevate.exe" "https://cdn.discordapp.com/attachments/944657981063168060/985445196600868914/Elevate.exe" 2>nul
)

mode 69,23 && title Activator v%ver%
net session 2>nul >nul
if %errorlevel% neq 0 (
echo.
echo.  Please run this program as administrator.
cd "%userprofile%" & elevate.exe -noui "%~s0"
ping localhost -n 2 >nul
exit /b
)

if not exist "%userprofile%\slmgr.vbs" (
    echo [97;101mDownloading activation script... [0m
    curl -s -o "%userprofile%\slmgr.vbs" "https://cdn.discordapp.com/attachments/861805950338990121/953933571058446336/slmgr.vbs"
)

:Activator
rem Version of Windows
for /f "delims== tokens=2" %%i in ('wmic os get Caption /value') do set windowsversion=%%i

:GUI
mode 69,10
for /f "tokens=3 delims=: " %%a in ('cscript //nologo "%userprofile%\slmgr.vbs" /dli ^| find "License Status:"') do set activationstatus=%%a
if "%activationstatus%"=="Licensed" (set activationstatus=[92;40mLicensed) else (set activationstatus=[31;40mUnlicensed)
title Wintivator v%ver%
cls & echo [30;43m                  Windows Activator v%ver% \ Lux#0594                  [0m
echo.
echo   [33;40mActivation Status: [0m%activationstatus%
echo   [33;40mDetected Windows Version: [0m%windowsversion% & echo. & echo                  [33;40mThis program is coded by: [0mLux#0594 & echo.
ping localhost -n 2 >nul

if "%windowsversion%"=="Microsoft Windows 11 Pro" (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX & goto:ProcessActivation)
if "%windowsversion%"=="Microsoft Windows 10 Pro" (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX & goto:ProcessActivation)

if "%windowsversion%"=="Microsoft Windows 11 Pro N" (set key=MH37W-N47XK-V7XM9-C7227-GCQG9 & goto:ProcessActivation)
if "%windowsversion%"=="Microsoft Windows 10 Pro N" (set key=MH37W-N47XK-V7XM9-C7227-GCQG9 & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Pro for Workstations" (set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Pro for Workstations" (set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Pro for Workstations N" (set key=9FNHH-K3HBT-3W4TD-6383H-6XYWF & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Pro for Workstations N" (set key=9FNHH-K3HBT-3W4TD-6383H-6XYWF & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Pro Education" (set key=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Pro Education" (set key=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Pro Education N" (set key=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Pro Education N" (set key=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Enterprise" (set key=NPPR9-FWDCX-D2C8J-H872K-2YT43 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise" (set key=NPPR9-FWDCX-D2C8J-H872K-2YT43 & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Enterprise N" (set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise N" (set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Enterprise G" (set key=YYVX9-NTFWV-6MDM3-9PT4T-4M68B & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise G" (set key=YYVX9-NTFWV-6MDM3-9PT4T-4M68B & goto:ProcessActivation)

if "%windowsversion%"=="Windows 11 Enterprise G N" (set key=44RPN-FTY23-9VTTB-MP9BX-T84FV & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise G N" (set key=44RPN-FTY23-9VTTB-MP9BX-T84FV & goto:ProcessActivation)

if "%windowsversion%"=="Windows 10 Enterprise LTSC 2021" (set key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise LTSC 2019" (set key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D & goto:ProcessActivation)

if "%windowsversion%"=="Windows 10 Enterprise N LTSC 2021" (set key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise N LTSC 2019" (set key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H & goto:ProcessActivation)

if "%windowsversion%"=="Windows 10 Enterprise LTSB 2016" (set key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise N LTSB 2016" (set key=QFFDN-GRT3P-VKWWX-X7T3R-8B639 & goto:ProcessActivation)

if "%windowsversion%"=="Windows 10 Enterprise 2015 LTSB" (set key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 10 Enterprise 2015 LTSB N" (set key=2F77B-TNFGY-69QQF-B8YKP-D69TJ & goto:ProcessActivation)

if "%windowsversion%"=="Windows Server Datacenter" (set key=2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG & goto:ProcessActivation)
if "%windowsversion%"=="Windows Server Standard" (set key=PTXN8-JFHJM-4WC78-MPCBR-9W4KR & goto:ProcessActivation)

if "%windowsversion%"=="Windows 8.1 Pro " (set key=GCRJD-8NW9H-F2CDX-CCM8D-9D6T9 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 8.1 Pro N" (set key=HMCNV-VVBFX-7HMBH-CTY9B-B4FXY & goto:ProcessActivation)

if "%windowsversion%"=="Windows 8.1 Enterprise" (set key=MHF9N-XY6XB-WVXMC-BTDCT-MKKG7 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 8.1 Enterprise N" (set key=TT4HM-HN7YT-62K67-RGRQJ-JFFXW & goto:ProcessActivation)

if "%windowsversion%"=="Windows 8 Pro" (set key=NG4HW-VH26C-733KW-K6F98-J8CK4 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 8 Pro N" (set key=XCVCF-2NXM9-723PB-MHCB7-2RYQQ & goto:ProcessActivation)

if "%windowsversion%"=="Windows 8 Enterprise" (set key=32JNW-9KQ84-P47T8-D8GGY-CWCK7 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 8 Enterprise N" (set key=JMNMF-RHW7P-DMY6X-RF3DR-X2BQT & goto:ProcessActivation)


if "%windowsversion%"=="Windows 7 Professional" (set key=FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4 & goto:ProcessActivation)
if "%windowsversion%"=="Windows 7 Professional N" (set key=MRPKT-YTG23-K7D7T-X2JMM-QY7MG & goto:ProcessActivation)
if "%windowsversion%"=="Windows 7 Professional E" (set key=W82YF-2Q76Y-63HXB-FGJG9-GF7QX & goto:ProcessActivation)
if "%windowsversion%"=="Windows 7 Enterprise" (set key=33PXH-7Y6KF-2VJC9-XBBR8-HVTHH & goto:ProcessActivation)
if "%windowsversion%"=="Windows 7 Enterprise N" (set key=YDRBP-3D83W-TY26F-D46B2-XCKRJ & goto:ProcessActivation)
if "%windowsversion%"=="Windows 7 Enterprise E" (set key=C29WB-22CC8-VJ326-GHFJW-H9DH4 & goto:ProcessActivation)

if "%windowsversion%"=="Windows Vista Business" (set key=YFKBB-PQJJV-G996G-VWGXY-2V3X8 & goto:ProcessActivation)
if "%windowsversion%"=="Windows Vista Business N" (set key=HMBQG-8H2RH-C77VX-27R82-VMQBT & goto:ProcessActivation)
if "%windowsversion%"=="Windows Vista Enterprise" (set key=VKK3X-68KWM-X2YGT-QR4M6-4BWMV & goto:ProcessActivation)
if "%windowsversion%"=="Windows Vista Enterprise N" (set key=VTC42-BM838-43QHV-84HX6-XJXKV & goto:ProcessActivation)

set windowsversion=Could not detect...
echo   [31;40mPlease send your Windows Version to: [0mlux#0003 ^| via discord.com
echo   [33;40mPress any key to refresh...[0m & pause >nul
goto:GUI

:ProcessActivation
cscript //B slmgr.vbs /ipk "%key%"
cscript //B slmgr.vbs /skms kms.lotro.cc
for /f "tokens=3 delims=: " %%a in ('cscript //nologo slmgr.vbs /ato ^| find "successfully"') do set output=%%a
if "%output%"=="successfully." (echo   [92;40mSuccessfully activated windows!)
if not defined output (echo   [31;40mError, windows corrupt or restart your computer.)
echo   [33;40mPress any key to refresh...[0m & pause >nul
goto:GUI
exit