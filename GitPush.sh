git add . -u
git commit -m "commit"
git rm -rf --cached .
git reset --hard HEAD
git add --all
git commit -m "commit"

git push

read -p "Command Finished..."