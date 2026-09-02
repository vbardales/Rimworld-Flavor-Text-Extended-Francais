# Attributions

## Required mods

**Flavor Text** (hekmo) — [Workshop 3245374432](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432)
**Flavor Text Extended** (nelim)

This mod contains no dish and no file from either of those two mods. All it adds is
French text and a table of grammatical forms.

## Why this is a separate mod

Flavor Text gives four forms to every ingredient, and that table lives in a `Def`, not
in a language file. RimWorld cannot inject a translation into a dictionary-typed field:
this was tested in game, both by position and by handle, and both were rejected — the
translation error count went from 3 to 5, and the targeted dish was left unchanged.

Replacing the table therefore requires a `PatchOperationReplace`, and an XML patch has no
way to gate itself on the game's language. `Patches/Inflections_FR.xml` is thus always
applied. In an English game, a dish named "{0_adj} roast" would display "de bœuf roast".

Splitting the two mods is the only way to leave each language intact.

## Remapping the four slots

English uses plural, collective, singular and adjective. The fourth cannot be rendered in
French: *rôti* agrees in gender and number, and a text substitution does not know that.
The four therefore carry:

| slot | French form | examples |
|---|---|---|
| `{N_plur}` | "à" form | aux baies, au riz, à la viande de bœuf |
| `{N_coll}` | bare form | baies, riz, viande de bœuf |
| `{N_sing}` | singular | baie, riz, œuf de poule |
| `{N_adj}` | "de" form, elision included | de baies, d'oignon, de héron |

Dish names are rewritten head-noun first — *rôti de bœuf* rather than *rôti bœuf* — so
that no agreement depends on an unknown ingredient. Natural agreement is used only where
the category guarantees the gender: `FT_Egg` always yields a masculine plural,
`FT_MeatRaw` always *viande de X*, feminine singular.

A hundred and fifty ingredients are covered across the four expansions, generated from
the game's official translations by `_tools/geninflections.js` in the English mod.

## AI assistance

The content of this mod was produced with the assistance of Claude (Anthropic), under
human direction and review. The design decisions — the remapping above, splitting the two
mods, the translation trade-offs — were made and approved by the human author.

## Known limits

- **No tool checks gender agreement.** A wrong agreement is valid French as far as a
  machine is concerned: neither RimWorld's translation report nor the checkers in
  `_tools/` can see it. They will only show up in play.
- Three dish names deliberately lose an ingredient slot, because French has a fixed name
  where English inserted the material: beef Wellington, gingerbread, energy bar.
- Two descriptions raise a discrepancy with the checker, both intentional: "bubble and
  squeak" is a proper name kept as is, and `Powdered_PlantFoodRaw_Balls` calls in the
  original for a `{2_coll}` slot its def does not have — a dead placeholder in Flavor
  Text, for which the French translation substitutes `{0}`.

## Licence

MIT, see `LICENSE`. It covers the translated text and the inflection table. It covers
neither Flavor Text nor Flavor Text Extended.
