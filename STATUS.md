---
mod: Flavor Text Extended - Français (unofficial)
packageId: nelim.flavortextextended.fr
repo: Rimworld-Flavor-Text-Extended-Francais
remote: https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais.git
visibility: public
visibility_verified_at: 2026-09-13
visibility_evidence: live GitHub repository read and ls-remote during the preceding audit
mod_visibility: public via GitHub; Workshop publication not established
detached: yes
stage: done
stage_meaning: offline gates complete under the user-approved public silent workflow; in-game validation pending
licence: silent
licence_declared: MIT limited to rights held by the contributor
licence_at: derivative translation; local notice does not establish upstream permission
upstream_permission: unverified
rights_reviewed_at: 2026-09-13
rights_evidence: _tools/UPSTREAM-PERMISSION-REVIEW.md
explicit_prohibition_found: false
settings_audit: complete
localization: complete
translation_en: complete
translation_fr: complete
dependencies: verified
showcase: complete
build: passed
automated_tests: passed
xml_tests: passed
tested_on:
automated_tested_on: 2026-09-13
audit_revision: 80a77c572465a0437b9766c3b1fa9f0d7784c356
review_revision: c675e87
in_game_validation_owner: user
workshop:
maintainer: Codex, task responsible for this local repository
updated: 2026-09-13
remaining:
  - "unverified optional scope: FoodCourt provider activation and recipe output in RimWorld 1.6; see _tools/FOODCOURT-FOLLOWUP.md. No incompatibility inferred from lexical absence."

  - "unverified: in-game FR/EN loading and switching, UI, optional integrations, new games and existing saves."
---

# Correction pass — 2026-09-13

The user requested fixes after the workflow audit, then requested the original icon style.
The previous audit and its historical notes are preserved in
`_tools/fix-2026-09-13/STATUS.before.md`; the earlier pre-audit snapshot remains in
`_tools/audit-2026-09-13/STATUS.before.md`. Earlier test outputs and scenario descriptions
are retained. This document describes the current working files, not just HEAD.

Repository: `C:\Users\nelim\Documents\rimworld\FlavorText\FlavorTextExtendedFR`.
Distributed folder: `Mod/`. Initial audit: `80a77c572465a0437b9766c3b1fa9f0d7784c356`. Technical corrections are recorded in `c675e87`; the subsequent documentation commit records the stage correction.
At audit entry About.xml and STATUS.md were already modified and Test-Xml.ps1 was untracked.
Those changes were incorporated, not reset. The correction pass modifies documentation,
images, two translation files and the inflection patch, and adds local code/build/tests,
conditional translations, grammar resources and evidence. Final file hashes and Git status
are recorded under `_tools/continue-2026-09-13/`; earlier evidence remains under `_tools/fix-2026-09-13/`.

## Stage interpretation

Literal workflow states:
`dansMonoRepo -> horsMonoRepo -> ModIcon générée -> Preview générée -> preOptions -> options -> l10n -> preTest -> done -> tested`.

**The current cumulative stage is `done`.** The user-approved public `silent` convention is satisfied: unofficial title and Preview, English disclosure, attribution, takedown commitment and MIT limited to the contributor's own rights. Explicit upstream permission remains unverified; it is not an additional blocking workflow gate. The earlier mandatory-permission interpretation is superseded. Only the user-run game campaign can advance the stage to `tested`.

| Gate | Current result |
| --- | --- |
| horsMonoRepo | Git isolation, remote, first push, identity, English documentation, changelog and synchronized distribution notices validated. The agreed public `silent` requirements are met; upstream permission remains unverified. |
| ModIcon générée | Build and installed 128x128 PNG validated independently. Original 64x64 artwork retained at the user's request and enlarged without adding detail. |
| Preview générée | Installed 896x504 PNG inspected directly, 569,664 bytes, under 1 MB. No concrete camera defect found. |
| preOptions | English description, exact unofficial notice/suffix, labeled GitHub link and revised visual hierarchy validated independently. |
| options | **Validated technically under the user's explicit gate override.** Shared useful settings, hidden shortcut, bounds, defaults and primitive persistence checked. UI/game integration remains in tested. |
| l10n | Local EN/FR resources and known generator paths covered; fallback, seven categories, three grammars and DefInjected checks pass. Natural agreement in arbitrary third-party content remains a runtime review item. |
| preTest | Current dependency IDs, 1.6 support, load order and Biotech LoadFolders gate validated independently. |
| done | **Validated.** Build and applicable automated/XML tests pass; acceptance scenarios are ready for the user. |
| tested | **Unverified**. Isolated headless startup attempted; target loading did not reach a verifiable completion. No final runtime campaign claimed. |

## Fixes and technical evidence

- English README, About description, changelog and licence scope now match the delivered
  content. The licence notice does not grant rights the contributor does not hold.
  About and README carry the prescribed public `(unofficial)` name and disclosure.
  PackageId, repository name, origin and folder identity were preserved.
- `Source/PatchOperationFrench.cs` now wraps ordinary XML patches. It consults
  `Prefs.LangFolderName`, which RimWorld sets before reloading play data on a language change.
  Installed 1.6 `LanguageDatabase.SelectLanguage`, `PlayDataLoader`, `PatchOperation` and
  `PatchOperationSequence` were inspected. The wrapper's completion deliberately belongs
  only to the outer operation: completing a skipped child would falsely report failure in English.
- `Mod/Patches/Inflections_FR.xml` retains the original 150 forms behind this language guard.
  `Inflections_ThirdParty_FR.xml` adds 36 entries in the eleven previously uncovered tables.
  Every upstream dictionary and original key is accounted for against Flavor Text 0.3.6.
- `SideDishes_FR.xml` uses complete French templates for both joining names and describing
  multiple dishes. It intentionally replaces the English-dependent random grammar with a
  smaller French set; it does not claim to preserve every English stylistic variant.
- Twelve translations for six Biotech-only dishes moved into `Mod/Biotech/Languages/`.
  `Mod/LoadFolders.xml` loads that folder only with `Ludeon.RimWorld.Biotech`.
- `Build.ps1` compiles local source using the installed .NET SDK and RimWorld references.
  Only the resulting local DLL is distributed; its current size/hash is recorded in the continuation manifest. Game/dependency DLLs and decompiled
  inspection files remain outside `Mod/`. Built and installed DLL hashes match.

Current commands and results (latest outputs in `_tools/continue-2026-09-13/`; earlier results preserved in `_tools/fix-2026-09-13/`):

| Command | Observed result |
| --- | --- |
| `& ./_tools/Build.ps1` | PASS, compiled against local RimWorld 1.6 references and installed DLL. |
| `& ./_tools/Test-Language.ps1` | PASS against the installed DLL: language isolation, case handling, one payload call, false/exception propagation. |
| `pwsh -NoProfile -File ./_tools/Test-PatchLifecycle.ps1` | PASS: production wrapper compiled with lifecycle doubles; XML mutation, EN/DE isolation, language reload sequence, skipped completion and failure reporting. These doubles are not game execution. |
| `& ./_tools/Test-Xml.ps1` | PASS: 82 XML files, 1,831 dishes, 25 guarded replacements simulated in memory, 186 entries across 15 tables, three grammars, seven category overrides, ten upstream setting strings and five new bilingual keys and Biotech gating. |
| `../../scripts/Check-DefInjected.ps1` with both actual dependency targets and their type assemblies | 3,671 keys checked, zero errors. Its six MayRequire advisory lines are unconditional (script lines 625–630); it does not inspect LoadFolders. The new folder gate is checked separately by Test-Xml, not dismissed as an unresolved path. This external checker does not execute the custom language guard. |

## Settings audit

Technical gate complete on 2026-09-13 under the user's explicit instruction that options
requires source/defs and applicable automated tests, with interactive checks reserved for tested.
The original five useful settings now appear under this mod's own name through SettingsBridge;
both that route and the hidden FTFR_Settings MainButton open the same upstream backend.
The original Flavor Text page remains available. No separate values or settings file is created.
The MainButton inherits the game's visibility mechanism and is not forcibly hidden every frame.
No RIMMSQOL or other customization integration has been executed or certified.

| Shared global setting | Default | Inspected upstream effect/application |
| --- | --- | --- |
| Extra ingredient cap | 0; accepted range 0–6 | CompFlavor.TryAddGhostIngredients limits newly generated extra ingredients. |
| Quick search | false | CompFlavor.GetBestFlavorDef stops its candidate search once ten matches exist. Applies to generation. |
| Meal-stack naming | true | CompFlavor.TransformLabel consults it when reading a stack label. |
| Lax recipe matching | true | FlavorDef uses it for meal kinds and matching; restart to rebuild precomputed data. |
| Dynamic meal detection | true | CategoryUtility uses it for ingredient-bearing food classification; restart to rebuild caches. |

Source use is verified, but cooking effects are not claimed as executed. The bridge clamps invalid
caps on construction, drawing and saving. Test-SettingsBridge compiles production bridge code with
UI/backend doubles and checks access identity, same state, write forwarding, bounds and reveal/hide.
Test-UpstreamSettings uses actual FlavorTextSettings and RimWorld Scribe primitive serialization:
clean defaults, all five values written/read at caps 0 and 6, and missing-field defaults pass.
It stops the loader after LoadingVars; full Unity FinalizeLoading and game saves are excluded.
No player configuration was read or changed. F11/F12 cover remaining interactive checks.
## Translation audit

Native English dish values and upstream English Keyed entries supply EN; no redundant
English DefInjected files are needed. French-only XML execution now preserves those English
dictionaries and grammar. `translation_en: complete` means resource readiness, not a live
English game result. The French label/description paths resolve against actual types/defs;
placeholder indices, nonempty forms, table keys and setting parameters pass structural checks.
The optional tables are gated by upstream package IDs during ingredient assignment, so their
presence does not require installing those optional mods.

FrenchFallbackPatch now intercepts only unresolved ThingDef forms while French is selected.
Reviewed concrete forms and non-French processing remain upstream. Five local Keyed resources
provide whole neutral forms, preserving localized labels, accents and compound nouns. Unknown
singulars retain the original label/number; no English stem stripping is applied. This cannot
supply translations absent from a third-party mod. All seven category overrides have concrete
French forms. The FT_Tags hairy prefix is also translated, bringing grammar replacements to three.
FrenchMealPostProcessing redirects only the final language-worker calls in Flavor Text's two meal
compilation methods, retains normal processing and repairs known aspirated-h complements
(haricot, houblon, husky, héron). It does not patch the global French language worker.

Test-Fallback passes twelve compound/accent/elision cases against the installed helper and shipped
bilingual keys. Test-FallbackPrefix checks dispatch with host doubles. Test-HarmonyRegistration
uses actual installed Harmony, Flavor Text, game and local DLLs under Windows PowerShell/.NET
Framework: exact fallback target, one prefix after repeated installation, actual patched fallback
invocation with in-memory language fixtures and real Translator, concrete FR/EN preservation,
one scoped transpiler on each meal method, and actual French LanguageWorker composition pass.
It does not cook a meal or execute Unity UI. Harmony is now an explicit dependency in About.xml.

`translation_en`, `translation_fr` and `localization: complete` denote local resource/code readiness
for the inspected dependency versions, not exhaustive linguistic correctness of arbitrary mods
or a successful game campaign. F01–F14 remain pending for runtime and natural-language review.
## Visual results and user preference

The user preferred the original ModIcon style. The final `Mod/About/ModIcon.png` is that
original artwork resampled from 64x64 (7,504 bytes) to 128x128 (33,010 bytes), without changing its design or creating new detail. Its original
master is `Art/ModIcon-source.png`; generated alternatives are archived, not installed.
The original banner/text treatment is retained in the icon at the user's request.

The final Preview uses the existing `Art/Preview-source.png` and a deterministic HTML overlay:
`Art/preview-template.html`, generated `Art/preview.html`, and `Art/preview-palette.json`.
Its secondary gold follows the warm food/wood tones; its blue accent follows the tricolor
and visibly contrasts with that secondary colour. Segoe UI is requested by the template and confirmed installed.
The title suffix is reduced to 65%, the `(unofficial)` tag is separate, the subtitle is English,
and the badge displays the declared supported game version 1.6.

Directly inspected both installed assets and their 268px/32px thumbnails. No clipped text or
overlap was seen. Contrast measured against a separate background-only render, over conservative
text rectangles: title 6.77, suffix 8.01, tag 8.10, summary 8.06 and badge 8.70, all above 4.5:1.
The original image, previous render, image-generation candidates and prompt record remain in Art.
No historical generation log or comparison screenshot is used as a mandatory gate.
The renderer initially failed in the sandbox; a headless local retry succeeded. The script now
requires a newly produced PNG before replacing the installed image, preventing stale-file passes.

## Rights and remaining work

The [upstream Workshop description and visible comments](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432)
were read on 2026-09-13. No explicit translation/redistribution permission was established there;
all three public comment pages were subsequently inspected (see the completed review below). The installed README/About review also did
not establish permission. This is neither an inferred licence nor an assertion of prohibition.
See ATTRIBUTION.md for scope. No author was contacted and no repository visibility was changed.

**Next gate: `tested`, through the user-run game campaign.** Explicit permission remains unverified without blocking `done` under the agreed public `silent` workflow.
The documentation defects that previously blocked this gate have been corrected. The independent settings and localization technical checks now pass.
The final game campaign is specified in `_tools/FUNCTIONAL-SCENARIOS.md` (F01–F14), including
language switching, optional mods, Biotech, settings, logs, new games and existing saves.
No in-game success is claimed. Only affected validations were repeated; prior evidence is retained.
## Continuation evidence

The pre-continuation STATUS and scenarios remain in `_tools/continue-2026-09-13/` alongside
all eight successful test outputs, build output, dimensions and SHA-256 manifest. Earlier failures
were test-host issues: .NET Core could not run the installed Harmony build, full Scribe finalization
requires Unity, and PowerShell could not construct an abstract LanguageWorker. The final tests
use .NET Framework for Harmony, explicitly limit Scribe to primitive fields, and use the actual
concrete French worker. These exclusions are reflected in each result; none is called a game pass.

Historical interpretation, superseded by the stage correction above: the cumulative stage was retained at `dansMonoRepo` because upstream rights/public-distribution consistency
is still unverified. No commit, push, publication, author message or visibility change was performed.


The optional Extended provider table added during continuation supplies four reviewed VV_Leeks forms, in addition to the 186 upstream entries. Test-Xml validates its identity and forms separately.

## Isolated runtime attempt — 2026-09-13

RimWorld 1.6.4871 rev591 was launched with -savedatafolder pointing into .build and
-logFile pointing into that same isolated profile. No existing save was loaded and the
normal player profile was not used as the save-data destination. The first two sandboxed
attempts could not initialize Steam, which removed the missing Workshop dependencies from
their disposable configurations. The resulting missing-parent/type errors are inconclusive
for this mod because Harmony and Flavor Text were absent.

The retry outside the sandbox reached Workshop discovery. It remained in the installed-mod
metadata scan and did not establish completion of target play-data loading. The diagnostic
was stopped; none of these starts is counted as passed. Headless null-device shader errors
also prevent any rendering assessment. All three logs are preserved in
_tools/runtime-attempt-2026-09-13/. No cooking, UI, language switching or save compatibility
scenario was executed, and no additional production-code defect was established by this attempt.

_tools/Start-IsolatedGame.ps1 provides fresh French/English profiles, a minimal active mod
list, isolated logs and a guard against starting beside an existing RimWorld process.
Its syntax was checked; the equivalent direct headless invocation was attempted as above.
The script's interactive launch and the full F01–F14 campaign remain unverified.
Existing build, resource and technical-test evidence is unchanged. Cumulative stage unchanged.

## FoodCourt integration — 2026-09-13

The authorized Extended additions are translated in Ext_FoodCourtDiscovery.xml: ten fields
for Altang, Beondegi, Bungeoppang, Jjapaghuri and Kimchijeon, retaining source ingredient indices
and the explicit colony adaptation of Altang. Current coverage is 930 base + 901 Extended dishes.
Four ingredient entries (sixteen forms) were added only to the existing current-Shenzhou table;
RawZongYe and overlapping private-provider copies remain excluded. No C# code changed.
Test-Xml passes for 82 XML files and 1,831 dishes, including dedicated ingredient-index and
provider-scope assertions. Full outputs and current artifact hashes are under
_tools/foodcourt-2026-09-13/. Runtime integration with Shenzhou 1.6 remains unverified.
The cumulative stage and prior settings/build evidence are unchanged.

The refreshed DefInjected checker resolves 3,671 keys with zero errors. Its six Biotech advisory lines remain unchanged; the conditional folder is checked separately.

## Post-commit handoff — 2026-09-13

At the user's explicit request, all in-game validation belongs to the user. Further agent
work is limited to source/files and offline technical checks: do not launch, control or
close RimWorld for this task. A French isolated profile was previously launched at
.build/game-tests/20260913-142710-French; no interactive test was completed or certified.
The user declined Computer Use and reserved the game campaign for themselves.

Reviewed commit c675e87. All 88 distributed files match the recorded SHA-256 manifest in
_tools/foodcourt-2026-09-13/distribution-manifest.json, with zero differences. Root/distribution
LICENSE, ATTRIBUTION.md and CHANGELOG.md copies match. The local Keyed resources contain
15 unique French keys and five unique English keys; the ten upstream settings use native
upstream English resources. No new delivery defect was identified. The passing XML and
settings checks from the commit turn remain applicable; no production files changed here.

Offline technical work is ready for the user-run campaign in _tools/FUNCTIONAL-SCENARIOS.md.
The cumulative stage is `done` under the agreed public `silent` convention. Permission remains unverified; no prohibition was found. Earlier no-commit and unchanged-stage statements describe historical audit passes, not the current status.

The additional public-source permission search is recorded in
_tools/UPSTREAM-PERMISSION-REVIEW.md. Author interaction with a Chinese translation was
found, but no explicit licence or authorization for this French companion was established.
Older comment pagination was unavailable to the web reader. The remaining permission
item therefore stays unverified; no production changes or additional game actions were made.

## Rights review: pagination resolved — 2026-09-13

All three pages of the 145 publicly visible Flavor Text comments were inspected through
the browser. The 9 May 2025 reply to nelim17 concerns technical translatability, not a
permission refusal. Favorable Chinese-translation and recipe-addon exchanges were also
found. No explicit prohibition, general licence or grant for publication of this French
companion was found. Full references are in _tools/UPSTREAM-PERMISSION-REVIEW.md.
The earlier pagination limitation is resolved; private/deleted messages remain unknown.
Classification stays `silent`, permission stays `unverified`, and the cumulative stage is `done`. The user clarified that explicit consent is not a mandatory gate under this workflow; the required public disclosures are already present.

Current attribution notices have been synchronized with the completed public-comment review. Only documentation changed; previous artifact manifests are historical snapshots predating this attribution update. Technical validations remain applicable.
