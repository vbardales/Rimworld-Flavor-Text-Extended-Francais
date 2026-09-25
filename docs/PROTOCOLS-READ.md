# Documentation read, and in which version

A local record of which shared documents this mod's session has read, from which revision, and what each one asks of
this mod. It is not a copy of them: they live in other repositories and change. When a revision below is no longer the
head, the "read" claims here are stale for whatever changed.

Read on 2026-09-25 by the session "Flavor Text Extended - Français / done"
(`local_2ef615f6-108d-4da0-b599-e79a80b8887a`, confirmed with `get_session("self")`), in two readings.

## Reading 1: the protocols repository

- Repository `vbardales/Rimworld-protocols`, read from the local bare clone `C:\Users\nelim\Documents\rimworld-protocols.git`,
  branch `main`, at **`359a460a5dfc558d008b5b4e3444f56e61ad4b94`** (2026-09-25, "docs(publishing): fail fast lifts only the
  regression pass; a red scenario needs a green replay before publish").
- `main` of the local clone has since moved to **`f3dc1e4d30`** ("docs: align AUDIT and the tests README with what the harness does
  now"). Its diff to `AUDIT.md` was read (wording only: a session no longer calls `Run-PickleWsl.ps1` itself, the worker does; the
  TicketDispatcher may stop an orphan game); `scripts/Tests/README.md`, also changed, was not re-read. Both local commits were
  unpushed to GitHub when checked.
- GitHub's `main` answered `9e7142611b17a807fa0a11ee01f583242a8cab05` ("docs(audit): the fail-fast policy also covers a
  1.0.0") when queried the same day: the local clone was one commit ahead, the difference being the fail-fast wording of
  `PUBLISHING.md`.
- The monorepo's working copy of `AUDIT.md` (blob `78c72fd1d1`) differs from the protocols blob (`a52b76653a`): the monorepo
  has uncommitted changes to it. The other seven documents are identical to the protocols blobs.

| File | Blob | Bytes | Applies to this mod |
|---|---|---|---|
| `AGENTS.md` | `bb4c08c1e4` | 3,265 | Yes: settings and translation gates, test-evidence retention, publishing by CI. |
| `AUDIT.md` | `a52b76653a` | 56,358 | Yes: stage chain, Pickle rules, fail-fast policy. |
| `PUBLISHING.md` | `595db194bd` | 45,569 | Yes: licence suffixes, images, thank-you comments, CI, fail fast. |
| `TRANSLATIONS.md` | `8970fe6c4a` | 6,109 | Yes: `localization`, `translation_en`, `translation_fr`. |
| `MOD_SETTINGS.md` | `a61cd54192` | 7,166 | Yes: `settings_audit`, hidden shortcut. |
| `STYLE_RIMWORLD.md` | `a23c0cea81` | 32,360 | Partly: the Preview overlay rules. |
| `EXTERNAL_TOOLS.md` | `8620b7a0e1` | 8,532 | Background only. |
| `SETTINGS_STEAM_DECK.md` | `3303d59d70` | 13,126 | No: the owner's Steam Deck optimizer configuration (not in the owner's list of 2026-09-25 evening). |
| `scripts/SEARCHING.md` | `93d971dc6a` | 9,594 | No: searching the Workshop corpus. |
| `scripts/PICKLE-WSL.md` | `0ff2103b0b` | 218 | Pointer to `PickleTools/Headless/README.md`. |
| `scripts/Tests/README.md` | `b1ab707796` | 3,595 | No: tests of the launcher scripts. |

## Reading 2: the owner's list of 2026-09-25 (evening)

| File | Version read | Blob | Bytes | Notes |
|---|---|---|---|---|
| `PickleTools/README.md` | `PickleTools` HEAD `0a661c9c91` (2026-09-25), file identical to HEAD | `842170847c` | 7,188 | The tool table; `ScreenshotStudio` + `ClearScreen` (`wsl-deps.studio.map`) for presentation captures. |
| `PickleTools/Headless/README.md` | same, identical to HEAD | `0a9d177ded` | 33,295 | Filter terms (`file::text`, `!term`), `-Then`, `-EvidenceDir`, exit codes 0-10, and the built-in wait limits. |
| `PickleTools/Upstream/PENDING.md` | same, identical to HEAD | `99a85fefee` | 22,230 | Pickle v4.9.1 baseline; row 24 is an idea from this mod's session (errors logged before a scenario). |
| `Docs/steps.md` (Pickle, `RimWorks/Rimworld-Pickle`) | tag **`v4.9.1`**, the Pickle the game ran (not `main`) | `0a868879f4` | ~31,900 as saved | Built-in steps. `main` holds a different blob (`2de0dc1794`, 32,597 bytes), not read. |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `Rimworld-Release-Admin` HEAD `2ce34a3b74` (2026-09-25), file clean | `70c5fba3d1` | 30,200 | CI runbook. `generate-publish-workflow.sh --check` says "Up to date: template 683151266dd1" against this HEAD. |

The rest of the list is this mod's own documents, read at this repository's HEAD `ad6bd9b` (before the corrections below):

| File | Blob as read | Bytes | Result |
|---|---|---|---|
| `STATUS.md` | `ec329da5f7` | 53,265 | Read whole. Stale fields found and corrected (below). |
| `README.md` | `d7ce3df21f` | 7,363 | Stale validation paragraph and "OpenAI tools" found; corrected. |
| `CHANGELOG.md` | `b1c53d3fd0` | 3,012 | Identical to `Mod/CHANGELOG.md`. The 1.0.0 entry says F13 and film evidence are pending; not changed, it is shipped history. |
| `ATTRIBUTION.md` | `a09f937f6f` | 3,966 | Consistent; names Codex and OpenAI's image tool. Identical to `Mod/ATTRIBUTION.md`. |
| `LICENSE` | `d74c03e911` | 1,625 | Consistent. |
| `PUBLICATION.md` | `a6bf9ad81d` | 22,043 | Stale claim that Flavor Text Extended has no Workshop id; corrected. |
| `TESTING.md` | `5ddcbd1ac4` | 12,263 | Stale rows and paragraph found; corrected. |
| `Mod/About/About.xml` | `dd844fbf83` | 4,498 | Consistent with its PUBLICATION.md copy; open points below (links, AI tool names, thanks). |
| `docs/runs/` (3 files) | 2026-09-21, 09-23, 09-24 | | Read whole. `2026-09-23.md` has a table broken by a paragraph (cosmetic, not changed). |
| `Tests/Pickle/README.md` | `d18fd63aea` | 19,037 | Read whole. Stale ("Status", "Awaits the fixture", "no Workshop id"); not changed while the tree is frozen for Pickle runs. |
| `Tests/Pickle/` other | | | The nine `wsl-*.map` files read whole; the 21 features read by tags and scenario titles; the ten `Source/*.cs` (907 lines) listed, not re-read line by line. `FakeIngredients/` and `Evidence/` not read. |
| `docs/PROTOCOLS-READ.md` | this file | | |

Listed but **absent** in this mod: `BACKLOG.md`, `NOTES.md`, `BUGS.md`. The monorepo's `BACKLOG.md` (blob `f5b28a5b06`,
107,768 bytes) was searched for this mod (no mention), not read.

## Not read

The code of `scripts/*` and `templates/lychee.toml`; `PickleTools/Authoring/README.md` (not in the list; `AUDIT.md` sends
suite authors to it); `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`; Pickle's `Docs/authoring.md` and `Docs/autorun.md`.

## What the documents ask of this mod, and where it stands (2026-09-25)

Followed already:
- Pickle runs go through `Submit-PickleRun.ps1` with `-Owner`, one pass per request, the SHA in the label, no watcher,
  heartbeat or `Monitor`. Evidence: one line per run in `docs/runs/`, `Tests/Pickle/Evidence/` gitignored.
- CI publication: dry-run of the exact SHA first, `publish` by the full SHA through `dispatch-publish.sh`, only the owner
  approves `steam-production`, tag and release created by the CI (1.0.0: run 36124437186).
- Two identical `ATTRIBUTION.md` (root and `Mod/`), `LICENSE` in `Mod/`, GitHub topics `mod`, `rimworld`, `rimworld-mod`.
- The gallery folder holds only the numbered images (`Art/Gallery/`).

Open:
1. **Thank-you comments.** `WORKSHOP_COMMENTS.md` says Harmony (2009463077) and Flavor Text (3245374432) are already
   `posted` (2026-09-22); the rule is to add this mod to `Covers` and not to post again. The drafts in `PUBLICATION.md` go the
   other way. A first-contact message to hekmo about this derivative would be a reply, not the register's main comment:
   the owner's decision.
2. **Thanks and integrations in the description.** The thanks should name the test tools actually used (Pickle, RimLogging,
   PickleTools, development-only) and thank the author of every integration named or exercised. The description thanks
   hekmo and Harmony only, and now names RIMMSQOL.
3. **AI mention.** Name the real tools: the description says "OpenAI tools"; `ATTRIBUTION.md` names Codex and OpenAI's
   image generation tool.
4. **Workshop links in the description** (rule of 2026-09-22): no mod name carries one. Flavor Text Extended **has a Workshop
   item, `3806100152`** (its `STATUS.md`; v1.1.0 by the CI on 2026-09-24), so `About.xml` should use `steamWorkshopUrl` for it
   instead of `downloadUrl`. Its own page links to this item (`3806100488`), still private.
5. **Language of the repository documents.** Everything in the repository is English. `PUBLICATION.md` holds the French page
   description and French first-contact messages the owner asked for (an exception for the page text itself); the prose
   around them is English.
6. **Preview title hierarchy.** `STYLE_RIMWORLD.md` sets `Extended` at 65 % in the secondary ink; `Art/preview-template.html`
   sets it at 100 %. The section is marked as a trial; not changed, owner's call.
7. **GitHub social preview** is set and still shows the Preview with `(unofficial)`; replaceable only on the repository's web
   settings page.
8. **Putting 1.0.0 into production** is the owner's, by hand: visibility, subscribe to the item's comments, "Watch all
   activity" on this mod and its parent mods, then the date and the three points in `STATUS.md` before `published`.
9. **The first real `update_description`.** `OPERATIONS.md` says `update_description` was not yet proven against a real
   `steamcmd`, and that a publish whose `Mod/` is unchanged may leave no change note. 1.0.0 was published with it; the item is
   private, so only the owner can check that the page carries the new description. Not verified.
10. **Before any `publish` of 1.0.1, even under fail fast:** no red scenario without a green replay (feature 07's lavish
    meals, the cooking pass 2b), the Workshop gallery, the owner's manual validations, the guardrails, the rollback target
    (none: the owner sets the item private).
11. **The `(unofficial)` suffix** is a deliberate exception to `PUBLISHING.md`, justified in
    `_tools/UPSTREAM-PERMISSION-REVIEW.md`.
12. **The cooking scenario (09) and Pickle's clocks.** `steps.md` says the runner drives about 1,200 ticks a second and gives
    `I wait for a {string} to exist` (30 s); `Headless/README.md` measured 500 to 700 ticks a second for `I wait N ticks`. Feature 09
    carries `@watch`, so the game runs at its own speed, which was about 13 ticks a second on the loaded machine. To try after the
    pending runs, on a frozen tree: drop `@watch` or wait in tick slices.
13. **Feature 09 and the three timeouts** (PickleTools, `Authoring/README.md`, "Waiting: fast mode, @watch, and three different timeouts"):
    `@timeout:N` is a per-step default, the scenario watchdog is `-pickle-scenario-timeout` (120 s, not passed by the launcher; the
    `-Extra` of `Submit-PickleRun.ps1` sets it), and `@watch` makes waits real time. `AUDIT.md` reads "`@timeout:N` or
    `-pickle-scenario-timeout` bound one scenario"; the PickleTools reading of the source says the tag is not the watchdog. This
    mod's earlier claim that `@timeout` is honoured on a Scenario and not on a Feature line is withdrawn: it is not explained by the
    source, and the 120 s kill of 2026-09-25 was the watchdog. Pass 2b v8 uses `-Extra '-pickle-scenario-timeout=600'`.

Resolved later on 2026-09-25 (evening), at the owner's word: point 1 (hekmo already written to by the owner; the register
`WORKSHOP_COMMENTS.md` updated in the monorepo root, left uncommitted there because it holds another session's changes; seven `drafted`
rows added for the optional providers), points 2, 3 and 4 (description rewritten: Workshop links, thanks to the test tools and to the authors
of the optional mods and of RIMMSQOL, AI tools named; `About.xml` links Flavor Text Extended's Workshop page), point 6 (the Preview follows the
validated style and is installed). Still open in point 2: the mods behind the tables of [RH2] Faction: V.O.I.D., Medieval Overhaul and
Optimization: Meats (C# Edition), whose Workshop ids are unconfirmed.

Corrected while reading, in this repository's own documents: `README.md` (validation paragraph, AI tool names), `TESTING.md` (feature count,
rows 2b, 3, 4 and the review paragraph), `STATUS.md` (`mod_visibility`, `pushed_at`, `in_game_runs`, three `remaining` items),
`PUBLICATION.md` (Flavor Text Extended's Workshop id). The 1.0.1 content of `Mod/` was then changed on purpose and the cooking request re-deposited
on that tree (the request was last in the queue); `Tests/Pickle/` (its README, feature 09) is still untouched.
