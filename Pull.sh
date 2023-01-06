read -p "."

git lfs install
git rm --cached -r .
git reset --hard
git rm .gitattributes
git rm .gitignore
git rm .
git reset .
git checkout .
git pull