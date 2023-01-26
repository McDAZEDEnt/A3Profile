@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
taskkill /f /im "Dropbox.exe"

git clone --depth 1 https://github.com/acemod/ACE3.git

cd /d ACE3
rd /s /q optionals
del /s /q /f .gitattributes
del /s /q /f .gitignore

cd /d "%ROOTDIR%"

git clone --depth 1 https://github.com/CBATeam/CBA_A3.git

cd /d CBA_A3
del /s /q /f .gitattributes
del /s /q /f .gitignore
