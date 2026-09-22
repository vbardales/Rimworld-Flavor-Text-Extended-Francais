# Functional acceptance scenarios

This is the historical acceptance inventory. It is no longer an instruction to hand-play the
game: `Tests/Pickle/` owns every automatable action and produces the captures or film that a
person reviews. No pending scenario is presumed successful.

Status: **not executed** for the correction build of 2026-09-13. The earlier scenario
set is preserved in `fix-2026-09-13/FUNCTIONAL-SCENARIOS.before.md`.
Record date, game/dependency versions, exact distributed file hashes, mod list, language,
new/existing save, observed outcome and a dated Player.log copy for each run.
Never erase the original log to prepare a test.

## Common setup

Use the pass matrix in `Tests/Pickle/README.md`. It stages the dependencies, takes the lock,
and leaves the reviewer with only the declared ScreenshotMode captures or FilmTicks video.
Dish selection is not deterministic: a different matching dish is evidence to review, not a
failure by itself.

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
| F11 | Open Options → Mod settings → Flavor Text Extended - Français (unofficial), then the original Flavor Text page, in both languages. Exercise all five settings, the ingredient-cap slider at 0 and 6, close/reopen, restart and reload. Compare normal/quick recipe search, stack labels and extra ingredients; restart after recipe matching or dynamic meal-detection changes. | French labels/tooltips in French and original English text in English. Slider stays in 0–6. Changes have the stated upstream effect and persist. Both useful pages share the same values and saved configuration. Defaults on a clean profile are 0, false, true, true, true for cap, quick search, stack names, lax matching and dynamic detection. |
| F12 | On a clean profile inspect MainButtons. With RIMMSQOL or a compatible customization mod, reveal FTFR_Settings, open it, edit settings, close/reopen and hide it again; restart to check the visibility choice. | No visible or greyed-out unsolicited button. FTFR_Settings opens the same shared settings as the primary entry. Revealing and hiding it works without forced visibility overrides. Name every integration actually tested. |
| F14 | Cook with ingredients absent from every predefined table, including translated compound labels, huile, haricots and yuzu; repeat in English. Exercise all seven category overrides and a hairy-tagged meal if available. | French neutral complements preserve labels and accents, with correct known elisions and no English stemming. Categories and hairy prefixes are French. English retains upstream behavior. Record exact ingredient/recipe IDs for agreement issues; unknown singulars deliberately retain the supplied label, and missing third-party French labels require a translation from that mod. |

## Exit criteria

All applicable acceptance cases must pass before `tested`, with FR/EN UI and log review and
new-game coverage. F13 (meals saved before this translation was installed) is explicitly out of
scope. F14 must not expose unresolved localization defects
on the supported target profile. F12 must establish the settings shortcut contract
or keep that part of the workflow pending. A missing integration or game session is
**unverified**, not a failed test. Re-run affected cases after a correction.

The static suite and lifecycle doubles are technical checks only. They do not validate
Unity UI, actual recipe selection, translation injection, runtime caches or save migration.

## FoodCourt additions — pending runtime acceptance

In French, generate each of the five FlavorTextExtended FoodCourtDiscovery dishes and inspect
its label, description and all ingredient slots, then repeat in English. Altang must retain its
adaptation notice. With the exact current Shenzhou provider active, verify RawDaBaiCai,
RawLianOu, RawLvDou and WorkedFenTiao category selection and four French forms. Repeat without
the provider: no required dependency or unresolved ingredient reference should be introduced.
RawZongYe remains a wrapper outside this integration. Record provider/version and logs;
no 1.6 compatibility or equivalence of overlapping package/defName copies is presumed.
