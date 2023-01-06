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

::Dev Setup
cd /d "ACE3/addons"
del /s /q /f *.pbo
cd /d "CBA_A3/addons"
del /s /q /f *.pbo

rd /s /q "%arma3%/z"
rd /s /q "P:/z"
rd /s /q "%arma3%/x"
rd /s /q "P:/x"
rd /s /q "P:/.vscode"
del /s /q /f "%ROOTDIR%/ACE3/include/x/*.*"

md "P:/x"
md "P:/z"

robocopy "%ROOTDIR%/CBA_A3" "%ROOTDIR%/ACE3/include/x/cba" *.* /S /M
mklink /J "P://x/A3A" "%ROOTDIR%/A3-Antistasi/A3A"
mklink /J "P://.vscode" "%ROOTDIR%/.vscode"
robocopy "%ROOTDIR%/ACE3/tools/pDummies" "P://" *.* /S

:: Delete keys and git
cd /d "%ROOTDIR%"
del /s /q /f *.bisign

:: delete ACE folders and pbo
del /s /q /f *ace_advanced_ballistics*.pbo
del /s /q /f *ace_advanced_fatigue*.pbo
del /s /q /f *ace_aircraft*.pbo
del /s /q /f *ace_atragmx*.pbo
del /s /q /f *ace_chemlights*.pbo
del /s /q /f *ace_cookoff*.pbo
del /s /q /f *ace_dagr*.pbo
del /s /q /f *ace_dogtags*.pbo
del /s /q /f *ace_fcs*.pbo
del /s /q /f *ace_field_rations*.pbo
del /s /q /f *ace_fire*.pbo
del /s /q /f *ace_flashlights*.pbo
del /s /q /f *ace_gforces*.pbo
del /s /q /f *ace_goggles*.pbo
del /s /q /f *ace_gunbag*.pbo
del /s /q /f *ace_hearing*.pbo
del /s /q /f *ace_hunterkiller*.pbo
del /s /q /f *ace_huntir*.pbo
del /s /q /f *ace_intelitems*.pbo
del /s /q /f *ace_kestrel4500*.pbo
del /s /q /f *ace_laserpointer*.pbo
del /s /q /f *ace_map*.pbo
del /s /q /f *ace_map_gestures*.pbo
del /s /q /f *ace_maptools*.pbo
del /s /q /f *ace_marker_flags*.pbo
del /s /q /f *ace_markers*.pbo
del /s /q /f *ace_microdagr*.pbo
del /s /q /f *ace_minedetector*.pbo
del /s /q /f *ace_movement*.pbo
del /s /q /f *ace_mx2a*.pbo
del /s /q /f *ace_nametags*.pbo
del /s /q /f *ace_nightvision*.pbo
del /s /q /f *ace_noidle*.pbo
del /s /q /f *ace_norearm*.pbo
del /s /q /f *ace_overheating*.pbo
del /s /q /f *ace_parachute*.pbo
del /s /q /f *ace_quickmount*.pbo
del /s /q /f *ace_rangecard*.pbo
del /s /q /f *ace_safemode*.pbo
del /s /q /f *ace_scopes*.pbo
del /s /q /f *ace_sitting*.pbo
del /s /q /f *ace_slideshow*.pbo
del /s /q /f *ace_spottingscope*.pbo
del /s /q /f *ace_tacticalladder*.pbo
del /s /q /f *ace_tagging*.pbo
del /s /q /f *ace_vector*.pbo
del /s /q /f *ace_vehicle_damage*.pbo
del /s /q /f *ace_volume*.pbo
del /s /q /f *ace_weather*.pbo
del /s /q /f *ace_winddeflection*.pbo
del /s /q /f *ace_xm157*.pbo
del /s /q /f *ace_yardage450*.pbo

cd /d "%ROOTDIR%\ACE3\addons"
rd /s /q advanced_ballistics
rd /s /q advanced_fatigue
rd /s /q aircraft
rd /s /q atragmx
rd /s /q chemlights
rd /s /q cookoff
rd /s /q dagr
rd /s /q dogtags
rd /s /q fcs
rd /s /q field_rations
rd /s /q fire
rd /s /q flashlights
rd /s /q gforces
rd /s /q goggles
rd /s /q gunbag
rd /s /q hearing
rd /s /q hunterkiller
rd /s /q huntir
rd /s /q intelitems
rd /s /q kestrel4500
rd /s /q laserpointer
rd /s /q map
rd /s /q map_gestures
rd /s /q maptools
rd /s /q marker_flags
rd /s /q markers
rd /s /q microdagr
rd /s /q minedetector
rd /s /q movement
rd /s /q mx2a
rd /s /q nametags
rd /s /q nightvision
rd /s /q noidle
rd /s /q norearm
rd /s /q overheating
rd /s /q parachute
rd /s /q quickmount
rd /s /q rangecard
rd /s /q safemode
rd /s /q scopes
rd /s /q sitting
rd /s /q slideshow
rd /s /q spottingscope
rd /s /q tacticalladder
rd /s /q tagging
rd /s /q vector
rd /s /q vehicle_damage
rd /s /q volume
rd /s /q weather
rd /s /q winddeflection
rd /s /q xm157
rd /s /q yardage450

:: ACE Setup
cd /d "%ROOTDIR%/ACE3/tools"
python setup.py

:: Sign mods
cd /d "%arma3% Tools\DSSignFile"
DSUtils.exe
