$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
# Offline check of the French agreement after an ingredient token: the pure class and the table, no Unity player.
$null = [Reflection.Assembly]::LoadFrom((Join-Path $root 'Mod/Assemblies/FlavorTextExtendedFR.dll'))
$A = [FlavorTextExtendedFR.FrenchAgreement]
function Expect($actual, $expected, $what) { if ($actual -cne $expected) { throw "$what : got '$actual', expected '$expected'" } }

# Inflect: regular words, irregular words, invariable plurals, unknown code.
foreach ($case in @(
    @('pané', 'ms', 'pané'), @('pané', 'fs', 'panée'), @('pané', 'mp', 'panés'), @('pané', 'fp', 'panées'),
    @('cru', 'fp', 'crues'), @('frit', 'fs', 'frite'), @('moulu', 'mp', 'moulus'),
    @('entier', 'fs', 'entière'), @('entier', 'mp', 'entiers'), @('entier', 'fp', 'entières'),
    @('épais', 'fs', 'épaisse'), @('épais', 'mp', 'épais'), @('épicé', 'fp', 'épicées'),
    @('rouge', 'fp', 'rouges'), @('pris', 'mp', 'pris'), @('pané', '', 'pané'), @('pané', 'xx', 'pané'))) {
    Expect ($A::Inflect($case[0], $case[1])) $case[2] ("Inflect " + $case[0] + " " + $case[1])
}

# Resolve: the nearest form before the mark decides; no form, no code or an unknown code leaves the lemma.
$forms = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::OrdinalIgnoreCase)
$forms['aux baies'] = 'fp'; $forms['de baies'] = 'fp'; $forms['baie'] = 'fs'
$forms['au riz'] = 'ms'; $forms['riz'] = 'ms'; $forms['à la viande de bœuf'] = 'fs'; $forms['viande de bœuf'] = 'fs'
Expect ($A::Resolve('une tarte aux baies ~sucré~, cuite', $forms)) 'une tarte aux baies sucrées, cuite' 'plural feminine'
Expect ($A::Resolve('un plat au riz ~épicé~', $forms)) 'un plat au riz épicé' 'masculine singular'
Expect ($A::Resolve('un plat à la viande de bœuf ~pané~ et ~frit~', $forms)) 'un plat à la viande de bœuf panée et frite' 'two marks, one ingredient'
Expect ($A::Resolve('de baies ~entier~ puis au riz ~entier~', $forms)) 'de baies entières puis au riz entier' 'nearest form wins'
Expect ($A::Resolve('un plat de poisson ~pané~', $forms)) 'un plat de poisson pané' 'no known form: lemma'
Expect ($A::Resolve('~pané~ au début', $forms)) 'pané au début' 'mark first, nothing before'
Expect ($A::Resolve('de baies ~pané~', $null)) 'de baies pané' 'no table: lemma'
Expect ($A::Resolve('rien à accorder', $forms)) 'rien à accorder' 'no mark'
Expect ($A::Resolve('une cerise ~pané~', $forms)) 'une cerise pané' 'a form inside another word is not a form (baie in baiser)'
Expect ($A::Resolve('du baiser ~pané~', $forms)) 'du baiser pané' 'word boundary'
Expect ($A::Resolve('avec ~+un~ baie ~entier~', $forms)) 'avec une baie entière' 'determiner before its noun'
Expect ($A::Resolve('avec ~+un~ riz', $forms)) 'avec un riz' 'determiner, masculine'
Expect ($A::Resolve('avec ~+un~ inconnu', $forms)) 'avec un inconnu' 'determiner, no form after'
if ($A::Resolve('x ~a~ y ~b~ z', $forms) -match '~') { throw 'a tilde survived' }

# The table file: parse, then every ingredient of the patches has a line and every line is an ingredient of the patches.
$D = [FlavorTextExtendedFR.FrenchAgreementData]
$lines = [IO.File]::ReadAllLines((Join-Path $root 'Mod/Data/ingredient-agreement.txt'), [Text.Encoding]::UTF8)
$table = $D::Parse($lines)
$keys = New-Object 'System.Collections.Generic.HashSet[string]'
foreach ($file in 'Inflections_FR.xml', 'Inflections_ThirdParty_FR.xml', 'Inflections_ExtendedProviders_FR.xml') {
    $xml = [xml][IO.File]::ReadAllText((Join-Path $root "Mod/Patches/$file"), [Text.Encoding]::UTF8)
    foreach ($key in $xml.SelectNodes('//dictionary/li/key')) { [void]$keys.Add($key.InnerText.Trim()) }
}
foreach ($key in $keys) { if (-not $table.ContainsKey($key)) { throw "ingredient without agreement line: $key" } }
foreach ($key in $table.Keys) { if (-not $keys.Contains($key)) { throw "agreement line for an unknown ingredient: $key" } }
foreach ($key in $table.Keys) { foreach ($code in $table[$key]) { if ($code -notmatch '^[mf][sp]$') { throw "bad code for $key : $code" } } }

# Index: the three whole-ingredient forms take the first code, the singular form the second; a shared string with two codes is dropped.
$inflections = New-Object 'System.Collections.Generic.Dictionary[string,System.Collections.Generic.IList[string]]'
$inflections['Eggs'] = [string[]]@('aux œufs', 'œufs', 'œuf', "d'œufs")
$inflections['Mixture'] = [string[]]@('aux légumes', 'légumes', 'portion de légumes', 'de légumes')
$inflections['Clash'] = [string[]]@('aux X', 'œufs', 'X', 'de X')
$codes = New-Object 'System.Collections.Generic.Dictionary[string,string[]]'
$codes['Eggs'] = [string[]]@('mp', 'ms'); $codes['Mixture'] = [string[]]@('mp', 'fs'); $codes['Clash'] = [string[]]@('fs', 'fs')
$index = $D::Index($inflections, $codes)
Expect $index['aux œufs'] 'mp' 'index plural'; Expect $index['œuf'] 'ms' 'index singular'; Expect $index['portion de légumes'] 'fs' 'index singular head'
if ($index.ContainsKey('œufs')) { throw 'a form shared with two codes was kept' }
Write-Output ("PASS: agreement after ingredient tokens: inflection, nearest form, word boundary, table of {0} ingredients matches the patches." -f $table.Count)
