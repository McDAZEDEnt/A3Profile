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

:: LARGE PAGES
echo .
echo ~~~~~~~~~!!!!!!!!!~~~~~~~~~
echo ~~~~~~~~~READ CAREFULLY!~~~~~~~~~
echo .
echo A white pop up will appear after you press 'Enter'.
echo Answer 'Yes' to the prompt, and confirm the changes.
echo .
pause
cd /d "%ROOTDIR%"
hugepages.reg
:: Repair in launcher
echo .
echo ~~~~~~~~~!!!!!!!!!~~~~~~~~~
echo ~~~~~~~~~READ CAREFULLY!~~~~~~~~~
echo .
echo DO NOT PROCEED UNTIL AFTER THE LAUNCHER OPENS!!
echo Follow steps in HowTo1.jpg and HowTo2.jpg
echo Repair NR6, ace_x, Realengine
echo.
start steam://rungameid/107410
pause
TASKKILL /F /IM steam.exe
TASKKILL /F /IM arma3launcher.exe
:: userconfig and mission symlink
cd /d "%arma3%"
rmdir /s /q "%userprofile%/Documents/Arma 3"
rmdir /s /q "%arma3%/userconfig"
rmdir /s /q "%arma3%/mpmissions"
rmdir /s /q "%arma3%/z"
rmdir /s /q "%arma3%/x"
rmdir /s /q "%ROOTDIR%/Saved"
rmdir /s /q "%ROOTDIR%/UserSaved"
mklink /J "%arma3%/userconfig" "%ROOTDIR%/userconfig"
mklink /J "%arma3%/mpmissions" "%ROOTDIR%/mpmissions"
:: UNHIDE !WORKSHOP & Copy missing keys
cd /d "%arma3%"
attrib -h "%Arma3%/!Workshop"
ROBOCOPY "%ROOTDIR%/Mods/Signed" "%arma3%/!Workshop" *.bisign /E
ROBOCOPY "%ROOTDIR%/Mods/Signed" "%arma3%/!Workshop" *.bikey /E
:: profiles setup
rmdir /S /Q "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/"
mkdir "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users"
mklink /j "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users/%CurrDirName%" "%USERPROFILE%/Documents/Arma 3 - Other Profiles/%CurrDirName%"
cd /d "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles"
mkdir hc
mkdir server
:: make profile from template
cd /d "%ROOTDIR%"
del *.Arma3Profile
del *.vars
del Arma3.cfg
del BISProfile.json
robocopy "%ROOTDIR%/userconfig" "%ROOTDIR%" *.Arma3Profile
ren "config.Arma3Profile" "%CurrDirName%.Arma3Profile"
ren "config.3den.Arma3Profile" "%CurrDirName%.3den.Arma3Profile"
call FoV.exe
EXIT
