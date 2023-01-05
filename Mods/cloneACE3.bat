taskkill /f /im "Dropbox.exe"
git clone --depth 1 https://github.com/acemod/ACE3.git

cd /d ACE3
del /s /q /f .gitattributes
del /s /q /f .gitignore
rd /s /q .git
rd /s /q .github
