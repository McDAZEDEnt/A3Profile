Function Check-RunAsAdministrator()
{
  #Get current user context
  $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  
  #Check user is running the script is member of Administrator Group
  if($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
  {
       Write-host "Script is running with Administrator privileges!"
  }
  else
    {
       #Create a new Elevated process to Start PowerShell
       $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
 
       # Specify the current script path and name as a parameter
       $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
 
       #Set the Process to elevated
       $ElevatedProcess.Verb = "runas"
 
       #Start the new elevated process
       [System.Diagnostics.Process]::Start($ElevatedProcess)
 
       #Exit from the current, unelevated, process
       Exit
 
    }
}

# Configuration
$Private:AddonBuilder = "$env:arma3 Tools\AddonBuilder\AddonBuilder.exe"
$Private:Key = "$env:userprofile\Dropbox\Save\_Stray\arma.biprivatekey"

#
# DO NOT EDIT BELOW UNLESS YOU KNOWN WHAT YOU ARE DOING
#
$Private:AddonBuilderDir = [System.IO.Path]::GetDirectoryName($Private:AddonBuilder)

New-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\shell\AddonBuilder –Value 'Build into PBO with AddonBuilder' -Force
New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Directory\shell\AddonBuilder -Name 'Icon' -PropertyType String -Value "$Private:AddonBuilder,0"
New-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\shell\AddonBuilder\command –Value "$Private:AddonBuilder ""%1"" ""%w"" ""-sign=$Private:Key"" -clear" -Force
