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

cd /d "%ROOTDIR%"
del /s /q /f *.bisign
:: ACE
del /s /q /f *ace_.vs.pbo
::del /s /q /f *ace_ai.pbo
del /s /q /f *ace_aircraft.pbo
del /s /q /f *ace_fcs.pbo
del /s /q /f *ace_fire.pbo
del /s /q /f *ace_hearing.pbo
del /s /q /f *ace_intelitems.pbo
del /s /q /f *ace_advanced_fatigue.pbo
del /s /q /f *ace_gforces.pbo
del /s /q /f *ace_minedetector.pbo
del /s /q /f *ace_nametags.pbo
del /s /q /f *ace_norearm.pbo
del /s /q /f *ace_noradio.pbo
del /s /q /f *ace_marker*.pbo
del /s /q /f *ace_map*.pbo
::del /s /q /f *ace_medical*.pbo
del /s /q /f *ace_quickmount.pbo
del /s /q /f *ace_field_rations.pbo
del /s /q /f *ace_volume.pbo
del /s /q /f *ace_zeus.pbo
:: Realengine
del /s /q /f *real_animations*.pbo
del /s /q /f *real_armor.pbo
del /s /q /f *real_fix_ui.pbo
del /s /q /f *real_fix_terrains.pbo
del /s /q /f *real_fix_factions.pbo
del /s /q /f *real_fix_weapons.pbo
del /s /q /f *real_uniform_unlock.pbo

cd /d "%arma3% Tools\DSSignFile"
DSUtils.exe
