@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%

start steam://rungameid/

Powershell.exe -executionpolicy remotesigned -File "%ROOTDIR%\A3-Antistasi\Tools\Builder\buildAddons.ps1
robocopy "%ROOTDIR%/A3-Antistasi/build/A3A" "%ROOTDIR%/A3-Antistasi/A3A" *.* /S

pause

:: ace
PublisherCmd update /id:2867649409 /changeNote:change /path:P:\z\ace\release\@ace /nologo /nosummary
:: Antistasi
PublisherCmd update /id:2913801179 /changeNote:change /path:P:\x\A3A /nologo /nosummary
:: NR6
PublisherCmd update /id:2899743072 /changeNote:change /path:P:\z\NR6 /nologo /nosummary
