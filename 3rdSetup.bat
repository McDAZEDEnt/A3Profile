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
:: USERCONFIG
cd /d "%arma3%"
rmdir /s /q "%arma3%/userconfig"
rmdir /s /q "%arma3%/mpmissions"
rmdir /s /q "%arma3%/z"
rmdir /s /q "%arma3%/x"
mklink /J "%arma3%/userconfig" "%ROOTDIR%/userconfig"
mklink /J "%arma3%/mpmissions" "%ROOTDIR%/mpmissions"
:: UNHIDE !WORKSHOP
cd /d "%arma3%"
attrib -h "%Arma3%/!Workshop"
ROBOCOPY "%ROOTDIR%/Mods/Signed" "%arma3%/!Workshop" *.bisign /E
ROBOCOPY "%ROOTDIR%/Mods/Signed" "%arma3%/!Workshop" *.bikey /E
:: PROFILE
rmdir /S /Q "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/"
mkdir "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users"
mklink /j "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users/%CurrDirName%" "%USERPROFILE%/Documents/Arma 3 - Other Profiles/%CurrDirName%"
cd /d "%ROOTDIR%"
ROBOCOPY "%ROOTDIR%/Mods/config.Arma3Profile" "%ROOTDIR%/Mods/%a3name%.Arma3Profile"
del /s /q /f *.vars.Arma3Profile
del /s /q /f Arma3.cfg
del /s /q /f BISProfile.json
call FoV.exe
EXIT
