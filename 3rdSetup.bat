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
echo .
echo Hit yes on the next pop up...
echo .
echo .
pause
cd /d "%ROOTDIR%"
hugepages.reg
:: REPAIR
attrib -h "%Arma3%/!Workshop"
cd /d "%Arma3%/!Workshop"
:: DELETE CBA
del /s /q /f "@CBA_A3\*"
:: DELETE ACE
del /s /q /f "@ace_x\*"
:: DELETE NR6
del /s /q /f "@NR6 PACK - HAL Evolved\*"
:: DELETE REALENGINE
del /s /q /f "@Realengine\*"
:: DELETE FACTIONS
del /s /q /f "@factions\*"
:: Refresh !workshop
cd /d "%Arma3%"
rd /s /q !Workshop
:: Repair in launcher
echo .
echo .
echo The Arma 3 Launcher will open in a few seconds.
echo Please import the "FullModded.html" preset into the launcher and repair all broken mods.
echo (Image reference included beside this script.)
echo Close the launcher when you are finished...
echo .
echo .
start steam://rungameid/107410
pause
TASKKILL /F /IM steam.exe
TASKKILL /F /IM arma3launcher.exe
:: USERCONFIG
cd /d "%arma3%"
rmdir /s /q "%arma3%/userconfig"
rmdir /s /q "%arma3%/mpmissions"
mklink /J "%arma3%/userconfig" "%ROOTDIR%/userconfig"
mklink /J "%arma3%/mpmissions" "%ROOTDIR%/mpmissions"
:: UNHIDE !WORKSHOP
cd /d "%arma3%"
attrib -h "%Arma3%/!Workshop"
:: PROFILE
rmdir /S /Q "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/"
mkdir "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users"
mklink /j "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users/%CurrDirName%" "%USERPROFILE%/Documents/Arma 3 - Other Profiles/%CurrDirName%"
cd /d "%ROOTDIR%"
del /s /q /f *.vars.Arma3Profile
call FoV.exe