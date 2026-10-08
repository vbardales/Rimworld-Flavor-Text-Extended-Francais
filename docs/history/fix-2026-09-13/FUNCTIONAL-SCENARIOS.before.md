# Functional scenarios

In-game verification for **Flavor Text Extended - Français**. One observable point per scenario,
and what its failure looks like in `Player.log`.

This mod is XML only: no assembly, nothing of its own to execute. Everything it does happens inside
someone else's code — hekmo's `FlavorText.dll` reads the inflection table this mod replaces, and
RimWorld's translation loader injects the labels and descriptions. Static checks can prove the
files are well formed and that every handle names a def that exists. They cannot prove that a
colonist who cooks a meal reads French. That is what these scenarios are for.

**The game is never launched from a session.** Virginie launches it. A session prepares the run,
hands over the steps, and reads the log afterwards.

## Preparing a run

1. Back up `Config/ModsConfig.xml` to `.bak`.
2. Load order: Harmony, Core, expansions, Flavor Text (`hekmo.FlavorText`), Flavor Text Extended
   (`nelim.flavortextextended`), then this mod (`nelim.flavortextextended.fr`).
3. Set the game language to **French**. Most of these scenarios are meaningless in any other
   language, and scenario 16 is the one that says why.
4. Empty `AppData/LocalLow/Ludeon Studios/RimWorld by Ludeon Studios/Player.log`.
5. Ask Virginie to launch and play the scenario.
6. Read the log afterwards, filtering on
   `^(XML error|Config error|Could not resolve|Could not find|Patch operation)`. Two passes: the
   first lists everything, the second must return nothing.

## Two conditions, not one

A dish can only name a meal when **both** hold. Missing either is the usual reason a scenario
produces nothing and looks like a failure when it is not.

- **Its ingredient slots are satisfiable.** Each slot names categories, and a category accepts its
  whole descent.
- **One of its meal kinds exists.** A dish declares `mealKinds`, and most of hekmo's declare a
  kind of cooking — soup, bake, snack, dessert, grill — that only a cooking mod provides.

On the profile measured on 2026-09-12, no cooking mod is active. The meal kinds that exist are the
base game's: `FT_MealsNormal` with simple, fine and lavish meals, `FT_MealsSurvivalPack`,
`FT_MealsPaste`, and `FT_MealsBaby` from Biotech. Every dish named below declares
`FT_MealsNonSpecial` or one of its descendants, so all of them can fire as an ordinary meal.

## The manoeuvre every naming scenario uses

Flavor Text names a meal after the ingredients that actually went into it, so the way to test a
specific dish name is to control those ingredients. Use the **bill's ingredient filter**, not the
stockpile: open the cooking bill, restrict the allowed ingredients to exactly the ones the dish
wants, and cook one meal. Development mode is the fast way to put the raw ingredients on the map in
the first place.

Four of the scenarios below share one dish and one setup, and differ only in which meat is allowed.
Running them together is a single stove and four bills.

## What the numbers should be

| | |
|---|---|
| Dish names and descriptions translated | 1826 |
| of which from Flavor Text (hekmo) | 930 |
| of which from Flavor Text Extended | 896 |
| Dishes whose ingredients exist, measured 2026-09-12 | 729 |
| Of those, dishes whose meal kind also exists | 222 |
| Ingredient inflection entries, four forms each | 150 |
| Core / Odyssey / Biotech / Anomaly | 87 / 58 / 4 / 1 |
| Patch operations, all `PatchOperationReplace` | 4 |
| Settings strings | 10 |

---

# Group A — Loading

## Scenario 0 — Startup

**Setup.** Launch with the three mods active. Go no further than the main menu.

**Observe.** One line in `Player.log`:

```
[Flavor Text] mod is now active: N active FlavorDefs for the current modlist found out of 1826 total FlavorDefs
```

**Pass.** The second number is **1826**. That is 930 from hekmo plus 896 from Flavor Text Extended,
and it counts defs, not translations — it proves both content mods loaded, which is what everything
below depends on.

**Fail.** A total of 930 means Flavor Text Extended did not load, and three quarters of the
scenarios below cannot run. A total of 0, or no line at all, means Flavor Text itself failed.

**The first number is not a verdict, and it is not the playable count either.** It counts dishes
whose ingredients exist, so on the profile measured it should land near 729. The number of dishes
that can actually name a meal there is 222, because the rest declare a meal kind no active mod
provides. Both are properties of the playthrough, not of this mod.

## Scenario 1 — The four inflection patches applied

**Setup.** Same as scenario 0.

**Observe.** Nothing in `Player.log` matching `Patch operation` for this mod.

**Pass.** Silence. The four operations target
`Defs/FlavorText.ThingInflectionsData[defName="X"]/dictionary` for `Core`, `Biotech`, `Anomaly` and
`Odyssey`, and a `PatchOperationReplace` whose xpath matches nothing is loud.

**Fail.**

```
Patch operation Verse.PatchOperationReplace(...) failed
file: .../Patches/Inflections_FR.xml
```

The likely cause is upstream: hekmo renamed a `ThingInflectionsData`, or moved the `dictionary`
field. The four names are hekmo's own and have held since 1.6.

**Why this one matters more than it looks.** If a patch silently stops matching, nothing else
breaks — the mod still loads, the dish names are still French, and the ingredient names quietly
revert to English inside them. Scenario 4 would catch it, but only if someone runs it.

## Scenario 2 — The patches apply without the expansions

**Setup.** Deactivate Biotech, Anomaly and Odyssey. Launch to the main menu.

**Observe.** Same as scenario 1: no failed patch operation.

**Pass.** Silence. hekmo declares all fifteen of his inflection tables unconditionally, so the
`Biotech`, `Anomaly` and `Odyssey` tables exist whether or not the player owns those expansions.
The entries inside them name things that will not exist, which costs nothing.

**Fail.** A failed patch operation naming one of the three expansion tables. That would mean hekmo
has started gating those defs, and the three operations need a `MayRequire` on their def node, not
on the `<Operation>`, which reads it from nowhere.

## Scenario 3 — Every entry has exactly four forms

**Setup.** Launch and cook any meal at all.

**Observe.** No line in `Player.log` containing `wrong number of inflections`.

**Pass.** Silence.

**Fail.**

```
X had wrong number of inflections. Expected 4 inflections, found 3 instead
```

Flavor Text expects four forms per ingredient and says so by name. This is the failure mode of a
hand-edit to `Inflections_FR.xml`: delete or duplicate one `<li>` and only that one ingredient
breaks, in only the dishes that use that slot.

---

# Group B — The grammar, which is the whole point

Scenarios 4 to 7 share one dish, **fricassée**, whose French label is `fricassée {0_adj}` against
an English `{0_adj} fricasee`. It takes a meat and a dairy, declares an ordinary meal kind, and
mentions only the meat in its name. One stove, one bill per meat.

**Common setup.** Development mode. Spawn milk and the meats named below. Build a stove, add a
**fine meal** bill, and restrict its ingredient filter to milk plus exactly one meat.

## Scenario 4 — Slot 3 carries the preposition

**Setup.** Common setup, with **cow meat**.

**Observe.** The meal's name.

**Pass.** **fricassée de bœuf**.

**Fail.** `fricassée bœuf`, or `fricassée viande de bœuf`. Either means the fourth slot is not
carrying `de bœuf` and the patched table is not being read — go back to scenario 1.

**What it proves.** This is the mod's central bet in one dish. English fills slot 3 with an
adjective. French cannot: an adjective there would have to agree in gender and number with an
ingredient the engine knows nothing about. The slot was remapped to a prepositional complement
instead, and dish names rewritten head-noun first. One preposition comes out, and no agreement is
ever needed.

## Scenario 5 — No gender agreement leaks

**Setup.** Common setup, run twice: **cow meat**, then **human meat**.

**Observe.** Both names.

**Pass.** **fricassée de bœuf** and **fricassée de chair humaine**. Everything before the
ingredient is identical in both.

**Fail.** Any word before the ingredient that changed shape between the two runs. That would mean a
label still opens with an adjective, and it is a bug in this mod's label files, not in the engine.

**Why these two meats.** Their collective forms differ in shape — *viande de bœuf* against *chair
humaine* — so a label that tried to agree with the ingredient would have to visibly pick one.

## Scenario 6 — Elision before a vowel

**Setup.** Common setup, with **squirrel meat**.

**Observe.** How the ingredient joins the name.

**Pass.** **fricassée d'écureuil**, elided.

**Fail.** `fricassée de écureuil`.

## Scenario 7 — No elision before an aspirated h

**Setup.** Common setup, with **husky meat**.

**Observe.** The same joint.

**Pass.** **fricassée de husky**, unelided.

**Fail.** `fricassée d'husky`.

**Why it is a separate scenario from 6.** French elides before a mute h and refuses before an
aspirated one, and nothing in the spelling tells them apart. No rule can be derived; the cases are
written out one by one. Running 6 and 7 together is what shows the distinction was handled rather
than averaged. Two more aspirated forms exist in the table, `de houblon` and the hemogen pack's
`d'hémogène` on the mute side, but neither ingredient can reach a cooking pot: hops sort into no
category at all, and hemogen packs into `FT_Blood`, which no dish has a slot for.

## Scenario 8 — Slot 0 carries the article

**Setup.** Two runs on a second dish, **omelette**, whose French label is `omelette {0_plur}`
against an English `{0_adj} omlette`. It takes a loose ingredient and an egg. Restrict the bill to
eggs plus **berries**, then to eggs plus **rice**.

**Observe.** The name.

**Pass.** **omelette aux baies**, then **omelette au riz**.

**Fail.** `omelette baies`, or `omelette de baies`.

**What it proves.** Slot 0 holds the article already contracted with the ingredient, so a label can
write `omelette {0_plur}` and get the right one of *aux*, *au* or *à la* without knowing the
ingredient's gender. Note that the French label moved the ingredient from slot 3 to slot 0: the
English name is adjectival, the French one wants an article, and a label is free to pick the slot
it needs.

## Scenario 9 — The third contraction

**Setup.** A third dish, **picadillo**, French label `picadillo {0_plur}`, taking a meat and a
potato. Restrict the bill to potatoes plus **cow meat**.

**Observe.** The name.

**Pass.** **picadillo à la viande de bœuf**.

**Fail.** Anything shorter, in particular `picadillo au bœuf`, which would mean slot 0 is being
filled from the wrong form.

**Why it is worth its own scenario.** *aux* and *au* are one word; *à la* is the case where the
slot has to carry a full phrase including the ingredient's own noun head. It is also the only one
of the three that reveals whether the meat table's first form survived the patch intact.

## Scenario 10 — Natural agreement, where the category allows it

**Setup.** A fourth dish, **braisée**, French label `{0_coll} braisée` against an English
`braised {0_coll}`. One slot, a meat. Restrict the bill to **cow meat** alone.

**Observe.** The ending of the last word.

**Pass.** **viande de bœuf braisée**, with the feminine ending.

**Fail.** `viande de bœuf braisé`.

**What it proves, and why it is not a contradiction of scenario 5.** The mod avoids agreement
wherever the ingredient is unknown. Here it is not unknown: the slot accepts `FT_MeatRaw` only, and
every entry in that category resolves to *viande de X*, feminine singular. The gender is guaranteed
by the category, so the label is allowed to write natural French. This scenario is the guard on
that permission: if `FT_MeatRaw` ever admitted an ingredient whose collective form is not feminine,
this label would start producing a wrong agreement and nothing else would notice.

## Scenario 11 — Descriptions are French too

**Setup.** Any cooked meal from any scenario above. Open its inspect pane and read the description,
not the name.

**Observe.** The description text.

**Pass.** French prose. All 1826 dishes have a translated description, not only a translated name.

**Fail.** English prose under a French name. That would mean the `Descriptions_*.xml` files did not
inject while the `Labels_*.xml` ones did, which would be odd — they sit in the same folder and load
together. Check the folder casing first: `DefInjected` must be spelled exactly that way, and a
mismatch that Windows forgives is fatal elsewhere.

---

# Group C — Known gaps

These three are expected to "fail" in the ordinary sense. They are here so a known limit is not
rediscovered as a bug, and so that the day one of them starts passing, someone notices.

## Scenario 12 — Side-dish clauses are still English

**Setup.** A **lavish meal** bill whose filter allows four or more distinct ingredients, so that
Flavor Text has to name two dishes and join them.

**Observe.** The word joining the two dish names.

**Current expected result.** An English joint: **and**, **with**, or **alongside**.

**Why.** The engine caps a dish at three ingredient slots and chunks the rest into a second dish,
joined by a rule from hekmo's `FT_SideDishLabels` rule pack. That pack is a `RulePackDef`, not a
`FlavorDef`, and this mod's `DefInjected` folder covers `FlavorText.FlavorDef` only.

**Fixable.** The strings live in `rulePack.rulesStrings`, a list of strings, which RimWorld injects
by index. Adding a `RulePackDef/` folder would cover them. The same holds for
`FT_SideDishDescriptions`, a larger job: it composes sentences from several rules and pulls in
vanilla word utilities.

## Scenario 13 — Third-party ingredients keep English inflections

**Setup.** Activate a cooking or farming mod hekmo already supports — Vanilla Cooking Expanded, VGP
Vegetable Garden, VV New Harvest, TP Sea Plants, Vanilla Plants Expanded More Plants. Cook with one
of its ingredients. None of these is active on the measured profile, so this needs a deliberate
change to the modlist.

**Observe.** How that ingredient reads inside the French dish name.

**Current expected result.** English. A dish built on VCE flour reads *flour* where a covered
ingredient would read *de farine*.

**Why.** hekmo ships fifteen inflection tables. Four are the base game and its expansions, and this
mod replaces those four. The other eleven are per-mod — `VanillaCookingExpanded`,
`VGPVegetableGarden`, `VGPGardenGourmet`, `VVNewHarvest`, `VanillaPlantsExpandedMorePlants`,
`TPSeaPlants`, `MedievalOverhaul`, `KitsBrazilianCrops`, `RC2Core`, `RH2FactionVoid`,
`OptimizationMeatsCSharpEdition` — and they are untouched.

**Consequence worth stating plainly.** On a modded kitchen the names come out mixed. The head of
the name is always French, because that half comes from this mod's labels; the ingredient inside it
may not be. Adding those mods also makes far more dishes reachable, since they bring the missing
meal kinds with them.

## Scenario 14 — Uncovered ingredients fall back to English generation

**Setup.** Cook with any ingredient that has no entry in any inflection table.

**Observe.** The ingredient's form inside the name.

**Current expected result.** An English-shaped form, typically the label with an `-s` added.

**Why.** When an ingredient has no predefined inflections, Flavor Text logs `did not have any
predefined inflections, checking category overrides...`, then falls back to generating them. That
generator is written in C# and is English: it cannot be corrected from XML. The strategy this mod
follows is to predefine explicitly and never depend on the fallback, which works for the 150
ingredients it covers and cannot work beyond them.

**Grep for it.** That log line names the ingredient. Running it over a session's log is the
cheapest way to list what a given modlist leaves uncovered.

---

# Group D — Coupling, settings, saves

## Scenario 15 — Categorisation survives the language switch

**Setup.** Two launches to the main menu on the same modlist, one in English and one in French.

**Observe.** The first number of the `[Flavor Text] mod is now active` line in each log.

**Pass.** The two numbers are equal, or within a handful of each other.

**Fail.** The French number drops noticeably. That would mean ingredients are falling out of their
categories when their labels are translated, and dozens of dishes are silently going dark.

**What it proves, and why it is the most valuable scenario in this file.** Flavor Text sorts a
`ThingDef` into a category by keyword, and its keywords are English. It reads **both** the def's
internal name and its label — this was read off the compiled code, not assumed. The internal name
is split on underscores and camel case, so `RawHops` yields the tokens *raw* and *hops* and keeps
matching an English keyword in a French game. The label is only a second chance, for ingredients
whose internal name carries no recognisable word. That is why Flavor Text Extended lists its own
categories' keywords in both languages. If this scenario ever failed, that bilingual list would be
the first place to look.

## Scenario 16 — The settings window is French

**Setup.** Options, Mod settings, Flavor Text.

**Observe.** The five settings and their tooltips.

**Pass.** All five labels and all five tooltips in French: the extra-ingredient cap, quick search,
naming meal stacks, lax recipe matching, dynamic meal detection.

**Fail.** Any English label or tooltip. Ten keyed strings cover this, and their names must match
hekmo's exactly, so a single renamed key upstream leaves one row English while the rest translate.

**Note.** The tooltips contain `\n`. They should render as line breaks, not as a literal
backslash-n.

## Scenario 17 — Meals cooked before the mod was installed

**Setup.** Load a save made with Flavor Text active and this mod absent, where named meals are
already sitting in a stockpile.

**Observe.** Those existing meals.

**Pass, most likely.** Their names turn French. The dish a meal was assigned is stored in the save,
but its label is read from the def, and the def is what this mod translates.

**What to watch instead.** The ingredient forms inside those names. If they stay English while the
surrounding words turn French, the inflections are resolved once at cooking time and stored, rather
than recomposed on display. That is not currently established either way: there is a log line about
defs `passed into TryGetFlavorDef from a saved game`, which says the search runs against saved
data, but not what happens to the forms.

**Either outcome is acceptable.** Record which one it is, and delete this paragraph once known.

---

# Group E — The negative scenario

## Scenario 18 — An English game with this mod active

**Setup.** Set the game language to English. Leave all three mods active. Cook anything.

**Observe.** The dish name.

**Expected.** Something broken, along the lines of **de bœuf fricasee** — an English dish name with
a French ingredient form inside it.

**This scenario is meant to fail, and that failure is the mod's reason to exist.** Inflections live
in a def, not in a language file, and RimWorld cannot inject a translation into that kind of field.
This was tested in game, by position and by handle, and both were rejected. Replacing them
therefore takes a patch, and a patch applies in every language. Keeping the French forms in a
separate mod is the only way an English game stays intact: the player simply does not install this
one.

**When to run it.** Once, after any change to how `Inflections_FR.xml` targets its defs. If an
English game ever comes out clean, the patch is no longer applying and scenario 1 has been failing
silently.

---

# Coverage this document does not claim

- **Every one of the 1826 names.** The scenarios check the grammatical machinery on chosen dishes.
  Whether dish 1417's French reads well is proofreading, not testing.
- **Gender agreement in general.** A wrong agreement is valid French as far as a machine is
  concerned, and no checker anywhere can see it. Scenario 10 guards the one place the mod
  deliberately relies on agreement; the rest is human reading.
- **Dish selection.** Which matching dish the engine picks is a weighted random draw among all
  matches, so the same ingredients will not always give the same name. A scenario demanding one
  exact string would be flaky by construction. That is why each scenario above names the
  grammatical joint to look at rather than the whole name, and why the bill filter is restricted
  hard enough that few dishes can match at all.
- **Anything that needs an assembly.** There is none here to test. The English mod carries the
  tooling that examined hekmo's.
