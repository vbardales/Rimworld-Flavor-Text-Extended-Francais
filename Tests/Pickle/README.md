# In-game scenarios, run by Pickle

The scenarios of [TESTING.md](../../TESTING.md) that a running game is needed for, and only those.
`Mod/` is a companion mod, **Flavor Text Extended - Français - Pickle tests**, never published. It
holds six feature files and a small steps assembly built from `Source/`.

**Status: written, never run.** The suite was written on 2026-09-21 so that `preTest -> done` is
met; running it belongs to `done -> tested`. What was checked without a game:

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

**Deliberately not in Gherkin**, with the reason, so nobody adds a scenario that cannot work:

- **Cooking with a colonist, a stove and a bill** (F01's cooking, F04-F06, F14's exact dishes).
  No vanilla step powers a stove, restricts a bill's ingredient filter or reads a label. `06`
  reaches the same generation without the stove; the job itself, the filter and the exact dish
  stay manual. The dish chosen is random among those that match, so no exact name is asserted.
- **Side-dish templates (F06, F07).** They need several distinct dishes in one meal, at random.
  Manual, several cooks.
- **The language switch at the menu (F03).** `SelectLanguage` reloads all data and pulls the game
  out from under the runner. Covered by two passes instead (English, French); the switch itself
  is manual.
- **Without Biotech, or without any DLC (F08, F09).** The WSL staging mounts every DLC, so a pass
  without them cannot be staged. Manual.
- **Optional mods (F10), the FoodCourt/Shenzhou provider, an existing save with old meals (F13).**
  The first two need a pass with those mods staged, not yet defined (see TESTING.md). The last
  needs a save made before the translation was installed, which the fixture is not.
- **Persistence across a real restart, and RIMMSQOL revealing the shortcut (F11, F12).** A restart
  cannot be faked by re-reading a file, and RIMMSQOL is not in the headless staging.

## Passes

Declared in [TESTING.md](../../TESTING.md). Two are defined and can be played once staging works:

| Pass | Command | Plays |
| --- | --- | --- |
| English, `sans-facultatifs` | `powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod <Mod>` | 01, 02, 04, 05, 06 (`03` is `@wip`, skipped by default) |
| French, `sans-facultatifs` | `powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod <Mod> -Language French -IncludeWip -Filter "03-french-language.feature" -Then "01-loads.feature" -Then "04-settings-shortcut.feature" -Then "05-language.feature" -Then "06-meal-naming.feature"` | 03, 01, 04, 05, 06: one game launch each, under one hold of the lock |

`02-english-isolation` is English-only and fails in French by design, so the French pass names its
features one by one instead of playing everything. `-Then` takes the lock once and stages once;
its status in `scripts/PICKLE-WSL.md` reads "no two-launch sequence had been seen to finish", so the
first French run may have to be split by hand into separate `-Filter` runs. `<Mod>` is `FlavorTextExtendedFR`, which resolves through the junction described in the next section.

Running any of this takes the machine lock and is done only through `scripts/Run-PickleWsl.ps1`;
see `scripts/PICKLE-WSL.md`. Read `exitReason` before the counts, compare the scenarios played with
the features discovered, and open the two `@review` captures: a green run does not show that the
picture shows anything.

## Staging: two one-time links, machine-local

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

**Not yet exercised.** Both links were checked by what does not need the machine: `--list` names
`FlavorTextExtendedFR`, and the link resolves to a folder whose `About.xml` declares
`nelim.flavortextextended`. Staging itself was not run: it wipes `~/rimworld/Mods`, and on 2026-09-21
another session held the machine lock with a queue behind it. The first real staging may still find
a third problem. Until then "written" is all this suite can honestly claim.
