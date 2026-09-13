$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot
Add-Type -Path @((Join-Path $root 'Source/FrenchFallback.cs'),(Join-Path $root 'Source/RuntimePatches.cs'),(Join-Path $PSScriptRoot 'Tests/FallbackPrefix.cs'))
[xml]$resources=Get-Content (Join-Path $root 'Mod/Languages/French/Keyed/Fallback.xml')
foreach($node in $resources.SelectNodes('/LanguageData/*')){[Verse.Translator]::Resources[$node.Name]=$node.InnerText}
[FlavorTextExtendedFR.Tests.FallbackPrefix]::Run()
