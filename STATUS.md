---
mod:          Flavor Text Extended - Français
packageId:    nelim.flavortextextended.fr
repo:         Rimworld-Flavor-Text-Extended-Francais
visibility:   public
detached:     yes
stage:        preTest
licence:      alive
licence_at:   looked for in four places in hekmo's mod — About.xml, README.md, the mod folder, the Workshop page — and found nowhere; this mod's own text is MIT, see LICENSE
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - defect: side-dish clauses stay English, so a meal over three ingredients reads "fricassée de bœuf with omelette aux baies"
  - defect: eleven of hekmo's fifteen inflection tables are untranslated, so a modded kitchen yields French dish names around English ingredients
  - unverified: gender agreement, which no checker can see — a wrong agreement is valid French to a machine
  - unverified: the nineteen scenarios of _tools/FUNCTIONAL-SCENARIOS.md, none played — they are written and buildable, scenario 15 being the one to run first
session:      local_a70ab0cf-d4fa-4441-84d0-b0f6162123c2
updated:      2026-09-12, the mod's own session
---

# Flavor Text Extended - Français — status

Status card, read by a pass over every mod rather than by asking each thread one at a time. It
lives at the root, never inside `Mod/`, so Steam never receives it, and it is tracked by git like
the rest of the repository.

The sweep of 2026-09-12 did not reach this mod. It walked the folders of `Documents\rimworld` and
found `FlavorText/FlavorTextExtended`, one level down, but not this one beside it. Every field
below was therefore filled by hand, by the session that holds the mod.

## What the mod is

A French layer over two other mods: **Flavor Text** (hekmo, Workshop 3245374432) and **Flavor Text
Extended** (`nelim.flavortextextended`). It adds no dish of its own. What it ships is 1826
translated dish names with their 1826 descriptions, ten settings strings, and a table of 150
ingredients each given four French grammatical forms.

It is XML only. No assembly, nothing to compile, and no code of its own runs at any point: hekmo's
`FlavorText.dll` reads the table, and RimWorld's translation loader injects the text.

**Why it is a mod of its own** rather than a language folder inside the English one: the inflection
table lives in a `Def`, and RimWorld cannot inject a translation into a dictionary-typed field.
Replacing it takes a patch, and a patch cannot gate itself on the game's language. Bundled with the
English mod it would put French forms inside English dish names. `ATTRIBUTION.md` carries the
in-game evidence for that.

## The fields no sweep could have filled

- **`stage`** — `preTest`, matching this session's sidebar group. The content is finished: 1826 of
  1826 dishes carry both a name and a description, with no orphan handle and no untranslated def.
  What is missing is not writing, it is the in-game check: the scenarios that would guide it are
  written and ready, and nobody has played them.
- **`licence`** — `alive`, and this is where the two Flavor Text mods legitimately differ. The
  English mod writes its own 896 dishes and owes hekmo only the engine, so `original` defends
  itself there. This one **translates hekmo's 930 dishes**, name and description, indexed def by
  def onto his: that is a derivative of his text, not an independent work beside it. His mod
  carries no licence and is alive in 1.6, so `alive` it is.

  This does not make the mod unpublishable, and it stays public. Nothing of hekmo's is
  redistributed: not one of his files ships here, only French written here and forms derived from
  RimWorld's own official translations. The publishability rule is about redistribution, not
  dependency.
- **`dependencies`** — `declared`. The About names both required mods in `modDependencies`, with
  a Workshop link for hekmo's and a repository link for the English one. `loadAfter` also names
  `brrainz.harmony`, which is not a dependency and is not declared as one: this mod has no code,
  the entry is load-order caution only.
- **`tested_on`** — empty, and the emptiness needs a sentence, because it is not quite "never
  seen running". The mod **was** loaded in game during design, to settle one question: whether a
  translation could be injected into the inflection dictionary. It could not, by position or by
  handle, and the translation error count moving from 3 to 5 is what decided the whole shape of
  this mod. That is one probe, not a run of the finished thing. It was in the active
  `ModsConfig.xml` until 2026-09-11 and is no longer.
- **`workshop`** — empty, exact: no `PublishedFileId.txt` in `Mod/`, so nothing was ever uploaded.
  The showcase is ready, preview and icon both, with the full-resolution source under `Art/`.

## What was done on 2026-09-11

- **Detached from the monorepo.** Its own repository, one remote which is not the monorepo, and
  the history already published taken up as it stood — the tree the remote carried was the very
  same object, so nothing moved on disk and nothing was replayed. The `.claude/` rule the monorepo
  used to provide came over, and the full-resolution preview source moved into `Art/`, out of
  `Mod/`.
- **The About url fixed.** It named the English mod's repository, a leftover from the split. The
  `downloadUrl` further down still names it, correctly: that one is the dependency link.

## What was done on 2026-09-12

- **`_tools/FUNCTIONAL-SCENARIOS.md` written**, nineteen in-game scenarios, every dish in them
  picked from the 222 that can actually be cooked on the current profile.
- **A dish needs two conditions, not one**, and the first draft of the document missed the second.
  Its ingredient slots must be satisfiable, and one of its `mealKinds` must exist. Most of hekmo's
  930 dishes declare a kind of cooking that only a cooking mod provides, and none is active here.
  Of 729 dishes whose ingredients exist, 222 can name a meal. The first draft named three that
  could not be cooked at all and was rewritten rather than patched.
- **Ingredient categorisation reads the def's internal name as well as its label**, read off the
  IL of `CategoryUtility.ExtractNames` rather than assumed. The internal name is split on
  underscores and camel case, so an English keyword still matches in a French game: translation
  does not drop vanilla ingredients out of their categories, and the label is a second chance for
  opaque names only. Reported to the English mod's session, which confirmed the reading against
  the IL itself, corrected both the comment and the code of its `actifs.js`, and saw its active
  count go from 629 to 729. A fifth of the coverage was invisible to the measurement, not absent
  from the mod.
- Two gaps confirmed rather than suspected, both now in `remaining` above.

## Reference numbers

An output that departs from these is a question, not necessarily a fault.

| | |
|---|---|
| dish names translated, with descriptions | 1826 |
| of which hekmo's | 930 |
| of which the English mod's | 896 |
| orphan handles, untranslated defs | 0, 0 |
| ingredients given four forms | 150 |
| Core / Odyssey / Biotech / Anomaly | 87 / 58 / 4 / 1 |
| patch operations, all `PatchOperationReplace` | 4 |
| settings strings | 10 |

## When to change these fields

- `stage` goes to `tested` once the scenarios have been played and the log read. Nothing in the
  mod is waiting on development: the content is complete and the scenarios are written.
- `tested_on` takes a date the day a real run happens. The game is never launched from a session;
  Virginie launches it, and the log is read afterwards.
- `workshop` fills in the day an item exists, which also means a `PublishedFileId.txt` lands in
  `Mod/` and must not be committed by accident.
- `remaining` loses its first line the day a `RulePackDef/` folder covers the side-dish clauses,
  and its second the day the eleven third-party inflection tables are translated. Neither is
  blocked by anything: both are known, sized, and simply not done.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source, `alive` no
licence but a living source, `forbidden` a written refusal, `original` owing nothing to anyone —
not a name, not an idea traceable to one mod, not a value derived from its assets.
