git lfs install
git lfs untrack ".gitattributes"
git lfs untrack ".gitignore"
git reset
git add --all
git add .gitattributes
git add .gitignore
git commit -am "commit"
git push

## read -p "Command Finished..."