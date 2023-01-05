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

:: Delete keys and git
cd /d "%ROOTDIR%"
del /s /q /f *.bisign

:: @ace
del /s /q /f *ace_aircraft*
del /s /q /f *ace_fcs*
del /s /q /f *ace_fire*
del /s /q /f *ace_hearing*
del /s /q /f *ace_intelitems*
del /s /q /f *ace_advanced_fatigue*
del /s /q /f *ace_gforces*
del /s /q /f *ace_minedetector*
del /s /q /f *ace_nametags*
del /s /q /f *ace_norearm*
del /s /q /f *ace_marker*
del /s /q /f *ace_map*
del /s /q /f *ace_quickmount*
del /s /q /f *ace_field_rations*
del /s /q /f *ace_volume*

:: ACE
cd /d "%ROOTDIR%\ACE3\addons"
rd /s /q aircraft
rd /s /q fcs
rd /s /q fire
rd /s /q hearing
rd /s /q intelitems
rd /s /q advanced_fatigue
rd /s /q gforces
rd /s /q minedetector
rd /s /q nametags
rd /s /q norearm
rd /s /q markers
rd /s /q marker_flags
rd /s /q map
rd /s /q maptools
rd /s /q map_gestures
rd /s /q quickmount
rd /s /q field_rations
rd /s /q volume

cd /d "ACE3"
del /s /q /f *.pbo
cd /d "CBA_A3"
del /s /q /f *.pbo

md "P://x"
md "P://z"

mklink /J "P://x/cba" "%ROOTDIR%/CBA_A3"
mklink /J "P://z/ace" "%ROOTDIR%/ACE3"
mklink /J "P://x/A3A" "%ROOTDIR%/A3-Antistasi/A3A"
mklink /J "P://.vscode" "%ROOTDIR%/.vscode"

ROBOCOPY "%ROOTDIR%/ACE3/tools/pDummies" "P://" *.* /S

:: Sign mods
cd /d "%arma3% Tools\DSSignFile"
DSUtils.exe