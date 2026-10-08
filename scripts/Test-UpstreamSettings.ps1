param(
    [string]$Managed = 'C:/Program Files (x86)/Steam/steamapps/common/RimWorld/RimWorldWin64_Data/Managed',
    [string]$FlavorText = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/3245374432/1.6/Assemblies/FlavorText.dll'
)
$ErrorActionPreference = 'Stop'
$root=Split-Path $PSScriptRoot
$output=Join-Path $root '.build/settings-test'
New-Item -ItemType Directory -Force $output | Out-Null
foreach($name in @('UnityEngine.CoreModule.dll','UnityEngine.IMGUIModule.dll','Assembly-CSharp.dll')) {
    $null=[Reflection.Assembly]::LoadFrom((Join-Path $Managed $name))
}
$null=[Reflection.Assembly]::LoadFrom($FlavorText)
$settings=[FlavorText.FlavorTextSettings]::new()
function Assert($condition,$message){if(-not $condition){throw $message}}
function ReadValues {
    return @([FlavorText.FlavorTextSettings]::ghostIngredientCap,
        [FlavorText.FlavorTextSettings]::quickSearch,
        [FlavorText.FlavorTextSettings]::flavorTextForStacks,
        [FlavorText.FlavorTextSettings]::laxRecipeMatching,
        [FlavorText.FlavorTextSettings]::dynamicMealIncorporation)
}
function SetValues($values) {
    [FlavorText.FlavorTextSettings]::ghostIngredientCap=$values[0]
    [FlavorText.FlavorTextSettings]::quickSearch=$values[1]
    [FlavorText.FlavorTextSettings]::flavorTextForStacks=$values[2]
    [FlavorText.FlavorTextSettings]::laxRecipeMatching=$values[3]
    [FlavorText.FlavorTextSettings]::dynamicMealIncorporation=$values[4]
}
function LoadValues($path) {
    [Verse.Scribe]::loader.InitLoading($path)
    $settings.ExposeData()
    # These are primitive fields, with no cross-references or post-load callbacks.
    # FinalizeLoading enters Unity-native code outside this host's capabilities;
    # stop after the actual LoadingVars/ExposeData phase instead of claiming a game load.
    [Verse.Scribe]::loader.ForceStop()
}
Assert (((ReadValues) -join ',') -eq '0,False,True,True,True') 'Unexpected clean defaults.'
foreach($values in @(@(6,$true,$false,$false,$false),@(0,$false,$true,$true,$true))) {
    SetValues $values
    $path=Join-Path $output 'roundtrip.xml'
    [Verse.Scribe]::saver.InitSaving($path,'settings')
    $settings.ExposeData()
    [Verse.Scribe]::saver.FinalizeSaving()
    SetValues @(-999,$false,$false,$false,$false)
    LoadValues $path
    Assert (((ReadValues) -join ',') -eq ($values -join ',')) 'Actual Scribe roundtrip changed values.'
}
$missing=Join-Path $output 'missing.xml'
[IO.File]::WriteAllText($missing,'<settings />')
SetValues @(99,$true,$false,$false,$false)
LoadValues $missing
Assert (((ReadValues) -join ',') -eq '0,False,True,True,True') 'Missing fields failed to restore defaults.'
Write-Output 'PASS: actual installed FlavorTextSettings and RimWorld Scribe primitive-field serialization; clean defaults, all five values saved/read at both valid cap boundaries, missing-field defaults. Unity FinalizeLoading, full game loading and UI are not executed.'
