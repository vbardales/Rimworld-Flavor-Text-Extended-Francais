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
translation_mod: yes
workflow_stage: localize[1.1.0]
stage_meaning: "2026-11-10: shootGallery[1.1.0] (Virginie agreed after 8.m closed, ticket 4bb5 green). History: 2026-10-13 playTests[1.1.0] (backward audit, AUDIT.md 8.a and 8.m: a commit of Mod/ after code_review_sha reopens the code review and playTests). Cause: a311b88 added Food Texture Variety French (Mod/FoodTextureVariety DefInjected, LoadFolders, loadAfter in About.xml), a feature of the owner. The rest of 1.1.0 stands: feature 07 green, settings and French passes green, French review of 2026-10-11 (b8327f3). Reopened and owed: (1) 8.b Virginie reads the new FTV French strings (3 ThingDef, 6 RecipeDef; now in FRENCH_REVIEW.md, regenerated 2026-10-15 with FTV in -ExtraDefs, sections FoodTextureVariety/DefInjected); (2) 8.f the FTV pass (wsl-deps map declared in TESTING.md, scenario asserting the French name; the ticket 779f proved the cards by eye, 3/3, not as a declared pass); (3) 8.m code review of f0ea3fbc..HEAD (Mod/ only, no Source/ change), then code_review_sha. Then shootGallery[1.1.0] again (gallery to recompose, see remaining)."
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
translation_fr: complete
dependencies: verified
showcase: complete
workshop_required_items: done, 2026-11-10 (read on the Steam page)
build: passed
automated_tests: passed
xml_tests: passed
tested_on: 2026-10-12 (feature 07, French, sans-facultatifs, request fd8c, 5/5 on tree 02c7139; the other passes were green on 1.0.1, see in_game_runs and docs/runs)
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
code_review_sha: fa6d0b12f7e07ca1aeebcf6e861c66bc01a5b3cc  # 2026-11-10: moved to HEAD after feature 24 replay 4bb5 green on the DLL (8.m closed); previous f3069f6e:  2026-10-17: range f0ea3fbc..f3069f6e re-read (Source: FrenchAgreement.cs, FrenchAgreementData.cs, one line in FrenchMealPostProcessing.cs; Mod/ French text, About, LoadFolders). One finding fixed (failed table build logged once). Open: add <v1.7> to LoadFolders.xml at the 1.7 move; the 2026-10-08 findings stay open in remaining
echo_review_sha: 0cd7238612c351e519ed9b4e426d14e008b97e87  # 2026-10-12: Art/echo-concept.png (1536 x 1024, clean outlines) kept with the new Preview-source.png (700 x 500, French flag); concept illustration, no capture shows the meals; flipX false
social_preview_sha256: 219944030ecf80aa0110526b9a4ea0ab4bd4e0bcdd8466a5cd7320cc945242a2  # 2026-11-08: Preview.png (60e2767) uploaded to GitHub Settings > Social preview via Chrome (owner validated); og:image downloaded and hashed: identical
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
updated: 2026-11-19
remaining:
  - "2026-11-19: rule AUDIT 6.c and TRANSLATIONS.md, missing keys of a translation are translated, never refused: the 170 French keys missing in TRANSLATION_REVIEW.md (FlavorCategoryDef FT_* labels, section French/Missing keys) must be translated (ChatGPT page 7 proposes the prefix `Flavor Text : ...` as in Extended_Categories.xml); the refusal logged in Docs/review-refusals.md the same day is to be reversed."
  - "2026-11-19: new rule, a stage change is decided by /mod-workflow:replay-audit run by the session, never written by hand (AGENTS.md; Check-Status stage-replay from 2026-11-20). Check-Status WARN ecosystem_line missing: the 1.1 line has no recorded ecosystem search (short DELTA through ecosystem, then write ecosystem_line: 1.1 or none)."
  - "2026-11-19: 8.m code review reopened by commit 07c695a (About.xml loadAfter Ludeon.RimWorld.Biotech, after code_review_sha); replay-audit 3 (range): 3.0 upstream_synced missing, 3.c CHANGELOG Unreleased lacks the French agreement marks, nouveau, Biotech loadAfter. ChatGPT review: all 7 pages answered once; pages 3 to 7 changed texts, rerun each; 170 French missing keys (FlavorCategoryDef FT_* labels, page 7) not checked against what the game shows; names to decide (Ramadan, Aymara, Maori, Peking duck, Hoppin John, Paris-Brest, Kool-Aid, Buddha bowl) wait for Virginie."
  - "replay-audit 2026-11-12 (ledger .replays/FlavorTextExtendedFR-20261112.tsv, 47 rows): first unfulfilled 6.g, workflow_stage shootGallery[1.1.0] moved back to localize[1.1.0]. 6.g: the ChatGPT reviews behind Virginie's 2026-10-17 validation (f05a6dd) fall in the plugin header bug window 2026-10-17 to 2026-11-11, which AUDIT 6.g says to relaunch; Docs/review-refusals.md is absent. 6.f: FRENCH_REVIEW.md is the old name, regenerate as TRANSLATION_REVIEW.md. 6.i follows 6.g. Owner may overrule if the 2026-10-17 reviews did not go through the plugin. Shot 1 of the gallery (verdict REDO, see below) waits."
  - "judged by the session 2026-10-12 (shootGallery, ticket f4c5 / run 2026-10-12-gallery-22-face, 3/3 green, folder deleted 2026-10-19 as superseded by gallery-22-camille-c): the three new frames are REFUSED by the director, none goes to Art/Gallery. Reasons: (1) FTV compatibility defect seen on the cards: the meal kind stays in English, `Katsudon (variety simple meal)`, `Momos aux oeufs de poule et achar de porc et gnocchi (variety fine meal)`, `Blanquette a deux viandes (variety simple meal)`, where the Extended meals read `(plat raffine)`; the first description line (`A simple meal quickly cooked from one main ingredient.`) is FTV's English text; the French name and description themselves are right (item 1 of the FTV feature is answered: Flavor Text names the FTV meals in French, but the kind suffix is not translated). (2) Composition: the three frames are alike, the table is small, the card covers half the screen with an empty lower half, the hen is tiny and half hidden behind the logs. Nelim's own face is now in place and readable. Next: translate the FTV kind labels (variety simple meal, variety fine meal, and the other FTV_Meal* kinds) in a patch or DefInjected of this mod, then recompose the series with a tighter frame and a visible hen, as small tickets."
  - "description of the 1.1.0 (owner decision 2026-09-28, option a): publish WITHOUT update_description. The owner keeps the French description added by hand on the Workshop page (French block 7384 bytes + English block 6564 = about 13.9 KB, over the 8000 byte Steam limit, so the two cannot be merged into one CI block). update_description would replace the whole page text with the English block and erase her French. The credits corrections (Mlie, Kitsune) and the new thanks reach the page by hand, in French and in English. The Markdown single source (CI/CD template 8998df59f1d2) is still adopted for About.xml: rewrite the \"## Steam description\" block in Markdown, regenerate the workflow, run sync-about-description.mjs --write, read the About.xml diff, commit all together after the French in-game passes, never before (until then a dry-run would stop on the BBCode block)."
  - "soft dependency on French Grammar (FG, formerly French Grammar Plus, owner decision 2026-09-28): the aspirated-h food words belong to FG's word list (Mod/Data/aspirated-h.txt already holds haricot, houblon, husky, héron, hareng, homard, hamburger, hérisson; hachis, halloumi, hot-dog, houmous and harissa were asked of FG, to be checked against usage). Ours today: the AspiratedH regex in Source/FrenchMealPostProcessing.cs. Plan once FG gives its final packageId and publication date: add it to loadAfter in About.xml (never modDependencies), skip our regex when ModsConfig.IsActive(<FG packageId>) and keep it otherwise, add FG to the optional-providers pass of the Pickle suite to prove d'haricots / de husky / de houblon read right with FG active, and keep the offline test for the regex. FG answered (2026-09-28): packageId `nelim.frenchgrammar` (never the old `nelim.frenchgrammarplus`), name "French Grammar Renew (unofficial)"; NOT public (private item, 0.1.0, stage preTest, nothing played in game, no 1.0.0 date), so a loadAfter is harmless but the description must not cite it until it is public. Its offline harness proves that any string going through worker.PostProcessed gets the fix ("un plat d'husky" -> "de husky", houblon, haricot, hareng, homard, hamburger, hérisson), but its Harmony patches were never played in a real game: KEEP our regex, do not switch it off on the mere detection of FG. hachis, hot-dog, houmous, hummus and harissa still come out elided wrongly with FG (not yet in its list, waiting for its owner's decision), so our regex must go on treating them if a dish ever needs them; halloumi is caught only by accident through the prefix hall, which also wrongly catches hallucination and hallux (FG defect, logged there; none of our texts contains them). Update 2026-09-28 (owner said add them): FG added hachis and harissa (Académie, 9th edition; list at 78 entries, commit cdd58ce); it did not add houmous and hummus (shared usage), hot-dog (only Wiktionary marks it aspirated) or halloumi (no source). Correction sent to FG: our regex covers only haricot, houblon, husky and héron, none of our ingredient tables cites those five words (they only appear in fixed dish texts), so there is no case today; a word is added to our regex the day a table cites it. Decision when FG is public and its scenario 1 is played: soft dependency (loadAfter with nelim.frenchgrammar)."
  - "deploy 1.1.0 with update_preview ON (owner, 2026-10-08): the Preview and ModIcon were regenerated on 2026-10-08, the Steam page image only changes with that option, at the dry-run and at the publish. Also: CHANGELOG.md (root and Mod/ copy, identical) needs an `## [Unreleased]` section listing the French corrections of 2026-09-27/28 (233 short forms, 31 Staples dishes, no em dash, wording fixes, credits) and the Preview/ModIcon regeneration; not written yet because Mod/ is frozen for the gallery ticket 20261009-001351-964-dc06."
  - "code review of 2026-10-08 (ed5900b..238affb, 0 red, 5 yellow, 2 questions, 1 nit; details in docs/runs/2026-10-08.md): none fixed yet, Source is frozen for the gallery ticket and each fix is a code change with its own tests. Owner decides which to take."
  - "minor version in preparation (1.1.0, owner 2026-09-28), to publish after Flavor Text Extended 1.2.0 ships and says so: French for its 233 short forms and 31 Staples dishes, Altang and Jjapaghuri on 3 slots, no em dash in the French text, wording fixes (canard, sauce hollandaise, clou de girofle, pong tia koon, tarte au riz, anguille au vert), credits corrected (Mlie, Kitsune), description in one Markdown source. To do before it: bump modVersion and the changelog, replay the French in-game passes on the new tree (the stage goes back to tested), dry-run of the exact SHA, then the owner approves."
  - "next publication, to adopt then (CI/CD setup message, 2026-09-25, Rimworld-Release-Admin f196148, docs/OPERATIONS.md; nothing forced, no action now): one source for the Workshop description. The description is written once in Markdown, in a ```markdown fenced block under \"## Steam description\" of PUBLICATION.md; the CI converts it to BBCode and generates the plain-text <description> of Mod/About/About.xml from it, and stops if About.xml differs. Route for this repository (manual workflow): ask CI/CD to regenerate with --description-markdown, then read the diff of the first sync-about --write (About.xml usually carries BBCode). It changes the SHA, so a new dry-run of the exact SHA; the change note must start with [b]1.0.2[/b] or similar. To be done with the credit correction below."
  - "credits to correct on the Steam page (owner remark, 2026-09-25): RimCuisine 2 Core (Continued) is Mlie's update of Crustypeanut's mod, Kit's Brazilian Crops (Continued) is Zaljerem's update of a mod by Kitsune; the published 1.0.1 description credits Crustypeanut and Zaljerem only. Fixed in Mod/About/About.xml and PUBLICATION.md (6564 bytes), not yet on Steam: it goes out grouped with the next publication (owner, 2026-09-25: update_description on, dry-run first). The thank-you comment already posted on the Kit's page names Zaljerem only; a comment on Kitsune's original page (2388898158) is the owner's call."
  - "unverified: RIMMSQOL revealing FTFR_Settings is covered by pass 7 (played, four launches, all exitReason passed, TESTING.md row 7; PickleTools/RimmsqolSteps/README.md). Other customization mods are not covered."
  - "defect (not a stage-chain transition): Mod/About/ModIcon.png is 1254 x 1254 and 1,444,880 bytes and ships with Mod/ (Steam publishes it unfiltered); PUBLISHING.md says about 128 px is enough. Legibility at 32 px is fine (checked 2026-10-02), the defect is the weight. Only the owner generates or resizes a ModIcon: asked, not touched."
protocols_read_sha: 4eb1b715105d5381bd2e48328281c62ca9ef026f
---

# History

Resolved and dated entries and the audit of 2026-10-11 are in `docs/runs/status-history-2026-10-16.md` (2026-10-16). The audits of 2026-10-02, 2026-09-22 and 2026-09-21, the update after the first in-game runs and the 2026-09-13 correction pass are in `docs/runs/status-history-2026-09-10.md` (moved unchanged, 2026-10-15).

# NSB

First sync 2026-11-10 (shootGallery[1.1.0]). Places read: 2026-11-10. Tribe read: 2026-11-10. Steps read: 2026-11-10 (git log of docs/steps.md and catalogues since 2026-10-16 read by title: nothing replaces a setup of feature 22).
NSB changed nothing the gallery uses (`dining-nook` (176, 108) still there). The mod adds no animal (no PawnKindDef or race in Mod/): rule 5 has nothing to show. Nothing is changed in the shotlist or in 22-gallery.feature before the owner answers.

| Place | Shots | Changes for the gallery | Last read |
|---|---|---|---|
| dining-nook (176, 108) | 1, 2, 3 | none (table meals put by the scenario) | 2026-11-10 |

| Colonist | Shots | Outfit per shot | Last read | Exceptions |
|---|---|---|---|---|
| Nelim | 1, 2, 3 | vanilla BasicShirt teal + Pants cream on the retextured body (owner 2026-10-07, photographer) | 2026-11-10 | PENDING: scenario sets hairstyle "Ponytails" and hair rgb (70, 46, 32); NSB canon is `Roo_HD_Hair_Highpony`, `Hair_DarkSaturatedReddish` #382412 (rule 3, no quoted validation) |
| Camille (guest) | 1, 2, 3 | vanilla BasicShirt orange + Pants grey | not in NSB | outside NSB: PENDING (rule 2). NSB lets a gallery create an anonymous colonist, but the owner's rule 2 asks an express validation |

| Animal | Shots | Outfit | Last read | Exceptions |
|---|---|---|---|---|
| Hen (Chicken, anonymous) | 3 | none | SANCTUAIRE-LIEUX.md, faune (Poulet 8 in the save) | none: anonymous fauna of the save is decor |

| Animal the mod includes | Shots |
|---|---|
| none (food mod) | n/a |

# Shotlist (shootGallery[1.1.0], 2026-11-10)

No capture yet: rating the plan. Header in `Tests/Pickle/Mod/Pickle/Features/22-gallery.feature`. Story "Lunch is served" (Nelim hosts Soren at the dining-nook, 12:00 to 12:10, table set, served, half eaten, hen in front). Cast all NSB (Soren, Nelim by roster, Chicken of the save): no owner question open. Camille and Nelim's `Ponytails` override dropped. DepMap to add before the first ticket: `rooboid.hdhair.continued` 3559870636.

| shot | a | b | c | d | e | f | g | j | plan | main risk |
|---|---|---|---|---|---|---|---|---|---|---|
| 1-set, 12:00, zoom 5.5 | 12:00, dining-nook, Clear, 20 deg | TorchLamp lit, Plant_Daylily in PlantPot, nook table and chairs | Plant_Daylily | Nelim teal shirt, cream trousers, Highpony, smile; Soren orange, charcoal, Tidy, smile | meal just put down, Nelim turns to Soren who just arrived, placed by stands-at | wide, lamp behind, plant right, card right | half-set table, host meets guest, card names a French dish | card cropped to right 60 percent, read at 268 px | 5 | Soren doorway cell unverified |
| 2-served, 12:05, zoom 7 | 12:05, same | same decor | Plant_Daylily | same outfits, smiles | table just filled, pawns face each other, gazes on the two-dish meal | medium, E/W facing | full table, two people, card names main and side | same crop | 5 | none known |
| 3-farm, 12:10, zoom 9 | 12:10, same | same decor | hen in front of the pawns, facing South | same outfits, smiles | two meals gone, hen stops, pawns laugh down at her | close, low-left, hen foreground | half-cleared table, hen, card names blanquette | same crop | 5 | hen may wander after placement |

k (series): ok. One story, 3 episodes (set, served, eaten), wide / medium / close, opening and closing image, rhythm moves. Not verified: Soren's roster steps (Male body under VTW), `TorchLamp` and `PlantPot` cells in the nook, card crop at 268 px. Verdict per capture: none yet.

Gallery 2026-11-10: 22-gallery.feature rewritten from the shotlist (80a76ac); shot 1 tickets ff37, 8412, c04d failed for ticket causes (filter form `22-gallery::sets the table`, Gherkin lines that lost their `#`, no exact-age step), 958e and 1cbf ran 1/1. Lesson: read Player.log "failed to parse" before blaming the filter. Details in git history.

Shot 1 verdict 2026-11-12 (ticket 1cbf, set-4, opened): REDO. Nelim stands behind the chairs facing south, Soren 3 cells east looks left, they do not face each other; 2 meals ok; faces too small for the smile; floor bare (rug, torches only). Image 3.5, adequacy 3.5, understanding 3, decoration 3. Capture folders deleted. Next: recompose shot 1 (pawns face each other beside the table, tighter frame, more decor), refile as one small ticket. NSB and NPT sync owed (Check-Status warns: changes of 2026-11-12).
