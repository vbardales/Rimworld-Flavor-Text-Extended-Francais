# In-game scenarios, run by Pickle

The scenarios of [TESTING.md](../../TESTING.md) that a running game is needed for, and only those.
`Mod/` is a companion mod, **Flavor Text Extended - Français - Pickle tests**, never published. It
holds seventeen feature files and a small steps assembly built from `Source/`. Two shared tools of Nelim's
Pickle Tools (`PickleTools/` at the repository root, a repository of its own) are staged by the passes that need
them: `FilmTicks` for the filmed cooking (09) and `RimmsqolSteps` for RIMMSQOL (12 to 15). `FakeIngredients/` is
a second, tiny mod of this suite, staged by its own pass only. What stays in this suite, and where another mod can
find it, is listed in `PickleTools/Elsewhere/FlavorTextExtendedFR.md`.

## Status

Written on 2026-09-21, and played the same day in three parts. All three ran in the WSL through
`Run-PickleWsl.ps1`; the Windows RimWorld was not touched.

- **English pass, `sans-facultatifs`, played before the language fix:** 24 scenarios discovered, **18 passed,
  0 failed, 6 skipped** (the six of `03`, meant for the French pass), `exitReason: passed`, six `run finished`
  lines. The two `@review` captures were opened: the real settings dialog, five settings at their documented
  defaults, English text, no dev tool and no launcher panel. 1,831 FlavorDefs loaded (930 + 901). Feature `02`'s
  isolation scenario was rewritten afterwards and has not been replayed.
- **French pass, played after the fix:** six launches under one lock (`-Then` finished, which the harness
  guide said it had not been seen to do), all `exitReason: passed`. `03` 5/5, `01` 5/5, `04` 4/4, `05` 2/2,
  `06` 3/3, `07` 5/5: 24 scenarios. The `Player.log` of the first five launches holds no error beyond the
  companion's harmless "did not load any content"; the sixth's was not read. Real French names came out (`Saucisse de bœuf`, `Salade d'écureuil` with the elision, and a lavish
  meal whose name carries the French side-dish joint `façon`). The owner opened and validated the squirrel, the
  beef and the first lavish meal. The husky capture does not test the aspirated h: the dish chosen did not name
  the husky. `07` has since gained an info-card capture per meal (the inspect pane cuts a long name), not yet played.
- **RIMMSQOL pass (7), played:** four launches, all `exitReason: passed`. Detail in `PickleTools/RimmsqolSteps/README.md`.

**What the first runs found.** The first French attempt, before the fix, failed 2 of the 6 scenarios of `03`, and
that is how a real defect surfaced: `FT_Egg` read its English values in a French game. RimWorld stores the
official French translation as `French (Français)`, the mod's language guard compared the stored value to `French`
alone, so **no French patch, side-dish grammar, ingredient fallback or aspirated-h repair had ever been applied in
a real game**, with every offline test green because each gave the guard the value `French`. Fixed in `164104b`,
and the offline tests now use the stored value. The other of the two failures was a limit of Pickle's stock steps
(see the last section).

Not yet played: `02` as rewritten, `07`'s info cards, `08`, `09`, `10`/`11`, `16`/`17`, and passes 3 and 4. Running the
suite fully belongs to `done -> tested`.

What was checked without a game:

- `dotnet build Source/FlavorTextExtendedFR.PickleSteps.csproj -c Release` succeeds against the shipped
  `FlavorTextExtendedFR.dll` and hekmo's real `FlavorText.dll`, so every type, field and method a step names
  exists today. The result is `Mod/Pickle/Assemblies/FlavorTextExtendedFR.PickleSteps.dll`.
- `Check-Steps.ps1` compiles the 66 step patterns (this suite's and the shared RIMMSQOL steps it stages) with
  Pickle's own expression engine: all compile, none declared twice. It then matches every feature line against
  them. Lines it leaves for Pickle's own vocabulary were matched against the expressions compiled into
  `RimWorks.Pickle.Vanilla.dll`; five parameterless forms (`no errors were logged`, `the save "..." is loaded`,
  `the save round trips`, `I save and reload`, `I close all dialogs`) are used verbatim by the features Pickle ships.
- The fake ingredients' six DefInjected keys resolve (`Check-DefInjected.ps1`, 0 errors).

## Scope: what stays in Gherkin, and what does not

Everything provable outside the game is proved outside it, by `_tools/` (build, `Test-Xml`,
`Test-Language`, `Test-PatchLifecycle`, `Test-SettingsBridge`, `Test-UpstreamSettings`,
`Test-Fallback*`, `Test-HarmonyRegistration`, `Check-DefInjected`), in seconds. None of those claims
is repeated here, except the one they could not make: what the running game really stores.

| Feature | What only a running game shows | Scenarios (FUNCTIONAL-SCENARIOS.md) |
| --- | --- | --- |
| `01-loads` | The real patch pipeline and loader accept the mod: load order, the targeted defs exist, the LoadFolders-gated Biotech dish exists, a game loads with no error and no warning of the mod's own, and saves and reloads. | F01, F08, F09 (with the DLC) |
| `02-english-isolation` | In an English game the category overrides keep the values the dependency ships (`FT_Egg`, `FT_Flour`), and the dependencies' labels read as their authors wrote them. Reads the value, not "who patched", which cannot see a wrapper patch. | F02, F07 |
| `03-french-language` (`@wip`) | In a French game the DefInjected paths resolved onto the real defs, the Biotech folder was loaded, and the wrapper let its operations through: the French category overrides are what the def holds. | F01, F08 |
| `04-settings-shortcut` (`@review`) | The real `Dialog_ModSettings` draws through the bridge and belongs to this mod, drawing it applies the 0-6 clamp to hekmo's field, the hidden shortcut opens the same page, and revealed it is drawn, not greyed. Two captures. | F11, F12 |
| `05-language` | Every text the mod owns resolves in the language of the pass, and the settings label is the one written for it. | F01, F11 |
| `06-meal-naming` | A meal of chosen ingredients is named through the real generation in the language of the pass: renamed, no raw slot, no English connector in French, no French leak in English. The actual names are written to the report for a person to judge. | F01, F04, F14 (partly) |
| `07-review-shots` (`@wip @review`) | Five meals of chosen ingredients (cow, squirrel, husky; two lavish meals of four ingredients for side dishes), in French: two captures each, the inspect pane and the info card, which shows the whole name and description. Nothing is asserted: the capture is the deliverable. | F04, F05, F06 |
| `08-unlisted-ingredients` (`@wip @review`) | The fallback for ingredients no table lists (F14), with three invented raw foods from `FakeIngredients/` (yuzu, huile de noix, haricots rouges): renamed, no raw slot, no internal name shown, inspect pane captured. Own pass, own mod. | F14 |
| `09-cooking` (`@wip @review @slow @watch`) | A colonist cooks a simple meal at a fuelled stove from the colony's stock; only the cooking is filmed by `PickleTools/FilmTicks`, one picture every 30 ticks, encoded into a video when ffmpeg is on the PATH; the meal that comes out is named in the language of the pass. | F01 |
| `10-restart-write`, `11-restart-read` (`@wip`) | Two launches under one lock: values saved in the first are the ones the second loaded at startup, then put back. | F11 |
| `12-rimmsqol-shortcut` (`@wip @review @rimmsqol`) | RIMMSQOL itself, staged and driven through the shared steps: its own list of main buttons offers `FTFR_Settings`, reads it hidden; RIMMSQOL reveals it and the bar draws it, the file RIMMSQOL wrote says so, and the revealed button opens this mod's page; RIMMSQOL hides it and forgets it and nothing is left. Three captures. | F12 |
| `13`, `14`, `15-rimmsqol-restart-*` (`@wip @rimmsqol`, `14` `@review`) | Three launches under one lock: reveal, then in a new process the reveal survived and it is hidden, then in a third the hiding survived and everything is forgotten. Each launch refuses to pass if the previous one ran in the same process. One capture. | F12 |
| `16-without-biotech` (`@wip`) | With Biotech left out of the pass, the Biotech-only translation loads nothing, its dish does not exist, and the game starts without error. No save loaded (the fixture holds every DLC). | F08 |
| `17-without-anomaly-odyssey` (`@wip`) | With both left out, the patches still find their targets (Flavor Text declares all its tables unconditionally) and the game starts without error. | F09 |

**Deliberately not in Gherkin**, with the reason, so nobody adds a scenario that cannot work:

- **Choosing the exact dish (F04-F06).** The dish is random among those that match and no step restricts a
  bill's ingredient filter, so a specific name cannot be forced. `06` and `07` name meals of chosen
  ingredients without a stove and `09` cooks for real, but the exact dish stays manual.
- **Side-dish templates (F06, F07).** They need several distinct dishes in one meal, at random. `07`'s two lavish
  meals show what comes out; the variety stays manual, several cooks.
- **An existing save with old meals (F13).** It needs a save made before the translation was installed, which
  the fixture is not.
- **RIMMSQOL's own checkbox (F12).** `12` to `15` drive RIMMSQOL's settings instance, the one its checkbox
  calls; they do not click the checkbox, and "the bar draws it" is computed from the bar's own list, not
  photographed.
- **The language switch from the menu (F03).** No longer a gap: the game restarts when the language changes
  (confirmed by the owner, 2026-09-21), so a switch is a cold start in the new language, which is what a pass
  with `-Language` is. Switching inside one run would only exercise the game's own reload
  (`SelectLanguage` clears and reloads all play data under the runner), which is not this mod's to guarantee.
  What the mod owes at a reload, the wrapper reading the language each time patches are applied, is proved
  outside the game (`Test-PatchLifecycle`, reload sequence included).
- **Names that read oddly by design.** `plat {0_adj} au four` gives "Plat de lait au four": the template is
  Flavor Text's generic `{0_adj} bake`, and a test cannot tell a good French name from a poor one. Read them in
  the captures.

## Passes

Declared in [TESTING.md](../../TESTING.md). `<Mod>` is `FlavorTextExtendedFR`, which resolves through the
junction described in the next section. Every command goes through `scripts/Run-PickleWsl.ps1` and is run in a real
PowerShell session (`powershell.exe -Command "& ./scripts/Run-PickleWsl.ps1 ..."`), because `-Then` is an
array (`[string[]]`): with `-File` it would reach the script as one string. The guide to the harness is
`PickleTools/Headless/README.md`.

| Pass | Extra arguments after `-Mod <Mod>` | Plays |
| --- | --- | --- |
| 1 English, `sans-facultatifs` | none | 01, 02, 04, 05, 06 (`03` and `07`-`17` are `@wip`, skipped by default) |
| 2 French | `-Language French -IncludeWip -Filter '03-french-language.feature' -Then '01-loads.feature','04-settings-shortcut.feature','05-language.feature','06-meal-naming.feature','07-review-shots.feature'` | 03, 01, 04, 05, 06, 07: one game launch each, under one hold of the lock |
| 2b French, cooking | `-Language French -IncludeWip -DepMap wsl-deps.cuisson-film.map -Filter '09-cooking.feature'` | 09, filmed by `PickleTools/FilmTicks` |
| 3 French, optional providers | `-Language French -IncludeWip -DepMap wsl-deps.avec-facultatifs.map -Filter '06-meal-naming.feature' -Then '01-loads.feature'` | 06, 01 |
| 4 French, Shenzhou | `-Language French -IncludeWip -DepMap wsl-deps.avec-shenzhou.map -Filter '06-meal-naming.feature' -Then '01-loads.feature'` | 06, 01 |
| 5 French, invented foods | `-Language French -IncludeWip -DepMap wsl-deps.faux-ingredients.map -Filter '08-unlisted-ingredients.feature'` | 08; the folder is staged by `path:`, no link |
| 6 restart pair | `-IncludeWip -Filter '10-restart-write.feature' -Then '11-restart-read.feature'` | 10, then 11: two launches |
| 7 RIMMSQOL | `-IncludeWip -DepMap wsl-deps.avec-rimmsqol.map -Filter '12-rimmsqol-shortcut.feature' -Then '13-rimmsqol-restart-reveal.feature','14-rimmsqol-restart-hide.feature','15-rimmsqol-restart-forget.feature'` | 12, then the chain 13, 14, 15: four launches under one lock. The last scenario forgets RIMMSQOL's choice; a run cut between two launches leaves it in the WSL profile, see `PickleTools/RimmsqolSteps/README.md`, "Leftovers" |
| 8 without Biotech | `-IncludeWip -DepMap wsl-deps.sans-biotech.map -Filter '16-without-biotech.feature'` | 16 |
| 9 without Anomaly and Odyssey | `-IncludeWip -DepMap wsl-deps.sans-anomaly-odyssey.map -Filter '17-without-anomaly-odyssey.feature'` | 17 |

`02-english-isolation` is English-only and fails in French by design, so the French passes name their
features one by one. `-Then` takes the lock once and stages once. A restart pair that dies between its two
launches leaves the ingredient cap at 4 and quick search on in the profile, and the next staging does not clean
them: put them back by hand.

Running any of this takes the machine lock and is done only through `scripts/Run-PickleWsl.ps1`. Read
`exitReason` before the counts, compare the scenarios played with the features discovered, and open the
`@review` captures: a green run does not show that the picture shows anything. The report folder is shared:
`pickle-reports` is overwritten by the next run, and the `screenshots` folder is not emptied between runs, so
copy what you need at once and read the launcher's archive (`pickle-reports-archive/`) for the rest.

## Staging: two one-time links, machine-local

`scripts/stage-pickle-wsl.sh` is shared with every other mod and was not edited. Read against this repository it
could not stage this suite as it stood, for two reasons, both settled by a link that lives on the machine and not in
this repository. Everything else is staged by `path:` from the repository (see `PickleTools/Headless/README.md`,
"A pass without a DLC, and a mod that has no Workshop id").

1. **`-Mod` is a top-level folder of the monorepo.** The script resolves `$REPO/$MOD/Tests/Pickle` and
   builds staged folder names from `$MOD`, and this repository sits one level deeper
   (`FlavorText/FlavorTextExtendedFR`) and is now its own Git repository. A **junction** at the top
   level, `rimworld\FlavorTextExtendedFR`, makes `-Mod FlavorTextExtendedFR` resolve. Created on
   2026-09-21 and excluded from the monorepo through its local `.git/info/exclude`; `--list` sees it
   from the WSL. Recreate it with:

   ```powershell
   New-Item -ItemType Junction `
     -Path   C:\Users\nelim\Documents\rimworld\FlavorTextExtendedFR `
     -Target C:\Users\nelim\Documents\rimworld\FlavorText\FlavorTextExtendedFR
   ```

   To remove it, `[System.IO.Directory]::Delete(<path>, $false)`, never `Remove-Item -Recurse`, which would
   follow the junction and delete the repository.
2. **`nelim.flavortextextended` has no Workshop id.** It is a hard dependency of the mod, published on GitHub only.
   The script takes a hard dependency from a folder named by its "id" inside the Workshop directories, and the id is
   only a folder name, so `wsl-ids.map` names it `FlavorTextExtended` and a symbolic link of that name in the WSL
   cache points at the local mod (its `About.xml` declares the packageId the script then checks). Created on
   2026-09-21 inside the WSL:

   ```bash
   mkdir -p ~/workshop-cache/steamapps/workshop/content/294100
   ln -s /mnt/c/Users/nelim/Documents/rimworld/FlavorText/FlavorTextExtended/Mod \
         ~/workshop-cache/steamapps/workshop/content/294100/FlavorTextExtended
   ```

   The `path:` form of a pass map serves optional mods and extra folders; whether the hard-dependency map
   (`wsl-ids.map`) accepts it too was not tried.

Exercised on 2026-09-21: the first staging worked (13 mods staged and loaded), and every pass since.

## What Pickle's own steps cannot see

Found by a real run, worth knowing before anyone writes the assertion the obvious way (also recorded in
`PickleTools/Elsewhere/FlavorTextExtendedFR.md`):

- **`def {string} was patched by mod {string}` cannot see a patch applied through a wrapper `PatchOperation`.**
  This mod wraps ordinary operations in a custom class (`PatchOperationFrench`, holding a `PatchOperationSequence`)
  that decides by language. For a def that operation had certainly changed, the step reported `patched by (no
  mod)`. It follows that `no def {string} was patched` also passes for such a def, so an "isolation" scenario written
  with it proves nothing. The suite asserts the value the def holds afterwards (`CategorySteps`).
- **A dotted field path takes no numeric index into a list.** `def "X" field "inflectionsOverride.0" is ...` fails
  with `List has no field or property '0'`. A list has to be read whole, by a step that knows its type.
