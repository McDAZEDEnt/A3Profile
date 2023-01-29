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

"%arma3%\Arma3_x64.exe" -name=%a3name% -skipIntro -noSplash -filePatching -showScriptErrors -debug "-mod=%arma3%\!Workshop\@CBA_A3;%arma3%\!Workshop\@ace_x;%arma3%\!Workshop\@Accurate Arsenal-Eden Icons;%arma3%\!Workshop\@Arsenal Search;%arma3%\!Workshop\@CUP Terrains - Core;%arma3%\!Workshop\@CUP Terrains - Maps;%arma3%\!Workshop\@CUP Terrains - Maps 2.0;%arma3%\!Workshop\@Disable 3den Mission Preview Shortcut;%arma3%\!Workshop\@Drongos Config Generator;%arma3%\!Workshop\@Drongos Map Population;%arma3%\!Workshop\@Eden Extended Objects;%arma3%\!Workshop\@RHSUSAF;%arma3%\!Workshop\@RHSAFRF;%arma3%\!Workshop\@LAMBS_Danger.fsm;%arma3%\!Workshop\@Map Object Finder;%arma3%\!Workshop\@NR6;%arma3%\!Workshop\@PERSIST - RCO;%arma3%\!Workshop\@POLPOX's Base Functions;%arma3%\!Workshop\@RHSGREF;%arma3%\!Workshop\@RHSSAF;%arma3%\!Workshop\@Simplex Support Services;%arma3%\!Workshop\@Spyder Addons;%arma3%\!Workshop\@task_force_radio;%arma3%\!Workshop\@Werthles' Headless Module;%arma3%\!Workshop\@ZEC - Zeus and Eden Templates - Building Compositions;%arma3%\!Workshop\@ZEI - Zeus and Eden Interiors"

timeout /t 3

taskkill /f /im steam.exe
taskkill /f /im arma3launcher.exe
taskkill /f /im ts3client_win64.exe
