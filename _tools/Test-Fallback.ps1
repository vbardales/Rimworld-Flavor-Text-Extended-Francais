$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot
$null=[Reflection.Assembly]::LoadFrom((Join-Path $root 'Mod/Assemblies/FlavorTextExtendedFR.dll'))
function Assert($condition,$message){if(-not $condition){throw $message}}
[xml]$fr=Get-Content (Join-Path $root 'Mod/Languages/French/Keyed/Fallback.xml') -Encoding UTF8
[xml]$en=Get-Content (Join-Path $root 'Mod/Languages/English/Keyed/Fallback.xml') -Encoding UTF8
foreach($key in $fr.LanguageData.ChildNodes | Where-Object NodeType -eq Element){
    Assert (-not [string]::IsNullOrWhiteSpace($en.LanguageData.($key.Name))) "Missing English key: $($key.Name)"
    $frTokens=@([regex]::Matches($key.InnerText,'\{\d+\}') | ForEach-Object Value)
    $enTokens=@([regex]::Matches($en.LanguageData.($key.Name),'\{\d+\}') | ForEach-Object Value)
    Assert (($frTokens -join ',') -eq ($enTokens -join ',')) "Parameter mismatch: $($key.Name)"
}
$cases=@(
    @('tomates séchées','à base de tomates séchées','de tomates séchées'),
    @('huile de noix',"à base d'huile de noix","d'huile de noix"),
    @('œufs de lézard',"à base d'œufs de lézard","d'œufs de lézard"),
    @('haricots rouges','à base de haricots rouges','de haricots rouges'),
    @('houblon','à base de houblon','de houblon'),
    @('héron','à base de héron','de héron'),
    @('Épinards',"à base d'Épinards","d'Épinards"),
    @('maïs','à base de maïs','de maïs'),
    @('yaourt','à base de yaourt','de yaourt'),
    @('yuzu','à base de yuzu','de yuzu'),
    @('riz sauvage','à base de riz sauvage','de riz sauvage'),
    @('pommes de terre','à base de pommes de terre','de pommes de terre')
)
foreach($case in $cases){
    $suffix=if([FlavorTextExtendedFR.FrenchFallback]::NeedsElision($case[0])){'Elided'}else{''}
    $aForm=$fr.LanguageData.('FTFR_FallbackA'+$suffix)
    $deForm=$fr.LanguageData.('FTFR_FallbackDe'+$suffix)
    $forms=[FlavorTextExtendedFR.FrenchFallback]::Create($case[0],$aForm,$deForm)
    Assert ($forms.Count -eq 4 -and $forms[0] -ceq $case[1] -and $forms[3] -ceq $case[2]) "Bad French complement: $($case[0])"
    Assert ($forms[1] -ceq $case[0] -and $forms[2] -ceq $case[0]) "Localized label was altered: $($case[0])"
}
$concrete=[Collections.Generic.List[string]]@('au riz','riz','grain de riz','de riz')
Assert (-not [FlavorTextExtendedFR.FrenchFallback]::NeedsGeneration($concrete)) 'Reviewed forms must remain untouched.'
foreach($marker in @('^','*','_','{0} meat','')){
    $candidateForms=[Collections.Generic.List[string]]@($marker,'a','b','c')
    Assert ([FlavorTextExtendedFR.FrenchFallback]::NeedsGeneration($candidateForms)) "Unresolved marker not detected: $marker"
}
Assert ([FlavorTextExtendedFR.FrenchFallback]::NeedsGeneration($null)) 'Missing forms not detected.'
Write-Output 'PASS: installed fallback helper and bilingual resources; twelve accented/compound/aspirated-h/semivowel cases, no English pluralization or stem stripping, explicit forms preserved, unresolved markers detected.'
