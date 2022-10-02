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

taskkill /f /im "git-bash.exe"
taskkill /f /im "git.exe"
taskkill /f /im "mintty.exe"
taskkill /f /im "bash.exe"
taskkill /F /IM explorer.exe & start explorer
net stop DbxSvc
sc stop DbxSvc

echo Enter new profile name:
set /p NewName=	-)
setx a3name "%NewName%"
cd /d "%ROOTDIR%"
del /s /q /f .vars.Arma3Profile
del /s /q /f %NewName%.Arma3Profile
del /s /q /f %NewName%.3den.Arma3Profile
ren %OldName%.Arma3Profile %NewName%.Arma3Profile
ren %OldName%.3den.Arma3Profile %NewName%.3den.Arma3Profile
cd ..\
ren %OldName% %NewName%
pause