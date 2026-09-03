# Flavor Text Extended - Français

Traduction française de [Flavor Text](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432)
(hekmo) et de [Flavor Text Extended](https://github.com/vbardales/Rimworld-Flavor-Text-Extended).
RimWorld 1.6.

Ce mod ne contient aucun plat : uniquement des textes et des formes grammaticales.

## À installer seulement si vous jouez en français

Il lui faut les deux autres mods. Dans une partie en anglais, il produirait des formes
françaises à l'intérieur de noms anglais — voir plus bas pourquoi il ne peut pas s'en
empêcher.

## Ce qu'il traduit

Les 930 noms de plats de Flavor Text et leurs 930 descriptions. Les 896 plats de
Flavor Text Extended, noms et descriptions. Les réglages du mod.

## Ce que votre colonie cultive décide de ce que vous voyez

Un plat ne peut apparaître que si ses ingrédients existent dans la partie. Les 896 de
Flavor Text Extended s'appuient sur un garde-manger plus large que celui du jeu de base —
blé, fromage, beurre, crème, oignon, tomate, ail, piment — et une partie sans mod de
cuisine n'en verra qu'une quarantaine.

Cette traduction, elle, couvre tout : les 930 plats de hekmo et les 896, qu'ils se
déclenchent ou non. Rien à installer de plus le jour où vous ajoutez un mod d'agriculture.

## La grammaire, qui est le vrai sujet

Flavor Text donne quatre formes à chaque ingrédient. En anglais ce sont le pluriel, le
collectif, le singulier et l'adjectif. En français le quatrième ne peut pas porter un
adjectif : « rôti » s'accorde en genre et en nombre, et une substitution de texte ne sait
pas le faire.

Les quatre emplacements sont donc remappés sur des formes qui **portent leur préposition** :

| Emplacement | Rôle | Exemple |
|---|---|---|
| `{N_plur}` | forme en « à » | aux baies, au riz, à la viande de bœuf |
| `{N_coll}` | forme nue | baies, riz, viande de bœuf |
| `{N_sing}` | singulier | baie, riz, œuf de poule |
| `{N_adj}` | forme en « de », avec élision | de baies, d'oignon, de bœuf |

Les noms de plats sont réécrits à tête nominale — « rôti de bœuf » et non « rôti bœuf » —
de sorte qu'aucun accord ne dépende d'un ingrédient inconnu. L'élision est traitée, y
compris devant un h aspiré : « d'oignon », mais « de héron ».

Cent cinquante ingrédients sont couverts, sur les quatre extensions, à partir des
traductions officielles du jeu.

## Pourquoi un mod séparé plutôt qu'un dossier `Languages/`

Les inflexions vivent dans une def, pas dans un fichier de langue, et RimWorld ne sait pas
injecter de traduction dans ce type de champ. Ce n'est pas une supposition : le test a été
fait en jeu, sur un chemin indexé (`value.0`) puis sur un `[TranslationHandle]`. Les deux
échouent, et le nombre d'erreurs de traduction augmente au lieu de diminuer.

Les remplacer suppose donc un `PatchOperation`, qui s'applique quelle que soit la langue du
jeu. C'est aussi la raison pour laquelle ce mod ne peut pas être fusionné dans le mod
anglais : il rendrait « de bœuf roast » à qui joue en anglais.

Séparer les deux mods est la seule façon de laisser chaque langue intacte.

## Arborescence

```
Languages/French/DefInjected/FlavorText.FlavorDef/
    Labels_01-12.xml, Descriptions_01-13.xml   les 930 plats de hekmo
    Ext_*.xml  (42 fichiers)                    les 896 plats de Flavor Text Extended
Languages/French/Keyed/Misc.xml                 les réglages
Patches/Inflections_FR.xml                      la table d'inflexions, 150 ingrédients
```

Un fichier `Ext_*.xml` par fichier de defs du mod anglais, même découpage et même nom, pour
qu'un plat se retrouve des deux côtés sans avoir à chercher.

## Une limite connue

La table d'inflexions couvre les ingrédients du jeu de base et des quatre extensions. Un
ingrédient venu d'un autre mod n'y figure pas : Flavor Text retombe alors sur son propre
mécanisme, et affiche la forme anglaise ou une forme brute. Il n'y a pas d'erreur en
console — le plat s'affiche simplement moins bien.

## Crédits

**Flavor Text** est de hekmo. Toute sa mécanique — la composition des noms, le choix d'une
définition, l'inflexion des ingrédients — est son œuvre. Ce mod ne fait qu'y substituer du
texte.

Traduction produite avec l'assistance de Claude (Anthropic), sous direction et relecture
humaines. Voir `ATTRIBUTION.md` pour le détail.

## Licence

MIT, voir `LICENSE`. Elle couvre les traductions et la table d'inflexions. Elle ne couvre
pas Flavor Text, qui reste sous ses propres termes.

- - -

## In English

French translation of Flavor Text (hekmo) and Flavor Text Extended. Contains no dishes:
text and grammatical forms only.

**Install this only if you play in French.** It replaces the ingredient inflection table,
which lives in a def rather than a language file, so the replacement applies in every
language — RimWorld cannot make an XML patch conditional on the current one. In an English
game it would produce French forms inside English dish names.

That constraint is also why this is a separate mod rather than a `Languages/` folder inside
Flavor Text Extended.
