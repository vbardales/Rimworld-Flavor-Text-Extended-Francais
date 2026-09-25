# Publication

What the Workshop page needs that nothing else in this repository carries, and what will not be
reproducible from this repository alone once written: screenshot order, thank-you messages,
dependencies/DLC to declare, and the adult-content checkboxes. See `PUBLISHING.md` at the monorepo
root for the general workflow; this file is the mod-specific record it asks for.

## Screenshots for the Workshop page

The gallery images are in `Gallery/` (committed, outside `Mod/`, so they are not uploaded with the mod). **Steam's
gallery is a manual upload**: SteamCMD has one image field, so the CI does not send them; the dry-run only lists this
folder as a reminder. Upload them in the order of their file names. Each one was taken by a Pickle pass (the French pass
of 2026-09-23, `docs/runs/2026-09-23.md`), re-encoded as JPEG (about 0.25 MB each), and **opened and looked at** before
being chosen; none is a mock-up.

1. `01-lavish-meal-french-name-and-description.jpg`: the info card of a lavish meal, "Dolma, façon Œufs de poule tournés à
   jaune coulant". First because it is the most demonstrative: a long French name with the French side-dish joint
   ("façon") and a full French description. (The inspect pane at the bottom left is the selected meal's.)
2. `02-elision-refused-before-aspirated-h.jpg`: "Stroganoff de husky", the aspirated h that refuses the elision
   (never "d'husky"), asserted by feature 19 as well.
3. `03-side-dish-with-french-grammar.jpg`: a lavish meal with a side dish joined by "avec" ("Funeral potatoes avec Huîtres
   des Rocheuses"; the American dish name stays in English on purpose, its description explains it).
4. `04-settings-page-in-french.jpg`: the settings page opened from Options, Mod settings, fully French.

Cropped versions (owner, 2026-09-25: the images must be cropped to what shows the mod, and live in `Art/`) are in
`Art/Gallery/`: the same four files, cut to the dialog. `Gallery/` is the folder the publication of `43dd52d` is pinned to
and stays until that publication is done; the next commit then removes it and regenerates the workflow with
`--gallery-dir Art/Gallery`. **These four were taken on the generic test colony, which is not the right one for a
showcase**: the next captures for the gallery must be made on the presentation colony (`nelim-zen-meadow-studio`, staged with
`ScreenshotStudio` and `ClearScreen` through `wsl-deps.studio.map`), as `PickleTools/Authoring/README.md` says for
presentation scenarios.

Not used: the captures of the RIMMSQOL pages and of the meal made before the translation (F13); they prove behaviour and
show nothing a player would choose this mod for.

## Thank-you messages

One per mod this one is derived from or depends on, personalized, under 1000 characters (Steam
comment limit), posted only after this item is public.

- **hekmo, Flavor Text** (Workshop 3245374432) — the source text this mod translates. Draft:

  > Hi hekmo — thank you for Flavor Text and its naming machinery. I have prepared a French-language companion for Flavor Text and Flavor Text Extended, credited here and in its documentation. It translates the dish text and adds French ingredient/side-dish grammar; it does not add dishes or replace your mod. If you would like attribution or wording changed, please let me know and I will update it. Thank you again for the foundation your work provides.

- **Harmony** (brrainz, Workshop 2009463077) — hard dependency, the language-aware patch runs
  through it. Draft:

  > Thank you, brrainz, for Harmony. This French companion for Flavor Text and Flavor Text Extended uses Harmony only for its language-aware runtime patches, and credits Harmony in its Workshop description and repository. It remains a required dependency because those patches rely on it. Your work makes this small compatibility layer possible.

Flavor Text Extended is this mod's own companion (same author), not a thank-you target.

## Dependencies and DLC

**Hard dependencies** (`modDependencies` in `About.xml`, technically required — the mod will not
load without them):
- `brrainz.harmony` — Harmony, used directly by `Source/RuntimePatches.cs` and
  `Source/PatchOperationFrench.cs`.
- `hekmo.FlavorText` — the mod this translates; every DefInjected handle targets its defs.
- `nelim.flavortextextended` — the sibling mod (901 Extended dishes) this also translates. No
  Workshop id: published on GitHub only
  ([Rimworld-Flavor-Text-Extended](https://github.com/vbardales/Rimworld-Flavor-Text-Extended)),
  linked via `downloadUrl`.

**DLC:** none required. `supportedVersions` declares 1.6 only. `Mod/LoadFolders.xml` loads the
`Biotech` folder only `IfModActive="Ludeon.RimWorld.Biotech"` — twelve translations for six
Biotech-only dishes that do not exist without it. Anomaly and Odyssey need no gate: Flavor Text
declares their ingredient tables unconditionally, and this mod's patches target those tables the
same way regardless of whether the DLC is owned.

**Recommended, not required** (`loadAfter` only, never `modDependencies`): the eleven third-party
mods whose ingredient tables this mod also translates (`Inflections_ThirdParty_FR.xml`) —
Optimization: Meats, VGP Vegetable Garden, VGP Garden Gourmet, Vanilla Plants Expanded - More
Plants, Vanilla Cooking Expanded, [RH2] Faction: V.O.I.D., VV New Harvest, RimCuisine 2 Core, Kit's
Brazilian Crops, Medieval Overhaul, TP Sea Plants — plus the Shenzhou provider
(`Dajian.ChiTeaditional.Expanded`) for the FoodCourt-discovered dishes. None of them is declared a
dependency: their absence costs nothing (the entries they'd translate simply never appear), and
forcing a download on everyone for eleven optional tables would be wrong per PUBLISHING.md. Verified
in sources, not by intention: see `Mod/Patches/Inflections_ThirdParty_FR.xml` and
`Ext_FoodCourtDiscovery.xml`.

## Adult content

**No.** Nothing in this mod adds, depicts, or names adult content. It translates existing dish names
and descriptions; the ModIcon and Preview were opened and inspected (see `STATUS.md`). Both Workshop
checkboxes should be left unchecked.

## Steam version notes

The publication workflow reads the change note from the heading below (a fenced block, BBCode as Steam
will show it, 8000 bytes at most). Nothing else in this section is read by it.

### 1.0.0

```
[b]1.0.0 - first public release[/b]
[list]
[*] French names and descriptions for 930 Flavor Text dishes and 901 Flavor Text Extended dishes.
[*] French ingredient inflections (four tables, 150 predefined entries, the eleven third-party tables and neutral forms for unlisted ingredients) and French side-dish grammar (elision before a vowel, none before an aspirated h).
[*] The five Flavor Text settings in French, under this mod's own name, sharing the upstream configuration; a hidden MainButtons shortcut that RIMMSQOL can reveal.
[*] Applies only when the game language is French; in any other language it changes nothing.
[*] Requires Flavor Text, Flavor Text Extended and Harmony. See the Workshop description and the GitHub source for compatibility and known limits.
[/list]
```

### 1.0.1

```
[b]1.0.1[/b]
[list]
[*] Fixed: a side dish no longer starts with a capital after a French joint ("Dolma, façon œufs de poule" instead of "façon Œufs de poule"). A dish whose own name is a proper noun keeps its capital.
[/list]
```

## Steam description

Source of the page description sent by the CI (`update_description` on): the fenced block below, BBCode as Steam shows it,
8000 bytes at most, no double quote and no backslash (the CI turns every double quote into a typographic one). It is the
same text as `<description>` in `Mod/About/About.xml`, which Steam only reads when an item is created: after that this block
is the source, so change both together. The dry-run prints its size, its SHA-256 and a line diff against the current page.

```
UNOFFICIAL. This mod is published without the original author's explicit consent.
If the original author contacts me to request its removal, I undertake to take it down promptly.

French dish names, descriptions and ingredient forms for Flavor Text and Flavor Text Extended.

[h2]What it translates[/h2]

The names and descriptions of 930 Flavor Text dishes and 901 Flavor Text Extended dishes, the five Flavor Text settings, predefined ingredient inflections and side-dish sentence templates. No new dishes are added by this translation.

[h2]Languages[/h2]

French ingredient forms carry their own articles and prepositions, for example « aux baies » and « de bœuf ». A small language-aware patch applies these forms and the side-dish grammar only when French is selected. English keeps the original dependencies' text and inflection tables. Switching the game's language restarts it, so this has been checked with a clean start in each language.

[h2]Compatibility[/h2]

Requires RimWorld 1.6, [i]Flavor Text[/i] by hekmo, and [i]Flavor Text Extended[/i], in that order. Harmony is a direct dependency of this translation. Optional cooking and farming mods are not required; their ingredients determine which dishes can actually appear. Biotech-specific translations load only with Biotech.

[h2]Settings[/h2]

Use [b]Options → Mod settings → Flavor Text Extended - Français (unofficial)[/b] for the five shared Flavor Text settings. The original page uses the same configuration. An optional MainButtons shortcut is hidden by default and can be revealed by customization mods. No customization mod is required for primary access. Restart after changing recipe matching or dynamic meal detection to rebuild caches.

[h2]Known limits[/h2]

Unlisted ingredients use neutral French forms built from their localized labels; unknown irregular singulars and missing third-party translations cannot be inferred. All seven category forms and the hairy-meal prefix are translated. Language isolation, the settings page and shortcut, French meal naming, the tables of the optional ingredient mods, meals saved before the translation and RIMMSQOL all have technical and in-game coverage; the filmed cooking with a colonist is still being verified (tracked in STATUS.md).

[hr][/hr]

[h2]If I go quiet[/h2]

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

[h2]AI-generated[/h2]

Translation work used Claude (Anthropic) under human direction and review; subsequent fixes, testing and image editing used both Claude and OpenAI tools.

[h2]Thanks[/h2]

Thanks to [b]hekmo[/b] for [i]Flavor Text[/i] and its naming machinery, and to [b]Harmony[/b], which this translation's language-aware patch depends on.

No explicit upstream permission has been established; see ATTRIBUTION.md and LICENSE for the exact scope. The local MIT notice applies only to rights held by the contributor and grants no rights in the upstream material.

[url=https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais]Source code on GitHub[/url]
```

## Publication by CI (fail fast)

Steam publications go through GitHub Actions (root `PUBLISHING.md`, "Publier par la CI"). The workflow of this mod
is the manual one (`publish-tag.yml`), for an item that already exists (id 3806100488, pre-published in 0.1.0,
private). Generated on 2026-09-25 from the pushed template of Rimworld-Release-Admin (`a94c0fe`, stamp
`683151266dd1`) with the command below, run from the monorepo root (it writes only under `.github/`):

```
bash Rimworld-Release-Admin/scripts/generate-publish-workflow.sh FlavorText/FlavorTextExtendedFR --replace --workshop-id 3806100488 --package-id nelim.flavortextextended.fr --release-title "Flavor Text Extended - Français {version}" --require Assemblies/FlavorTextExtendedFR.dll --description-file PUBLICATION.md --description-heading '^## Steam description$' --gallery-dir Gallery
```

- Fail fast applies to this mod (owner, 2026-09-25): publish after the dry-run and the approval, then the remaining tests in
  small tickets; if one is red, fix and publish the fix.
- Order of operations: dry-run of the exact SHA (`gh workflow run publish-tag.yml --ref main -f ref=<SHA> -f version=<version>
  -f mode=dry-run -f update_description=true`), then `Rimworld-Release-Admin/scripts/dispatch-publish.sh` with the full SHA and
  the same option. Only the owner approves `steam-production`. The CI creates the tag `v<version>` and the GitHub release
  after the upload: never create them by hand (the hand-made `v1.0.0` of 2026-09-22 was deleted for that reason).
- Rollback: **no rollback target** (owner, 2026-09-25). If a published version turns out to be wrong, the owner sets the item
  back to private on Steam; nothing is restored. The Steam button "rétablir cette version" of the item's change history exists
  if a target is ever wanted.
- Description and gallery (owner, 2026-09-25): the description is sent by the CI (`## Steam description` above,
  `update_description` on, the same option in the dry-run and in the publish); the gallery is only listed (manual upload,
  `Gallery/` for 1.0.0, then `Art/Gallery/`).
- The whole of `Mod/` is uploaded (no `.steamignore`): About, Assemblies, Biotech, Defs, Languages, Patches,
  LoadFolders.xml, ATTRIBUTION.md, CHANGELOG.md, LICENSE.
- 1.0.0: SHA `43dd52da70c3ffbdb3ab55c7301e877be88040e9`, dry-run 36122774168, publish run 36124437186 approved by the owner
  on 2026-09-25. 1.0.1 (side dish in lower case after a French joint) follows as its own publication.

## After the next Workshop update — do not forget

- Commit `About/PublishedFileId.txt` immediately once it exists; losing it before that commit makes
  the next upload create a second Workshop item.
- The item id is already committed. Subscribe to that item, test for real, then confirm its public
  visibility by hand — RimWorld never calls `SetItemVisibility`.
- Post the thank-you messages above only after the item is public: a link to a private item opens
  for no one.
