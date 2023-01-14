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

cd /d "%ROOTDIR%"
taskkill /f /im "Dropbox.exe"
taskkill /f /im explorer.exe

echo Enter new profile name:
set /p NewName=	-)
setx a3name "%NewName%"

cd /d ..\
ren %OldName% %NewName%

%SystemRoot%\explorer.exe "%userprofile%\Documents\Arma 3 - Other Profiles"

pause