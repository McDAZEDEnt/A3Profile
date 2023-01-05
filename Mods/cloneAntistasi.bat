taskkill /f /im "Dropbox.exe"
git clone --depth 1 --branch 3.0.0 https://github.com/official-antistasi-community/A3-Antistasi.git

cd /d A3-Antistasi
del /s /q /f .gitattributes
del /s /q /f .gitignore
rd /s /q .git
rd /s /q .github
