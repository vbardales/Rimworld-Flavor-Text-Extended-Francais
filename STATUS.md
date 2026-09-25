---
mod: Flavor Text Extended - Français
packageId: nelim.flavortextextended.fr
repo: Rimworld-Flavor-Text-Extended-Francais
remote: https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais.git
visibility: public
visibility_verified_at: 2026-09-21
visibility_evidence: "gh api repos/vbardales/Rimworld-Flavor-Text-Extended-Francais: private=false; git ls-remote HEAD = b62253a"
mod_visibility: public via GitHub; Workshop item recorded, public visibility not verified
detached: yes
stage: done
stage_meaning: "ready for in-game validation. The 2026-09-22 audit corrections restored the literal unofficial notice and repaired the offline test runners; the complete out-of-game battery is green. Existing in-game evidence and remaining scenarios are tracked separately."
licence: silent
licence_declared: "MIT limited to rights held by the contributor"
licence_exception: "2026-09-21, owner decision in chat: kept public/silent although upstream Flavor Text declares 1.6 (PUBLISHING.md would class it alive). Reason given: no French version of Flavor Text Extended exists, and it is an extension, not a plain translation of the upstream mod. The rule's own criterion (no 1.6 declared = abandoned) is NOT met; this is an exception, not a finding of abandonment. `original` was proposed and considered the same day, then not retained: the 901 Extended dishes, the C# code and the tooling are the owner's own work, but the 930 Flavor Text dishes are translations of hekmo's text, and ATTRIBUTION.md, README and About.xml all state that. The absence of any other French translation does not bear on rights."
licence_at: derivative translation; local notice does not establish upstream permission
upstream_permission: unverified
suffix_exception: "2026-09-25, owner decision: no (unofficial) suffix in the name or the Preview, contrary to the PUBLISHING.md rule for silent. Reason: the author welcomed a Chinese translation (comments of 2025-09-07/08) and encouraged the Flavor Text Extended add-on (comment of 2025-10-12); no upstream licence was found, so none is claimed. The description keeps UNOFFICIAL and says: without explicit consent, though he has been kind. Detail: _tools/UPSTREAM-PERMISSION-REVIEW.md"
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
automated_tested_on: 2026-09-21 (rerun from the current sources after the language fix)
in_game_runs: "2026-09-21 (before the language fix and the revisions): English 18/24, French 24/24, RIMMSQOL 4/4, all superseded. 2026-09-23/24, suite 846c156 and after, all exitReason passed: pass 1 English 21/0, pass 2 French 27/0 (03, 01, 04, 05, 06, 19, 07), pass 3 providers 06 3/3 + 01 5/5, pass 4 Shenzhou 06 3/3 + 01 5/5, pass 5 invented foods 4/4, pass 6 restart pair 1/1 + 2/2, pass 7 RIMMSQOL 3/3 + 1/1 x3, pass 8 without Biotech 2/2, pass 9 without Anomaly/Odyssey 2/2. Detail: docs/runs/2026-09-23.md and 2026-09-24.md"
last_fix_revision: 164104b
pushed: true
pushed_at: 2026-09-22
tag: v1.0.0 (created by the CI on 43dd52da70c3ffbdb3ab55c7301e877be88040e9)
tag_revision: 43dd52da70c3ffbdb3ab55c7301e877be88040e9
release: "https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais/releases/tag/v1.0.0 (created by the CI after the upload, 2026-09-25)"
audit_revision: 634066483d44f51201aa8ea0722da4b796864aad
review_revision: c675e87
in_game_validation_owner: user
workshop:
  id: "3806100488"
  id_committed_at: 2026-09-22
  tag: v1.0.0
  tag_revision: 43dd52da70c3ffbdb3ab55c7301e877be88040e9
  visibility: private (owner, 2026-09-25: pre-published in 0.1.0, private, as Steam creates every item)
  self_subscription_test: unverified
prepublished: yes (1.0.0 uploaded to the Steam item, private; 1.0.1 prepared)
published: 1.0.0 uploaded 2026-09-25 (item private, public visibility and self-subscription test are the owner's); 1.0.1 to follow
maintainer: Codex, task responsible for this local repository
updated: 2026-09-25
remaining:
  - "1.0.1 is not published until its reds are green (owner, 2026-09-25): ticket 20260925-124301-548-63b1 (the two lavish meals of 07) and the cooking pass 2b (request 20260925-115722-557-d407, never green so far). Fail fast skips the non-regression pass, not this validation; see TESTING.md, Before a publication."
  - "1.0.0 published 2026-09-25 by the CI: dry-run 36122774168, publish run 36124437186 (publish job 58 s, tag-and-release 6 s), SHA 43dd52da70c3ffbdb3ab55c7301e877be88040e9, update_description on. The owner found a defect in the gallery captures the same day (a side dish starting with a capital after a French joint: 'façon Œufs de poule'); fixed in 1.0.1 (b292667), which is its own publication under the fail-fast policy. Still to do for 1.0.1: the in-game check (ticket 20260925-124301-548-63b1, the two lavish meals of feature 07), gallery images retaken on the presentation colony and cropped, workflow regenerated with --gallery-dir Art/Gallery, dry-run of the new SHA, then the owner's approval."
  - "partial (done -> tested): passes 1 to 9 were replayed on 2026-09-23/24 with ScreenshotMode and are green (in_game_runs above). Still to play: pass 2b (cooking film, feature 09, first attempt killed by the 120 s bill wait, rewritten with a sliced wait, queued again), feature 20 in passes 3 and 4 (provider tables, new, thresholds to calibrate), pass 10 (F13), and a final replay of passes 1, 2 and 5 on the normalized suite (no @wip, explicit filters, fixed fixture foodType). Stage stays done until then."
  - "partial (done -> tested): F13. The fixture is made by feature 21 (@fixture-maker, an English game where this mod changes nothing), run alone; its save is to be committed as Tests/Pickle/Mod/Pickle/Fixtures/legacy-meals-before-ftfr.rws, then feature 18 loses its last @wip and plays in pass 10 (French), pausing on an existing meal and capturing its info card."
  - "partial (tested -> prepublished): v1.0.0 now anchors the committed Workshop id, while later test-evidence changes remain untagged; curated screenshots and their final order remain unset. Thank-you messages and Steam v1.0.0 notes are prepared in PUBLICATION.md but not posted/entered."
  - "unverified (prepublished -> published): item 3806100488 has no recorded self-subscription test or manually confirmed public visibility. No Workshop action was taken by this audit."
  - "resolved by owner exception 2026-09-21 (was a defect at dansMonoRepo -> horsMonoRepo): upstream Flavor Text 0.3.6 declares 1.5 and 1.6 and its author is active in public comments through Oct 2025, so PUBLISHING.md would class it `alive` (private, ` (prohibited)`; precedent MedievalHomestead, MintchocoConfectionery). The owner keeps it public `silent`, see licence_exception. Residual, stated plainly: no upstream permission exists and the author is reachable; the takedown commitment in About.xml and README is the only safeguard. Revisit if hekmo objects or if the exception is withdrawn."
  - "resolved 2026-09-21 (was a defect at preTest -> done): the Pickle suite is written under Tests/Pickle (eighteen features, including F13's fixture-gated legacy-meal capture; a companion steps assembly builds against the real FlavorText.dll and the shipped mod DLL) and TESTING.md declares the passes. Scope and exclusions are argued in Tests/Pickle/README.md."
  - "resolved 2026-09-21: staging. Two obstacles settled without editing the shared script, by machine-local links: a junction rimworld\\FlavorTextExtendedFR to this repository (locally excluded from the monorepo) so -Mod resolves, and a symbolic link FlavorTextExtended in the WSL workshop cache to the local Extended mod (named in wsl-ids.map). Everything else is staged by path: from the repository. Every pass played so far staged and ran."
  - "resolved 2026-09-21, found by the first French in-game pass (defect, 164104b): the language guard compared the stored language to `French`, a real game stores `French (Français)`, so no French patch, side-dish grammar, ingredient fallback or aspirated-h repair had ever applied in a real game. Every offline test had given the guard `French`. Fixed with RimWorld's own rule (the part before the bracket); the offline tests use the stored value and Test-Language was shown to fail against the previous DLL. See the update below. The automated_tests: passed of 2026-09-13 could not see it."
  - "resolved 2026-09-22, owner instruction (accepted the nominal in-game scenario as sufficient, fixes on report): pushed 15 commits to origin/main (b62253a..5005af9), including the language fix -- the public repository no longer ships the broken DLL. CHANGELOG's placeholder '1.0.0 -- Initial repository content' heading and 'Unreleased' entries consolidated into one dated 1.0.0 entry (5005af9); tag v1.0.0 posted and pushed; GitHub release v1.0.0 published with that entry as its notes. About.xml description completed with the missing trailing sections in the prescribed order (IF I GO QUIET verbatim, AI-GENERATED, THANKS, then the licence/ATTRIBUTION line, then the source link) and two stale 'awaits in-game validation' sentences updated (a0d82fe). PUBLICATION.md drafted: dependencies and DLC recorded from sources, adult content answered no, thank-you messages and Steam release notes drafted but not sent/posted. Screenshot order is NOT settled -- no curated Workshop screenshot set exists yet, only ad hoc Pickle @review captures kept outside the repository; PUBLICATION.md says so and lists candidates."
  - "OPEN, owner action: the fix is NOT pushed. origin/main is b62253a, whose Mod/Assemblies DLL still carries the defect; the local branch is 14 commits ahead. The GitHub repository is public. CHANGELOG `Unreleased` describes the fix, modVersion is 1.0.0, no tag, no Workshop item. Push, tag and any republication are the owner's decision and were not done."
  - "resolved 2026-09-21, owner decision: the dish name `funeral potatoes` stays in English (an American dish; the literal French is not a name anyone knows), 2edf94f. Known limit, not fixed: names that come from Flavor Text's generic templates read oddly, e.g. `plat {0_adj} au four` gives `Plat de lait au four`; the owner does not know that name either and made no decision on a replacement."
  - "resolved 2026-09-24 (was unverified): the features written and not yet played on 2026-09-21 (02 rewritten, 07 info cards, 08, 10/11, 16/17) have all been played green, see in_game_runs. 09 (cooking) and 18 (F13) remain, see the two items above. `@wip` is gone from every feature except 18."
  - "resolved 2026-09-24: the aspirated h is now asserted, not judged from a random draw: feature 19 forces the dish and passed in the French pass (Viande de husky au four, no d'husky). The French settings page (Plafond d'ingrédients supplémentaires, Recherche rapide, Nommer les piles de repas, Correspondance souple des recettes, Détection dynamique des repas) was opened in the pass 2 capture and is fully French. Owner validation of the remaining meal captures is still welcome but no longer gates the automation."
  - "superseded 2026-09-22: F13 (an existing save with old meals) is relevant but must run through Pickle once a committed pre-translation fixture exists; it has no hand-played replacement. Exact dish/side-dish variety and RIMMSQOL's own checkbox are addressed by Pickle-produced captures. The language switch is not a gap: the game restarts on a language change, so the English and French passes cover it."
  - "unverified: RIMMSQOL revealing FTFR_Settings is covered by pass 7 (played, four launches, all exitReason passed, TESTING.md row 7; PickleTools/RimmsqolSteps/README.md). Other customization mods are not covered."
  - "note (shared tooling, not this mod): the launcher printed `veille non empechee` on 2026-09-21 (SetThreadExecutionState received -2147483647, not convertible to UInt32 in PowerShell 5.1). A separate session was started to look at it; its result was not read here. See PickleTools/Headless/README.md."
  - "note (environment, not a defect): three test scripts (Test-PatchLifecycle, Test-Fallback, Test-FallbackPrefix) require PowerShell 7 (`pwsh`, as README says). It is not installed on this machine; they were replayed 2026-09-21 by equivalent means, from the current sources, after the fix."
---

# Current audit — 2026-09-22

**Previous stage: `preview`. Retained stage: `done`.** The audit defect was corrected and the
complete offline battery now passes. No RimWorld process, Pickle run, game configuration,
Workshop page, or publication action was started or changed.

Audited working revision `634066483d44f51201aa8ea0722da4b796864aad` (`main`, equal to
`origin/main` by the local refs). At entry `Mod/About/PublishedFileId.txt` was already untracked;
it was preserved. This audit updates `STATUS.md`; rebuilding the Pickle companion also regenerated
its tracked `Tests/Pickle/Mod/Pickle/Assemblies/FlavorTextExtendedFR.PickleSteps.dll`.

| Transition | Result | Current evidence |
|---|---|---|
| dansMonoRepo -> horsMonoRepo | validated under the recorded owner exception | Standalone Git root, GitHub `origin`, root/distributed LICENSE and ATTRIBUTION copies byte-identical, required documentation present. The existing `silent`/public exception and unverified upstream permission remain recorded above. |
| -> ModIcon generated | validated | `_tools/Build.ps1` rebuilt and installed the distribution DLL successfully. `Mod/About/ModIcon.png` was opened: 128x128 PNG, 33,010 bytes, mascot and ribbon remain legible. |
| -> Preview generated | validated | `Mod/About/Preview.png` was opened directly: 896x504 PNG, 569,664 bytes, under 1 MB; title, French suffix, unofficial tag and 1.6 badge are legible, with no clipping or concrete camera defect observed. |
| -> preOptions | validated | The distributed description now begins with the prescribed literal `UNOFFICIAL.` opening, without BBCode; `_tools/Test-Xml.ps1` passes. |
| -> options | independently validated | `Test-Language`, `Test-SettingsBridge`, `Test-UpstreamSettings`, and `Test-HarmonyRegistration` pass on the current rebuilt DLL. They substantiate the settings bridge, bounds, primitive persistence and Harmony wiring, not a new in-game run. |
| -> l10n | validated | The full XML check, fallback helper and fallback-prefix tests all pass from the current checkout; no player-facing localization defect was found by these out-of-game checks. |
| -> preTest -> done | validated | The functional scenarios and Pickle suite remain written; build, XML and the complete offline battery pass. `done` does not require a new game run. |
| -> tested | not reached | The existing in-game evidence is retained below; the remaining scenarios and review work are still listed in `remaining`. |

## Commands and results

- `_tools/Build.ps1`: PASS against the installed RimWorld, Flavor Text and Harmony references.
- `_tools/Test-Xml.ps1`: PASS, including 82 XML files, 1,831 dishes, 25 guarded patches, 186 ingredients and the hidden bilingual shortcut.
- `_tools/Test-Language.ps1`, `_tools/Test-PatchLifecycle.ps1`, `_tools/Test-SettingsBridge.ps1`, `_tools/Test-UpstreamSettings.ps1`, `_tools/Test-Fallback.ps1`, `_tools/Test-FallbackPrefix.ps1`, and `_tools/Test-HarmonyRegistration.ps1`: PASS.
- `dotnet build Tests/Pickle/Source/FlavorTextExtendedFR.PickleSteps.csproj -c Release`: PASS, 0 warnings and 0 errors. `Tests/Pickle/Check-Steps.ps1`: 73 declared patterns compile, none duplicate, 234 feature lines matched; 95 lines are intentionally delegated to Pickle's vocabulary.
- The runner corrections are: UTF-8 BOM plus explicit UTF-8 reads for the fallback resources, a `System.Xml` reference for the lifecycle doubles, and the missing `FrenchLanguage.cs` input for the fallback-prefix doubles. README commands now use the installed Windows PowerShell host.

The current gate is `done -> tested`: run only the remaining in-game scenarios when the owner
chooses to do so. The committed Workshop id is separate follow-up state and does not authorize a
Workshop action.

# Update - 2026-09-21, after the first in-game runs

Written after the audit below, once the Pickle suite existed and had been played. The audit section that
follows is kept as it was; where it says nothing ran in game, that was true of that pass. The stage stays
**`done`**: `done -> tested` is not reached (see `remaining`).

## What the runs showed

- **A defect the offline tests could not see.** The first French pass failed 2 of the 6 scenarios of
  `03-french-language`: `FT_Egg` read its English values in a French game. Cause: RimWorld stores the official
  French translation as `French (Français)` (the owner's own `Prefs.xml` holds it), the mod's guard compared the
  stored value to `French`, so it always answered "not French". No French patch, no side-dish grammar, no
  ingredient fallback and no aspirated-h repair had ever applied in a real game. Every offline test had given the
  guard `French`. The DefInjected texts still worked, because the game matches a mod's `Languages/French` folder
  by the part before the bracket: which is why the four label scenarios passed and hid the rest.
- **The fix, `164104b`.** `FrenchLanguage.IsFrench` applies that same rule, and `PatchOperationFrench`,
  `RuntimePatches` and `FrenchMealPostProcessing` use it. The enriched `Test-Language` was run against the
  **previous** DLL first and failed on the stored value; after the rebuild the whole offline battery is green
  (build, `Test-Language`, `Test-Xml`, `Test-SettingsBridge`, `Test-UpstreamSettings`,
  `Test-HarmonyRegistration`, and the three PowerShell 7 scripts replayed by equivalent means from the current
  sources). CHANGELOG updated in both copies.
- **The second French pass, after the fix.** Six launches under one lock, all `exitReason: passed`: `03` 5/5, `01`
  5/5, `04` 4/4, `05` 2/2, `06` 3/3, `07` 5/5 (24 scenarios). `-Then` finished, which the harness guide had never
  seen. French names came out: `Saucisse de bœuf (plat raffiné)`, `Salade d'écureuil (plat raffiné)`, `Plat de lait au
  four (plat raffiné)`, and for a lavish meal a title starting `Burger à la viande d'écureuil, façon…`, whose `façon`
  is the mod's own French side-dish joint, so that patch applied. The `Player.log` of the first five launches has no
  error beyond the companion's harmless "did not load any content"; the sixth was not read.
- **Two stock Pickle steps cannot be used for this mod.** `def X was patched by mod Y` reported `(no mod)` for a
  patch made through the wrapper operation, so `no def X was patched` would also have passed in French: the English
  isolation scenario proved nothing and was rewritten. A dotted path takes no numeric index into a list. The suite now
  reads the value the def holds (`CategorySteps`). Recorded for other mods in `PickleTools/Elsewhere/FlavorTextExtendedFR.md`.

## Decisions and validation by the owner

- Licence stays `silent` under the recorded exception (above).
- `funeral potatoes` is kept in English (`2edf94f`). `Plat de lait au four` stays as a known limit.
- French captures are validated one at a time: squirrel, beef and the first lavish meal are validated. The owner asked
  that the next captures show the whole title on hover; the suite now also captures each meal's info card, which shows
  the whole name and description (`4214a61`, not yet played).

## What changed in the suite since the audit

- Seventeen features (was six at the audit): `07` review captures, `08` unlisted ingredients, `09` filmed cooking,
  `10`/`11` restart pair, `12`-`15` RIMMSQOL (played, written by a separate session, committed in `2b91ab8`), `16`/`17`
  without a DLC. Passes 1 to 9 in `TESTING.md`; commands and staging in `Tests/Pickle/README.md`.
- Shared tooling: `PickleTools/FilmTicks` films the cooking, `PickleTools/RimmsqolSteps` drives RIMMSQOL, the
  ledger `PickleTools/Elsewhere/FlavorTextExtendedFR.md` says what stays here and what another mod can lift.
- `path:` in a pass map replaces two machine links I had set up; two remain (junction, Extended symlink).
- Not pushed: 14 commits ahead of `origin/main`, which still holds the DLL with the defect. See `remaining`.

## Evidence
The raw reports of the 2026-09-21 runs were deleted on 2026-09-23 (superseded by the passes replayed for `tested`); their text summary is `docs/runs/2026-09-21.md`, the current ones are under `Tests/Pickle/Evidence/2026-09-23-*` (ignored by Git) and `docs/runs/2026-09-23.md`.
`-french-03`, `-french-03b`, `-french-ok`. The launcher's own archive holds the rest for a few runs only.


# Cumulative audit - 2026-09-21

**Previous stage: `done`. Retained stage: `done`, after a retraction and a restoration the same day.**
The first pass of this audit retracted it to `preTest` for one reason: no Pickle suite and no
justification of its absence. The suite was then written at the owner's request and the criterion
is met (section "Pickle suite written" below). `done -> tested` is not reached. When this audit was written nothing had run in game; see the update above for what ran since.

*Revision of the same day.* The first pass of this audit retained `dansMonoRepo`, because the licence
`silent` contradicts PUBLISHING.md (upstream declares 1.6, so `alive`). The owner then decided, in chat,
to keep the mod public and `silent` as an explicit exception (see `licence_exception`). The defect
was a missing justification; with the owner's decision recorded, the transition holds. The finding
itself is unchanged and stays visible in the table and in `remaining`.

Audited revision `b62253aff189c473e7c22cd9613986e0b1f92c52` = `origin/main` (`git ls-remote`);
working tree clean before this update, which changes STATUS.md only. As of that pass no RimWorld was launched
(no `RimWorldWin64` process, no WSL run, no Pickle), no game configuration touched, nothing published.
AUDIT.md postdates the 2026-09-13 `done` decision.

| Transition | Result | Evidence checked today |
|---|---|---|
| dansMonoRepo -> horsMonoRepo | validated **under an owner exception** (rule not met, exception recorded) | Standalone git root; `origin` is the GitHub repo, public, `main`, remote HEAD = local HEAD, commits pushed. STATUS present; README, ATTRIBUTION, CHANGELOG, LICENSE in English; `LICENSE`, `ATTRIBUTION.md`, `CHANGELOG.md` identical in root and `Mod/`. packageId `nelim.flavortextextended.fr`, repo `Rimworld-Flavor-Text-Extended-Francais`, folder `FlavorTextExtendedFR`: consistent. **Licence: `silent` is contradicted by the sources.** Installed Flavor Text `About.xml` (0.3.6) lists `<li>1.5</li><li>1.6</li>`, with a `1.6/` folder and LoadFolders. The 2026-09-13 review itself noted the 1.5/1.6 declaration but kept `silent`. PUBLISHING.md (precision of 2026-09-13): a source declaring 1.6 is `alive`, and `alive` imposes private + ` (prohibited)`. Public visibility is therefore inconsistent with the rights established. The "explicit consent is not a gate" clarification recorded earlier concerns `silent` and does not address `alive`. **Owner exception, same day:** kept public and `silent` because no French Flavor Text Extended exists and this is an extension rather than a plain translation. That reason is not the rule's criterion; it is recorded as a decision, in `licence_exception`. |
| -> ModIcon générée | validated | Build reproducible: `Build.ps1` recompiled, SHA-256 of `Mod/Assemblies/FlavorTextExtendedFR.dll` identical before and after (`CA2326E6...D48B`), tree still clean. `ModIcon.png` 128x128 PNG, 33,010 bytes, opened: one mascot with a `flavor text` ribbon. The original artwork kept at the user's request is recorded below. |
| -> Preview générée | validated | `Preview.png` 896x504 PNG, 569,664 bytes (< 1 MB), opened: dishes on dark wood, title, summary and badge legible, nothing clipped, no concrete camera defect. |
| -> preOptions | validated (`(unofficial)` suffix, opening paragraph and Preview tag match `silent`) | Blue accent (`#49BDF0`) clearly distinct from the gold secondary (`#E9C389`), in the image and in `Art/preview-palette.json`. Description in English, ends with `[url=https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais]Source code on GitHub[/url]`, matching `<url>` and the remote. `Français` is the smaller secondary suffix and `(unofficial)` the tag. The description opens with the prescribed UNOFFICIAL paragraph, verbatim. |
| -> options | validated | Five upstream settings exposed under `Options -> Mod settings -> <mod name>` through `SettingsBridge` (`SettingsCategory()` returns the mod name); hidden `FTFR_Settings` MainButton (`buttonVisible=false`, `Visible` inherited, not forced) opens the same page; cap clamped to 0-6. Code and tests only, as this transition asks. `Test-SettingsBridge` and `Test-UpstreamSettings` PASS today (doubles / primitive Scribe fields; no Unity UI, no RIMMSQOL). |
| -> l10n | validated | No hard-coded player-facing string in `Source/` (literals are logic: markers, regex, keys, exception text). Keyed FR/EN keys present with equal tokens (`Fallback.xml`, five keys each); `MainButtonDef` label/description in French DefInjected, English source in the Def. `Check-DefInjected.ps1` (Flavor Text 1.6 and 1.5, Extended, this mod, Flavor Text DLL): **3,671 keys, 0 errors**, six MayRequire advisories for Biotech (the folder gate is covered by `Test-Xml`). |
| -> preTest | validated | Hard dependencies `brrainz.harmony` (code uses Harmony), `hekmo.FlavorText` (code references `FlavorTextSettings`/`FlavorTextMod`), `nelim.flavortextextended` (translated defs; ID matches the sibling's About). `loadAfter` Harmony, Core, Flavor Text, Extended. `LoadFolders.xml`: `/` plus `Biotech` under `IfModActive="Ludeon.RimWorld.Biotech"`, matching the Biotech-only DefInjected folder. Optional providers are `MayRequire`-gated, not dependencies. |
| -> done | validated (second pass of the day) | Scenarios F01-F14 plus FoodCourt in `_tools/FUNCTIONAL-SCENARIOS.md` (preconditions, actions, expected results): present. Automated and XML tests: green (below). Pickle (Gherkin): first found **absent and unjustified**, then written and justified, see below. No test run in game is required for `done`. |
| -> tested | not reached | Nothing executed in game. |

## Tests rerun on the delivered tree - 2026-09-21

| Check | Result |
|---|---|
| `_tools/Build.ps1` | PASS, DLL byte-identical to the shipped one |
| `Test-Language`, `Test-Xml`, `Test-SettingsBridge`, `Test-UpstreamSettings`, `Test-HarmonyRegistration` | PASS (Windows PowerShell 5.1): 82 XML files, 1,831 dishes, 25 guarded patches applied in memory, 186 entries / 15 tables, 3 grammars, 7 category overrides, Biotech gating, hidden shortcut |
| `Test-PatchLifecycle`, `Test-FallbackPrefix` | PASS **by equivalent means**: as-is they fail on PS 5.1 (`Add-Type` compiles C# 5). Same sources and test doubles compiled with the SDK 8.0.424 Roslyn into the scratchpad and loaded in PS 5.1. Not the literal command; `pwsh` is absent. |
| `Test-Fallback` | PASS **by equivalent means**: as-is it fails on PS 5.1 (UTF-8 without BOM read as ANSI: parse error, then `Bad French complement`). Scratch copy with BOM and explicit UTF-8 reads; the repository script is unchanged. |
| `Check-DefInjected.ps1` | 3,671 keys, 0 errors |
| Distribution manifest (88 files, `_tools/foodcourt-2026-09-13`) | 86 identical. `Mod/About/About.xml` and `Mod/ATTRIBUTION.md` differ, explained by commits `036f4b7` and `b62253a` (author `nelim` -> `Nelim`, attribution text). `git diff c675e87 HEAD -- Mod/` outside ATTRIBUTION.md is that two-line About change only. No file added or missing. Code, patches, translations and images unchanged since the evidence. |

## Pickle suite written - 2026-09-21

Written at the owner's request after the audit found none. Files: `Tests/Pickle/` (README with scope,
exclusions and passes; `Mod/` companion "Flavor Text Extended - Français - Pickle tests"; six features
`01-loads`, `02-english-isolation`, `03-french-language` (`@wip`, French pass), `04-settings-shortcut`
(`@review`), `05-language`, `06-meal-naming`; `Source/` steps assembly; `Check-Steps.ps1`;
`wsl-ids.map`) and `TESTING.md` at the root, which declares the passes (English and French without
optional mods, plus a defined-but-unbuilt French pass with the optional providers; no incompatibility
is declared, so no third family).

What was checked without a game, and nothing more: the steps assembly builds (0 warnings, 0 errors)
against the real `FlavorText.dll` and the shipped `FlavorTextExtendedFR.dll`; `Check-Steps.ps1` compiles
the 15 patterns with Pickle's own expression engine and every feature line resolves; the vanilla steps
used were matched against the expressions compiled into Pickle's Vanilla DLL, and five parameterless forms
against the features Pickle ships. **No Pickle run happened, and no RimWorld was launched**: the suite
is written, not validated. Scope: only what a running game shows; cooking with a colonist, side-dish variety,
DLC-less runs, optional mods, old saves and RIMMSQOL stay manual, each with its reason.

Two findings while writing it, not fixed: the shared staging script cannot stage this repository today (nested
folder, and a hard dependency with no Workshop id). They are recorded in `remaining` and in `Tests/Pickle/README.md`.
`Mod/` (the distributed folder) was not touched.

## First Pickle run - English pass - 2026-09-21

Taken as a queue ticket at the owner's request, through `scripts/Run-PickleWsl.ps1 -Mod FlavorTextExtendedFR`
only, on the WSL game under Xvfb; the Windows RimWorld was not touched. Pass: `sans-facultatifs`, English.
Report archived by the launcher in `pickle-reports-archive/0921-1803` (the shared folder was overwritten
by another session's run within minutes), its raw copy was deleted on 2026-09-23, superseded by the pass 1 replay (`docs/runs/2026-09-23.md`).

- `exitReason: passed`, read before the counts. **24 scenarios discovered, 18 passed, 0 failed, 6 skipped.**
  The 6 skipped are exactly the 6 scenarios of `03-french-language` (`@wip`, French pass); 6 features, 6
  `run finished` lines, so nothing was cut short. Pickle's own exit code 0.
- Startup line of Flavor Text: 1,831 FlavorDefs in total (930 + 901), 641 active for the staged modlist.
  Its only WARN lines are its own startup messages; the scenario `no warnings from mod` on this mod passed.
- The three meals of `06-meal-naming` were named by Flavor Text in the game: `Beef Sausage (fine meal)`,
  `Squirrel Salad (fine meal)`, `Milk Bake (fine meal)`. English only: French agreement is not judged.
- The two `@review` captures were opened and looked at: the real dialog titled `Flavor Text Extended - Français
  (unofficial)`, extra ingredient cap 0, quick search off, the other three on, English labels, no development
  tool and no launcher panel. The shortcut route and the Options route show the same page (the two images are
  the same). A green `@review` proves the path, and the images were checked by eye rather than assumed.
- What this run shows, and nothing more: the staging works, the mod and both dependencies load and save and
  reload without an error, the English language isolation holds on the real defs (`no def "FT_Egg" was patched`
  and the three others, dependency labels read as written), the settings dialog opens for this mod from
  both routes, the 0-6 clamp holds when the page is drawn, the shortcut is hidden then drawn then hidden.
  It is **not** the `tested` stage: no French pass, no manual scenarios.

## Work needed to cross the next transition (done -> tested)

Play the French pass (a second ticket, `-Language French`, one `-Filter` per feature as `Tests/Pickle/README.md`
gives), define and play pass 3 with the optional providers, always through `scripts/Run-PickleWsl.ps1`, read
`exitReason` before the counts and open the `@review` captures again in French. Then the manual scenarios in game.
In-game validation is owned by the user.

## Recommendations (optional, not blockers)

- Since upstream is maintained and reachable, a message to hekmo would turn the exception into an
  explicit permission (or a refusal) at little cost. Nothing was sent; that is the owner's call.
- Install PowerShell 7, or make the three PS7-only scripts encoding-safe (BOM), so the README commands run as written.
- CHANGELOG `Unreleased` and `modVersion 1.0.0` with no tag: relevant only from `tested -> prepublished`.
- The About description does not yet carry the `IF I GO QUIET`, `AI-GENERATED` and `THANKS` sections: a `tested -> prepublished` item.

---

# Earlier record (2026-09-13 correction pass) - kept for history; its stage and licence conclusions are superseded above

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
