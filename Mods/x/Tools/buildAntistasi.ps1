## Replace 'Antistasi' with mod folder name
## Replace 'A3A' with folder inside 'x'

param (
    [string]$modFileName = "mod.cpp",
    [string]$metaFileName = "meta.cpp"
)

"Meta file name: $metaFileName`n`n"
Push-Location

Set-Location "$PSScriptRoot\..\A3A"

"Setup temporary directories..."
if (Test-Path "..\build") {
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
"Builder ran at: $displayTime"
"Build complete!"