# Testing

How mod tested, what each test type may claim. Manual acceptance scenarios in [`TEST_SCENARIOS.md`](TEST_SCENARIOS.md) (F01-F14 + FoodCourt additions); in-game automation in [`Tests/Pickle/`](Tests/Pickle/README.md).

## Outside the game (run, green on 2026-09-21)

Everything provable without RimWorld proved without it, in seconds: `scripts/Build.ps1`, `Test-Xml` (82 XML files, 1,831 dishes, guarded patches applied to in-memory copy of dependencies' Defs), `Test-Language`, `Test-PatchLifecycle`, `Test-SettingsBridge`, `Test-UpstreamSettings`, `Test-Fallback`, `Test-FallbackPrefix`, `Test-HarmonyRegistration`, `scripts/Check-DefInjected.ps1` (3,671 keys, 0 errors). Three need PowerShell 7; see `STATUS.md` for replay where absent.

**What tests could not see, game run did.** Until 2026-09-21 every test gave language guard value `"French"`. Real game stores official French translation as `French (Français)`, so guard never matched, mod did nothing in real French game, all offline tests green. First in-game run found it, fixed in `164104b`. Offline tests now use stored value; `Test-Language` shown to fail against previous DLL before rebuild. Lesson written into what each test kind may claim, below.

## In the game, by Pickle

Twenty-two features (21 = fixture-making tool, never part of pass; 22 makes gallery candidates, not proof), one companion mod, one steps assembly. Shared steps of Nelim's Pickle Tools used where they exist (`PickleTools/FilmTicks` for cooking film, `PickleTools/RimmsqolSteps` for pass 7); what stays in this suite, and where other mod can find it, listed in `PickleTools/Elsewhere/FlavorTextExtendedFR.md`. Scope = part needing running game: real patch pipeline and loader, real DefInjected resolution and LoadFolders gate, real settings dialog and hidden shortcut, real name generation, real cooking, what only second launch or other modlist shows. What left out of Gherkin, and why, written in `Tests/Pickle/README.md`.

### Passes

One run does not validate mod; report must say which pass is which. Mod declares **no incompatibility** and no optional mod in `loadAfter`, so third family (one pass per declared incompatibility) not applicable. Several passes needed. Commands in `Tests/Pickle/README.md`, with `-Mod FlavorTextExtendedFR`.

| # | Pass | Set | Language | Plays | Status |
| --- | --- | --- | --- | --- | --- |
| 1 | `sans-facultatifs`, English | Minimal set plus PickleTools ScreenshotMode (`-DepMap wsl-deps.sans-facultatifs.map`) | English | 01, 02, 04, 05, 06, 19, 24 | **non-regression replay 2026-09-25 after 1.0.1 publication (request `e893`): 21/21, `exitReason: passed`.** Before: replayed 2026-09-23 with ScreenshotMode, suite `846c156`: `exitReason: passed`, 21 passed, 0 failed, 29 skipped (French and `@wip` scenarios of other passes); clean captures opened (`docs/runs/2026-09-23.md`).** Feature 19 (exact dishes) now plays here too. |
| 2 | `sans-facultatifs`, French | Same set plus ScreenshotMode | French | 03, then 01, 04, 05, 06, 19, 24, 07: eight launches under one lock | **non-regression replay 2026-09-25 after 1.0.1 publication (request `b7be`): seven launches, 27/27, all `exitReason: passed`.** Before: replayed 2026-09-23 with ScreenshotMode, suite `846c156`: seven launches, all `exitReason: passed`, 27 scenarios, 0 failed (`docs/runs/2026-09-23.md`); raw reports of launches 1 to 6 purged before copying, counts and captures kept.** |
| 2b | `sans-facultatifs`, French, cooking | Same set plus `PickleTools/FilmTicks` (`-DepMap wsl-deps.cuisson-film.map`) | French | 09, filmed | **green (2026-09-25, request `20260925-153507-017-6072`, 1/1, `exitReason: passed`, one attempt, 200 s, tree `5b99cfa`).** Four earlier attempts, none verdict on mod: stock 120 s bill wait (2026-09-24), survival ration taken for dish, pawn list read off main thread, and (2026-09-25) scenario watchdog at 120 s (`@watch` slowed game to ~13 ticks/s), then game killed by other session's test script. Fifth ran with 600 s scenario watchdog (`docs/runs/2026-09-25.md`). Film and colony-view capture for owner to judge. |
| 3 | `avec-facultatifs`, French | Same set plus eight providers of third-party tables, with hard dependencies: Vanilla Plants Expanded and its More Plants, Vanilla Cooking Expanded, Vanilla Brewing Expanded, Kit's Brazilian Crops, VGP Vegetable Garden and Garden Gourmet, VV New Harvest, RimCuisine 2 Core, TP Sea Plants (`-DepMap wsl-deps.avec-facultatifs.map`) | French | 06, 01 | **played 2026-09-24: 06 3/3 and 01 5/5, `exitReason: passed`, 26 mods loaded.** Those meals never touch provider table, so feature 20 (provider tables) reads them: **played 2026-09-24, `exitReason: passed`, 12 tables checked, 30 ingredients present.** |
| 4 | `avec-shenzhou`, French | Same set plus Shenzhou alone (`-DepMap wsl-deps.avec-shenzhou.map`); declares 1.5 at most, so its own errors read as such | French | 06, 01 | **played 2026-09-24: 06 3/3 and 01 5/5, `exitReason: passed`.** Launcher flags Shenzhou as dropped (false alarm: listed `(incompatible version)`, content loaded, its own errors in log). Feature 20 **played 2026-09-24 after step fix (it read one table per patch operation): `exitReason: passed`, 16 tables, 39 ingredients present, four Shenzhou entries among them.** |
| 5 | `faux-ingredients`, French | Same set plus folder of this repository with three invented raw foods, staged by `path:` (`-DepMap wsl-deps.faux-ingredients.map`), for F14 | French | 08 | **played 2026-09-24: 08 4/4, `exitReason: passed`.** Fixture then got foodType (logged three config errors); replayed 2026-09-25 after 1.0.1 publication (request `0d0b`): 08 4/4, `exitReason: passed`. |
| 6 | restart pair | Same set | English | 10 then 11, two launches under one lock (`-IncludeWip -Filter '10-restart-write.feature' -Then '11-restart-read.feature'`) | **played 2026-09-24: 10 1/1 then 11 2/2, both `exitReason: passed`.** |
| 7 | `avec-rimmsqol` | Same set plus RIMMSQOL (`MalteSchulze.RIMMSqol`, Workshop 1084452457; hard dependency Harmony, staged everywhere) and shared steps driving it (`-DepMap wsl-deps.avec-rimmsqol.map`), for F12 | English | 12, then 13, 14, 15: four launches under one lock | **played 2026-09-24: 12 3/3, then 13, 14, 15 1/1 each, all `exitReason: passed`, 16 mods loaded.** |
| 8 | `sans-biotech` | Same set with Biotech left out (`-DepMap wsl-deps.sans-biotech.map`, `!ludeon.rimworld.biotech`), for F08 | English | 16, no save loaded | **played 2026-09-24: 16 2/2, `exitReason: passed`; DLC removal by `!packageId` works in real run.** |
| 9 | `sans-anomaly-odyssey` | Same set with both left out (`-DepMap wsl-deps.sans-anomaly-odyssey.map`), for F09 | English | 17, no save loaded | **played 2026-09-24: 17 2/2, `exitReason: passed`.** |
| 10 | legacy meals | Minimal set plus ScreenshotMode (`-DepMap wsl-deps.sans-facultatifs.map`) and committed `legacy-meals-before-ftfr` save made before this translation installed | French | 18, pauses on existing meal's info card and captures it | **played 2026-09-24: 18 1/1, `exitReason: passed`; meal made in English game reads "Salade de lait" in French pass, capture opened.** |
| 11 | `ftv`, French, optional provider | Minimal set plus Food Texture Variety and its Core (`-DepMap wsl-deps.ftv.map`; pass stages `Mod/FoodTextureVariety` through LoadFolders) | French | 25, colonist cooks `FTV_CookMealSimple`, name must end with `(plat simple)` | **written 2026-10-16, not played** (new step needs companion rebuilt first; ticket owed after queued tickets) |
| 11 | `sanctuary`, gallery | Nelim's Sanctuary (save `Nelims-tribe`) with studio tools (`-DepMap wsl-deps.sanctuary.map`) | French | 22, three staged pictures, candidates for `Art/Gallery/` (owner accepts or refuses each) | **deposited 2026-10-08**, see `docs/runs/2026-10-08.md`; not verdict on mod |

Left out of pass 3 on owner's word, 2026-09-21: [RH2] Faction: V.O.I.D., Medieval Overhaul and Optimization: Meats. Their tables covered by offline checks only. Nelim's Food Court local, unpublished, declares itself incompatible with Shenzhou, no table of this mod targets it: not staged. Passes 3 and 4 separate because Shenzhou old, would put own errors beside eight providers.

Passes 3 and 4 exist because French name built from ingredients actually cooked, and ingredients reaching optional tables only exist with those mods; green on passes 1 and 2 says nothing about them. No incompatibility declared among eight providers of pass 3 (Vegetable Garden refuses `GrowableGrass`, not staged); if first run shows two conflicting, pass splits.

Two machine-local links remain, described in `Tests/Pickle/README.md`, exercised by passes played so far: junction at top of monorepo, so staging script finds nested repository, and symbolic link in WSL workshop cache for Flavor Text Extended, which has no Workshop id. Everything else staged by `path:` from this repository. Running any pass takes machine lock, goes through `scripts/Run-PickleWsl.ps1` only; `-Then` (several launches under one lock) seen finishing on 2026-09-21.

## Evidence to keep

Repository rule (root `AGENTS.md`, "Test evidence"): keep only reports that still prove something. Disk is constraint, report is cost.

- **Where.** Raw run output (`Player.log`, `junit.xml`, `summary.*`, `messages.ndjson`, captures) goes to `Tests/Pickle/Evidence/<date>-<pass>/`, git-ignored. One text line per run goes to `docs/runs/`, never folder. `build/` holds no evidence.
- **What stays.** Per scenario, latest report for revision now in repository, plus older one only when sole proof of check latest run did not repeat (language, pass not replayed). What `STATUS.md` points to must exist: repoint field before deleting target.
- **What goes.** Report of superseded build (suite or mod changed since), failing run once green one replaced it (result stays as line in `docs/runs/`), any duplicate copy.
- **What to read first.** `exitReason`, then scenarios played against features discovered, then `dropped-mods.txt`, then captures and `[FTFR tests] ... reads:` lines a person judges.
- **How to keep it small.** Captures as JPEG (quality 88 enough to judge name or settings page), logs and `.ndjson` gzipped; `junit.xml` and `summary.*` untouched.
- **When.** Apply as soon as newer report replaces older, not at end of `tested`.

## Conditions of `tested` (AUDIT.md, step 9, read 2026-10-02) and where they stand

| Condition | State on 2026-10-02 |
| --- | --- |
| No scenario left in `@wip` | **Holds.** `grep -rn "@wip" Tests/Pickle` finds nothing in features; last one (18, legacy meals) repaired, played green in pass 10. |
| Every conditional scenario has had its pass | **Held on older builds, to replay on current one.** `@requires:Ludeon.RimWorld.Biotech` (01, 02, 03): passes 1 and 2. `@requires:nelim.pickletools.screenshotmode` (04, 06, 07, 08, 09, 12, 14, 18): passes playing those features. `@requires:nelim.pickletools.filmticks` (09): pass 2b, v12. `@requires:VanillaExpanded.VCookE` (20): pass 3, seq 3, played 2026-09-29. `@requires:Dajian.ChiTeaditional.Expanded` (20): pass 4b-v2, played 2026-09-24 (skipped on purpose in pass 3, provider not staged; skip is not pass). `@rimmsqol` features 12 to 15 carry no `@requires`; pass 7 stages RIMMSQOL. |
| No manual test left to validate | **Holds, with mapping below.** `TEST_SCENARIOS.md` is historical inventory: every F-row has Pickle feature (table in `Tests/Pickle/README.md`), F03 (language switch from menu) not scenario because game restarts on language change (two passes, one per language), FoodCourt additions covered by features 01 and 03 (dishes exist, labels read French), 20 (provider tables, Shenzhou entries) and passes 3 and 4; text of Altang's adaptation notice read in `FRENCH_REVIEW.md`, not played. What stays for person is only reading `@review` captures (04, 06, 07, 08, 09, 12, 14, 18), not manual test: scenario already proved image in intended state. Virginie's French text review is translation gate (`FRENCH_REVIEW.md`), not game test. |
| Scenarios played on revision to certify | **No.** Last French pass (2026-09-28 15:45 to 15:58) ran after French text of `1014e7e`, before `44a8cbc` (bounded `LowerSideDishes` search in `FrenchMealPostProcessing.cs`, 2026-09-28 22:40), so feature 07 (lavish meals, side dishes lowered) new again on current DLL. Pass 3 (folder mtime 2026-09-29 14:24 to 14:29) later than `44a8cbc`, but folder does not record tree SHA: unverified. |

Order of next passes (Virginie, 2026-10-02, `AUDIT.md`): never-ran or red first, as small tickets (here: feature 07 alone, French, `-Filter '07-review-shots.feature'`), then **all non-regression passes together, at end, on final revision**. Scenario with green run on current logic is non-regression scenario; change to mod or step it uses makes it new again.

## Evidence kept on disk, and why (cleaned 2026-10-02: 67 MB to 11 MB)

`Tests/Pickle/Evidence/` git-ignored; nothing in it tracked. Rule is root `AGENTS.md`, "Test evidence": per scenario, latest report for revision now in repository, plus older one only when sole proof of check latest run did not repeat. Kept, with reason:

| Folder | Why it stays |
| --- | --- |
| `2026-09-28-pass2-french` (seq1 to seq7) | Latest French `sans-facultatifs` pass (03, 01, 04, 05, 06, 19, 07), JPEG captures of 06 and 07. Feature 07 superseded once replayed after `44a8cbc`. |
| `2026-09-28-pass3-french-providers` (seq1 to seq3) | Latest pass 3 (06, 01, 20 with eight providers). Captures minified to JPEG. |
| `2026-09-25-nonreg-pass1-english` | Only English pass: sole proof of 02 and English reading of other features. |
| `2026-09-25-nonreg-pass5-faux-ingredients` | Latest pass 5 (feature 08). |
| `2026-09-24-pass4-french-shenzhou`, `2026-09-24-pass4b-v2-provider-tables` | Sole proof of Shenzhou-only pass (06, 01, four Shenzhou entries of feature 20). |
| `2026-09-24-pass6-restart-pair`, `2026-09-24-pass7-rimmsqol`, `2026-09-24-pass8-without-biotech`, `2026-09-24-pass9-without-anomaly-odyssey`, `2026-09-24-pass10-legacy-meals` | Sole proof of restart pair, RIMMSQOL, two DLC-absent passes, legacy-meal capture; no later run repeats them. |
| `2026-09-26-pass2b-cooking-v12` | Latest and only green cooking film with info card. Film and JPEG captures kept. |

Deleted 2026-10-02, with run replacing each: `2026-09-24-pass3-french-providers` and `-pass3b-provider-tables` (by `2026-09-28-pass3-french-providers`), `2026-09-24-pass5-french-invented-foods` (by `2026-09-25-nonreg-pass5-faux-ingredients`), `2026-09-25-nonreg-pass2-french` and `2026-09-25-1-0-1-lavish-meals` (by `2026-09-28-pass2-french`), `2026-09-25-pass2b-cooking-v9` (by v12), `2026-09-26-pass2b-cooking-v11` (failed, cause in `docs/runs/2026-09-26.md`). `report.html` dropped from every kept folder (verdict in `summary.*` and `junit.xml`), PNG captures of kept runs re-encoded as JPEG (ffmpeg, `-q:v 3`). No `.dds` file and no evidence file tracked by git (checked with `git ls-files` and whole history).

**What to keep at next runs, per pass:** `summary.json`, `summary.md`, `junit.xml`, `messages.ndjson`, `Player.log`, `evidence-complete.txt`, and `@review` captures or films the pass exists to produce, as JPEG. Never whole `screenshots/` folder, never `report.html`. Delete folder as soon as newer run of same scenarios on newer revision exists, after its line in `docs/runs/`. On Windows, deleting folder with long capture names fails with `Remove-Item`: use Node's `fs.rmSync` on relative path, or empty it with `robocopy <empty> <target> /MIR` first.

## Before a publication (fail fast)

Publication policy of mod is fail fast (`PUBLICATION.md`, "Publication by CI"). For tests it means:

- **Not required before publishing:** replay of passes already green (non-regression pass). Runs after publication, in small tickets; red there = defect of published version, said as such.
- **Required before publishing:** every scenario that was red seen green on revision to publish, every defect found by person (in capture, in game) has check failing without fix, passing with it. Fewest scenarios, one ticket each, result goes to `docs/runs/`.
- **For 1.0.1:** two lavish meals of feature 07 (side dish lower case after French joint): **green on 2026-09-25** (`docs/runs/2026-09-25.md`, no negative control). Cooking pass 2b (feature 09) green (request 6072, 2026-09-25).

## What each kind of test may claim

- Green outside game: files parse, handles resolve, logic of wrapper, bridge and fallback right **against values test gives it**. Does not show colonist reads French, cannot know what running game really stores: language guard is the proof. Any code branching on something game provides needs one in-game scenario reading what running game holds.
- Green Pickle run: path ran. Does not show capture shows anything (open images), nor French name agrees (read `[FTFR tests] meal ... reads:` lines, and info cards of 07). Read `exitReason` before counts, compare scenarios played with features discovered.
- Two stock steps untrustworthy for this mod, suite no longer uses them: `def X was patched by mod Y` (and so `no def X was patched`) cannot see patch applied through mod's wrapper operation, and dotted field path takes no numeric index into list. Suite reads value def holds instead (`CategorySteps`).
- Review limited to captured images or cooking film: features 04, 06, 07, 08, 12, 14 use PickleTools ScreenshotMode, 09 uses PickleTools FilmTicks. Language switch is restart in new language, so English and French passes cover it. F13 (meals saved before translation installed) proved by feature `18-legacy-meals` against committed fixture made by feature 21 in English game (pass 10, played 2026-09-24). Running without DLC (F08, F09), unlisted ingredients (F14), restart played (passes 8, 9, 5, 6). Cooking with colonist green (2b, 2026-09-25).
- Names reading oddly but coming from Flavor Text's own generic templates, such as `plat {0_adj} au four` ("Plat de lait au four"), known limit of this mod's translation of those templates, not defect test can catch.