param([string]$Source = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/3245374432/1.6/Defs/ThingInflections.xml')
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
# Reviewed French forms: a-form, collective, singular, de-form. IDs belong to upstream.
$forms = @{
Meat_Cow = @('à la viande de bœuf','viande de bœuf','morceau de viande de bœuf','de bœuf')
Rawmushroom = @('aux champignons','champignons','champignon','de champignons')
Rawbean = @('aux haricots','haricots','haricot','de haricots')
Rawsnowbeet = @('aux betteraves des neiges','betteraves des neiges','betterave des neiges','de betteraves des neiges')
RawOlive = @('aux olives','olives','olive',"d'olives")
Raworange = @('aux oranges','oranges','orange',"d'oranges")
RawRedLentil = @('aux lentilles corail','lentilles corail','lentille corail','de lentilles corail')
Rawdate = @('aux dattes','dattes','datte','de dattes')
RawCoconut = @('à la noix de coco','noix de coco','noix de coco','de noix de coco')
Rawgooseberry = @('aux groseilles à maquereau','groseilles à maquereau','groseille à maquereau','de groseilles à maquereau')
Rawcloudberry = @('aux mûres arctiques','mûres arctiques','mûre arctique','de mûres arctiques')
Rawblueberry = @('aux myrtilles','myrtilles','myrtille','de myrtilles')
Rawpeach = @('aux pêches','pêches','pêche','de pêches')
driedfruit = @('aux fruits séchés','fruits séchés','fruit séché','de fruits séchés')
Flour = @('à la farine','farine','portion de farine','de farine')
VCE_RawSunflower = @('aux graines de tournesol','graines de tournesol','graine de tournesol','de graines de tournesol')
VCE_RawGarlic = @("à l'ail",'ail',"gousse d'ail","d'ail")
VCE_RawSpices = @('aux épices','épices','épice',"d'épices")
VCE_InsectJellyPreserves = @("aux conserves de gelée d'insecte","conserves de gelée d'insecte","conserve de gelée d'insecte","de conserves de gelée d'insecte")
VCE_Flour = @('à la pâte','pâte','portion de pâte','de pâte')
Meat_RH_DF_Bone = @('à la viande osseuse','viande osseuse','morceau de viande osseuse','de viande osseuse')
VV_QuinoaSeeds = @('au quinoa','quinoa','grain de quinoa','de quinoa')
VV_BroccoliFlorets = @('aux fleurettes de brocoli','fleurettes de brocoli','fleurette de brocoli','de brocoli')
VV_NettleLeaves = @('aux orties','orties',"feuille d'ortie","d'orties")
RC2_RawJuniperBerries = @('aux baies de genièvre','baies de genièvre','baie de genièvre','de genièvre')
RC2_Tofu = @('au tofu','tofu','morceau de tofu','de tofu')
RC2_RawCherries = @('aux cerises','cerises','cerise','de cerises')
RC2_Flour = @('à la pâte','pâte','portion de pâte','de pâte')
KIT_Cashew = @('aux pommes de cajou','pommes de cajou','pomme de cajou','de pommes de cajou')
DankPyon_RawMulberry = @('aux mûres','mûres','mûre','de mûres')
DankPyon_RawPumpkins = @('à la citrouille','citrouille','citrouille','de citrouille')
DankPyon_RawFlax = @('au lin','lin','graine de lin','de lin')
DankPyon_Salt = @('au sel','sel','pincée de sel','de sel')
DankPyon_EggConstrictorCaveFertilized = @('aux œufs de constricteur des cavernes','œufs de constricteur des cavernes','œuf de constricteur des cavernes',"d'œufs de constricteur des cavernes")
DankPyon_EggLargeCobraCaveFertilized = @('aux œufs de cobra des cavernes','œufs de cobra des cavernes','œuf de cobra des cavernes',"d'œufs de cobra des cavernes")
TP_EdibleSeaweed = @('aux algues','algues','algue',"d'algues")
}
[xml]$upstream = Get-Content -LiteralPath $Source
$doc = [System.Xml.XmlDocument]::new()
$doc.LoadXml('<Patch><Operation Class="FlavorTextExtendedFR.PatchOperationFrench"><patch Class="PatchOperationSequence"><operations /></patch></Operation></Patch>')
$operations = $doc.SelectSingleNode('//operations')
foreach ($table in $upstream.SelectNodes('/Defs/FlavorText.ThingInflectionsData')) {
    if ($table.defName -in @('Core','Biotech','Anomaly','Odyssey')) { continue }
    $op = $doc.CreateElement('li'); $op.SetAttribute('Class','PatchOperationReplace')
    $xpath = $doc.CreateElement('xpath')
    $xpath.InnerText = 'Defs/FlavorText.ThingInflectionsData[defName="' + $table.defName + '"]/dictionary'
    $null = $op.AppendChild($xpath)
    $value = $doc.CreateElement('value'); $dict = $doc.CreateElement('dictionary')
    foreach ($entry in $table.dictionary.li) {
        if (-not $forms.ContainsKey($entry.key)) { throw "Missing forms: $($entry.key)" }
        $li=$doc.CreateElement('li'); $key=$doc.CreateElement('key'); $key.InnerText=$entry.key
        $null=$li.AppendChild($key); $v=$doc.CreateElement('value')
        foreach($form in $forms[$entry.key]) { $f=$doc.CreateElement('li'); $f.InnerText=$form; $null=$v.AppendChild($f) }
        $null=$li.AppendChild($v); $null=$dict.AppendChild($li)
    }
    $null=$value.AppendChild($dict); $null=$op.AppendChild($value); $null=$operations.AppendChild($op)
}
$settings=[System.Xml.XmlWriterSettings]::new(); $settings.Indent=$true; $settings.Encoding=[System.Text.UTF8Encoding]::new($false)
$writer=[System.Xml.XmlWriter]::Create((Join-Path $root 'Mod/Patches/Inflections_ThirdParty_FR.xml'),$settings)
try { $doc.Save($writer) } finally { $writer.Dispose() }
