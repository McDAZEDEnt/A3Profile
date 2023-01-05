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

echo Enter new profile name:
set /p NewName=	-)
setx a3name "%NewName%"
cd /d "%ROOTDIR%"
taskkill /F /IM explorer.exe & start explorer
cd ..\
ren %OldName% %NewName%
pause