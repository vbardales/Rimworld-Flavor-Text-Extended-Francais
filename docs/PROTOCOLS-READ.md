# Protocols read, and in which version

A local record of which shared protocol documents this mod's session has read, from which revision, and what
each one asks of this mod. It is not a copy of them: the documents live in the protocols repository and change.
When a revision below is no longer the head of `main`, the "read" claims here are stale for whatever changed.

## Source

- Repository: `vbardales/Rimworld-protocols` (GitHub, default branch `main`).
- Read from the local bare clone `C:\Users\nelim\Documents\rimworld-protocols.git`, branch `main`, at
  **`359a460a5dfc558d008b5b4e3444f56e61ad4b94`** (2026-09-25, "docs(publishing): fail fast lifts only the regression pass;
  a red scenario needs a green replay before publish").
- GitHub's `main` answered `9e7142611b17a807fa0a11ee01f583242a8cab05` ("docs(audit): the fail-fast policy also covers a
  1.0.0", 2026-09-25 09:50 UTC) when queried the same day: the local clone was one commit ahead. The difference is the
  fail-fast wording of `PUBLISHING.md`.
- The monorepo's working copy of `AUDIT.md` (blob `78c72fd1d1`) differs from the protocols blob (`a52b76653a`): the monorepo
  has local, uncommitted changes to it. The other seven documents are identical to the protocols blobs.
- Read on 2026-09-25 by the session "Flavor Text Extended - Français / done" (`local_2ef615f6-108d-4da0-b599-e79a80b8887a`,
  confirmed with `get_session("self")`).

## Documents read in full

| File | Blob | Bytes | Applies to this mod |
|---|---|---|---|
| `AGENTS.md` | `bb4c08c1e4` | 3,265 | Yes: settings and translation gates, test-evidence retention, publishing by CI. |
| `AUDIT.md` | `a52b76653a` | 56,358 | Yes: stage chain, Pickle rules, fail-fast policy. |
| `PUBLISHING.md` | `595db194bd` | 45,569 | Yes: licence suffixes, images, thank-you comments, CI, fail fast. |
| `TRANSLATIONS.md` | `8970fe6c4a` | 6,109 | Yes: `localization`, `translation_en`, `translation_fr` fields. |
| `MOD_SETTINGS.md` | `a61cd54192` | 7,166 | Yes: `settings_audit`, hidden shortcut. |
| `STYLE_RIMWORLD.md` | `a23c0cea81` | 32,360 | Partly: the Preview overlay rules (title hierarchy, tag, badge, palette file). |
| `EXTERNAL_TOOLS.md` | `8620b7a0e1` | 8,532 | Background only (no tool adopted by this mod). |
| `SETTINGS_STEAM_DECK.md` | `3303d59d70` | 13,126 | No: an optimizer-mods configuration for the owner's Steam Deck. |
| `scripts/SEARCHING.md` | `93d971dc6a` | 9,594 | No: searching the Workshop corpus. |
| `scripts/PICKLE-WSL.md` | `0ff2103b0b` | 218 | Pointer to `PickleTools/Headless/README.md`. |
| `scripts/Tests/README.md` | `b1ab707796` | 3,595 | No: tests of the launcher scripts. |

Also read, outside the protocols repository because `PUBLISHING.md` sends to it: `WORKSHOP_COMMENTS.md` at the monorepo root
(working-copy blob `04c716300c`, modified 2026-09-25 14:05, last committed 2026-09-24).

## Not read

The code of `scripts/*` and `templates/lychee.toml`; `PickleTools/README.md`, `PickleTools/Authoring/README.md` and
`PickleTools/Headless/README.md`; `Rimworld-Release-Admin/docs/OPERATIONS.md`; `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`.
The parts of these that this mod relies on were learned from the session's own work (2026-09-22 to 2026-09-25) and from the
peer sessions, not re-read here.

## What the protocols ask of this mod, and where it stands (2026-09-25)

Followed already:
- Pickle runs go through `Submit-PickleRun.ps1` with `-Owner`, one pass per request, the SHA in the label, the tree frozen until
  `RUN_DONE`; no watcher, heartbeat or `Monitor` (AUDIT.md, "Tests Pickle").
- Test evidence: one line per run in `docs/runs/`, `Tests/Pickle/Evidence/` gitignored, superseded reports deleted.
- CI publication: dry-run of the exact SHA first, `publish` by the full SHA through `dispatch-publish.sh`, only the owner approves
  `steam-production`, tag and release created by the CI (1.0.0: run 36124437186).
- Two identical `ATTRIBUTION.md` (root and `Mod/`), `LICENSE` in `Mod/`, GitHub topics `mod`, `rimworld`, `rimworld-mod`.
- The gallery folder holds only the numbered images (`Art/Gallery/`), which is the `--gallery-dir` rule of `PUBLISHING.md`.

Open, found while reading (none changed by the reading itself):
1. **Thank-you comments.** `WORKSHOP_COMMENTS.md` says Harmony (2009463077) and Flavor Text (3245374432) are already `posted`
   (2026-09-22); the rule is to add this mod to `Covers` and not to post again. The messages drafted in `PUBLICATION.md` go the
   other way, and this mod is not yet in either `Covers`. Owner's decision: a first-contact message to hekmo about this
   derivative, which he never heard of, would be a reply, not the register's main comment.
2. **Thanks and integrations in the description.** `PUBLISHING.md` asks the thanks to name the test tools actually used (Pickle,
   RimLogging, PickleTools, as development-only) and to thank the author of every integration named, claimed or exercised.
   The description thanks hekmo and Harmony only, and the 1.0.1 text now names RIMMSQOL, which pass 7 exercises.
3. **AI mention.** The rule is to name the real tools. The description says "OpenAI tools"; `ATTRIBUTION.md` names Codex and
   OpenAI's image generation tool.
4. **Language of the repository documents.** Everything in the repository is English. `PUBLICATION.md` holds the French page
   description and the French first-contact messages the owner asked for (an owner exception for the page text itself); the
   prose around them is English as of this record.
5. **Preview title hierarchy.** `STYLE_RIMWORLD.md` says `Flavor Text Extended` is `Flavor Text` at 100 % in the primary ink and
   `Extended` at 65 % in the secondary ink. `Art/preview-template.html` sets `Extended` at 100 %. The section is marked as a
   trial ("essai du 2026-09-12"); not changed, owner's call.
6. **GitHub social preview** is set (custom image). It still shows the Preview with the `(unofficial)` tag; it can only be
   replaced on the repository's web settings page.
7. **Putting 1.0.0 into production** is the owner's, by hand: change visibility, subscribe to the item's comments, "Watch all
   activity" on this mod and its parent mods, then record the date and the three points in `STATUS.md` before `published`.
8. **Before any `publish` of 1.0.1, even under fail fast:** no red scenario without a green replay, the Workshop gallery, the
   owner's manual validations, the guardrails, and the rollback target (none: the owner sets the item private).
9. **The `(unofficial)` suffix** is a deliberate exception to `PUBLISHING.md`, justified in
   `_tools/UPSTREAM-PERMISSION-REVIEW.md`.
