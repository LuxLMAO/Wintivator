@echo off

cd %userprofile% 

:: Version
set ver=1.3

::Run CMD in 32-Bit
set SystemPath=%SystemRoot%\System32
if not "%ProgramFiles(x86)%"=="" (if exist %SystemRoot%\Sysnative\* set SystemPath=%SystemRoot%\Sysnative)
if not %processor_architecture%==AMD64 (
%SystemPath%\cmd.exe /c "%~s0"
exit /b
)

cd %userprofile%
if exist "%sd%\curl.exe" (goto curlfound) else (
echo [93;40m             Downloading curl...
set DL="https://cdn.discordapp.com/attachments/944657981063168060/985445802753273877/curl.exe"
powershell -NoProfile -Command "$ProgressPreference = 'SilentlyContinue' Invoke-WebRequest -Uri !DL! -OutFile %sd%\curl.exe" >nul 2>&1
)

:curlfound

if not exist "%userprofile%\elevate.exe" (
    echo [97;101mDownloading elevate... [0m
    "%sd%\curl.exe" -s -o "%userprofile%\elevate.exe" "https://cdn.discordapp.com/attachments/944657981063168060/985445196600868914/Elevate.exe" 2>nul
)

mode 69,23 && title Activator
net session 2>nul >nul
if %errorlevel% neq 0 (
echo.
echo.  Please run this program as administrator.
cd %userprofile% & elevate -noui "%~s0"
ping localhost -n 2 >nul
exit /b
)

if not exist "%userprofile%\slmgr.vbs" (
    echo [97;101mDownloading activation script... [0m
    curl -s -o "slmgr.vbs" "https://cdn.discordapp.com/attachments/861805950338990121/953933571058446336/slmgr.vbs"
)

color 05

:menu
title Windows Activator \ v%ver%
cls
echo [30;43m                  Windows Activator v%ver% \ Lux#0594                  [0m
echo.
echo                    [33;40m[1][0m Home/Core
echo                    [33;40m[2][0m Home/Core (Country Specific)
echo                    [33;40m[3][0m Home/Core (Single Language)
echo                    [33;40m[4][0m Home/Core N
echo                    [33;40m[5][0m Professional
echo                    [33;40m[6][0m Professional N
echo                    [33;40m[7][0m Enterprise
echo                    [33;40m[8][0m Enterprise N
echo                    [33;40m[9][0m Education
echo                    [33;40m[A][0m Education N
echo                    [33;40m[B][0m Enterprise 2015 LTSB
echo                    [33;40m[C][0m Enterprise 2015 LTSB N
echo                    [33;40m[D][0m Enterprise 2016 LTSB
echo                    [33;40m[E][0m Enterprise 2016 LTSB N
echo.
echo                            [33;40m[F][0m Version
echo.
set /p input="[33;40m[-->][0m "

if /I "%input%"=="" goto menu

if /I "%input%"=="1" goto 1
if /I "%input%"=="2" goto 2
if /I "%input%"=="3" goto 3
if /I "%input%"=="4" goto 4
if /I "%input%"=="5" goto 5
if /I "%input%"=="6" goto 6
if /I "%input%"=="7" goto 7
if /I "%input%"=="8" goto 8
if /I "%input%"=="9" goto 9
if /I "%input%"=="A" goto A
if /I "%input%"=="B" goto B
if /I "%input%"=="C" goto C
if /I "%input%"=="D" goto D
if /I "%input%"=="E" goto E
if /I "%input%"=="F" start shell:::{bb06c0e4-d293-4f75-8a90-cb05b6477eee} && goto menu

:1
set v=
set v=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
goto process
:2
set v=
set v=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
goto process
:3
set v=
set v=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
goto process
:4
set v=
set v=3KHY7-WNT83-DGQKR-F7HPR-844BM
goto process
:5
set v=
set v=W269N-WFGWX-YVC9B-4J6C9-T83GX
goto process
:6
set v=
set v=MH37W-N47XK-V7XM9-C7227-GCQG9
goto process
:7
set v=
set v=NPPR9-FWDCX-D2C8J-H872K-2YT43
goto process
:8
set v=
set v=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
goto process
:9
set v=
set v=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
goto process
:A
set v=
set v=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
goto process
:B
set v=
set v=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
goto process
:C
set v=
set v=2F77B-TNFGY-69QQF-B8YKP-D69TJ
goto process
:D
set v=
set v=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
goto process
:E
set v=
set v=QFFDN-GRT3P-VKWWX-X7T3R-8B639
goto process

:process
cls
color 06
cscript slmgr.vbs /ipk "%v%"
cscript slmgr.vbs /skms kms.lotro.cc
cscript slmgr.vbs /ato
pause
goto menu