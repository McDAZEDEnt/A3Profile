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

:: Dev setup
rd /s /q "%arma3%/z"
rd /s /q "P:/z"
rd /s /q "%arma3%/x"
rd /s /q "P:/x"
rd /s /q "P:/.vscode"
rd /s /q "%ROOTDIR%/ACE3/include/x/cba"

md "P:/x"
md "P:/z"

robocopy "%ROOTDIR%/CBA_A3" "%ROOTDIR%/ACE3/include/x/cba" *.* /S
robocopy "%ROOTDIR%/ACE3/tools/pDummies" "P://" *.* /S
robocopy "%ROOTDIR%/.vscode/z" "P://z" *$* /S
mklink /J "P://x/A3A" "%ROOTDIR%/A3-Antistasi-Plus/A3A"
mklink /J "P://z/NR6" "%ROOTDIR%/@NR6"
mklink /J "P://.vscode" "%ROOTDIR%/.vscode"

:: delete ACE folders and pbo
del /s /q /f *ace_advanced_ballistics*
del /s /q /f *ace_advanced_fatigue*
del /s /q /f *ace_aircraft*
del /s /q /f *ace_atragmx*
del /s /q /f *ace_chemlights*
del /s /q /f *ace_cookoff*
del /s /q /f *ace_dagr*
del /s /q /f *ace_dogtags*
del /s /q /f *ace_dragon*
del /s /q /f *ace_fcs*
del /s /q /f *ace_field_rations*
del /s /q /f *ace_fire*
del /s /q /f *ace_flashlights*
del /s /q /f *ace_gforces*
del /s /q /f *ace_goggles*
del /s /q /f *ace_gunbag*
del /s /q /f *ace_hearing*
del /s /q /f *ace_hitreactions*
del /s /q /f *ace_hunterkiller*
del /s /q /f *ace_huntir*
del /s /q /f *ace_intelitems*
del /s /q /f *ace_kestrel4500*
del /s /q /f *ace_laserpointer*
del /s /q /f *ace_map*
del /s /q /f *ace_map_gestures*
del /s /q /f *ace_maptools*
del /s /q /f *ace_marker_flags*
del /s /q /f *ace_markers*
del /s /q /f *ace_microdagr*
del /s /q /f *ace_minedetector*
del /s /q /f *ace_movement*
del /s /q /f *ace_mx2a*
del /s /q /f *ace_nametags*
del /s /q /f *ace_nightvision*
del /s /q /f *ace_noidle*
del /s /q /f *ace_norearm*
del /s /q /f *ace_overheating*
del /s /q /f *ace_parachute*
del /s /q /f *ace_quickmount*
del /s /q /f *ace_rangecard*
del /s /q /f *ace_safemode*
del /s /q /f *ace_scopes*
del /s /q /f *ace_sitting*
del /s /q /f *ace_slideshow*
del /s /q /f *ace_spottingscope*
del /s /q /f *ace_tacticalladder*
del /s /q /f *ace_tagging*
del /s /q /f *ace_vector*
del /s /q /f *ace_vehicle_damage*
del /s /q /f *ace_volume*
del /s /q /f *ace_weather*
del /s /q /f *ace_winddeflection*
del /s /q /f *ace_xm157*
del /s /q /f *ace_yardage450*

:: delete ACE folders and pbo
cd /d "%ROOTDIR%/ACE3/Addons"
rd /s /q advanced_ballistics
rd /s /q advanced_fatigue
rd /s /q aircraft
rd /s /q atragmx
rd /s /q chemlights
rd /s /q cookoff
rd /s /q dagr
rd /s /q dogtags
rd /s /q dragon
rd /s /q fcs
rd /s /q field_rations
rd /s /q fire
rd /s /q flashlights
rd /s /q gforces
rd /s /q goggles
rd /s /q gunbag
rd /s /q hearing
rd /s /q hitreactions
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

rd /s /q "%arma3%/z"
rd /s /q "%arma3%/x"

:: Sign mods
::cd /d "%arma3% Tools\DSSignFile"
::DSUtils.exe
