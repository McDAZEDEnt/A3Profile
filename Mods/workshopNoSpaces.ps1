cd $env:arma3\!Workshop

get-childitem -directory | foreach {rename-item $_ $_.name.replace(" ","")}


get-childitem -directory | foreach {rename-item $_ $_.name.replace("["," ")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("]"," ")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("("," ")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace(")"," ")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("-"," ")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("'"," ")}

get-childitem -directory | foreach {rename-item $_ $_.name.replace("."," ")}


get-childitem -directory | foreach {rename-item $_ $_.name.replace(" ","")}


pause