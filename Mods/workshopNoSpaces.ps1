cd C:\Users\Public\arma3mods

Get-ChildItem * -Filter "*`[*`]*" | Rename-Item -NewName { $_.name -replace '\[','' -replace '\]','' }

get-childitem -directory | foreach {rename-item $_ $_.name.replace(")","")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("-","")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("!","")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("'","")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace(".","")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace(" ","_")}


pause