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

attrib -h "%Arma3%/!Workshop"
rd /s /q "%Arma3%/!Workshop"

:: LARGE PAGES
cls
echo .
echo ~~~~~~~~~!!!!!!!!!~~~~~~~~~
echo ~~~~~~~~~READ CAREFULLY!~~~~~~~~~
echo .
echo A white pop up will appear after you press 'Enter'.
echo Answer 'Yes' to the prompt, and confirm the changes.
echo .
timeout /t 12 /nobreak
cd /d "%ROOTDIR%"
hugepages.reg
:: Repair in launcher
cls
echo .
echo ~~~~~~~~~!!!!!!!!!~~~~~~~~~
echo ~~~~~~~~~READ CAREFULLY!~~~~~~~~~
echo .
echo DO NOT PROCEED UNTIL AFTER THE LAUNCHER OPENS!!
echo 1. Import the 'ModList.html' preset into the arma3 launcher
echo 2. Follow steps in HowTo1.jpg and HowTo2.jpg.
echo 3. Repair any broken mods.
echo (There will be some red dependency errors due to modified ace3.)
echo (This is normal behaviour, you can safely ignore it.)
echo 4. Close the Launcher
echo.
start steam://rungameid/107410
timeout /t 12 /nobreak
pause
TASKKILL /F /IM steam.exe
TASKKILL /F /IM arma3launcher.exe
:: userconfig and mission symlink
cd /d "%arma3%"
rmdir /s /q "%arma3%/userconfig"
rmdir /s /q "%arma3%/mpmissions"
rmdir /s /q "%arma3%/keys"
rmdir /s /q "%ROOTDIR%/x"
rmdir /s /q "%ROOTDIR%/z"
mklink /J "%arma3%/userconfig" "%ROOTDIR%/userconfig"
mklink /J "%arma3%/mpmissions" "%ROOTDIR%/mpmissions"
mklink /J "%arma3%/keys" "%ROOTDIR%/userconfig/keys"
:: UNHIDE !WORKSHOP & Copy missing keys
cd /d "%arma3%"
attrib -h "%arma3%\!Workshop"
rd /s /q "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\keys"
mkdir "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\keys"
for /r %%d in (*.bikey) do copy "%%d" "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\keys"
:: ROBOCOPY "%ROOTDIR%/userconfig/!Workshop" "%arma3%/!Workshop" *.bisign /E
:: make profile from template
cd /d "%userprofile%/Documents"
mkdir "Arma 3"
cd /d "%userprofile%/Documents/Arma 3"
del /s /q /f "%username%.Arma3Profile"
del /s /q /f "%username%.3den.Arma3Profile"
rd /s /q "Saved"
rd /s /q "UserSaved"
cd /d "%ROOTDIR%"
del *.Arma3Profile
del *.vars
robocopy "%ROOTDIR%/userconfig" "%ROOTDIR%" *.Arma3Profile
ren "config.Arma3Profile" "%CurrDirName%.Arma3Profile"
ren "config.3den.Arma3Profile" "%CurrDirName%.3den.Arma3Profile"
call FoV.exe
EXIT
