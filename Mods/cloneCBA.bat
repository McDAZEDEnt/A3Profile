taskkill /f /im "Dropbox.exe"
git clone --depth 1 --branch v3.15.8.220912 https://github.com/CBATeam/CBA_A3.git

cd /d CBA_A3
del /s /q /f .gitattributes
del /s /q /f .gitignore
rd /s /q .git
rd /s /q .github
