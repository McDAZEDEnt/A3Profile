git lfs install
git rm --cached -r .
git reset --hard
git rm .gitattributes
git rm .gitignore
git reset .
git checkout .
git pull

read -p "Command Finished..."