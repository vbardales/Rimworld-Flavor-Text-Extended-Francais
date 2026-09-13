$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
# Run in its own PowerShell process: these Verse test doubles must never enter the game.
Add-Type -Path @(
    (Join-Path $root 'Source/FrenchLanguage.cs'),
    (Join-Path $root 'Source/PatchOperationFrench.cs'),
    (Join-Path $PSScriptRoot 'Tests/PatchLifecycle.cs')
)
[FlavorTextExtendedFR.Tests.PatchLifecycle]::Run()
