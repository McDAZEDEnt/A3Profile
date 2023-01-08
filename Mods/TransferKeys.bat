@echo off
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

rd /s /q "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\!Workshop"

attrib -h "%arma3%\!Workshop"

ROBOCOPY "%arma3%\!Workshop" "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\!Workshop" *.arma.bisign /S

attrib -h "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\!Workshop"

cd /d "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\!Workshop"

rd /s /q @ace_x
rd /s /q @NR6
rd /s /q @Antistasi
