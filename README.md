# Flavor Text Extended - Français

UNOFFICIAL. This mod is published without the original author's explicit consent (though he has so far been kind to translations and add-ons).
If the original author contacts me to request its removal, I undertake to take it down promptly.

French translation of [Flavor Text](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432)
by hekmo and [Flavor Text Extended](https://github.com/vbardales/Rimworld-Flavor-Text-Extended).
Targets RimWorld 1.6. This mod adds text and grammatical forms, not dishes.

## Installation and languages

Load Harmony, Flavor Text, Flavor Text Extended, then this mod. Harmony is a direct dependency.
Cooking and farming mods are optional. They determine which ingredients and dishes are available.
Biotech-only translations are loaded only when Biotech is active.

French dish labels use RimWorld's native DefInjected system. Ingredient dictionaries and
side-dish grammar use a small compiled patch operation: it executes their XML replacements
only when the selected language folder is `French`. Other languages retain the dependencies'
original dictionaries and grammar. RimWorld reloads play data when changing language.
This behavior has technical regression coverage, and the in-game suite plays one pass per language: the game restarts on a language change, so a pass is a cold start in that language.

## Coverage

- Names and descriptions for 930 Flavor Text and 901 Flavor Text Extended dishes.
- Five Flavor Text setting labels and five tooltips, using the upstream English keys.
- 186 ingredient entries across all 15 predefined inflection tables in Flavor Text 0.3.6.
- French sentence templates joining main dishes and side dishes.
- Seven category inflection overrides, the hairy-meal prefix and a French fallback for unlisted ingredients.

English resources cover this mod's own fallback keys; dependency source text is not duplicated.
The optional ingredient tables do not require those mods to be installed.

## French grammar

The four ingredient slots carry their own articles and prepositions:

| Slot | Meaning | Example |
| --- | --- | --- |
| `{N_plur}` | a-form | aux baies, au riz, à la viande de bœuf |
| `{N_coll}` | collective form | baies, riz, viande de bœuf |
| `{N_sing}` | singular | baie, grain de riz, morceau de viande |
| `{N_adj}` | de-form, including elision | de baies, d'oignon, de bœuf |

Dish names can then say `rôti {0_adj}` without guessing an ingredient's gender.
French side-dish templates use complete sentences and do not assume a dish name's gender.
They intentionally use a smaller French grammar than the English original, without
its English-dependent adjective and name-generation rules.

## Settings

Use **Options → Mod settings → Flavor Text Extended - Français**. The five settings belong to Flavor Text:
extra ingredient cap, quick search, meal-stack naming, lax recipe matching and dynamic
meal detection. The original Flavor Text page remains available and shares the same configuration.
A MainButtons shortcut is hidden by default and can be revealed by customization mods.
It opens this same page. No customization mod is required for primary access.
The ingredient cap is clamped to 0–6 on construction, page access and saving.
Settings are global. Stack naming applies when labels are read; recipe-search and ingredient
options affect generation. Restart after changing recipe matching or dynamic meal detection
to rebuild upstream caches. Existing cached meal names are not guaranteed to regenerate.
Defaults are 0, false, true, true, true in the order listed above.

## Known limits and validation

In French, unlisted ingredients use their localized label with neutral French complements.
The fallback preserves accents and compound labels instead of applying English singularization.
It cannot translate an ingredient whose supplying mod has no French label, or infer every
irregular singular. Exact forms belong in the reviewed dictionaries. Known aspirated-h words
(haricot, houblon, husky, héron) survive RimWorld's final meal-text processing.
French agreement and the rendering of existing named meals still require in-game review.

The in-game suite (`Tests/Pickle/`, twenty-one features) has played green in ten passes (English, French, the optional
providers, Shenzhou, invented ingredients, a restart, RIMMSQOL, without Biotech, without Anomaly and Odyssey, and meals saved
before the translation): see `TESTING.md` and `docs/runs/`. Not yet green: the filmed cooking with a colonist (feature 09).
French agreement of names is judged by a person from the captures, and only RIMMSQOL is covered among customization mods.
See `STATUS.md` for the current workflow stage, `_tools/FUNCTIONAL-SCENARIOS.md` for scenarios and `CHANGELOG.md` for changes.

## Build and technical checks

Requires a .NET SDK and an installed RimWorld 1.6. No NuGet package or copied game DLL is shipped.

```powershell
& ./_tools/Build.ps1
& ./_tools/Test-Language.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./_tools/Test-PatchLifecycle.ps1
& ./_tools/Test-Xml.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./_tools/Test-UpstreamSettings.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./_tools/Test-SettingsBridge.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./_tools/Test-Fallback.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./_tools/Test-FallbackPrefix.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ./_tools/Test-HarmonyRegistration.ps1
```

`Build.ps1 -Managed <path>` accepts another RimWorld Managed directory. It compiles against
those references and copies only `FlavorTextExtendedFR.dll` into `Mod/Assemblies/`.
Source and intermediates stay outside the distributed `Mod/` folder.
`-FlavorText` and `-Harmony` accept alternative dependency DLL paths. The Harmony integration
test uses Windows PowerShell/.NET Framework; the installed Harmony build is incompatible with
the test host's PowerShell Core runtime. It does not start Unity or modify player configuration.
`Test-Xml.ps1 -FlavorText <Defs> -Extended <Defs>` accepts other dependency locations.
It requires both dependency datasets; missing dependencies fail the check.

For interactive acceptance testing, close RimWorld and run
`& ./_tools/Start-IsolatedGame.ps1 -Language French` (or `English`). The launcher creates a
fresh profile under `.build/game-tests/`, activates only Core and the three required mods
plus this translation, and writes a separate Player.log. Steam must be accessible so the
Workshop dependencies are discovered. Enable DLCs or optional integrations within that
test profile for the corresponding scenarios. `-Headless` is only a loading diagnostic:
the null graphics device emits shader errors and cannot validate rendering or interaction.

`Art/` keeps image sources and archived previous renders. `Mod/About/` contains the installed
PNG assets. `Mod/` also carries matching licence, attribution and changelog copies.

## Credits and licence

Flavor Text and its naming machinery are by hekmo. Flavor Text Extended and this translation
are maintained by Nelim. Initial translation work used Claude (Anthropic), under human direction
and review. Subsequent fixes used Codex and image work used OpenAI's image generation tool (OpenAI). See `ATTRIBUTION.md`.

The MIT notice covers only contributions for which the contributor holds the required rights.
It does not grant rights in upstream material. Translation derives from source text; no explicit
upstream permission has been established. The unofficial notice is disclosure, not permission.
