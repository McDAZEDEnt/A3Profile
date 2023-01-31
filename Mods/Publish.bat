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

start "" "steam://rungameid/233800"

pause

Powershell.exe -executionpolicy remotesigned -File "%ROOTDIR%\A3-Antistasi-Plus\Tools\Builder\buildAddons.ps1
robocopy "%ROOTDIR%/A3-Antistasi-Plus/build/A3A-Plus" "%ROOTDIR%/A3-Antistasi-Plus/A3A" *.* /S

pause

cd /d "P:\z\NR6\addons"
del /s /q /f *.pbo*
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_airreinforcements" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_alice2" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_hal" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_reinforcements" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_sitemarkers" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_sites" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_tools" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"
"%arma3% tools/AddonBuilder/AddonBuilder.exe" "P:\z\NR6\addons\nr6_zbe_cache" "P:\z\NR6\addons" -clear -packonly -sign="%userprofile%\Dropbox\Save\_Stray\arma.biprivatekey"

pause

cd /d "P:\z\ace\tools"
call python make.py

cd /d "%arma3% Tools\Publisher"

:: ace
PublisherCmd update /id:2867649409 /changeNote:change /path:P:\z\ace\release\@ace /nologo /nosummary
:: Antistasi
PublisherCmd update /id:2913801179 /changeNote:change /path:P:\x\A3A /nologo /nosummary
:: NR6
PublisherCmd update /id:2899743072 /changeNote:change /path:P:\z\NR6 /nologo /nosummary

pause