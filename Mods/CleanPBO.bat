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
FOR /d /r . %d IN (".git") DO @IF EXIST "%d" rd /s /q "%d"
FOR /d /r . %d IN (".github") DO @IF EXIST "%d" rd /s /q "%d"

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
del /s /q /f *ace_markers*
del /s /q /f *ace_map*
del /s /q /f *ace_quickmount*
del /s /q /f *ace_field_rations*
del /s /q /f *ace_volume*
del /s /q /f *ace_zeus*

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
rd /s /q map
rd /s /q map_gestures
rd /s /q quickmount
rd /s /q field_rations
rd /s /q volume
rd /s /q zeus

:: Sign mods
cd /d "%arma3% Tools\DSSignFile"
DSUtils.exe
