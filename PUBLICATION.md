# Publication

What the Workshop page needs that nothing else in this repository carries, and what will not be
reproducible from this repository alone once written: screenshot order, thank-you messages,
dependencies/DLC to declare, and the adult-content checkboxes. See `PUBLISHING.md` at the monorepo
root for the general workflow; this file is the mod-specific record it asks for.

## Screenshots for the Workshop page

**Not yet produced.** No curated, reviewed set of gameplay screenshots exists in this repository.
The in-game Pickle passes (`Tests/Pickle/`, see `TESTING.md`) take `@review` captures for their own
purpose — proving the settings dialog and a few meal names render correctly — and a few of those
(the settings page, a fine meal's inspect pane, two lavish meals with their info cards) were opened
and validated by the owner on 2026-09-21, but they were taken for verification, not composed or
selected as a Workshop showcase, and they are not stored in the repository (`.build/`, gitignored).

Before the next Workshop update, pick and order 3-5 screenshots from a real playthrough or a
dedicated Pickle capture pass, following STYLE_RIMWORLD.md's rule for a showcase image: the first
one is the most demonstrative, not the prettiest, because Steam displays it large. Candidates, based
on what this mod actually changes:
1. A cooked meal's full French name and description in the inspect pane or info card (the mod's
   whole point).
2. The settings page (`Options → Mod settings → Flavor Text Extended - Français (unofficial)`),
   showing the five controls.
3. A side-dish name using the French joining grammar (`façon`, `avec`), from a lavish meal.
4. Optionally, the elision/aspirated-h contrast (`d'écureuil` vs `de husky`) side by side.

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

## Publication by CI (fail fast)

Steam publications go through GitHub Actions (root `PUBLISHING.md`, "Publier par la CI"). The workflow of this mod
is the manual one (`publish-tag.yml`), for an item that already exists (id 3806100488, pre-published in 0.1.0,
private). Generated on 2026-09-25 with the command below, run from the monorepo root (it writes only under
`.github/`):

```
bash Rimworld-Release-Admin/scripts/generate-publish-workflow.sh FlavorText/FlavorTextExtendedFR --workshop-id 3806100488 --package-id nelim.flavortextextended.fr --release-title "Flavor Text Extended - Français {version}" --require Assemblies/FlavorTextExtendedFR.dll
```

- Fail fast applies to this 1.0.0 (owner, 2026-09-25): publish after the dry-run and the approval, then the
  remaining tests in small tickets; if one is red, roll back and publish a fix.
- Order of operations: dry-run of the exact SHA (`gh workflow run publish-tag.yml --ref main -f ref=<SHA> -f version=1.0.0
  -f mode=dry-run`), then `Rimworld-Release-Admin/scripts/dispatch-publish.sh` with the full SHA. Only the owner approves
  `steam-production`. The CI creates the tag `v1.0.0` and the GitHub release after the upload: never create them by hand
  (the hand-made ones of 2026-09-22 were deleted for that reason).
- Rollback: the Steam button "rétablir cette version" in the item's change history. **Target to choose before publishing
  (the owner):** not chosen yet. The only earlier entry is 0.1.0 (`ed5900b`), which holds the item id and no working content.
- Open: whether the page description is sent by the CI (`--description-file`, a template file) and which gallery folder the
  dry-run lists; asked of CI/CD on 2026-09-25, no answer yet.
- The whole of `Mod/` is uploaded (no `.steamignore`): About, Assemblies, Biotech, Defs, Languages, Patches,
  LoadFolders.xml, ATTRIBUTION.md, CHANGELOG.md, LICENSE.

## After the next Workshop update — do not forget

- Commit `About/PublishedFileId.txt` immediately once it exists; losing it before that commit makes
  the next upload create a second Workshop item.
- The item id is already committed. Subscribe to that item, test for real, then confirm its public
  visibility by hand — RimWorld never calls `SetItemVisibility`.
- Post the thank-you messages above only after the item is public: a link to a private item opens
  for no one.
