# Flavor Text Extended - Français

French translation of [Flavor Text](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432)
by hekmo and of [Flavor Text Extended](https://github.com/vbardales/Rimworld-Flavor-Text-Extended).
RimWorld 1.6.

This mod contains no dishes: text and grammatical forms only.

## Install it only if you play in French

It needs both other mods. In an English game it would produce French forms inside English
dish names — see below for why it cannot help doing so.

## What it translates

The 930 dish names of Flavor Text and their 930 descriptions. The 896 dishes of Flavor
Text Extended, names and descriptions. The mod's own settings.

## What your colony grows decides what you see

A dish can only appear if its ingredients exist in the game. The 896 of Flavor Text
Extended lean on a wider pantry than vanilla keeps — wheat, cheese, butter, cream, onion,
tomato, garlic, chilli — so a save with no cooking mods will see about forty of them.

This translation covers everything regardless: hekmo's 930 and the 896, whether they fire
or not. Nothing more to install the day you add a farming mod.

## The grammar, which is the real subject

Flavor Text gives every ingredient four forms. In English they are plural, collective,
singular and adjectival. In French the fourth cannot carry an adjective: *rôti* agrees in
gender and number, and text substitution does not know the gender of an ingredient.

The four slots are therefore remapped onto forms that **carry their own preposition**:

| Slot | Role | Example |
|---|---|---|
| `{N_plur}` | the "à" form | aux baies, au riz, à la viande de bœuf |
| `{N_coll}` | bare form | baies, riz, viande de bœuf |
| `{N_sing}` | singular | baie, riz, œuf de poule |
| `{N_adj}` | the "de" form, with elision | de baies, d'oignon, de bœuf |

Dish names are rewritten with a noun head — *rôti de bœuf*, not *rôti bœuf* — so that no
agreement ever depends on an unknown ingredient. Elision is handled, including before an
aspirated h: *d'oignon*, but *de héron*.

One hundred and fifty ingredients are covered, across the four expansions, taken from the
game's official French translations.

## Why a separate mod rather than a `Languages/` folder

The inflections live in a def, not in a language file, and RimWorld cannot inject a
translation into that kind of field. This is not an assumption: it was tested in game,
first on an indexed path (`value.0`), then on a `[TranslationHandle]`. Both fail, and the
translation error count goes up rather than down.

Replacing them therefore takes a `PatchOperation`, which applies whatever language the game
is running in. That is also why this mod cannot be folded into the English one: it would
render *de bœuf roast* for anyone playing in English.

Splitting the two mods is the only way to leave each language intact.

## Layout

```
Languages/French/DefInjected/FlavorText.FlavorDef/
    Labels_01-12.xml, Descriptions_01-13.xml   hekmo's 930 dishes
    Ext_*.xml  (42 files)                       the 896 of Flavor Text Extended
Languages/French/Keyed/Misc.xml                 the settings
Patches/Inflections_FR.xml                      the inflection table, 150 ingredients
```

One `Ext_*.xml` per defs file in the English mod, same split and same name, so that a dish
can be found on both sides without hunting for it.

## A known limit

The inflection table covers the ingredients of the base game and the four expansions. An
ingredient from another mod is not in it: Flavor Text then falls back on its own mechanism
and shows the English form, or a raw one. There is no console error — the dish simply reads
less well.

## Credits

**Flavor Text** is by hekmo. All of its machinery — how names are composed, how a
definition is chosen, how ingredients inflect — is his work. This mod only substitutes text
into it.

Translation produced with the assistance of Claude (Anthropic), under human direction and
review. See `ATTRIBUTION.md` for the detail.

## Licence

MIT, see `LICENSE`. It covers the translations and the inflection table. It does not cover
Flavor Text, which remains under its own terms.

- - -

## En français

Traduction française de Flavor Text (hekmo) et de Flavor Text Extended. Aucun plat : que du
texte et des formes grammaticales.

**À installer seulement si vous jouez en français.** Il remplace la table d'inflexions des
ingrédients, qui vit dans une def et non dans un fichier de langue : le remplacement
s'applique donc quelle que soit la langue du jeu, RimWorld ne sachant pas conditionner un
patch XML à la langue courante. Dans une partie en anglais, il produirait des formes
françaises à l'intérieur de noms anglais.

C'est aussi la raison pour laquelle il est un mod séparé, et non un dossier `Languages/`
dans Flavor Text Extended.
