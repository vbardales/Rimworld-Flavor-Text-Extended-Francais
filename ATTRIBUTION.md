# Attributions

## Mods requis

**Flavor Text** (hekmo) — [Workshop 3245374432](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432)
**Flavor Text Extended** (nelim)

Ce mod ne contient aucun plat et aucun fichier de ces deux mods. Il n'apporte que
des textes français et une table de formes grammaticales.

## Pourquoi ce mod est séparé

Flavor Text donne quatre formes à chaque ingrédient, et cette table vit dans une
`Def`, pas dans un fichier de langue. RimWorld ne sait pas injecter de traduction
dans un champ de type dictionnaire : la chose a été testée en jeu, par position et
par handle, et les deux formes ont été rejetées — le compteur d'erreurs de
traduction est passé de 3 à 5, et le plat visé est resté inchangé.

Remplacer la table suppose donc un `PatchOperationReplace`, et un patch XML n'a
aucun moyen de se conditionner à la langue du jeu. `Patches/Inflections_FR.xml`
s'applique donc toujours. Dans une partie en anglais, un plat nommé
« {0_adj} roast » afficherait « de bœuf roast ».

Séparer les deux mods est la seule façon de laisser chaque langue intacte.

## Le remappage des quatre emplacements

L'anglais emploie pluriel, collectif, singulier et adjectif. Le quatrième ne peut
pas être rendu en français : « rôti » s'accorde en genre et en nombre, et une
substitution de texte ne le sait pas. Les quatre portent donc :

| emplacement | forme française | exemples |
|---|---|---|
| `{N_plur}` | forme « à » | aux baies, au riz, à la viande de bœuf |
| `{N_coll}` | forme nue | baies, riz, viande de bœuf |
| `{N_sing}` | singulier | baie, riz, œuf de poule |
| `{N_adj}` | forme « de », élision comprise | de baies, d'oignon, de héron |

Les noms de plats sont réécrits à tête nominale — « rôti de bœuf » et non
« rôti bœuf » — pour qu'aucun accord ne dépende d'un ingrédient inconnu. L'accord
naturel n'est employé que là où la catégorie garantit le genre : `FT_Egg` donne
toujours un masculin pluriel, `FT_MeatRaw` toujours « viande de X », féminin
singulier.

Cent cinquante ingrédients sont couverts, sur les quatre extensions, générés depuis
les traductions officielles du jeu par `_tools/geninflections.js` du mod anglais.

## Assistance par IA

Le contenu de ce mod a été produit avec l'assistance de Claude (Anthropic), sous
direction et relecture humaines. Les décisions de conception — le remappage
ci-dessus, la séparation des deux mods, les arbitrages de traduction — ont été
prises et validées par l'auteur humain.

## Limites connues

- **Les accords en genre ne sont vérifiés par aucun outil.** Une faute d'accord est
  du français valide pour la machine : ni le rapport de traduction de RimWorld ni les
  vérificateurs de `_tools/` ne peuvent la voir. Elles n'apparaîtront qu'en jouant.
- Trois noms de plats perdent volontairement un emplacement d'ingrédient, parce que
  le français a un nom fixe là où l'anglais insérait la matière : bœuf Wellington,
  pain d'épices, barre énergétique.
- Deux descriptions signalent un écart au vérificateur, l'un et l'autre voulus :
  « bubble and squeak » est un nom propre conservé, et `Powdered_PlantFoodRaw_Balls`
  appelle dans l'original un emplacement `{2_coll}` que sa def ne possède pas — un
  placeholder mort de Flavor Text, auquel la traduction française substitue `{0}`.

## Licence

MIT, voir `LICENSE`. Elle couvre les textes traduits et la table d'inflexions. Elle
ne couvre ni Flavor Text ni Flavor Text Extended.
