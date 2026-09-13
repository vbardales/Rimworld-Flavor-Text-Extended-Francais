# Functional acceptance scenarios

Status: **not executed** for the correction build of 2026-09-13. The earlier scenario
set is preserved in `fix-2026-09-13/FUNCTIONAL-SCENARIOS.before.md`.
Record date, game/dependency versions, exact distributed file hashes, mod list, language,
new/existing save, observed outcome and a dated Player.log copy for each run.
Never erase the original log to prepare a test.

## Common setup

Use RimWorld 1.6, Harmony, Flavor Text, Flavor Text Extended and this translation in
that order. Back up the save and configuration before testing. Use a disposable colony
with a stove and ingredients; optional cooking mods may expose more meal kinds.
The user starts the game. Every scenario remains pending until its observations are recorded.
Dish selection is not deterministic: inspect the actual selected dish and its ingredient
slots rather than treating a different matching recipe as a failure.

| ID | Preconditions and actions | Expected result |
| --- | --- | --- |
| F01 | Start a new French colony with all installed DLCs. Cook a simple, fine and lavish meal. Read names, descriptions and Player.log. | French names and descriptions for the selected covered dishes. No exceptions, failed patches, unresolved translation keys or malformed placeholders attributable to this mod. |
| F02 | Start in English with this mod still active. Cook the same classes of meals using predefined ingredients. Inspect all 15 dictionary defs and both side-dish rule packs through development tools where available. | Original English dictionaries and rule packs remain unchanged. No French ingredient prepositions injected by this mod. No false patch failure on completion. |
| F03 | At the main menu, switch English → French → English. Start a disposable colony after each switch and cook fresh meals. Repeat with a full restart in each language. | Each newly loaded language produces its own grammar, with no previous-language patch state leaking. No load or completion errors. |
| F04 | In French, cook a matching meat dish with cow, squirrel and husky meat in turn. Check recipes using the `{N_adj}` slot. | Forms such as `de bœuf`, `d'écureuil` and `de husky`, without a duplicated preposition. All selected ingredient slots resolve. |
| F05 | In French, use berries, rice and cow meat in dishes selecting `{N_plur}`; read `{N_coll}` and `{N_sing}` examples too. | Forms include `aux baies`, `au riz` and `à la viande de bœuf`; collective/singular forms fit the selected template. Record agreement issues as defects. |
| F06 | In French, cook a meal with enough distinct ingredients to select multiple dishes. Repeat until several side-dish templates appear. Inspect names and descriptions. | French joints and complete French sentences. No `with`, `alongside`, raw `{0}`/`{1}`, unresolved rule name or duplicated sentence punctuation introduced by the templates. |
| F07 | Repeat F06 in English. | The original English side-dish variation is retained; no French replacement templates appear. |
| F08 | Disable Biotech and start a new French game. Then enable it and repeat with baby-food dishes. | Without Biotech, its six dish translations are not loaded and cause no missing-def errors. With Biotech, their twelve name/description entries appear in French. |
| F09 | Disable Anomaly and Odyssey and load in French; then repeat with them active. | Language patches still find the upstream dictionaries. No references to absent DLC items create patch errors; actual dish availability follows installed content. |
| F10 | Add each supported optional mod separately where available; select ingredients listed in `Inflections_ThirdParty_FR.xml`. Include VGP mushrooms, VCE spices and the meat optimization override. Repeat selected cases in English. | Listed ingredients use the four reviewed French forms in French. English keeps upstream forms. Missing optional mods never become required dependencies. Report the exact combinations tested. |
| F11 | Open Options → Mod settings → Flavor Text in both languages. Exercise all five settings, the ingredient-cap slider at 0 and 6, close/reopen, restart and reload. Compare normal/quick recipe search, stack labels and extra ingredients; restart after recipe matching or dynamic meal-detection changes. | French labels/tooltips in French and original English text in English. Slider stays in 0–6. Changes have the stated upstream effect and persist. No extra empty page from the translation. Defaults on a clean profile are 0, false, true, true, true for cap, quick search, stack names, lax matching and dynamic detection. |
| F12 | On a clean profile inspect MainButtons. With RIMMSQOL or a compatible customization mod, inspect available settings shortcuts and exercise a supported one if present. | No visible or greyed-out unsolicited button. If a shortcut exists, it opens the same Flavor Text settings and shares persistence. Absence of the inherited shortcut is a recorded contract gap, not a claimed pass. Name every integration actually tested. |
| F13 | Load a copy of an existing save made before this translation was installed; include stored meals. Inspect it, cook fresh meals, save and reload twice in each language. | Save loads without corruption or attributable errors. Existing meals remain usable. Newly cooked meals use the selected language. Record whether old cached meal names update; do not claim automatic renaming without observing it. |
| F14 | Cook with an ingredient absent from every predefined table. | Diagnostic boundary: record any English fallback or agreement failure with the ingredient and selected recipe IDs. Such output is a remaining localization defect; this scenario cannot be counted as a successful full-French acceptance result. |

## Exit criteria

All applicable acceptance cases must pass before `tested`, with FR/EN UI and log review,
new-game and existing-save coverage. F14 must not expose unresolved localization defects
on the supported target profile. F12 must establish the inherited settings shortcut contract
or keep that part of the workflow pending. A missing integration or game session is
**unverified**, not a failed test. Re-run affected cases after a correction.

The static suite and lifecycle doubles are technical checks only. They do not validate
Unity UI, actual recipe selection, translation injection, runtime caches or save migration.