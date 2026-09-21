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

## In the game, by Pickle (English pass played, French pass pending)

Eleven features, one companion mod, one steps assembly. The scope is the part a running game is needed
for: the real patch pipeline and loader, the real DefInjected resolution and LoadFolders gate, the
real settings dialog and the hidden shortcut, and the real name generation. What is left out of
Gherkin, and why, is written in `Tests/Pickle/README.md`; nothing is left out for lack of effort
that a step could have covered.

### Passes

A mod is not validated by one run, and this report must say which pass is which. This mod declares
**no incompatibility** and no optional mod in `loadAfter`, so the third family (one pass per declared
incompatibility) does not apply. Several passes are needed:

| # | Pass | Set | Language | Plays | Status |
| --- | --- | --- | --- | --- | --- |
| 1 | `sans-facultatifs`, English | The minimal set the staging mounts by default: Core, the DLC, Harmony, RimLogging, Pickle, Flavor Text, Flavor Text Extended, the mod and its companion | English | 01, 02, 04, 05, 06 | **played 2026-09-21: 18 passed, 0 failed, 6 skipped (feature 03), `exitReason: passed`; the two `@review` captures opened** |
| 2 | `sans-facultatifs`, French | The same set | French | 03, 01, 04, 05, 06, 07 | defined, ticket taken |
| 2b | `sans-facultatifs`, French, cooking | The same set | French | 09 (`-IncludeWip -Filter '09-cooking.feature'`), filmed | defined, not run |
| 3 | `avec-facultatifs`, French | The same set plus eight providers of the third-party tables, with their hard dependencies: Vanilla Plants Expanded and its More Plants, Vanilla Cooking Expanded, Vanilla Brewing Expanded, Kit's Brazilian Crops, VGP Vegetable Garden and Garden Gourmet, VV New Harvest, RimCuisine 2 Core, TP Sea Plants (`-DepMap wsl-deps.avec-facultatifs.map`) | French | 06, 01 | defined (map written), not run |
| 4 | `avec-shenzhou`, French | The same set plus Shenzhou alone (`-DepMap wsl-deps.avec-shenzhou.map`); it declares 1.5 at most, so its own errors are read as such | French | 06, 01 | defined (map written), not run |
| 5 | `faux-ingredients`, French | The same set plus a local mod of three invented raw foods (`-DepMap wsl-deps.faux-ingredients.map`), for F14 | French | 08 | defined, needs a local link (see README), not run |
| 6 | restart pair | The same set | English | 10 then 11, two launches under one lock (`-IncludeWip -Filter '10-restart-write.feature' -Then '11-restart-read.feature'`) | defined, not run |

Left out of pass 3 on the owner's word, 2026-09-21: [RH2] Faction: V.O.I.D., Medieval Overhaul and Optimization: Meats. Their tables stay covered by the offline checks only. Nelim's Food Court is local and unpublished, declares itself incompatible with Shenzhou, and no table of this mod targets it: it is not staged. The two passes 3 and 4 are separate because the providers of pass 4 are exclusive with FoodCourt and old.

Passes 3 and 4 exist because a French name is built from the ingredients actually cooked, and the ingredients
that reach the optional tables only exist with those mods; a green on passes 1 and 2 says nothing
about them. No incompatibility is declared among the eight providers of pass 3 (Vegetable Garden refuses
`GrowableGrass`, which is not staged); if a first run shows two of them conflicting, the pass splits.

Commands are in `Tests/Pickle/README.md`, with `-Mod FlavorTextExtendedFR`. The shared staging script
could not stage a nested repository or a GitHub-only hard dependency; both are settled by two
machine-local links (a junction at the top of the monorepo, a symbolic link in the WSL workshop
cache), described there and exercised by the English pass. Running any pass takes the machine lock
and goes through `scripts/Run-PickleWsl.ps1` only.

## What each kind of test may claim

- Green outside the game: the files parse, the handles resolve, the logic of the wrapper, the bridge
  and the fallback is right against doubles or the real installed assemblies. It does not show that a
  colonist reads French.
- Green Pickle run: the path ran. It does not show that the capture shows anything (open the two
  `@review` images) nor that a French name agrees (read the `[FTFR tests] meal ... reads:` lines).
  Read `exitReason` before the counts and compare scenarios played with features discovered.
- The manual scenarios stay the only evidence for forcing an exact dish, side-dish variety,
  running without a DLC, an existing save with old meals, and RIMMSQOL
  revealing the shortcut. The language switch is a restart in the new language, so the English and French
  passes cover it. Cooking with a colonist (filmed), unlisted ingredients and the restart are
  now scenarios, written and not yet played.
