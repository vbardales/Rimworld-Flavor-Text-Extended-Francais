# Testing

How this mod is tested, and what each kind of test is allowed to claim. The manual acceptance
scenarios are in [`_tools/FUNCTIONAL-SCENARIOS.md`](_tools/FUNCTIONAL-SCENARIOS.md) (F01-F14 and the
FoodCourt additions); the in-game automation is in [`Tests/Pickle/`](Tests/Pickle/README.md).

## Outside the game (run, green on 2026-09-21)

Everything that can be proved without RimWorld is proved without it, in seconds: `_tools/Build.ps1`,
`Test-Xml` (82 XML files, 1,831 dishes, the guarded patches applied to an in-memory copy of the
dependencies' Defs), `Test-Language`, `Test-PatchLifecycle`, `Test-SettingsBridge`,
`Test-UpstreamSettings`, `Test-Fallback`, `Test-FallbackPrefix`, `Test-HarmonyRegistration`, and
`scripts/Check-DefInjected.ps1` (3,671 keys, 0 errors). Three of them need PowerShell 7; see
`STATUS.md` for how they were replayed where it is absent.

**What these tests could not see, and a game run did.** Until 2026-09-21 every one of them gave the language
guard the value `"French"`. A real game stores the official French translation as `French (Français)`, so the
guard never matched and the mod did nothing in a real French game, with every offline test green. It was found
by the first in-game run and fixed in `164104b`. The offline tests now use the stored value, and
`Test-Language` was shown to fail against the previous DLL before it was rebuilt. The lesson is written into
what each kind of test may claim, below.

## In the game, by Pickle

Twenty-one features (the last, 21, is a fixture-making tool and never part of a pass), one companion mod, one steps assembly. The shared steps of Nelim's Pickle Tools are used
where they exist (`PickleTools/FilmTicks` for the cooking film, `PickleTools/RimmsqolSteps` for pass 7); what
stays in this suite, and where another mod can find it, is listed in `PickleTools/Elsewhere/FlavorTextExtendedFR.md`.
The scope is the part a running game is needed for: the real patch pipeline and loader, the real DefInjected
resolution and LoadFolders gate, the real settings dialog and the hidden shortcut, the real name generation,
real cooking, and what only a second launch or another modlist shows. What is left out of Gherkin, and why, is
written in `Tests/Pickle/README.md`.

### Passes

A mod is not validated by one run, and this report must say which pass is which. This mod declares
**no incompatibility** and no optional mod in `loadAfter`, so the third family (one pass per declared
incompatibility) does not apply. Several passes are needed. Commands are in `Tests/Pickle/README.md`, with
`-Mod FlavorTextExtendedFR`.

| # | Pass | Set | Language | Plays | Status |
| --- | --- | --- | --- | --- | --- |
| 1 | `sans-facultatifs`, English | The minimal set plus PickleTools ScreenshotMode (`-DepMap wsl-deps.sans-facultatifs.map`) | English | 01, 02, 04, 05, 06, 19 | **replayed 2026-09-23 with ScreenshotMode, suite `846c156`: `exitReason: passed`, 21 passed, 0 failed, 29 skipped (French and `@wip` scenarios of other passes); clean captures opened (`docs/runs/2026-09-23.md`).** Feature 19 (exact dishes) now plays here too. |
| 2 | `sans-facultatifs`, French | The same set plus ScreenshotMode | French | 03, then 01, 04, 05, 06, 19, 07: seven launches under one lock | **replayed 2026-09-23 with ScreenshotMode, suite `846c156`: seven launches, all `exitReason: passed`, 27 scenarios, 0 failed (`docs/runs/2026-09-23.md`); raw reports of launches 1 to 6 were purged before copying, the counts and captures are kept.** |
| 2b | `sans-facultatifs`, French, cooking | The same set plus `PickleTools/FilmTicks` (`-DepMap wsl-deps.cuisson-film.map`) | French | 09, filmed | **not green yet.** Four attempts, none a verdict on the mod: the stock 120 s bill wait (2026-09-24), a survival ration taken for the dish, a pawn list read off the main thread, and (2026-09-25) the watchdog at 120 s because `@timeout` sat on the Feature line, then the game killed by another session's test script. Request `20260925-144030-065-1c24` queued (`docs/runs/`). |
| 3 | `avec-facultatifs`, French | The same set plus eight providers of the third-party tables, with their hard dependencies: Vanilla Plants Expanded and its More Plants, Vanilla Cooking Expanded, Vanilla Brewing Expanded, Kit's Brazilian Crops, VGP Vegetable Garden and Garden Gourmet, VV New Harvest, RimCuisine 2 Core, TP Sea Plants (`-DepMap wsl-deps.avec-facultatifs.map`) | French | 06, 01 | **played 2026-09-24: 06 3/3 and 01 5/5, `exitReason: passed`, 26 mods loaded.** Those meals never touch a provider table, so feature 20 (provider tables) reads them: **played 2026-09-24, `exitReason: passed`, 12 tables checked, 30 ingredients present.** |
| 4 | `avec-shenzhou`, French | The same set plus Shenzhou alone (`-DepMap wsl-deps.avec-shenzhou.map`); it declares 1.5 at most, so its own errors are read as such | French | 06, 01 | **played 2026-09-24: 06 3/3 and 01 5/5, `exitReason: passed`.** The launcher flags Shenzhou as dropped (false alarm: listed `(incompatible version)`, content loaded, its own errors in the log). Feature 20 **played 2026-09-24 after a fix of the step (it read one table per patch operation): `exitReason: passed`, 16 tables, 39 ingredients present, the four Shenzhou entries among them.** |
| 5 | `faux-ingredients`, French | The same set plus a folder of this repository with three invented raw foods, staged by `path:` (`-DepMap wsl-deps.faux-ingredients.map`), for F14 | French | 08 | **played 2026-09-24: 08 4/4, `exitReason: passed`.** The fixture then got a foodType (it logged three config errors); replay in the final round. |
| 6 | restart pair | The same set | English | 10 then 11, two launches under one lock (`-IncludeWip -Filter '10-restart-write.feature' -Then '11-restart-read.feature'`) | **played 2026-09-24: 10 1/1 then 11 2/2, both `exitReason: passed`.** |
| 7 | `avec-rimmsqol` | The same set plus RIMMSQOL (`MalteSchulze.RIMMSqol`, Workshop 1084452457; hard dependency Harmony, staged everywhere) and the shared steps that drive it (`-DepMap wsl-deps.avec-rimmsqol.map`), for F12 | English | 12, then 13, 14, 15: four launches under one lock | **played 2026-09-24: 12 3/3, then 13, 14 and 15 1/1 each, all `exitReason: passed`, 16 mods loaded.** |
| 8 | `sans-biotech` | The same set with Biotech left out (`-DepMap wsl-deps.sans-biotech.map`, `!ludeon.rimworld.biotech`), for F08 | English | 16, no save loaded | **played 2026-09-24: 16 2/2, `exitReason: passed`; the DLC removal by `!packageId` works in a real run.** |
| 9 | `sans-anomaly-odyssey` | The same set with both left out (`-DepMap wsl-deps.sans-anomaly-odyssey.map`), for F09 | English | 17, no save loaded | **played 2026-09-24: 17 2/2, `exitReason: passed`.** |
| 10 | legacy meals | The minimal set plus ScreenshotMode (`-DepMap wsl-deps.sans-facultatifs.map`) and a committed `legacy-meals-before-ftfr` save made before this translation was installed | French | 18, pauses on an existing meal's info card and captures it | **played 2026-09-24: 18 1/1, `exitReason: passed`; a meal made in an English game reads "Salade de lait" in the French pass, capture opened.** |

Left out of pass 3 on the owner's word, 2026-09-21: [RH2] Faction: V.O.I.D., Medieval Overhaul and Optimization: Meats. Their tables stay covered by the offline checks only. Nelim's Food Court is local and unpublished, declares itself incompatible with Shenzhou, and no table of this mod targets it: it is not staged. Passes 3 and 4 are separate because Shenzhou is old and would put its own errors beside the eight providers.

Passes 3 and 4 exist because a French name is built from the ingredients actually cooked, and the ingredients
that reach the optional tables only exist with those mods; a green on passes 1 and 2 says nothing
about them. No incompatibility is declared among the eight providers of pass 3 (Vegetable Garden refuses
`GrowableGrass`, which is not staged); if a first run shows two of them conflicting, the pass splits.

Two machine-local links remain, described in `Tests/Pickle/README.md` and exercised by the passes played so
far: a junction at the top of the monorepo, so the staging script finds a nested repository, and a symbolic link
in the WSL workshop cache for Flavor Text Extended, which has no Workshop id. Everything else is staged by
`path:` from this repository. Running any pass takes the machine lock and goes through
`scripts/Run-PickleWsl.ps1` only; `-Then` (several launches under one lock) was seen to finish on 2026-09-21.

## Evidence to keep

Rule of the repository (root `AGENTS.md`, "Test evidence"): keep only the reports that still prove something.
The disk is a constraint, so a report is a cost.

- **Where.** Raw output of a run (`Player.log`, `junit.xml`, `summary.*`, `messages.ndjson`, captures) goes to
  `Tests/Pickle/Evidence/<date>-<pass>/`, which is ignored by git. One text line per run goes to `docs/runs/`,
  never a folder. `.build/` holds no evidence.
- **What stays.** Per scenario, the latest report for the revision now in the repository, plus an older one
  only when it is the sole proof of a check the latest run did not repeat (a language, a pass not replayed).
  What `STATUS.md` points to must exist: repoint the field before deleting its target.
- **What goes.** A report of a superseded build (a suite or a mod changed since), a failing run once a green
  one replaced it (its result stays as a line in `docs/runs/`), and any duplicate copy.
- **What to read first.** `exitReason`, then the scenarios played against the features discovered, then
  `dropped-mods.txt`, then the captures and the `[FTFR tests] ... reads:` lines a person judges.
- **How to keep it small.** Captures as JPEG (quality 88 is enough to judge a name or a settings page), logs
  and `.ndjson` gzipped; `junit.xml` and `summary.*` untouched.
- **When.** Apply it as soon as a newer report replaces an older one, not at the end of `tested`.

## Before a publication (fail fast)

The publication policy of this mod is fail fast (`PUBLICATION.md`, "Publication by CI"). For the tests it means:

- **Not required before publishing:** the replay of the passes that were already green (the non-regression pass). It runs after
  the publication, in small tickets, and a red there is a defect of the published version, said as such.
- **Required before publishing:** every scenario that was red has been seen green on the revision to publish, and every defect found
  by a person (in a capture, in the game) has a check that fails without the fix and passes with it. Fewest scenarios, one ticket
  each, and the result goes to `docs/runs/`.
- **For 1.0.1:** the two lavish meals of feature 07 (side dish in lower case after a French joint) and the cooking pass 2b
  (feature 09), which has not been green yet.

## What each kind of test may claim

- Green outside the game: the files parse, the handles resolve, the logic of the wrapper, the bridge
  and the fallback is right **against the values the test gives it**. It does not show that a colonist
  reads French, and it cannot know what the running game really stores: the language guard is the proof.
  Any code that branches on something the game provides needs one in-game scenario that reads what the
  running game holds.
- Green Pickle run: the path ran. It does not show that a capture shows anything (open the images), nor that
  a French name agrees (read the `[FTFR tests] meal ... reads:` lines, and the info cards of 07). Read
  `exitReason` before the counts, and compare the scenarios played with the features discovered.
- Two stock steps cannot be trusted for what this mod does, and the suite no longer uses them for it:
  `def X was patched by mod Y` (and so `no def X was patched`) cannot see a patch applied through the mod's
  wrapper operation, and a dotted field path takes no numeric index into a list. The suite reads the value the
  def holds instead (`CategorySteps`).
- Review is limited to captured images or the cooking film: features 04, 06, 07, 08, 12 and 14 use
  PickleTools ScreenshotMode, and 09 uses PickleTools FilmTicks. The language switch is a restart in the new
  language, so the English and French passes cover it. F13 (meals saved before this translation was installed) is proved by feature `18-legacy-meals` against a committed
  fixture made by feature 21 in an English game (pass 10, played 2026-09-24). Running without a DLC (F08, F09), unlisted
  ingredients (F14) and the restart are played (passes 8, 9, 5 and 6). Cooking with a colonist is written and not yet green (2b).
- Names that read oddly but come from Flavor Text's own generic templates, such as `plat {0_adj} au four`
  ("Plat de lait au four"), are a known limit of this mod's translation of those templates, not a defect
  a test can catch.
