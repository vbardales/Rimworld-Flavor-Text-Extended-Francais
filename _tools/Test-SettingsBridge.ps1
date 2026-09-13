$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot
Add-Type -Path @((Join-Path $root 'Source/SettingsBounds.cs'),(Join-Path $root 'Source/SettingsBridge.cs'),(Join-Path $PSScriptRoot 'Tests/SettingsBridge.cs'))
[FlavorTextExtendedFR.SettingsBridgeTests]::Run()
