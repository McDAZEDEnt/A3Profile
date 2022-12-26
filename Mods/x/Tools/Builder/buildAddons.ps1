param (
    [string]$modFileName = "mod.cpp",
    [string]$metaFileName = "meta.cpp"
)

"Meta file name: $metaFileName`n`n"
Push-Location

Set-Location "$PSScriptRoot\..\..\A3A"

"`nGet version number"
$versionFile = (Get-Content addons\core\Includes\script_version.hpp)
$version = ""
ForEach($line in $versionFile) {
    if (($line) -match "(?<= )([\w\d]*)(?![ \w\d])") {
        $version += $Matches[0] + "."
    }
}
$version = $version.Substring(0, $version.Length -1)

"Setup temporary directories..."
if (Test-Path "$env:arma3\@Antistasi") {
    Remove-Item -Path "$env:arma3\@Antistasi" -Recurse -Force
}
New-Item -Path "$env:arma3" -ItemType Directory -Force > $null
New-Item -Path "$env:arma3\@Antistasi" -ItemType Directory -Force > $null
New-Item -Path "$env:arma3\@Antistasi\addons" -ItemType Directory -Force > $null

$addonLocation = "." # We are here already
$addonOutLocation = "$env:arma3\@Antistasi"
$addonsOutLocation = "$addonOutLocation\addons"

"`nBuild addons..."
$modules = Get-Childitem "$addonLocation\addons" -Directory
foreach ($module in $modules) {
    $pboName = "$($module.Name).pbo"
    #"Building $pboName...  $addonLocation\addons\$($module.Name)   -> $addonsOutLocation\$pboName"
    "Building $pboName ..."
    .$PSScriptRoot\hemtt armake pack --force $module.fullName "$addonsOutLocation\$pboName"
}

"`nCopy mod.cpp..."
Copy-Item "$modFileName" $addonOutLocation
Push-Location
Set-Location $addonOutLocation
Rename-Item $modFileName "mod.cpp"
Pop-Location

"`nCopy meta.cpp..."
Copy-Item "meta\$metaFileName" $addonOutLocation
Push-Location
Set-Location $addonOutLocation
Rename-Item $metaFileName "meta.cpp"
Pop-Location

$displayTime = Get-Date -DisplayHint DateTime
"Antistasi builder ran at: $displayTime"
"Antistasi version: $version build complete"

pause