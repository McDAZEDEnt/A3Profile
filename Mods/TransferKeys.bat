@echo off
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

cd /d "%arma3%"

attrib -h "%arma3%\!Workshop"

for /r %%d in (*.bikey) do copy "%%d" "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%\userconfig\keys"

pause