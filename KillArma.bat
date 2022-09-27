@echo off
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
taskkill /f /im arma3_x64.exe
taskkill /f /im arma3server_x64.exe
taskkill /f /im arma3.exe
taskkill /f /im arma3server.exe
taskkill /f /im publisher.exe
taskkill /f /im addonbuilder.exe
taskkill /f /im arma3tools.exe