@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

:start
setlocal enableextensions
for /f "tokens=3*" %%a in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 107410" /v InstallLocation ^| Find "InstallLocation"') do SET REG=%%a %%b

echo "%REG%"
echo .
echo .
SET correct=
SET /p correct=Is the Arma 3 path correct? [Y/N]:
IF NOT '%correct%'=='' SET correct=%correct:~0,1%
IF '%correct%'=='Y' GOTO yes
IF '%correct%'=='y' GOTO yes
IF '%correct%'=='N' GOTO no
IF '%correct%'=='n' GOTO no
IF '%correct%'=='' GOTO no
ECHO "%correct%" is not valid
ECHO.
GOTO start

:yes
setx arma3 "%REG%"
GOTO end

:no
echo .
echo .
echo	Where is Arma 3 installed? (filepath with no quotes)
echo	(If unsure, open Steam and right click on Arma 3.)
set /p PASTE=	-)
setx arma3 "%PASTE%"
GOTO end

:end
echo	Done!
pause
exit