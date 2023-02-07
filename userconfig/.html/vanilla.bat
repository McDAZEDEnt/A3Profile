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

taskkill /f /im Dropbox.exe
taskkill /f /im DropboxUpdate.exe
taskkill /f /im wenativehost.exe
taskkill /f /im fdm.exe
taskkill /f /im helperservice.exe
net stop DbxSvc
sc stop DbxSvc

start "" "steam://rungameid/"

cd /d "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%"

del /s /q /f %a3name%.vars.Arma3Profile

timeout /t 12

@echo on

"%arma3%\Arma3_x64.exe" -noSplash -name=%a3name% -filePatching -world=VR 

timeout /t 3

taskkill /f /im steam.exe
taskkill /f /im arma3launcher.exe
