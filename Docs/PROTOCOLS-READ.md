# Documentation read, and in which version

A local record of which shared documents this mod's session has read, from which blob, and what each asks of this mod.
It is not a copy of them: they live in other repositories and change. A blob below that no longer matches the file on
disk (`git hash-object <file>`) means the "read" claim is stale for that file: re-read it, and skip the ones marked
"not useful" unless their blob moved.

Previous reading: 2026-09-25 by this mod's session (protocols `359a460a5f`, PickleTools `0a661c9c91`, Release-Admin
`2ce34a3b74`). Everything below supersedes it.

## Reading of 2026-10-02

Session "flavortextextended.fr / options" (id from `get_session("self")` at the time: `local_f87192e7-3bf3-42f8-a553-11e7386eda3b`, the Code session
that applied `AUDIT.md`). Paths are relative to the `rimworld` monorepo root. Blobs are `git hash-object` of the working copy
on 2026-10-02 (first 10 characters). "Read" means the whole file; where a delegated reader summarised it, it says so.

| File | Blob | Bytes | Read by | Useful to this mod |
|---|---|---|---|---|
| `AGENTS.md` | `44dddcbc8f` | 2,716 | session, whole (injected as project instructions) | Yes: gates order, evidence retention, publishing by CI. |
| `AUDIT.md` | `daab030ccf` | 69,900 | session, whole | Yes: stage chain, `tested` criteria (no `@wip`, conditional scenarios, no manual test), backward audit (step 12), Pickle rules. |
| `PUBLISHING.md` | `11de03424f` | 64,935 | session, whole | Yes: gallery `0-` rule, desktop.ini, thanks, CI, fail fast, upstream PR rule. |
| `TRANSLATIONS.md` | `7b4d9a23bd` | 14,121 | session, whole | Yes: French review by Virginie (`FRENCH_REVIEW.md`), neutral forms, plural keys. |
| `MOD_SETTINGS.md` | `a61cd54192` | 7,166 | delegated reader, whole (blob identical to the 2026-09-25 reading) | Yes, narrowly: `settings_audit` record; this mod's result stays `complete` (bridge to upstream's settings, hidden shortcut). |
| `STYLE_RIMWORLD.md` | `773961397c` | 50,854 | delegated reader, whole | Partly: Preview overlay and gallery `0-` rules; the illustration prompt rules do not apply. |
| `WORKSHOP_COMMENTS.md` | `cdd3381ba9` | 28,446 | delegated reader, whole | Yes: every recipient of this mod is already `posted`; a new external credit needs a new row. |
| `scripts/SEARCHING.md` | `45f0fa13cc` | 12,230 | delegated reader, whole | **Not useful** here (corpus search); only if a defName collision must be traced. |
| `PickleTools/README.md` | `1d28b27e67` | 9,028 | delegated reader, whole | Marginal: tool table; the tools this mod stages are already named in `Tests/Pickle/README.md`. |
| `PickleTools/Headless/README.md` | `c023a674fb` | 39,421 | delegated reader, whole | Yes: launcher, `-EvidenceDir`, exit codes, pass naming, map trailing newline. |
| `PickleTools/Authoring/README.md` | `75329decf2` | 25,502 | delegated reader, whole | Yes: pass matrix, timeouts, evidence reading and policy. |
| `PickleTools/docs/steps.md` | `8639a06971` | 33,092 | delegated reader, whole | **Not useful** to re-read: a generated catalogue; look a step up only when writing one. |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `347a0d63b9` | 15,568 | delegated reader, whole | Yes: dry-run, full SHA, `steam-production`, description source, change-note format. |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `1bdd1eed63` | 12,663 | delegated reader, whole | Yes: which test to run, owner id, evidence trimming. |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `7ab5e437d4` | 13,983 | delegated reader, whole | Yes: `Submit-PickleRun.ps1` flags, `-EvidenceDir` is never overwritten, `-RunTimeoutMinutes 120` for a full pass. |
| `PickleTools/TESTING.md`, "What to keep after a test" | n/a | n/a | session, that section only | Yes: the table of what to keep and delete; applied in this mod's `TESTING.md`. |

This mod's own documents, read on 2026-10-02 at HEAD `25bf8e3`: `STATUS.md` (front matter and the dated sections, whole),
`TESTING.md` (whole), `CHANGELOG.md` (first 20 lines), `PUBLICATION.md` (the gallery and Workshop sections, not the whole),
`docs/runs/` (`2026-09-26.md` whole; the others by their headings and the evidence paths they cite), `Tests/Pickle/` (the
features' tags and titles, the pass maps' names, the evidence folders by their `summary.json`), `Mod/About/About.xml`
(`modDependencies`, name, description tail only, via the checks below), `README.md` and `ATTRIBUTION.md` (not re-read: unchanged
since 2026-09-25, same size), `LICENSE` (not re-read).

Absent in this mod, as on 2026-09-25: `BACKLOG.md`, `NOTES.md`, `BUGS.md`. There is no `BACKLOG.md` to carry an upstream
pull request: see "Upstream" in `STATUS.md`.

## Not read, and why

The scripts under `scripts/` (not asked), `PickleTools/Upstream/PENDING.md` (nothing in this audit touches Pickle itself),
Pickle's `Docs/authoring.md` and `Docs/autorun.md`, `Rimworld-Ticket-Dispatcher` code.

## What the documents ask of this mod, and where it stands (2026-10-02)

Applied in this session: evidence cleaned and minified, with the keep/delete list in `TESTING.md`; `Mod/desktop.ini` removed
from git and ignored (Steam ships `Mod/` as is); the gallery renamed to the single-digit scheme (`0-preview.png`, `1-` to `4-`;
`0-` is byte-identical to `Mod/About/Preview.png`); `workflow_stage` added to `STATUS.md`; the session title set to
`flavortextextended.fr / options`.

Open, and not a session's to do:
1. **ModIcon weight.** `Mod/About/ModIcon.png` is 1254 x 1254 and 1,444,880 bytes; `PUBLISHING.md` says about 128 px is enough and
   warns about exactly this weight. The icon reads at 32 px (checked: the winking mascot and the bowl stay recognisable), so the
   defect is the weight, not the legibility. Only the owner generates or replaces a ModIcon, and a session may resize one only
   with her explicit agreement for that file.
2. **French review by Virginie** (`TRANSLATIONS.md`, 2026-09-30): `FRENCH_REVIEW.md` is generated; the dated review line under
   `Translation audit` is hers to write. A session never writes it.
3. **Replay of feature 07 and the non-regression passes at the end**, on the final revision, in small tickets: see `TESTING.md`.
4. **Upstream pull request.** The upstream mod Flavor Text (hekmo) has no git repository (a GitHub search on 2026-10-02 finds
   only the owner's two repositories), so there is nothing to send a pull request to. Flavor Text Extended is the owner's own
   repository (`vbardales/Rimworld-Flavor-Text-Extended`): changes belong there directly.

## Re-check of 2026-10-08

Blobs now (`git hash-object`), against the table above. Unchanged: `AGENTS.md` `44dddcbc8f`, `MOD_SETTINGS.md` `a61cd54192`,
`Headless/README.md` `c023a674fb`, `Authoring/README.md` `75329decf2`. **Changed since 2026-10-02, not re-read whole**:

| File | New blob | What was read |
|---|---|---|
| `AUDIT.md` | `689f79b78c` | Commit `bc206b5` diff only: `prepublished` needs the gallery ready; candidate images are named `<n>-candidate-<name>` (under 2 MB each, 8 MB per folder). Does not change the retained stage (`showcase` / `options`). |
| `PUBLISHING.md` | `32f93cf148` | Headlines of the gallery rules added 2026-10-02 to 10-06 (staged photos, one story, living things, Preview source set `Art/Preview.config.json`). **Not read in full**: re-read before the gallery of 1.1.0 is retaken. |
| `TRANSLATIONS.md` | `da906f82cc` | Not re-read; no commit to it since 2026-10-02 in the protocols log, so the blob difference is line-ending or local only: unverified. |
| `STYLE_RIMWORLD.md`, `WORKSHOP_COMMENTS.md`, `SEARCHING.md`, `PickleTools/README.md`, `steps.md`, `OPERATIONS.md`, `WELCOME.md`, `SUBMIT.md` | moved | Not re-read. Still "not useful" for `SEARCHING.md` and `steps.md`. |

Another session migrated the Preview sources on 2026-10-03 (`Art/Preview.config.json`, see `STATUS.md`); its changes were still
uncommitted in this tree on 2026-10-08 and were left alone.
