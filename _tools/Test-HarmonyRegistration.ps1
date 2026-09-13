param(
    [string]$Managed='C:/Program Files (x86)/Steam/steamapps/common/RimWorld/RimWorldWin64_Data/Managed',
    [string]$FlavorText='C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/3245374432/1.6/Assemblies/FlavorText.dll',
    [string]$Harmony='C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/2009463077/Current/Assemblies/0Harmony.dll'
)
$ErrorActionPreference='Stop'
if($PSVersionTable.PSEdition -eq 'Core'){throw 'Run this integration check with powershell.exe (.NET Framework), not pwsh: the installed Harmony build targets the game/Framework runtime.'}
$root=Split-Path $PSScriptRoot
foreach($name in @('UnityEngine.CoreModule.dll','UnityEngine.IMGUIModule.dll','Assembly-CSharp.dll')){
    $null=[Reflection.Assembly]::LoadFrom((Join-Path $Managed $name))
}
foreach($path in @($FlavorText,$Harmony,(Join-Path $root 'Mod/Assemblies/FlavorTextExtendedFR.dll'))){$null=[Reflection.Assembly]::LoadFrom($path)}
$target=[FlavorTextExtendedFR.FrenchFallbackPatch]::TargetMethod()
if($target.Name -ne 'GenerateInflections' -or $target.GetParameters().Count -ne 2){throw 'Wrong upstream target signature.'}
[FlavorTextExtendedFR.RuntimePatches]::Install()
[FlavorTextExtendedFR.RuntimePatches]::Install()
$patches=[HarmonyLib.Harmony]::GetPatchInfo($target)
$owned=@($patches.Prefixes | Where-Object owner -eq 'nelim.flavortextextended.fr')
if($owned.Count -ne 1){throw "Expected exactly one installed prefix, found $($owned.Count)."}
if($owned[0].PatchMethod.Name -ne 'Prefix' -or $owned[0].PatchMethod.DeclaringType.FullName -ne 'FlavorTextExtendedFR.FrenchFallbackPatch'){throw 'Wrong prefix registered.'}
# Configure only this test process's in-memory language objects. Do not call Prefs.Init,
# its applying setter, or LoadedLanguage's texture-loading constructor; no real config
# or game files are changed. Production Translator resolves the shipped XML keys.
$flags=[Reflection.BindingFlags]'NonPublic,Instance,Static'
$preferences=[Runtime.Serialization.FormatterServices]::GetUninitializedObject([Verse.PrefsData])
$preferences.langFolderName='French'
[Verse.Prefs].GetField('data',$flags).SetValue($null,$preferences)
$language=[Runtime.Serialization.FormatterServices]::GetUninitializedObject([Verse.LoadedLanguage])
$language.folderName='French'
$language.keyedReplacements=[Collections.Generic.Dictionary[string,Verse.LoadedLanguage+KeyedReplacement]]::new()
[Verse.LoadedLanguage].GetField('dataIsLoaded',$flags).SetValue($language,$true)
[xml]$resources=Get-Content (Join-Path $root 'Mod/Languages/French/Keyed/Fallback.xml') -Encoding UTF8
foreach($node in $resources.SelectNodes('/LanguageData/*')){
    $replacement=[Verse.LoadedLanguage+KeyedReplacement]::new()
    $replacement.key=$node.Name; $replacement.value=$node.InnerText
    $language.keyedReplacements[$node.Name]=$replacement
}
[Verse.LanguageDatabase]::activeLanguage=$language
$ingredient=[Runtime.Serialization.FormatterServices]::GetUninitializedObject([Verse.ThingDef])
[Verse.Def].GetField('label').SetValue($ingredient,'huile de noix')
[Verse.Def].GetField('defName').SetValue($ingredient,'Fixture_Oil')
$forms=[Collections.Generic.List[string]]::new()
$result=$target.Invoke($null,@($ingredient,$forms))
if($result.Count -ne 4 -or $result[0] -cne "à base d'huile de noix" -or $result[3] -cne "d'huile de noix"){throw 'Actual Harmony dispatch did not generate the translated fallback.'}
$reviewed=[Collections.Generic.List[string]]@('au riz','riz','grain de riz','de riz')
$result=$target.Invoke($null,@($ingredient,$reviewed))
if(($result -join '|') -cne ($reviewed -join '|')){throw 'Actual hook altered reviewed French forms.'}
$preferences.langFolderName='English'
$original=[Collections.Generic.List[string]]@('berries','berries','berry','berry')
$result=$target.Invoke($null,@($ingredient,$original))
if(($result -join '|') -cne ($original -join '|')){throw 'Actual hook altered English forms.'}
Write-Output 'PASS: actual Harmony/Flavor Text/translation DLLs; exact target, one prefix after repeated registration, patched method invoked for French fallback and reviewed French/English forms using in-memory language fixtures and shipped keys. No Unity game, UI or player config execution.'

foreach($mealTarget in [FlavorTextExtendedFR.FrenchMealPostProcessing]::TargetMethods()){
    $info=[HarmonyLib.Harmony]::GetPatchInfo($mealTarget)
    $owned=@($info.Transpilers | Where-Object owner -eq 'nelim.flavortextextended.fr')
    if($owned.Count -ne 1){throw "Expected one meal transpiler: $($mealTarget.Name)"}
}
$preferences.langFolderName='French'
$worker=[Verse.LanguageWorker_French]::new()
foreach($noun in @('haricots','houblon','husky','hérons')){
    $text='Plat de '+$noun
    if([FlavorTextExtendedFR.FrenchMealPostProcessing]::Apply($worker,$text) -cne $text){throw "Aspirated h lost: $noun"}
}
if([FlavorTextExtendedFR.FrenchMealPostProcessing]::Apply($worker,'Plat de huile et de oignon') -cne "Plat d'huile et d'oignon"){throw 'Normal elision changed.'}
$preferences.langFolderName='English'
$englishWorker=$worker
if([FlavorTextExtendedFR.FrenchMealPostProcessing]::Apply($englishWorker,"d'haricots") -cne "d'haricots"){throw 'Non-French processing changed.'}
Write-Output 'PASS: both actual meal methods accept exactly one scoped transpiler; actual French LanguageWorker plus wrapper preserves aspirated h and normal elision; English bypass. Full meal cooking is not executed.'