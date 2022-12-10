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
echo The Arma 3 launcher will open in a few seconds.
echo Step 1. Import the "FullModded.html" preset into the launcher.
echo Step 2. Repair all broken mods (red squares)
echo (Image reference -  howto1.jpg & howto2.jpg)
echo Step 3. Close the launcher
echo When you are finished, press the 'Enter' button.
echo .
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
ROBOCOPY "%ROOTDIR%/Mods/Signed" "%arma3%/!Workshop/" *.bisign /E
ROBOCOPY "%ROOTDIR%/Mods/Signed" "%arma3%/!Workshop/" *.bikey /E
:: PROFILE
rmdir /S /Q "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/"
mkdir "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users"
mklink /j "%USERPROFILE%/Documents/Arma 3 - Other Profiles/Arma3Launcher/profiles/Users/%CurrDirName%" "%USERPROFILE%/Documents/Arma 3 - Other Profiles/%CurrDirName%"
cd /d "%ROOTDIR%"
del /s /q /f *.vars.Arma3Profile
call FoV.exe
EXIT
