@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set OldName=%%~nxI
echo %OldName%
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

taskkill /f /im "Dropbox.exe"
taskkill /f /im "DropboxUpdate.exe"
net stop DbxSvc
sc stop DbxSvc
taskkill /F /IM explorer.exe & start explorer

echo Enter new profile name:
set /p NewName=	-)
setx a3name "%NewName%"
cd /d "%ROOTDIR%"
del /s /q /f .vars.Arma3Profile
del /s /q /f %NewName%.Arma3Profile
del /s /q /f %NewName%.3den.Arma3Profile
git stash
git checkout main
git pull origin
ren McDAZED.Arma3Profile %NewName%.Arma3Profile
ren McDAZED.3den.Arma3Profile %NewName%.3den.Arma3Profile
cd ..\
ren %OldName% %NewName%
pause