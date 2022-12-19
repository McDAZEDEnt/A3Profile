Get-ChildItem -path "$env:userprofile\Documents\Arma 3 - Other Profiles\McDAZED" -Include '.vscode' -Recurse -force | Remove-Item -force -Recurse
