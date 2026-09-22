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

Seventeen features, one companion mod, one steps assembly. The shared steps of Nelim's Pickle Tools are used
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
| 1 | `sans-facultatifs`, English | The minimal set plus PickleTools ScreenshotMode (`-DepMap wsl-deps.sans-facultatifs.map`) | English | 01, 02, 04, 05, 06 | **played 2026-09-21 before the screenshot-mode revision: 18 passed, 0 failed, 6 skipped.** Feature 02 was rewritten and the review evidence is now clean-capture based; replay required. |
| 2 | `sans-facultatifs`, French | The same set plus ScreenshotMode | French | 03, then 01, 04, 05, 06, 07: six launches under one lock | **played 2026-09-21 before the screenshot-mode revision.** The French fix pass remains useful history, but the revised clean captures require replay. |
| 2b | `sans-facultatifs`, French, cooking | The same set plus `PickleTools/FilmTicks` (`-DepMap wsl-deps.cuisson-film.map`) | French | 09, filmed | defined, not run |
| 3 | `avec-facultatifs`, French | The same set plus eight providers of the third-party tables, with their hard dependencies: Vanilla Plants Expanded and its More Plants, Vanilla Cooking Expanded, Vanilla Brewing Expanded, Kit's Brazilian Crops, VGP Vegetable Garden and Garden Gourmet, VV New Harvest, RimCuisine 2 Core, TP Sea Plants (`-DepMap wsl-deps.avec-facultatifs.map`) | French | 06, 01 | map written, not run |
| 4 | `avec-shenzhou`, French | The same set plus Shenzhou alone (`-DepMap wsl-deps.avec-shenzhou.map`); it declares 1.5 at most, so its own errors are read as such | French | 06, 01 | map written, not run |
| 5 | `faux-ingredients`, French | The same set plus a folder of this repository with three invented raw foods, staged by `path:` (`-DepMap wsl-deps.faux-ingredients.map`), for F14 | French | 08 | map written, not run |
| 6 | restart pair | The same set | English | 10 then 11, two launches under one lock (`-IncludeWip -Filter '10-restart-write.feature' -Then '11-restart-read.feature'`) | defined, not run |
| 7 | `avec-rimmsqol` | The same set plus RIMMSQOL (`MalteSchulze.RIMMSqol`, Workshop 1084452457; hard dependency Harmony, staged everywhere) and the shared steps that drive it (`-DepMap wsl-deps.avec-rimmsqol.map`), for F12 | English | 12, then 13, 14, 15: four launches under one lock | **played 2026-09-21: 4 launches, all `exitReason: passed` (12: 3 of 3; 13, 14, 15: 1 of 1 each)**, 15 mods loaded, profile left with no RIMMSQOL choice. Captures opened. Detail and limits in `PickleTools/RimmsqolSteps/README.md` |
| 8 | `sans-biotech` | The same set with Biotech left out (`-DepMap wsl-deps.sans-biotech.map`, `!ludeon.rimworld.biotech`), for F08 | English | 16, no save loaded | map written, not run. The harness itself says a DLC left out has not yet been seen in a real run |
| 9 | `sans-anomaly-odyssey` | The same set with both left out (`-DepMap wsl-deps.sans-anomaly-odyssey.map`), for F09 | English | 17, no save loaded | map written, not run |

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
  language, so the English and French passes cover it. F13 (meals saved before this translation was installed) is
  **not applicable**: it was explicitly removed from this audit's scope, so no fixture or manual substitute is
  required. Running without a DLC (F08, F09), cooking with a colonist,
  unlisted ingredients (F14) and the restart are written and not yet played.
- Names that read oddly but come from Flavor Text's own generic templates, such as `plat {0_adj} au four`
  ("Plat de lait au four"), are a known limit of this mod's translation of those templates, not a defect
  a test can catch.
