@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

echo	Where is Arma 3 installed? (filepath with no quotes)
echo	(If unsure, open Steam and right click on Arma 3.)
set /p A3=	-)
setx Arma3 "%A3%"

echo	Done!
pause
