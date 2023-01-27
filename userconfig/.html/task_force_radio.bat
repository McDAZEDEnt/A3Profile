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

start "" "ts3server://mcdazed.com/"

start "" "steam://rungameid/"

timeout /t 12

@echo on

"%arma3%\Arma3BattlEye.exe" 0 1 1 -exe Arma3_x64.exe -name=%a3name% "-mod=%arma3%\!Workshop\@CBA_A3;%arma3%\!Workshop\@ace_x;%arma3%\!Workshop\@@AI Driving Control;%arma3%\!Workshop\@Accurate Arsenal-Eden Icons;%arma3%\!Workshop\@Enhanced Movement;%arma3%\!Workshop\@ACE Armor Adjuster;%arma3%\!Workshop\@ACE Grenades in hatches - Tweaked;%arma3%\!Workshop\@ACE Interaction Menu Expansion - Enhanced;%arma3%\!Workshop\@Antistasi;%arma3%\!Workshop\@Arma 3 Performance Extension;%arma3%\!Workshop\@Arsenal Search;%arma3%\!Workshop\@Automatic ViewDistance;%arma3%\!Workshop\@AWR - Advanced Wound Reaction;%arma3%\!Workshop\@Cinematic Lens Flare;%arma3%\!Workshop\@CUP Terrains - Core;%arma3%\!Workshop\@CUP Terrains - Maps;%arma3%\!Workshop\@CUP Terrains - Maps 2.0;%arma3%\!Workshop\@Drongos Map Population;%arma3%\!Workshop\@Eden Extended Objects;%arma3%\!Workshop\@Enhanced Movement Rework;%arma3%\!Workshop\@Enhanced Soundscape;%arma3%\!Workshop\@RHSUSAF;%arma3%\!Workshop\@RHSAFRF;%arma3%\!Workshop\@Escape From Tarkov Weapon Sounds [RHS];%arma3%\!Workshop\@Fawks' Enhanced NVGs;%arma3%\!Workshop\@Improved ACE Arsenal Category;%arma3%\!Workshop\@JSRS SOUNDMOD;%arma3%\!Workshop\@LAMBS_Danger.fsm;%arma3%\!Workshop\@Light Blue Water Colour Mod;%arma3%\!Workshop\@Looting Enhanced;%arma3%\!Workshop\@MRB Air Visibility;%arma3%\!Workshop\@MRB Sea Vessel Visibility;%arma3%\!Workshop\@MRB Vehicle Visibility;%arma3%\!Workshop\@New CSAT (Overhaul) DVK;%arma3%\!Workshop\@New CSAT (No contact) DVK;%arma3%\!Workshop\@No Actions;%arma3%\!Workshop\@No More Aircraft Bouncing;%arma3%\!Workshop\@NR6;%arma3%\!Workshop\@PERSIST - RCO;%arma3%\!Workshop\@Project SFX- Footsteps;%arma3%\!Workshop\@Real Lighting and Weather;%arma3%\!Workshop\@Reduced Haze Mod v3.1;%arma3%\!Workshop\@RHSGREF;%arma3%\!Workshop\@RHSSAF;%arma3%\!Workshop\@saroTweakMapFPS;%arma3%\!Workshop\@Simplex Support Services;%arma3%\!Workshop\@Spyder Addons;%arma3%\!Workshop\@Squad Feedback;%arma3%\!Workshop\@task_force_radio;%arma3%\!Workshop\@Vindicta (Alpha);%arma3%\!Workshop\@Werthles' Headless Module" -connect=mcdazed.com -port=2302

timeout /t 3

taskkill /f /im steam.exe
taskkill /f /im arma3launcher.exe
taskkill /f /im ts3client_win64.exe
