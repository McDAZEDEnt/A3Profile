read -p "Press any key to continue..."

git lfs install
git rm --cached -r .
git reset --hard
git rm .gitattributes
git rm .gitignore
git rm -r .
git reset .
git checkout .
git pull
