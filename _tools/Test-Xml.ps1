param(
    [string]$FlavorText = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/3245374432/1.6/Defs',
    [string]$Extended = "$PSScriptRoot/../../FlavorTextExtended/Mod/Defs"
)
$ErrorActionPreference = 'Stop'
function Assert($Condition, $Message) { if (-not $Condition) { throw $Message } }
function ReadXml($Path) {
    $doc = [System.Xml.XmlDocument]::new()
    $doc.XmlResolver = $null
    $doc.Load($Path)
    return ,$doc
}
$root = Split-Path $PSScriptRoot
$files = @(Get-ChildItem "$root/Mod" -Recurse -Filter *.xml)
foreach ($file in $files) { $null = ReadXml $file.FullName }
$defs = [System.Xml.XmlDocument]::new()
$defs.LoadXml('<Defs/>')
foreach ($dir in @($FlavorText, $Extended)) {
    Assert (Test-Path $dir) "Missing dependency Defs: $dir"
    foreach ($file in Get-ChildItem $dir -Recurse -Filter *.xml) {
        $doc = ReadXml $file.FullName
        foreach ($node in $doc.SelectNodes('/Defs/*')) { $null = $defs.DocumentElement.AppendChild($defs.ImportNode($node, $true)) }
    }
}
$dishes = @{}
foreach ($node in $defs.SelectNodes('/Defs/FlavorText.FlavorDef[defName]')) {
    Assert (-not $dishes.ContainsKey($node.defName)) "Duplicate source def: $($node.defName)"
    $dishes[$node.defName] = $node
}
$seen = @{}
foreach ($file in Get-ChildItem "$root/Mod" -Recurse -Filter *.xml | Where-Object { $_.FullName -match '[\\/]DefInjected[\\/]FlavorText\.FlavorDef[\\/]' }) {
    $doc = ReadXml $file.FullName
    Assert ($doc.DocumentElement.Name -eq 'LanguageData') "Wrong translation root: $file"
    foreach ($node in $doc.SelectNodes('/LanguageData/*')) {
        $key = $node.Name
        Assert (-not $seen.ContainsKey($key)) "Duplicate translation: $key"
        $seen[$key] = $true
        Assert ($key -match '^(.+)\.(label|description)$') "Invalid handle: $key"
        $name = $Matches[1]
        Assert ($dishes.ContainsKey($name)) "Unknown def: $name"
        $requiresBiotech = $dishes[$name].GetAttribute('MayRequire') -eq 'Ludeon.Rimworld.Biotech'
        $inBiotechFolder = $file.FullName -match '[\\/]Mod[\\/]Biotech[\\/]'
        Assert ($requiresBiotech -eq $inBiotechFolder) "Wrong conditional folder: $key"
        Assert (-not [string]::IsNullOrWhiteSpace($node.InnerText)) "Empty translation: $key"
        $rest = [regex]::Replace($node.InnerText, '\{\d+(?:_(?:plur|coll|sing|adj))?\}', '')
        Assert ($rest -notmatch '[{}]') "Malformed placeholder: $key"
        foreach ($match in [regex]::Matches($node.InnerText, '\{(\d+)(?:_\w+)?\}')) {
            Assert ([int]$match.Groups[1].Value -lt $dishes[$name].SelectNodes('ingredients/li').Count) "Invalid ingredient index: $key $match"
        }
    }
}
foreach ($name in $dishes.Keys) {
    foreach ($field in @('label','description')) { Assert ($seen.ContainsKey("$name.$field")) "Missing translation: $name.$field" }
}
$operations = @()
foreach ($file in Get-ChildItem "$root/Mod/Patches" -Filter *.xml) {
    $patch = ReadXml $file.FullName
    Assert ($patch.SelectNodes('/Patch/Operation').Count -eq 1) "Unexpected unguarded patch: $file"
    $guard = $patch.SelectSingleNode('/Patch/Operation')
    Assert ($guard.Class -eq 'FlavorTextExtendedFR.PatchOperationFrench') "Unguarded language patch: $file"
    Assert ($guard.patch.Class -eq 'PatchOperationSequence') "Expected sequence: $file"
    $operations += @($guard.SelectNodes('patch/operations/li'))
}
# Verify the optional Extended provider addition separately from upstream replacements.
$providerOps = @($operations | Where-Object Class -eq 'PatchOperationAdd')
Assert ($providerOps.Count -eq 1) 'Expected one optional Extended provider table'
$provider = $providerOps[0]
Assert ($provider.xpath -eq 'Defs') 'Provider table must be added to Defs'
$addedTables = @($provider.SelectNodes('value/FlavorText.ThingInflectionsData'))
Assert ($addedTables.Count -eq 5) 'Expected five optional provider tables'
foreach ($addedTable in $addedTables) {
    Assert (-not [string]::IsNullOrWhiteSpace($addedTable.packageID)) 'Missing provider scope'
    foreach ($item in $addedTable.SelectNodes('dictionary/li')) {
        Assert ($item.SelectNodes('value/li').Count -eq 4) 'Expected four optional ingredient forms'
        foreach ($form in $item.SelectNodes('value/li')) { Assert (-not [string]::IsNullOrWhiteSpace($form.InnerText) -and $form.InnerText -notmatch '[{}*^_]') 'Unresolved optional form' }
    }
}
$table = $provider.SelectSingleNode('value/FlavorText.ThingInflectionsData[defName="FTFR_ExtendedNewHarvest"]')
Assert ($table.defName -eq 'FTFR_ExtendedNewHarvest' -and $table.packageID -eq 'VVenchov.VVNewHarvest') 'Wrong optional provider identity'
$entry = $table.SelectSingleNode('dictionary/li')
Assert ($table.SelectNodes('dictionary/li').Count -eq 1 -and $entry.key -eq 'VV_Leeks') 'Wrong optional ingredient'
Assert (($entry.SelectNodes('value/li') | ForEach-Object InnerText) -join '|' -ceq 'aux poireaux|poireaux|poireau|de poireaux') 'Unexpected leek forms'
$operations = @($operations | Where-Object Class -ne 'PatchOperationAdd')
$foodCourtKeys = @('RawDaBaiCai','RawLianOu','RawLvDou','WorkedFenTiao')
foreach ($foodCourtKey in $foodCourtKeys) {
    $matches = @($provider.SelectNodes('value/FlavorText.ThingInflectionsData/dictionary/li[key="'+$foodCourtKey+'"]'))
    Assert ($matches.Count -eq 1) "Duplicate or missing FoodCourt form: $foodCourtKey"
    Assert ($matches[0].ParentNode.ParentNode.packageID -ceq 'dajian.chiteaditional.expanded') "Wrong FoodCourt provider: $foodCourtKey"
}
Assert ($provider.SelectNodes('value/FlavorText.ThingInflectionsData/dictionary/li[key="RawZongYe"]').Count -eq 0) 'Zongzi wrapper must remain excluded'
$discovery = ReadXml "$root/Mod/Languages/French/DefInjected/FlavorText.FlavorDef/Ext_FoodCourtDiscovery.xml"
Assert ($discovery.SelectNodes('/LanguageData/*').Count -eq 10) 'Expected five translated FoodCourt dishes'
foreach ($field in $discovery.SelectNodes('/LanguageData/*')) {
    $parts=$field.Name.Split('.')
    $source=$dishes[$parts[0]].SelectSingleNode($parts[1]).InnerText
    $sourceIndices=@([regex]::Matches($source,'\{(\d+)_\w+\}') | ForEach-Object {$_.Groups[1].Value} | Sort-Object -Unique)
    $translatedIndices=@([regex]::Matches($field.InnerText,'\{(\d+)_\w+\}') | ForEach-Object {$_.Groups[1].Value} | Sort-Object -Unique)
    Assert (($sourceIndices -join ',') -ceq ($translatedIndices -join ',')) "FoodCourt ingredient identity changed: $($field.Name)"
}
Write-Output 'PASS: ten FoodCourt fields preserve source ingredient indices; four scoped Shenzhou entries; zongzi wrapper excluded.'
Write-Output 'PASS: French-only optional VV_Leeks table and four reviewed forms.'
Assert ($operations.Count -eq 25) 'Expected fifteen dictionaries, seven category forms and three grammar patches'
$entries = 0
$tables = @{}
$grammars = 0
$categories = 0
foreach ($op in $operations) {
    Assert ($op.Class -eq 'PatchOperationReplace') 'Unexpected patch class'
    $targets = $defs.SelectNodes($op.xpath)
    Assert ($targets.Count -eq 1) "Patch must match exactly once: $($op.xpath)"
    if ($targets[0].Name -eq 'inflectionsOverride') {
        $forms=$op.SelectNodes('value/inflectionsOverride/li')
        Assert ($forms.Count -eq 4) 'Category must have four concrete forms'
        foreach($form in $forms){Assert (-not [string]::IsNullOrWhiteSpace($form.InnerText) -and $form.InnerText -notmatch '[{}*^_]') "Unresolved category form: $form"}
        $replacement=$defs.ImportNode($op.SelectSingleNode('value/inflectionsOverride'),$true)
        $null=$targets[0].ParentNode.ReplaceChild($replacement,$targets[0])
        $categories++
        continue
    }
    if ($targets[0].Name -eq 'rulesStrings') {
        $rules = $op.SelectNodes('value/rulesStrings/li')
        Assert ($rules.Count -gt 0) 'Empty French grammar'
        foreach ($rule in $rules) {
            Assert ($rule.InnerText -match '^(hairy|label|maindish|sidedish)(\([^)]*\))?->.+') "Invalid grammar: $rule"
            Assert ($rule.InnerText.StartsWith('hairy->') -or ($rule.InnerText.Contains('{0}') -and $rule.InnerText.Contains('{1}'))) "Missing dish parameter: $rule"
            Assert ($rule.InnerText -notmatch '\[[^]]+\]') "Unresolved grammar dependency: $rule"
        }
        $replacement=$defs.ImportNode($op.SelectSingleNode('value/rulesStrings'),$true)
        $null=$targets[0].ParentNode.ReplaceChild($replacement,$targets[0])
        $grammars++
        continue
    }
    $tableName=$targets[0].ParentNode.defName
    Assert (-not $tables.ContainsKey($tableName)) "Duplicate dictionary patch: $tableName"
    $tables[$tableName]=$true
    $keys = @{}
    foreach ($entry in $op.SelectNodes('value/dictionary/li')) {
        Assert (-not $keys.ContainsKey($entry.key)) "Duplicate ingredient: $($entry.key)"
        $keys[$entry.key] = $true
        $forms = $entry.SelectNodes('value/li')
        Assert ($forms.Count -eq 4) "Expected four forms: $($entry.key)"
        foreach ($form in $forms) { Assert (-not [string]::IsNullOrWhiteSpace($form.InnerText)) "Empty form: $($entry.key)" }
        $entries++
    }
    foreach ($original in $targets[0].SelectNodes('li')) {
        Assert ($keys.ContainsKey($original.key)) "Source ingredient lost: $tableName/$($original.key)"
    }
    $replacement = $defs.ImportNode($op.SelectSingleNode('value/dictionary'), $true)
    $null = $targets[0].ParentNode.ReplaceChild($replacement, $targets[0])
}
Assert ($entries -eq 186) 'Expected 186 ingredient entries'
Assert ($grammars -eq 3) 'Expected three grammar replacements'
Assert ($categories -eq $defs.SelectNodes('/Defs/FlavorText.FlavorCategoryDef/inflectionsOverride').Count) 'Category override coverage incomplete'
foreach($table in $defs.SelectNodes('/Defs/FlavorText.ThingInflectionsData')) {
    Assert ($tables.ContainsKey($table.defName)) "Untranslated inflection table: $($table.defName)"
}
$keyed = ReadXml "$root/Mod/Languages/French/Keyed/Misc.xml"
$keys = @{}
foreach ($node in $keyed.SelectNodes('/LanguageData/*')) {
    Assert (-not $keys.ContainsKey($node.Name)) "Duplicate setting: $($node.Name)"
    Assert (-not [string]::IsNullOrWhiteSpace($node.InnerText)) "Empty setting: $($node.Name)"
    $keys[$node.Name] = $true
}
Assert ($keys.Count -eq 10) 'Expected ten settings'
$englishFile=Join-Path (Split-Path (Split-Path $FlavorText)) 'Languages/English/Keyed/Misc.xml'
$english=ReadXml $englishFile
foreach($entry in $english.SelectNodes('/LanguageData/*')) {
    Assert ($keys.ContainsKey($entry.Name)) "Missing French setting: $($entry.Name)"
    $fr=$keyed.SelectSingleNode('/LanguageData/'+$entry.Name)
    $enTokens=@([regex]::Matches($entry.InnerText,'\{\d+\}') | ForEach-Object Value | Sort-Object -Unique)
    $frTokens=@([regex]::Matches($fr.InnerText,'\{\d+\}') | ForEach-Object Value | Sort-Object -Unique)
    Assert (($enTokens -join ',') -eq ($frTokens -join ',')) "Setting parameters differ: $($entry.Name)"
}
$folders=ReadXml "$root/Mod/LoadFolders.xml"
Assert ($folders.SelectNodes('/loadFolders/v1.6/li[text()="/" and not(@IfModActive)]').Count -eq 1) 'Root folder not loaded'
Assert ($folders.SelectNodes('/loadFolders/v1.6/li[text()="Biotech" and @IfModActive="Ludeon.RimWorld.Biotech"]').Count -eq 1) 'Biotech folder not gated'
$about = (ReadXml "$root/Mod/About/About.xml").ModMetaData
Assert ($about.packageId -eq 'nelim.flavortextextended.fr') 'Wrong packageId'
Assert ($about.description.Contains($about.url)) 'GitHub URL missing from description'
foreach ($id in @('brrainz.harmony','hekmo.FlavorText','nelim.flavortextextended')) {
    Assert ($id -in $about.modDependencies.li.packageId) "Missing dependency: $id"
    Assert ($id -in $about.loadAfter.li) "Missing loadAfter: $id"
}
# The root rule asks for a ' (unofficial)' suffix on a 'silent' mod. Owner decision 2026-09-25: this mod does not carry it;
# the justification (hekmo's public comments of 2025-09-07/08 and 2025-10-12) is in _tools/UPSTREAM-PERMISSION-REVIEW.md.
Assert ($about.name.StartsWith('Flavor Text Extended - Fran') -and $about.name.Length -eq 'Flavor Text Extended - Fran'.Length + 4 -and -not $about.name.EndsWith('(unofficial)')) 'Unexpected mod name (the (unofficial) suffix was dropped by the owner on 2026-09-25)'
Assert ($about.description.StartsWith('UNOFFICIAL.')) 'Missing unofficial disclaimer'
Assert ($about.description.Contains('[url='+$about.url+']Source code on GitHub[/url]')) 'Missing labeled GitHub link'
$button=(ReadXml "$root/Mod/Defs/MainButtonDefs/Settings.xml").Defs.MainButtonDef
Assert ($button.buttonVisible -eq 'false') 'Shortcut must be hidden by default'
Assert ($button.validWithoutMap -eq 'true') 'Shortcut must work without a map'
Assert ($button.workerClass -eq 'FlavorTextExtendedFR.SettingsButton') 'Wrong shortcut worker'
$buttonFr=ReadXml "$root/Mod/Languages/French/DefInjected/MainButtonDef/Settings.xml"
foreach($field in @('label','description')){
    Assert (-not [string]::IsNullOrWhiteSpace($button.$field)) "Missing English shortcut $field"
    Assert (-not [string]::IsNullOrWhiteSpace($buttonFr.SelectSingleNode('/LanguageData/FTFR_Settings.'+$field).InnerText)) "Missing French shortcut $field"
}
Write-Output "PASS: $($files.Count) XML files; $($dishes.Count) dishes; 25 French-only patches applied in memory; $entries ingredients across 15 tables; 7 category overrides; 3 grammars; 10 upstream setting strings; Biotech gating; hidden bilingual shortcut."
