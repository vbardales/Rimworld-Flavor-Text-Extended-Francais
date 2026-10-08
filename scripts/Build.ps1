param(
    [string]$Managed = 'C:/Program Files (x86)/Steam/steamapps/common/RimWorld/RimWorldWin64_Data/Managed',
    [string]$FlavorText = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/3245374432/1.6/Assemblies/FlavorText.dll',
    [string]$Harmony = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/2009463077/Current/Assemblies/0Harmony.dll'
)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
$build = Join-Path $root '.build'
New-Item -ItemType Directory -Force $build | Out-Null
$sdk = @(& dotnet --list-sdks)[-1]
if ($LASTEXITCODE -ne 0 -or $sdk -notmatch '^([^ ]+) \[(.+)\]$') { throw 'No .NET SDK found.' }
$compiler = Join-Path $Matches[2] "$($Matches[1])/Roslyn/bincore/csc.dll"
$output = Join-Path $build 'FlavorTextExtendedFR.dll'
$references = @('mscorlib.dll', 'netstandard.dll', 'System.dll', 'System.Core.dll', 'System.Xml.dll', 'Assembly-CSharp.dll', 'UnityEngine.CoreModule.dll')
$arguments = @('/nologo', '/target:library', '/nostdlib+', '/optimize+', '/deterministic+', '/warnaserror+', "/out:$output")
foreach ($name in $references) {
    $path = Join-Path $Managed $name
    if (-not (Test-Path $path)) { throw "Missing game reference: $path" }
    $arguments += "/reference:$path"
}
$arguments += @(Get-ChildItem (Join-Path $root 'Source') -Filter *.cs | ForEach-Object FullName)
if(-not(Test-Path $FlavorText)){throw "Missing Flavor Text reference: $FlavorText"}
$arguments += "/reference:$FlavorText"
if(-not(Test-Path $Harmony)){throw "Missing Harmony reference: $Harmony"}
$arguments += "/reference:$Harmony"
& dotnet $compiler @arguments
if ($LASTEXITCODE -ne 0) { throw "Compilation failed: $LASTEXITCODE" }
$destination = Join-Path $root 'Mod/Assemblies'
New-Item -ItemType Directory -Force $destination | Out-Null
Copy-Item -LiteralPath $output -Destination $destination
Write-Output "PASS: compiled and installed FlavorTextExtendedFR.dll against $Managed"
