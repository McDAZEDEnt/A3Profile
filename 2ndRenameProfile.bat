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

taskkill /f /im "Dropbox.exe"
taskkill /f /im "DropboxUpdate.exe"
net stop DbxSvc
sc stop DbxSvc

echo Enter new profile name:
set /p name=	-)
setx a3name "%name%"
cd /d "%USERPROFILE%/Documents/Arma 3 - Other Profiles/%CurrDirName%"
del /s /q /f %CurrDirName%.vars.Arma3Profile
ren %CurrDirName%.Arma3Profile %name%.Arma3Profile
ren %CurrDirName%.3den.Arma3Profile %name%.3den.Arma3Profile
cd /d "%USERPROFILE%/Documents/Arma 3 - Other Profiles"
ren %CurrDirName% %name%
