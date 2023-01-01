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

attrib -h "%arma3%/!Workshop"

ROBOCOPY "%arma3%/!Workshop" "%ROOTDIR%/!Workshop" *.arma.bisign /S

attrib -h "%ROOTDIR%/!Workshop"

cd /d "%ROOTDIR%/!Workshop"

rd /s /q @ace_x
rd /s /q @NR6
