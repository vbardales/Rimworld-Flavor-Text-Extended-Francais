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

## In the game, by Pickle (written, never run)

Six features, one companion mod, one steps assembly. The scope is the part a running game is needed
for: the real patch pipeline and loader, the real DefInjected resolution and LoadFolders gate, the
real settings dialog and the hidden shortcut, and the real name generation. What is left out of
Gherkin, and why, is written in `Tests/Pickle/README.md`; nothing is left out for lack of effort
that a step could have covered.

### Passes

A mod is not validated by one run, and this report must say which pass is which. This mod declares
**no incompatibility** and no optional mod in `loadAfter`, so the third family (one pass per declared
incompatibility) does not apply. Three passes are needed:

| # | Pass | Set | Language | Plays | Status |
| --- | --- | --- | --- | --- | --- |
| 1 | `sans-facultatifs`, English | The minimal set the staging mounts by default: Core, the DLC, Harmony, RimLogging, Pickle, Flavor Text, Flavor Text Extended, the mod and its companion | English | 01, 02, 04, 05, 06 | **played 2026-09-21: 18 passed, 0 failed, 6 skipped (feature 03), `exitReason: passed`; the two `@review` captures opened** |
| 2 | `sans-facultatifs`, French | The same set | French | 03, 01, 04, 05, 06 | defined, not run |
| 3 | `avec-facultatifs`, French | The same set plus the providers of the third-party ingredient tables (`Inflections_ThirdParty_FR.xml`: Vanilla Cooking Expanded, Vanilla Plants Expanded - More Plants, VGP Garden Gourmet, VGP Vegetable Garden, VV New Harvest, Kits Brazilian Crops, Medieval Overhaul, RC2, RH2 Faction Void, TP Sea Plants, Optimization: Meats) and the Shenzhou/FoodCourt provider | French | 06, and 01 | **not defined**: needs a `wsl-deps.avec-facultatifs.map` with the Workshop ids of those mods |

Pass 3 exists because a French name is built from the ingredients actually cooked, and the ingredients
that reach the optional tables only exist with those mods; a green on passes 1 and 2 says nothing
about them. It is deliberately not created here as an empty map: an empty overlay would label a pass
that stages nothing extra. Whether some of those mods conflict with each other, which would multiply
the pass, is unknown until the ids are collected.

Commands are in `Tests/Pickle/README.md`, with `-Mod FlavorTextExtendedFR`. The shared staging script
could not stage a nested repository or a GitHub-only hard dependency; both are settled by two
machine-local links (a junction at the top of the monorepo, a symbolic link in the WSL workshop
cache), described there and not yet exercised by a staging. Running any pass takes the machine lock
and goes through `scripts/Run-PickleWsl.ps1` only.

## What each kind of test may claim

- Green outside the game: the files parse, the handles resolve, the logic of the wrapper, the bridge
  and the fallback is right against doubles or the real installed assemblies. It does not show that a
  colonist reads French.
- Green Pickle run: the path ran. It does not show that the capture shows anything (open the two
  `@review` images) nor that a French name agrees (read the `[FTFR tests] meal ... reads:` lines).
  Read `exitReason` before the counts and compare scenarios played with features discovered.
- The manual scenarios stay the only evidence for cooking with a colonist, side-dish variety, the
  language switch from the menu, running without a DLC, optional mods, an existing save with old
  meals, persistence across a real restart, and RIMMSQOL revealing the shortcut.
