---
mod: Flavor Text Extended - Français
packageId: nelim.flavortextextended.fr
repo: Rimworld-Flavor-Text-Extended-Francais
remote: https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais.git
visibility: public
visibility_verified_at: 2026-09-21
visibility_evidence: "gh api repos/vbardales/Rimworld-Flavor-Text-Extended-Francais: private=false; git ls-remote HEAD = b62253a"
mod_visibility: GitHub public; Workshop item 3806100488 public (owner, 2026-09-25, after 1.0.1; not checked by a session)
detached: yes
stage: showcase
workflow_stage: options
stage_meaning: "replaced 2026-10-02 (AUDIT.md step 12, backward audit): the first transition that fails is options -> l10n, because translation_fr is partial since the French review rule of TRANSLATIONS.md (2026-09-30): no French text is `complete` until Virginie has reviewed it and the review line exists. This is a missing review, not a found defect: the code, the XML, the offline battery, the Pickle suite and the published 1.0.1 are untouched. The stage returns to `done` when her dated review line is recorded under Translation audit (and the 07 replay below keeps the later gates honest). Previous reading, kept: done again (2026-09-28): the published 1.0.1 stays on the Workshop, but the repository is now ahead of it with a minor version in preparation (233 short forms and 31 dishes translated for Flavor Text Extended 1.2.0, no em dash in the French text, several wording corrections). Those changes are checked out of game only (`Test-Xml` and the offline battery are green); the in-game passes have to be replayed on the new tree before `tested` holds again. History of the previous reading, kept: published (2026-09-28 reading): 1.0.0 then 1.0.1 uploaded by the CI on 2026-09-25, the item is public and subscribed to (owner), the in-game passes are green (passes 1 to 10, feature 20, cooking 2b) and the non-regression replay was played after the 1.0.1 publication under fail fast. The stage had stayed at done until then only because nobody had recorded the transitions; they are recorded in the table below. Older text, kept for history: ready for in-game validation. The 2026-09-22 audit corrections restored the literal unofficial notice and repaired the offline test runners; the complete out-of-game battery is green. Existing in-game evidence and remaining scenarios are tracked separately."
licence: silent
licence_declared: "MIT limited to rights held by the contributor"
licence_exception: "2026-09-21, owner decision in chat: kept public/silent although upstream Flavor Text declares 1.6 (PUBLISHING.md would class it alive). Reason given: no French version of Flavor Text Extended exists, and it is an extension, not a plain translation of the upstream mod. The rule's own criterion (no 1.6 declared = abandoned) is NOT met; this is an exception, not a finding of abandonment. `original` was proposed and considered the same day, then not retained: the 901 Extended dishes, the C# code and the tooling are the owner's own work, but the 930 Flavor Text dishes are translations of hekmo's text, and ATTRIBUTION.md, README and About.xml all state that. The absence of any other French translation does not bear on rights."
licence_at: derivative translation; local notice does not establish upstream permission
upstream_mod_remotes:
  - Flavor Text (hekmo, hekmo.FlavorText): N/A — no authoritative upstream repository found (see docs/UPSTREAM-PERMISSION-REVIEW.md, targeted web queries combining Flavor Text, hekmo, permission, license and GitHub found none)
  - Flavor Text Extended (owner's own mod): https://github.com/vbardales/Rimworld-Flavor-Text-Extended.git
upstream_permission: unverified
suffix_exception: "2026-09-25, owner decision: no (unofficial) suffix in the name or the Preview, contrary to the PUBLISHING.md rule for silent. Reason: the author welcomed a Chinese translation (comments of 2025-09-07/08) and encouraged the Flavor Text Extended add-on (comment of 2025-10-12); no upstream licence was found, so none is claimed. The description keeps UNOFFICIAL and says: without explicit consent, though he has been kind. Detail: docs/UPSTREAM-PERMISSION-REVIEW.md"
rights_reviewed_at: 2026-09-13
rights_evidence: docs/UPSTREAM-PERMISSION-REVIEW.md
explicit_prohibition_found: false
settings_audit: complete
localization: complete
translation_en: complete
translation_fr: partial
dependencies: verified
showcase: complete
build: passed
automated_tests: passed
xml_tests: passed
tested_on:
automated_tested_on: 2026-09-21 (rerun from the current sources after the language fix)
in_game_runs: "2026-09-21 (before the language fix and the revisions): English 18/24, French 24/24, RIMMSQOL 4/4, all superseded. 2026-09-23/24, suite 846c156 and after, all exitReason passed: pass 1 English 21/0, pass 2 French 27/0 (03, 01, 04, 05, 06, 19, 07), pass 3 providers 06 3/3 + 01 5/5, pass 4 Shenzhou 06 3/3 + 01 5/5, pass 5 invented foods 4/4, pass 6 restart pair 1/1 + 2/2, pass 7 RIMMSQOL 3/3 + 1/1 x3, pass 8 without Biotech 2/2, pass 9 without Anomaly/Odyssey 2/2. 2026-09-24 (after the first attempts failed for causes of the step, not of the mod): feature 20 provider tables in passes 3 and 4 (12 then 16 tables read as written), the F13 fixture made by feature 21, pass 10 (F13) 1/1. Not green yet: pass 2b, the cooking film. Detail: docs/runs/2026-09-23.md and 2026-09-24.md"
last_fix_revision: 164104b
pushed: true
pushed_at: 2026-09-25
tag: v1.0.0 (created by the CI on 43dd52da70c3ffbdb3ab55c7301e877be88040e9)
tag_revision: 43dd52da70c3ffbdb3ab55c7301e877be88040e9
release: "https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais/releases/tag/v1.0.0 (created by the CI after the upload, 2026-09-25)"
audit_revision: 634066483d44f51201aa8ea0722da4b796864aad
review_revision: c675e87
code_review_revision: 238affb09622a3147e26a83ccc360155b0d10652 (2026-10-08, first /code-review-style pass, range ed5900b..238affb on Source, scripts, Tests/Pickle/Source, .github/scripts; findings in docs/runs/2026-10-08.md; review_revision above is the 2026-09-13 manual audit, not a code review)
in_game_validation_owner: user
workshop:
  id: "3806100488"
  id_committed_at: 2026-09-22
  tag: v1.0.1
  tag_revision: ab2e37e0d514f0c82b716e80bb942fd6b951d277
  visibility: public (owner, 2026-09-25, after the 1.0.1 publication; it had been private since Steam creates every item)
  self_subscription_test: the owner reports she subscribed and set the comment and activity watches (2026-09-25); no session verified it
prepublished: yes (1.0.0 then 1.0.1 uploaded to the Steam item)
published: 1.0.1 uploaded 2026-09-25 by the CI (publish run 36150171081, dry-run 36149832678, SHA ab2e37e0d514f0c82b716e80bb942fd6b951d277, tag v1.0.1 and release created by the CI, update_description and update_preview on); 1.0.0 the same day (run 36124437186)
maintainer: Codex, task responsible for this local repository
updated: 2026-10-02
remaining:
  - "description of the 1.1.0 (owner decision 2026-09-28, option a): publish WITHOUT update_description. The owner keeps the French description added by hand on the Workshop page (French block 7384 bytes + English block 6564 = about 13.9 KB, over the 8000 byte Steam limit, so the two cannot be merged into one CI block). update_description would replace the whole page text with the English block and erase her French. The credits corrections (Mlie, Kitsune) and the new thanks reach the page by hand, in French and in English. The Markdown single source (CI/CD template 8998df59f1d2) is still adopted for About.xml: rewrite the \"## Steam description\" block in Markdown, regenerate the workflow, run sync-about-description.mjs --write, read the About.xml diff, commit all together after the French in-game passes, never before (until then a dry-run would stop on the BBCode block)."
  - "soft dependency on French Grammar (FG, formerly French Grammar Plus, owner decision 2026-09-28): the aspirated-h food words belong to FG's word list (Mod/Data/aspirated-h.txt already holds haricot, houblon, husky, héron, hareng, homard, hamburger, hérisson; hachis, halloumi, hot-dog, houmous and harissa were asked of FG, to be checked against usage). Ours today: the AspiratedH regex in Source/FrenchMealPostProcessing.cs. Plan once FG gives its final packageId and publication date: add it to loadAfter in About.xml (never modDependencies), skip our regex when ModsConfig.IsActive(<FG packageId>) and keep it otherwise, add FG to the optional-providers pass of the Pickle suite to prove d'haricots / de husky / de houblon read right with FG active, and keep the offline test for the regex. FG answered (2026-09-28): packageId `nelim.frenchgrammar` (never the old `nelim.frenchgrammarplus`), name "French Grammar Renew (unofficial)"; NOT public (private item, 0.1.0, stage preTest, nothing played in game, no 1.0.0 date), so a loadAfter is harmless but the description must not cite it until it is public. Its offline harness proves that any string going through worker.PostProcessed gets the fix ("un plat d'husky" -> "de husky", houblon, haricot, hareng, homard, hamburger, hérisson), but its Harmony patches were never played in a real game: KEEP our regex, do not switch it off on the mere detection of FG. hachis, hot-dog, houmous, hummus and harissa still come out elided wrongly with FG (not yet in its list, waiting for its owner's decision), so our regex must go on treating them if a dish ever needs them; halloumi is caught only by accident through the prefix hall, which also wrongly catches hallucination and hallux (FG defect, logged there; none of our texts contains them). Update 2026-09-28 (owner said add them): FG added hachis and harissa (Académie, 9th edition; list at 78 entries, commit cdd58ce); it did not add houmous and hummus (shared usage), hot-dog (only Wiktionary marks it aspirated) or halloumi (no source). Correction sent to FG: our regex covers only haricot, houblon, husky and héron, none of our ingredient tables cites those five words (they only appear in fixed dish texts), so there is no case today; a word is added to our regex the day a table cites it. Decision when FG is public and its scenario 1 is played: soft dependency (loadAfter with nelim.frenchgrammar)."
  - "minor version in preparation (1.1.0, owner 2026-09-28), to publish after Flavor Text Extended 1.2.0 ships and says so: French for its 233 short forms and 31 Staples dishes, Altang and Jjapaghuri on 3 slots, no em dash in the French text, wording fixes (canard, sauce hollandaise, clou de girofle, pong tia koon, tarte au riz, anguille au vert), credits corrected (Mlie, Kitsune), description in one Markdown source. To do before it: bump modVersion and the changelog, replay the French in-game passes on the new tree (the stage goes back to tested), dry-run of the exact SHA, then the owner approves."
  - "next publication, to adopt then (CI/CD setup message, 2026-09-25, Rimworld-Release-Admin f196148, docs/OPERATIONS.md; nothing forced, no action now): one source for the Workshop description. The description is written once in Markdown, in a ```markdown fenced block under \"## Steam description\" of PUBLICATION.md; the CI converts it to BBCode and generates the plain-text <description> of Mod/About/About.xml from it, and stops if About.xml differs. Route for this repository (manual workflow): ask CI/CD to regenerate with --description-markdown, then read the diff of the first sync-about --write (About.xml usually carries BBCode). It changes the SHA, so a new dry-run of the exact SHA; the change note must start with [b]1.0.2[/b] or similar. To be done with the credit correction below."
  - "credits to correct on the Steam page (owner remark, 2026-09-25): RimCuisine 2 Core (Continued) is Mlie's update of Crustypeanut's mod, Kit's Brazilian Crops (Continued) is Zaljerem's update of a mod by Kitsune; the published 1.0.1 description credits Crustypeanut and Zaljerem only. Fixed in Mod/About/About.xml and PUBLICATION.md (6564 bytes), not yet on Steam: it goes out grouped with the next publication (owner, 2026-09-25: update_description on, dry-run first). The thank-you comment already posted on the Kit's page names Zaljerem only; a comment on Kitsune's original page (2388898158) is the owner's call."
  - "1.0.1 published 2026-09-25 by the CI (owner approved steam-production; run 36150171081, SHA ab2e37e0d514f0c82b716e80bb942fd6b951d277, dry-run 36149832678 with both options): the side-dish lowercase fix, the new description and Preview. All reds were green before it: the two lavish meals of feature 07 (request 63b1, 2/2) and the cooking pass 2b (request 6072, 1/1, 200 s, the description-only change of About.xml came after that run). The non-regression replay of passes 1, 2 and 5 on the normalized suite is skipped under fail fast and runs after the publication, in small tickets. Owner side, reported done: the item is public and the subscriptions are set. The ten thank-you comments are posted (owner, 2026-09-25; register updated). Still the owner's: the gallery upload (Art/Gallery; Steam refused some images as already uploaded, error 29), the GitHub social preview."
  - "1.0.0 published 2026-09-25 by the CI: dry-run 36122774168, publish run 36124437186 (publish job 58 s, tag-and-release 6 s), SHA 43dd52da70c3ffbdb3ab55c7301e877be88040e9, update_description on. The owner found a defect in the gallery captures the same day (a side dish starting with a capital after a French joint: 'façon Œufs de poule'); fixed in 1.0.1 (b292667), which is its own publication under the fail-fast policy. Still to do for 1.0.1: the in-game check (ticket 20260925-124301-548-63b1, the two lavish meals of feature 07), gallery images retaken on the presentation colony and cropped, workflow regenerated with --gallery-dir Art/Gallery, dry-run of the new SHA, then the owner's approval."
  - "partial (done -> tested): passes 1 to 10 and feature 20 are green (in_game_runs above). Pass 2b (cooking film, feature 09) is green since 2026-09-25 (request 20260925-153507-017-6072, 1/1); four earlier attempts were none a verdict on the mod, see docs/runs/2026-09-24.md and TESTING.md. The final replay of passes 1, 2 and 5 on the normalized suite (no @wip, explicit filters, fixed fixture foodType), skipped before the 1.0.1 publication under fail fast, was played after it on 2026-09-25 on the published tree (Mod/ and Tests/ identical to 256d704): pass 1 21/21 (e893), pass 2 27/27 in seven launches (b7be), pass 5 4/4 (0d0b), all exitReason passed, see docs/runs/2026-09-25.md. What kept the stage at done is therefore played and green; the stage change itself is left to the protocol and the owner."
  - "resolved 2026-09-24: F13. The fixture was made by feature 21 (@fixture-maker, an English game) and committed as Tests/Pickle/Mod/Pickle/Fixtures/legacy-meals-before-ftfr.rws (f07f576); feature 18 lost its last @wip and played green in pass 10 (French): a meal made in English reads Salade de lait (plat raffine)."
  - "partial (tested -> prepublished): the Workshop gallery is Art/Gallery (four cropped captures, taken on the generic test colony; to be retaken on the presentation colony before upload, a manual step). Thank-you messages and Steam change notes are prepared in PUBLICATION.md; both recipients are already posted in WORKSHOP_COMMENTS.md, so the register rule is to add this mod to Covers, not to post again (owner to decide). See docs/PROTOCOLS-READ.md for the other open points."
  - "reported by the owner (prepublished -> published): item 3806100488 is public and subscribed to, 2026-09-25. A session cannot see a private page and did not verify it after the switch."
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
  - "unverified (TRANSLATIONS.md, 2026-09-30): French review by Virginie. No session can certify French quality; FRENCH_REVIEW.md is generated for her reading, `translation_fr` stays `partial` until she records a dated review line under Translation audit below."
  - "defect (not a stage-chain transition): Mod/About/ModIcon.png is 1254 x 1254 and 1,444,880 bytes and ships with Mod/ (Steam publishes it unfiltered); PUBLISHING.md says about 128 px is enough. Legibility at 32 px is fine (checked 2026-10-02), the defect is the weight. Only the owner generates or resizes a ModIcon: asked, not touched."
  - "unverified (done -> tested): feature 07 (lavish meals) must be replayed on the current DLL: the last French pass (2026-09-28 15:45 to 15:58) predates 44a8cbc (bounded LowerSideDishes search, 2026-09-28 22:40). Pass 3 folders (mtime 2026-09-29) do not record their tree SHA. Order: 07 alone first (small ticket), then every non-regression pass together at the end on the final revision (AUDIT.md, 2026-10-02)."
  - "unverified (done -> tested): every conditional scenario had its pass, on older builds (table in TESTING.md, Conditions of tested); no scenario is @wip; no manual test is left (FUNCTIONAL-SCENARIOS.md mapped to the Pickle features)."
---

# Audit - 2026-10-02 (AUDIT.md applied, backward reading)

**Previous stage: `done`. Retained: `showcase`, `workflow_stage: options`.** Session title: `flavortextextended.fr / options`.
Audited revision `25bf8e3` (`main`, clean at entry). No RimWorld was launched, no Pickle request deposited, nothing published.

| Transition | Result |
|---|---|
| dansMonoRepo -> horsMonoRepo | holds (standalone repo, remote, `upstream_mod_remotes`: Flavor Text N/A, a GitHub search on 2026-10-02 finds no hekmo repository; Flavor Text Extended is the owner's own). |
| -> ModIcon | holds for format and legibility at 32 px (opened); the 1.4 MB weight is a defect to settle with the owner, see `remaining`. |
| -> Preview | holds: 896 x 504, 823,842 bytes, byte-identical to `Art/Gallery/0-preview.png`. |
| -> preOptions | holds: the description ends with `[url=...]Source code on GitHub[/url]`; the `(unofficial)` exception is recorded. |
| -> options | holds: `settings_audit: complete`; no French text agrees with a pawn (no `PAWN_` token anywhere in `Mod/`), so no gender setting is owed. |
| -> l10n | **fails**: `translation_fr: partial`, French review by Virginie pending (TRANSLATIONS.md, 2026-09-30). No counted noun is built from keys (the only `{0}` is a setting value), so no `.One`/`.Many` is owed. `FRENCH_REVIEW.md` exists. |
| l10n -> preTest, preTest -> done, done -> tested, later | cited, not re-decided: the earlier recordings stand (dependencies verified 2026-09-22; `Test-Xml` and the offline battery green; Pickle suite written; passes green on older builds). |

Changed by this audit: evidence cleaned (67 MB to 11 MB, list in `TESTING.md`), `Mod/desktop.ini` untracked and ignored (it shipped in
`Mod/`), gallery renamed to `0-` ... `4-`, `docs/PROTOCOLS-READ.md` rewritten, TESTING.md and FUNCTIONAL-SCENARIOS.md updated with the `tested`
conditions. CHANGELOG untouched: the item was created by the CI with 1.0.0, so no `0.1.0` entry exists and none is invented.

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
| -> ModIcon generated | validated | `scripts/Build.ps1` rebuilt and installed the distribution DLL successfully. `Mod/About/ModIcon.png` was opened: 128x128 PNG, 33,010 bytes, mascot and ribbon remain legible. |
| -> Preview generated | validated | `Mod/About/Preview.png` was opened directly: 896x504 PNG, 569,664 bytes, under 1 MB; title, French suffix, unofficial tag and 1.6 badge are legible, with no clipping or concrete camera defect observed. |
| -> preOptions | validated | The distributed description now begins with the prescribed literal `UNOFFICIAL.` opening, without BBCode; `scripts/Test-Xml.ps1` passes. |
| -> options | independently validated | `Test-Language`, `Test-SettingsBridge`, `Test-UpstreamSettings`, and `Test-HarmonyRegistration` pass on the current rebuilt DLL. They substantiate the settings bridge, bounds, primitive persistence and Harmony wiring, not a new in-game run. |
| -> l10n | validated | The full XML check, fallback helper and fallback-prefix tests all pass from the current checkout; no player-facing localization defect was found by these out-of-game checks. |
| -> preTest -> done | validated | The functional scenarios and Pickle suite remain written; build, XML and the complete offline battery pass. `done` does not require a new game run. |
| -> tested | validated, recorded 2026-09-28 | Passes 1 to 10 and feature 20 green, the cooking pass 2b green with the info card (request 9bac, 2026-09-26), the `@review` captures opened; see `docs/runs/` and `TESTING.md`. |
| -> prepublished | validated, recorded 2026-09-28 | Workshop item 3806100488 created and 1.0.0 uploaded by the CI (run 36124437186), PUBLICATION.md, gallery, description, dependencies and content descriptors settled. |
| -> published | validated on the owner's word, recorded 2026-09-28 | 1.0.1 uploaded by the CI (run 36150171081, SHA ab2e37e), the item is public and subscribed to (owner, 2026-09-25); a session cannot see a private page and did not verify it after the switch. |

## Commands and results

- `scripts/Build.ps1`: PASS against the installed RimWorld, Flavor Text and Harmony references.
- `scripts/Test-Xml.ps1`: PASS, including 82 XML files, 1,831 dishes, 25 guarded patches, 186 ingredients and the hidden bilingual shortcut.
- `scripts/Test-Language.ps1`, `scripts/Test-PatchLifecycle.ps1`, `scripts/Test-SettingsBridge.ps1`, `scripts/Test-UpstreamSettings.ps1`, `scripts/Test-Fallback.ps1`, `scripts/Test-FallbackPrefix.ps1`, and `scripts/Test-HarmonyRegistration.ps1`: PASS.
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
The raw reports of the 2026-09-21 runs were deleted on 2026-09-23 (superseded by the passes replayed for `tested`); their text summary is `docs/runs/2026-09-21.md`, the current ones are under `Tests/Pickle/Evidence/2026-09-25-nonreg-*` (the 2026-09-23 folders were deleted on 2026-09-26, superseded by the non-regression replay) (ignored by Git) and `docs/runs/2026-09-23.md`.
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
| -> done | validated (second pass of the day) | Scenarios F01-F14 plus FoodCourt in `docs/FUNCTIONAL-SCENARIOS.md` (preconditions, actions, expected results): present. Automated and XML tests: green (below). Pickle (Gherkin): first found **absent and unjustified**, then written and justified, see below. No test run in game is required for `done`. |
| -> tested | not reached | Nothing executed in game. |

## Tests rerun on the delivered tree - 2026-09-21

| Check | Result |
|---|---|
| `scripts/Build.ps1` | PASS, DLL byte-identical to the shipped one |
| `Test-Language`, `Test-Xml`, `Test-SettingsBridge`, `Test-UpstreamSettings`, `Test-HarmonyRegistration` | PASS (Windows PowerShell 5.1): 82 XML files, 1,831 dishes, 25 guarded patches applied in memory, 186 entries / 15 tables, 3 grammars, 7 category overrides, Biotech gating, hidden shortcut |
| `Test-PatchLifecycle`, `Test-FallbackPrefix` | PASS **by equivalent means**: as-is they fail on PS 5.1 (`Add-Type` compiles C# 5). Same sources and test doubles compiled with the SDK 8.0.424 Roslyn into the scratchpad and loaded in PS 5.1. Not the literal command; `pwsh` is absent. |
| `Test-Fallback` | PASS **by equivalent means**: as-is it fails on PS 5.1 (UTF-8 without BOM read as ANSI: parse error, then `Bad French complement`). Scratch copy with BOM and explicit UTF-8 reads; the repository script is unchanged. |
| `Check-DefInjected.ps1` | 3,671 keys, 0 errors |
| Distribution manifest (88 files, `docs/history/foodcourt-2026-09-13`) | 86 identical. `Mod/About/About.xml` and `Mod/ATTRIBUTION.md` differ, explained by commits `036f4b7` and `b62253a` (author `nelim` -> `Nelim`, attribution text). `git diff c675e87 HEAD -- Mod/` outside ATTRIBUTION.md is that two-line About change only. No file added or missing. Code, patches, translations and images unchanged since the evidence. |

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
`docs/history/fix-2026-09-13/STATUS.before.md`; the earlier pre-audit snapshot remains in
`docs/history/audit-2026-09-13/STATUS.before.md`. Earlier test outputs and scenario descriptions
are retained. This document describes the current working files, not just HEAD.

Repository: `C:\Users\nelim\Documents\rimworld\FlavorText\FlavorTextExtendedFR`.
Distributed folder: `Mod/`. Initial audit: `80a77c572465a0437b9766c3b1fa9f0d7784c356`. Technical corrections are recorded in `c675e87`; the subsequent documentation commit records the stage correction.
At audit entry About.xml and STATUS.md were already modified and Test-Xml.ps1 was untracked.
Those changes were incorporated, not reset. The correction pass modifies documentation,
images, two translation files and the inflection patch, and adds local code/build/tests,
conditional translations, grammar resources and evidence. Final file hashes and Git status
are recorded under `docs/history/continue-2026-09-13/`; earlier evidence remains under `docs/history/fix-2026-09-13/`.

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

Current commands and results (latest outputs in `docs/history/continue-2026-09-13/`; earlier results preserved in `docs/history/fix-2026-09-13/`):

| Command | Observed result |
| --- | --- |
| `& ./scripts/Build.ps1` | PASS, compiled against local RimWorld 1.6 references and installed DLL. |
| `& ./scripts/Test-Language.ps1` | PASS against the installed DLL: language isolation, case handling, one payload call, false/exception propagation. |
| `pwsh -NoProfile -File ./scripts/Test-PatchLifecycle.ps1` | PASS: production wrapper compiled with lifecycle doubles; XML mutation, EN/DE isolation, language reload sequence, skipped completion and failure reporting. These doubles are not game execution. |
| `& ./scripts/Test-Xml.ps1` | PASS: 82 XML files, 1,831 dishes, 25 guarded replacements simulated in memory, 186 entries across 15 tables, three grammars, seven category overrides, ten upstream setting strings and five new bilingual keys and Biotech gating. |
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

## Translation audit — 2026-09-30 (French gender-agreement rule and systematic review)

`translation_fr` reset to `unchecked` on 2026-09-30 for every mod with a `Languages/French` folder
(TRANSLATIONS.md). This session read every French file of this mod in full (74 DefInjected files
under `FlavorText.FlavorDef`/`FlavorCategoryDef`/`MainButtonDef`, plus `Keyed/Fallback.xml` and
`Keyed/Misc.xml` — no pattern search) to check the three-segment `{PAWN_gender ? … : … : ·…}`
switch: `grep -r PAWN_gender` and manual reading both found **zero** matches. This mod's entire
French content is food/dish descriptions, labels, settings tooltips and short names — no text
refers to a pawn, so the gender-agreement rule does not apply to any string here. Set
`translation_fr: partial` (never `complete`: only Virginie's own review can set it).

Where the French lives: `Mod/Languages/French/DefInjected/FlavorText.FlavorDef/` (Descriptions_01–13,
Descriptions_Variants, Labels_01–12, Labels_Variants, and ~30 `Ext_*.xml` regional/theme files, all
generated from `FlavorDefs_FR_*.xml` by `scripts/scinder.js`), `.../FlavorCategoryDef/Extended_Categories.xml`,
`.../MainButtonDef/Settings.xml`, `Mod/Languages/French/Keyed/{Fallback,Misc}.xml`, and
`Mod/Biotech/Languages/French/DefInjected/FlavorText.FlavorDef/Biotech.xml`.

`scripts/Generate-FrenchReview.ps1` (new, adapted from FoodCourt's script) generated `FRENCH_REVIEW.md`
at the mod root. **Known limitation**: Original/English resolution falls back to the upstream Def
field, but only Flavor Text Extended has a local dev checkout (sibling `FlavorText/FlavorTextExtended`);
base Flavor Text (hekmo) has none in this tree (`upstream_mod_remotes: N/A`), so most rows — the
~930 base-game dish keys — show English as "not found - check by hand". Virginie's review of those
rows needs the installed Workshop copy of Flavor Text open alongside `FRENCH_REVIEW.md`, or the
script re-run once a local Flavor Text checkout exists. Rows for Flavor Text Extended's own ~901
dishes resolve correctly. No row was flagged `?` (no `{PAWN_gender}`/`TODO`/`???` pattern found).

No terminology or tone uncertainty flagged by this session: the French reads as intended per file
header comments (grammar-gender conventions for generic ingredient slots, deliberate registers for
the meal-paste and dog-food sections, documented puns/wordplay substitutions).

Review line (to be filled by Virginie, never by a session): reviewer, date, revision reviewed,
corrections requested — pending.
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
The final game campaign is specified in `docs/FUNCTIONAL-SCENARIOS.md` (F01–F14), including
language switching, optional mods, Biotech, settings, logs, new games and existing saves.
No in-game success is claimed. Only affected validations were repeated; prior evidence is retained.
## Continuation evidence

The pre-continuation STATUS and scenarios remain in `docs/history/continue-2026-09-13/` alongside
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
docs/history/runtime-attempt-2026-09-13/. No cooking, UI, language switching or save compatibility
scenario was executed, and no additional production-code defect was established by this attempt.

scripts/Start-IsolatedGame.ps1 provides fresh French/English profiles, a minimal active mod
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
docs/history/foodcourt-2026-09-13/. Runtime integration with Shenzhou 1.6 remains unverified.
The cumulative stage and prior settings/build evidence are unchanged.

The refreshed DefInjected checker resolves 3,671 keys with zero errors. Its six Biotech advisory lines remain unchanged; the conditional folder is checked separately.

## Post-commit handoff — 2026-09-13

At the user's explicit request, all in-game validation belongs to the user. Further agent
work is limited to source/files and offline technical checks: do not launch, control or
close RimWorld for this task. A French isolated profile was previously launched at
.build/game-tests/20260913-142710-French; no interactive test was completed or certified.
The user declined Computer Use and reserved the game campaign for themselves.

Reviewed commit c675e87. All 88 distributed files match the recorded SHA-256 manifest in
docs/history/foodcourt-2026-09-13/distribution-manifest.json, with zero differences. Root/distribution
LICENSE, ATTRIBUTION.md and CHANGELOG.md copies match. The local Keyed resources contain
15 unique French keys and five unique English keys; the ten upstream settings use native
upstream English resources. No new delivery defect was identified. The passing XML and
settings checks from the commit turn remain applicable; no production files changed here.

Offline technical work is ready for the user-run campaign in docs/FUNCTIONAL-SCENARIOS.md.
The cumulative stage is `done` under the agreed public `silent` convention. Permission remains unverified; no prohibition was found. Earlier no-commit and unchanged-stage statements describe historical audit passes, not the current status.

The additional public-source permission search is recorded in
docs/UPSTREAM-PERMISSION-REVIEW.md. Author interaction with a Chinese translation was
found, but no explicit licence or authorization for this French companion was established.
Older comment pagination was unavailable to the web reader. The remaining permission
item therefore stays unverified; no production changes or additional game actions were made.

## Rights review: pagination resolved — 2026-09-13

All three pages of the 145 publicly visible Flavor Text comments were inspected through
the browser. The 9 May 2025 reply to nelim17 concerns technical translatability, not a
permission refusal. Favorable Chinese-translation and recipe-addon exchanges were also
found. No explicit prohibition, general licence or grant for publication of this French
companion was found. Full references are in docs/UPSTREAM-PERMISSION-REVIEW.md.
The earlier pagination limitation is resolved; private/deleted messages remain unknown.
Classification stays `silent`, permission stays `unverified`, and the cumulative stage is `done`. The user clarified that explicit consent is not a mandatory gate under this workflow; the required public disclosures are already present.

Current attribution notices have been synchronized with the completed public-comment review. Only documentation changed; previous artifact manifests are historical snapshots predating this attribution update. Technical validations remain applicable.


## Preview source migration — 2026-10-03

Copy, typography, layout and palette are consolidated in `Art/Preview.config.json`. Canonical inputs are `Art/Preview-source.png`, `Art/echo.png` and `Art/ModIcon-source.png`; temporary renderer diagnostics belong under ignored `Art/.render/`. Existing Preview, gallery and ICO outputs were preserved because they were present and coherent; no render was run. Superseded JSON files and generated QA intermediates were removed. Nothing published.
