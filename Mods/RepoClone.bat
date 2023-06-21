@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

echo .
echo Type the AUTHOR of the repository as it is displayed in the URL
echo .
echo 	i.e 'McDAZEDEnt' from Github.com/McDAZEDEnt/BadGuys1
echo .
set /p author= -)

echo .
echo Type the name of the REPOSITORY as it is displayed in the URL
echo .
echo 	i.e 'BadGuys1' from Github.com/McDAZEDEnt/BadGuys1
echo .
set /p repo= -)

setx NOSYNC "%ROOTDIR%\%repo%"
pause

git clone --depth 1 https://github.com/%author%/%repo%.git

start "" Powershell.exe -executionpolicy unrestricted -File dbx.ps1

pause