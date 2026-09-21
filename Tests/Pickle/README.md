# In-game scenarios, run by Pickle

The scenarios of [TESTING.md](../../TESTING.md) that a running game is needed for, and only those.
`Mod/` is a companion mod, **Flavor Text Extended - Français - Pickle tests**, never published. It
holds eleven feature files and a small steps assembly built from `Source/`.

**Status: written on 2026-09-21; one pass played the same day.** The English pass, `sans-facultatifs`,
ran in the WSL: 24 scenarios discovered, **18 passed, 0 failed, 6 skipped**, `exitReason: passed`. The 6
skipped are exactly the six scenarios of `03-french-language`, `@wip` and meant for the French pass.
Six features, six `run finished` lines. The two `@review` captures were opened: the real settings
dialog, titled with the mod's name, five settings at their documented defaults (cap 0, quick search off,
the other three on), English text, no dev tool and no launcher panel on screen. The three meals were
named by Flavor Text in the game (`Beef Sausage`, `Squirrel Salad`, `Milk Bake`, each followed by
`(fine meal)`), with 1,831 FlavorDefs loaded (930 + 901). **The French pass has not been played**, so
the two guesses in `03` and every French assertion remain unverified, and so does pass 3. Running the
suite fully belongs to `done -> tested`. What was checked without a game:

- `dotnet build Source/FlavorTextExtendedFR.PickleSteps.csproj -c Release` succeeds against the
  shipped `FlavorTextExtendedFR.dll` and hekmo's real `FlavorText.dll`, so every type, field and
  method a step names exists today. The result is `Mod/Pickle/Assemblies/FlavorTextExtendedFR.PickleSteps.dll`.
- `Check-Steps.ps1` compiles the 15 step patterns with Pickle's own expression engine (all compile,
  none declared twice, none unused) and matches every feature line against them. Every line it
  leaves for Pickle's own vocabulary was then matched against the expressions compiled into
  `RimWorks.Pickle.Vanilla.dll`, extracted and run through the same engine. Five parameterless forms
  are not in that extraction (`no errors were logged`, `the save "..." is loaded`, `the save round
  trips`, `I save and reload`, `I close all dialogs`): they are used verbatim by the features Pickle
  ships, which is the evidence for them.

Nothing in this folder is evidence that the mod works in game. Two guesses are called out in
`03-french-language.feature` and isolated in scenarios of their own (attribution of a patch made by
a wrapper operation, and a numeric segment in a field path).

## Scope: what stays in Gherkin, and what does not

Everything provable outside the game is proved outside it, by `_tools/` (build, `Test-Xml`,
`Test-Language`, `Test-PatchLifecycle`, `Test-SettingsBridge`, `Test-UpstreamSettings`,
`Test-Fallback*`, `Test-HarmonyRegistration`, `Check-DefInjected`), in seconds. None of those claims
is repeated here.

| Feature | What only a running game shows | Scenarios (FUNCTIONAL-SCENARIOS.md) |
| --- | --- | --- |
| `01-loads` | The real patch pipeline and loader accept the mod: load order, the targeted defs exist, the LoadFolders-gated Biotech dish exists, a game loads with no error and no warning of the mod's own, and saves and reloads. | F01, F08, F09 (with the DLC) |
| `02-english-isolation` | In an English game no guarded patch was applied to the real defs and the dependencies read as their authors wrote them. | F02, F07 |
| `03-french-language` (`@wip`) | In a French game the DefInjected paths resolved onto the real defs, the Biotech folder was loaded, and the wrapper let its operations through. | F01, F08 |
| `04-settings-shortcut` (`@review`) | The real `Dialog_ModSettings` draws through the bridge and belongs to this mod, drawing it applies the 0-6 clamp to hekmo's field, the hidden shortcut opens the same page, and revealed it is drawn, not greyed. Two captures. | F11, F12 |
| `05-language` | Every text the mod owns resolves in the language of the pass, and the settings label is the one written for it. | F01, F11 |
| `06-meal-naming` | A meal of chosen ingredients is named through the real generation in the language of the pass: renamed, no raw slot, no English connector in French, no French leak in English. The actual names are written to the report for a person to judge. | F01, F04, F14 (partly) |
| `07-review-shots` (`@wip @review`) | Five captures of the inspect pane on meals of chosen ingredients (cow, squirrel, husky; two lavish meals of four ingredients for side dishes), in French, for a person to open and validate. Nothing is asserted: the capture is the deliverable. | F04, F05, F06 |
| `08-unlisted-ingredients` (`@wip @review`) | The fallback for ingredients no table lists (F14), with three invented raw foods from `FakeIngredients/` (yuzu, huile de noix, haricots rouges): renamed, no raw slot, no internal name shown, inspect pane captured. Own pass, own mod, see below. | F14 |
| `09-cooking` (`@wip @review @film @slow`) | A colonist cooks a simple meal at a fuelled stove from the colony's stock, filmed; the meal that comes out is named in the language of the pass. Frames and a capture for a person to watch. | F01 |
| `10-restart-write`, `11-restart-read` (`@wip`) | Two launches under one lock: values saved in the first are the ones the second loaded at startup, then put back. | F11 |

**Deliberately not in Gherkin**, with the reason, so nobody adds a scenario that cannot work:

- **Choosing the exact dish (F04-F06).** Cooking itself is now in `09-cooking` (a step loads a stove
  with fuel, the rest is Pickle's own), but the dish is random among those that match and no step
  restricts a bill's ingredient filter, so a specific name cannot be forced. `06` and `07` name
  meals of chosen ingredients without a stove; the exact dish stays manual.
- **Side-dish templates (F06, F07).** They need several distinct dishes in one meal, at random.
  Manual, several cooks.
- **Without Biotech, or without any DLC (F08, F09).** The WSL staging mounts every DLC, so a pass
  without them cannot be staged. Manual.
- **An existing save with old meals (F13).** It needs a save made before the translation was
  installed, which the fixture is not. Optional mods (F10) and the Shenzhou provider are covered by
  passes 3 and 4, whose maps are written (see TESTING.md); Medieval Overhaul, Optimization: Meats and
  V.O.I.D. are left out on the owner's word, and Nelim's Food Court, local and unpublished, is not
  targeted by any table of this mod.
- **RIMMSQOL revealing the shortcut (F12).** RIMMSQOL is not in the headless staging, and driving its own
  interface needs its internals read first; not written. The contract on this mod's side (hidden,
  then drawn and live, then hidden again) is in `04`.
- **The language switch from the menu (F03), inside one run.** Not a scenario, and not for lack of
  effort: `SelectLanguage` reloads all data and pulls the game out from under the runner, so a
  scenario that switches fails for reasons that are not the mod's. Two separate launches, English
  and French, each from a clean start, cover what F03 is worried about (no patch state leaking from
  one language into the other, since a new process has none to leak); the menu switch itself stays
  manual.

## Passes

Declared in [TESTING.md](../../TESTING.md). `<Mod>` is `FlavorTextExtendedFR`, which resolves through the junction
described in the next section. Every command goes through `scripts/Run-PickleWsl.ps1` and is run in a real
PowerShell session (`powershell.exe -Command "& ./scripts/Run-PickleWsl.ps1 ..."`), because `-Then` is an
array (`[string[]]`): with `-File` it would reach the script as one string.

| Pass | Extra arguments after `-Mod <Mod>` | Plays |
| --- | --- | --- |
| 1 English, `sans-facultatifs` | none | 01, 02, 04, 05, 06 (`03`, `07`-`11` are `@wip`, skipped by default) |
| 2 French | `-Language French -IncludeWip -Filter '03-french-language.feature' -Then '01-loads.feature','04-settings-shortcut.feature','05-language.feature','06-meal-naming.feature','07-review-shots.feature'` | 03, 01, 04, 05, 06, 07: one game launch each, under one hold of the lock |
| 2b French, cooking | `-Language French -IncludeWip -Filter '09-cooking.feature'` | 09, filmed |
| 3 French, optional providers | `-Language French -IncludeWip -DepMap wsl-deps.avec-facultatifs.map -Filter '06-meal-naming.feature' -Then '01-loads.feature'` | 06, 01 |
| 4 French, Shenzhou | `-Language French -IncludeWip -DepMap wsl-deps.avec-shenzhou.map -Filter '06-meal-naming.feature' -Then '01-loads.feature'` | 06, 01 |
| 5 French, invented foods | `-Language French -IncludeWip -DepMap wsl-deps.faux-ingredients.map -Filter '08-unlisted-ingredients.feature'` | 08 (needs the third link below) |
| 6 restart pair | `-IncludeWip -Filter '10-restart-write.feature' -Then '11-restart-read.feature'` | 10, then 11: two launches |

`02-english-isolation` is English-only and fails in French by design, so the French passes name their
features one by one. `-Then` takes the lock once and stages once; `scripts/PICKLE-WSL.md` says no
two-launch sequence had been seen to finish when it was written, so a sequence may have to be split into
separate `-Filter` runs. A restart pair that dies between its two launches leaves the ingredient cap at 4 and
quick search on in the profile, and the next staging does not clean them: put them back by hand.

Running any of this takes the machine lock and is done only through `scripts/Run-PickleWsl.ps1`;
see `scripts/PICKLE-WSL.md`. Read `exitReason` before the counts, compare the scenarios played with
the features discovered, and open the two `@review` captures: a green run does not show that the
picture shows anything.

## Staging: three one-time links, machine-local

`scripts/stage-pickle-wsl.sh` is shared with every other mod and was not edited. Read against this
repository it could not stage this suite as it stood, for two reasons, both settled without touching
the script by a link that lives on the machine and not in this repository:

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
2. **`nelim.flavortextextended` has no Workshop id.** It is a hard dependency published on GitHub only.
   The script takes a dependency from a folder named by its "id" inside the Workshop directories, and
   the id is only a folder name, so `wsl-ids.map` names it `FlavorTextExtended` and a symbolic link of
   that name in the WSL cache points at the local mod (its `About.xml` declares the packageId the
   script then checks). Created on 2026-09-21 inside the WSL:

   ```bash
   mkdir -p ~/workshop-cache/steamapps/workshop/content/294100
   ln -s /mnt/c/Users/nelim/Documents/rimworld/FlavorText/FlavorTextExtended/Mod ~/workshop-cache/steamapps/workshop/content/294100/FlavorTextExtended
   ```

3. **The invented foods (pass 5).** `Tests/Pickle/FakeIngredients` is a mod of its own so that a fault in how
   Flavor Text categorizes three invented raw foods cannot break another pass. A symbolic link named
   `FTFRFakeIngredients` in the WSL cache points at it (created 2026-09-21, named in
   `wsl-deps.faux-ingredients.map`):

   ```bash
   ln -s /mnt/c/Users/nelim/Documents/rimworld/FlavorText/FlavorTextExtendedFR/Tests/Pickle/FakeIngredients \n         ~/workshop-cache/steamapps/workshop/content/294100/FTFRFakeIngredients
   ```

**Exercised on 2026-09-21.** The first staging through `Run-PickleWsl.ps1 -Mod FlavorTextExtendedFR`
worked: 13 mods staged, all loaded (Harmony, the game and its five DLC, RimLogging, Pickle, Flavor Text,
Flavor Text Extended, the mod and its companion), and the run went to its end. Both links did their job
and no third problem showed up in the English pass.

Two things seen in that run, neither fixed here. The launcher printed `veille non empechee`: its call to
`SetThreadExecutionState` passes `-2147483647`, which PowerShell 5.1 cannot convert to `UInt32`, so the
machine was not kept awake (harmless for a run of about two minutes, not for a long one). And the report
folder is shared: `pickle-reports` was overwritten by another session's run within minutes, and the
`screenshots` folder is not emptied between runs. This suite's report was recovered from
`pickle-reports-archive/0921-1803`.
