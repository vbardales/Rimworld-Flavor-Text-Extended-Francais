# Publication

What the Workshop page needs that nothing else in this repository carries, and what will not be
reproducible from this repository alone once written: screenshot order, thank-you messages,
dependencies/DLC to declare, and the adult-content checkboxes. See `PUBLISHING.md` at the monorepo
root for the general workflow; this file is the mod-specific record it asks for.

## Screenshots for the Workshop page

The gallery images are in `Art/Gallery/` (committed, outside `Mod/`, so they are not uploaded with the mod; it is the `--gallery-dir` of the
publication workflow, and holds only the numbered images). **Steam's gallery is a manual upload**: SteamCMD has one image field, so the CI
does not send them; the dry-run only lists this folder as a reminder. Upload them in the order of their file names. Each one was taken by a
Pickle pass, cropped to the dialog (the scenarios' captures are full frames; the crop is done by hand, a 950 x 440 rectangle at
485, 160), re-encoded as JPEG, and **opened and looked at**; none is a mock-up. All four come from the generic test colony, not the
presentation colony; the owner accepted them on 2026-09-25 (the meals of 01 and 03 come from the 1.0.1 run, so the side dishes read in lower case).

1. `01-lavish-meal-french-name-and-description.jpg`: "Ragoût mulligan et kakigōri (plat gastronomique)", the info card of a lavish meal: a
   French name with a joint, and the description of the main dish and of the side dish. First because it is the most demonstrative.
   (`Tests/Pickle/Evidence/2026-09-25-1-0-1-lavish-meals`, request 63b1.)
2. `02-elision-refused-before-aspirated-h.jpg`: "Stroganoff de husky", the aspirated h that refuses the elision (never "d'husky"),
   asserted by feature 19 as well (2026-09-23 French pass).
3. `03-side-dish-with-french-grammar.jpg`: "Barre énergétique aux pommes de terre avec yaourt (plat gastronomique)": the "avec" joint and
   a side dish in lower case (63b1).
4. `04-settings-page-in-french.jpg`: the settings page opened from Options, Mod settings, fully French (2026-09-23).

Not used: the captures of the RIMMSQOL pages and of the meal made before the translation (F13); they prove behaviour and show nothing a
player would choose this mod for.

## Thank-you messages and the register

The register is `WORKSHOP_COMMENTS.md` at the monorepo root (one main comment per recipient page for the whole collection). State on
2026-09-25:

- **hekmo, Flavor Text** (3245374432): the owner has already sent her message (reported 2026-09-25). Nothing to post.
- **Harmony** (2009463077), **Pickle** (3791648678), **RimLogging** (3733484696) and **RIMMSQOL** (1084452457): already `posted` in the
  register; this mod is added to their `Covers`. Nothing to post.
- **Flavor Text Extended** and **PickleTools** are the author's own projects: not applicable.
- **The optional mods whose tables are covered** are thanked in the description. `VV - New Harvest` is `posted` (covered by Flavor Text
  Extended) and Shenzhou (2877536640) `drafted`. Vanilla Cooking Expanded (2134308519), Vanilla Plants Expanded - More Plants (2748889667),
  Kit's Brazilian Crops (2886512401), VGP Vegetable Garden (2007061826), VGP Garden Gourmet (2007062982), RimCuisine 2 Core (2562519366)
  and TP Sea Plants (3643012859) had no row: `drafted` rows are added, the comments are still to write, and to post only once this item is
  public. The owner decides whether to write them.
- **Thanked since 2026-09-25, checked offline only:** [RH2] Faction: V.O.I.D. (2883208829, Chicken Plucker; the page name matches
  `RH2.Faction.VOID`), Medieval Overhaul (3219596926, SirLalaPyon, continued by EvilEyes and ViralReaction; 3220265769 is a collection, not
  the mod; the packageId `DankPyon.Medieval.Overhaul` is not shown by Steam, so not verified) and Optimization: Meats - C# Edition
  (2542931556, SeoHyeon). No pass stages them (owner's word, 2026-09-21); the description says so. Three `drafted` rows added to the register.

## Thank-you comments to post (drafted 2026-09-25, rewritten twice the same day: fan-toned, each one different)

The item is public (owner, 2026-09-25), so these can be posted. One main comment per recipient page, in English like the ones already sent, under Steam's 1,000-character limit, ending with this mod's item URL. Only the owner posts. After posting, change the row in `WORKSHOP_COMMENTS.md` to `posted` with the date. Nothing here claims a tested integration: Vanilla Cooking Expanded, More Plants, Kit's Brazilian Crops, both VGP mods, RimCuisine 2 and TP Sea Plants were loaded by the in-game passes; V.O.I.D., Medieval Overhaul and Optimization: Meats are covered by offline checks only, and their comments say only that the French forms exist.

**Credits corrected 2026-09-25 (after the owner's remark):** RimCuisine 2 Core (Continued) is Mlie's update of Crustypeanut's mod (original 1833592062); Kit's Brazilian Crops (Continued) is Zaljerem's update of a mod by Kitsune (original 2388898158). The description now says so; it reaches the Steam page with the next `update_description` publication. The Kit's comment already posted thanks Zaljerem only.

**Posted by the owner on 2026-09-25** (texts not kept here; the drafts were replaced by the ones below): Vanilla Cooking Expanded (2134308519), Vanilla Plants Expanded - More Plants (2748889667), Kit's Brazilian Crops (2886512401), VGP Vegetable Garden (2007061826), VGP Garden Gourmet (2007062982).

**Mlie, continuing Crustypeanut — RimCuisine 2 Core (Continued)** ([Workshop 2562519366](https://steamcommunity.com/sharedfiles/filedetails/?id=2562519366)) — 400 characters

> Fun fact: RimCuisine 2 shared a test colony with the French translation of Flavor Text Extended 🍰 Its ingredients get French names in the meal titles, restaurant-menu style, and it all happens quietly when both are loaded. Mlie, thank you for bringing the cookbook back for 1.6, and to Crustypeanut for writing it in the first place! https://steamcommunity.com/sharedfiles/filedetails/?id=3806100488

**Tanypredator — TP Sea Plants** ([Workshop 3643012859](https://steamcommunity.com/sharedfiles/filedetails/?id=3643012859)) — 319 characters

> Seaweed on the menu?! 🌊🦑 Tanypredator, thanks to TP Sea Plants my colonists can eat from the sea, and the French translation of Flavor Text Extended has French words for your plants so those dishes come out with real names. Merci for the ocean snacks! https://steamcommunity.com/sharedfiles/filedetails/?id=3806100488

**Chicken Plucker — [RH2] Faction: V.O.I.D.** ([Workshop 2883208829](https://steamcommunity.com/sharedfiles/filedetails/?id=2883208829)) — 374 characters

> Chicken Plucker, your page says nobody should install this under any circumstances, so naturally I read all of it 🖤 The French translation of Flavor Text Extended has a French word for your bone meat, so a V.O.I.D. dinner gets a proper name. No, I'm not joining the research programme. Thanks for the chaos! https://steamcommunity.com/sharedfiles/filedetails/?id=3806100488

**SirLalaPyon, continued by EvilEyes and ViralReaction — Medieval Overhaul** ([Workshop 3219596926](https://steamcommunity.com/sharedfiles/filedetails/?id=3219596926)) — 360 characters

> Hear ye, hear ye! 🏰 Mulberries, pumpkins, flax, salt and cave eggs from Medieval Overhaul now have French names in the French translation of Flavor Text Extended, so a peasant feast reads like a tavern menu. Thank you SirLalaPyon for the mod, and EvilEyes and ViralReaction for carrying it on! https://steamcommunity.com/sharedfiles/filedetails/?id=3806100488

**SeoHyeon — Optimization: Meats - C# Edition** ([Workshop 2542931556](https://steamcommunity.com/sharedfiles/filedetails/?id=2542931556)) — 297 characters

> Less meat, more names 🥩 SeoHyeon, your mod folds the animal meats into a few, so the French translation of Flavor Text Extended only had a few French words to add ("viande de bœuf" and friends). Tidy freezer, tidy menu. Thank you! https://steamcommunity.com/sharedfiles/filedetails/?id=3806100488

**Kitsune (account Covre) — Kit's Brazilian Crops, the original** ([Workshop 2388898158](https://steamcommunity.com/sharedfiles/filedetails/?id=2388898158)) — 372 characters. Asked by the owner on 2026-09-25 after the credit correction. The page is tagged finished and its creator answers in Portuguese.

> Olá, Kitsune! 🦊🍍 Your Brazilian crops are still going strong: Zaljerem's continued version now has French names too, thanks to the French translation of Flavor Text Extended, so the colony's plates read a little more Brasil. Nothing needed from you, only a big obrigada for the crops that started it all! https://steamcommunity.com/sharedfiles/filedetails/?id=3806100488

Not written: Chinese Traditional Cultural Things Expanded (2877536640). A comment was already posted there on 2026-09-22 (see `FlavorText/FlavorTextExtended/PUBLICATION.md`, "Additional Steam comment"), while the register still says `drafted`: the register row is to be corrected to `posted` by whoever owns that record.

## Workshop page fields

- **Required items** (the page's "required items"): Harmony (2009463077), Flavor Text (3245374432), Flavor Text Extended (3806100152).
  No DLC. Not required: the optional providers and RIMMSQOL.
- **Content descriptors:** none applies (nothing here is nudity or sexual content, frequent violence or gore, adult-only sexual content or general
  mature content: this mod translates dish names and descriptions). See "Adult content" below.

## Dependencies and DLC

**Hard dependencies** (`modDependencies` in `About.xml`, technically required — the mod will not
load without them):
- `brrainz.harmony` — Harmony, used directly by `Source/RuntimePatches.cs` and
  `Source/PatchOperationFrench.cs`.
- `hekmo.FlavorText` — the mod this translates; every DefInjected handle targets its defs.
- `nelim.flavortextextended` — the sibling mod (901 Extended dishes) this also translates. It has a Workshop item,
  `3806100152` (its `STATUS.md`: v1.0.0 on 2026-09-22, v1.1.0 by the CI on 2026-09-24), and a GitHub repository
  ([Rimworld-Flavor-Text-Extended](https://github.com/vbardales/Rimworld-Flavor-Text-Extended)). This mod's `About.xml` still links
  it only through `downloadUrl` (GitHub): to be changed to `steamWorkshopUrl` (`steam://url/CommunityFilePage/3806100152`) in 1.0.1,
  and the description names should carry Workshop links (`PUBLISHING.md`, "Lien Workshop sur chaque nom de mod cité"). The
  staging of the Pickle passes still uses a machine-local link for it, from before it had an id.

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

## French description (manual addition, owner, 2026-09-25)

Added by hand on the Workshop page, on top of the English description the CI sends (an owner exception: the repository rule is English,
but the page text itself is what she asked for in French). The page title does not change (`Flavor Text Extended - Français`, without
`(unofficial)` since 2026-09-25, so that a search for `Flavor Text Extended` finds it); the owner edits the French and English titles by
hand. The CI does not read this block: its heading is not `## Steam description`. No double quote, no backslash. Keep it in step with
the English block whenever that one changes.

```
[h1]Extension pour texte d'ambiance culinaire : traduction en français de Flavor Text Extended (non-officiel)[/h1]

NON OFFICIEL. Ce mod est publié sans le consentement explicite de l'auteur original (mais celui-ci a jusqu'ici bien accueilli les traductions et les addons).
Si l'auteur original me contacte pour en demander le retrait, je m'engage à le retirer rapidement.

Noms de plats, descriptions et formes d'ingrédients en français pour [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] et [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806100152]Flavor Text Extended[/url].

[h2]Ce que ça traduit[/h2]

Les noms et les descriptions de 930 plats de [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] et de 901 plats de [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806100152]Flavor Text Extended[/url], les cinq réglages de [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url], les formes fléchies des ingrédients prédéfinis et les modèles de phrases pour les plats d'accompagnement. Cette traduction n'ajoute aucun nouveau plat.

[h2]Langues[/h2]

Les formes françaises des ingrédients portent leurs propres articles et prépositions, par exemple « aux baies » et « de bœuf ». Un petit correctif sensible à la langue applique ces formes et la grammaire des plats d'accompagnement uniquement quand le français est sélectionné. En anglais, le texte et les tables de formes des mods d'origine restent inchangés. Changer la langue du jeu le redémarre : le tout a donc été vérifié avec un démarrage propre dans chaque langue.

[h2]Compatibilité[/h2]

Nécessite RimWorld 1.6, [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] de hekmo et [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806100152]Flavor Text Extended[/url], dans cet ordre. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077]Harmony[/url] est une dépendance directe de cette traduction. Les mods facultatifs de cuisine et d'agriculture ne sont pas requis : leurs ingrédients déterminent les plats qui peuvent réellement apparaître. Les traductions propres à Biotech ne se chargent qu'avec Biotech.

[h2]Réglages[/h2]

Utilisez [b]Options → Options de mod → Flavor Text Extended - Français[/b] pour les cinq réglages partagés de [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url]. La page d'origine utilise la même configuration. Un raccourci facultatif dans la barre du bas est masqué par défaut et peut être révélé par des mods de personnalisation ; aucun n'est nécessaire pour y accéder. Redémarrez le jeu après avoir changé la correspondance des recettes ou la détection dynamique des repas, pour reconstruire les caches.

[h2]Limites connues[/h2]

Les ingrédients non répertoriés reçoivent des formes françaises neutres construites à partir de leur libellé localisé ; les singuliers irréguliers inconnus et les traductions manquantes des mods tiers ne peuvent pas être devinés. Les sept formes de catégories et le préfixe des repas poilus sont traduits. L'isolation de la langue, la page de réglages et le raccourci, les noms de repas en français, les tables des mods d'ingrédients facultatifs, les repas sauvegardés avant la traduction et [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1084452457]RIMMSQOL[/url] sont couverts par des tests techniques et des tests en jeu.

[hr][/hr]

[h2]Si je disparais[/h2]

Si je ne réponds pas dans un délai raisonnable après avoir été contactée, chacun est libre de mettre à jour ce mod ou n'importe lequel de mes autres mods, y compris d'en publier une suite. Tous les crédits doivent être conservés.

[h2]Généré avec l'IA[/h2]

La traduction française initiale a été faite avec Claude (Anthropic), sous direction et relecture humaines. Une passe de corrections a utilisé Codex (OpenAI). Les correctifs suivants et les tests en jeu ont utilisé Claude Code (Anthropic), et le travail sur les images l'outil de génération d'images d'OpenAI.

[h2]Remerciements[/h2]

Merci à [b]hekmo[/b] pour [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] et sa mécanique de nommage, et à [b]Andreas Pardeike[/b] pour [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077]Harmony[/url], dont dépend le correctif sensible à la langue de cette traduction.

Merci aussi aux auteurs des mods facultatifs dont cette traduction couvre les tables d'ingrédients, et que ses tests en jeu ont chargés à côté d'elle, sauf les trois derniers, vérifiés hors jeu seulement :
[list]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2134308519]Vanilla Cooking Expanded[/url] et [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2748889667]Vanilla Plants Expanded - More Plants[/url], par Oskar Potocki, Sarg Bjornson et d'autres
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2886512401]Kit's Brazilian Crops (Continued)[/url], par Kitsune, repris par Zaljerem
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2007061826]VGP Vegetable Garden[/url] et [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2007062982]VGP Garden Gourmet[/url], par dismarzero
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3448458106]VV - New Harvest[/url], par VVenchov
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2562519366]RimCuisine 2 Core (Continued)[/url], par Crustypeanut, repris par Mlie
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3643012859]TP Sea Plants[/url], par Tanypredator
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2877536640]Chinese Traditional Cultural Things Expanded[/url] (Shenzhou), par Diamond.J, DaJian, Frolg, TangWan, XF et d'autres
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2883208829]RH2 Faction: V.O.I.D.[/url], par Chicken Plucker
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3219596926]Medieval Overhaul[/url], par SirLalaPyon, repris par EvilEyes et ViralReaction
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2542931556]Optimization: Meats - C# Edition[/url], par SeoHyeon
[/list]
Et à [b]Malte Schulze[/b] pour [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1084452457]RIMMSQOL[/url], que les tests ont utilisé pour révéler et masquer le raccourci de ce mod.

Les tests en jeu ont tourné sur [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678]Pickle[/url] et [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696]RimLogging[/url] de RimWorks, et sur [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806142401]PickleTools[/url], de l'auteur de ce mod. Ce sont des outils de développement, jamais une dépendance de ce mod.

Aucune autorisation explicite de l'auteur d'origine n'a été établie ; voir ATTRIBUTION.md et LICENSE pour la portée exacte. La licence MIT locale ne s'applique qu'aux droits détenus par la contributrice et n'accorde aucun droit sur le matériel d'origine.

[url=https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais]Code source sur GitHub[/url]
```

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
[*] New description and Preview: every mod name links to its Workshop page, the thanks name the authors of the optional mods whose ingredient tables are covered and the test tools, and the AI tools are named. The mod name no longer carries the "(unofficial)" tag; the description still says the mod is unofficial and published without explicit consent.
[/list]
```

## Steam description

Source of the page description sent by the CI (`update_description` on): the fenced block below, BBCode as Steam shows it,
8000 bytes at most, no double quote and no backslash (the CI turns every double quote into a typographic one). It is the
same text as `<description>` in `Mod/About/About.xml`, which Steam only reads when an item is created: after that this block
is the source, so change both together. The dry-run prints its size, its SHA-256 and a line diff against the current page.

```
UNOFFICIAL. This mod is published without the original author's explicit consent (though he has so far been kind to translations and add-ons).
If the original author contacts me to request its removal, I undertake to take it down promptly.

French dish names, descriptions and ingredient forms for [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806100152]Flavor Text Extended[/url].

[h2]What it translates[/h2]

The names and descriptions of 930 [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] dishes and 901 [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806100152]Flavor Text Extended[/url] dishes, the five [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] settings, predefined ingredient inflections and side-dish sentence templates. No new dishes are added by this translation.

[h2]Languages[/h2]

French ingredient forms carry their own articles and prepositions, for example « aux baies » and « de bœuf ». A small language-aware patch applies these forms and the side-dish grammar only when French is selected. English keeps the original dependencies' text and inflection tables. Switching the game's language restarts it, so this has been checked with a clean start in each language.

[h2]Compatibility[/h2]

Requires RimWorld 1.6, [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] by hekmo, and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806100152]Flavor Text Extended[/url], in that order. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077]Harmony[/url] is a direct dependency of this translation. Optional cooking and farming mods are not required; their ingredients determine which dishes can actually appear. Biotech-specific translations load only with Biotech.

[h2]Settings[/h2]

Use [b]Options → Mod settings → Flavor Text Extended - Français[/b] for the five shared [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] settings. The original page uses the same configuration. An optional MainButtons shortcut is hidden by default and can be revealed by customization mods. No customization mod is required for primary access. Restart after changing recipe matching or dynamic meal detection to rebuild caches.

[h2]Known limits[/h2]

Unlisted ingredients use neutral French forms built from their localized labels; unknown irregular singulars and missing third-party translations cannot be inferred. All seven category forms and the hairy-meal prefix are translated. Language isolation, the settings page and shortcut, French meal naming, the tables of the optional ingredient mods, meals saved before the translation and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1084452457]RIMMSQOL[/url] all have technical and in-game coverage.

[hr][/hr]

[h2]If I go quiet[/h2]

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

[h2]AI-generated[/h2]

The initial French translation was made with Claude (Anthropic), under human direction and review. A correction pass used Codex (OpenAI). Later fixes and the in-game tests used Claude Code (Anthropic), and image work used OpenAI's image generation tool.

[h2]Thanks[/h2]

Thanks to [b]hekmo[/b] for [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432]Flavor Text[/url] and its naming machinery, and to [b]Andreas Pardeike[/b] for [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077]Harmony[/url], which this translation's language-aware patch depends on.

Thanks also to the authors of the optional mods whose ingredient tables this translation covers, and which its in-game tests loaded beside it, except the last three, which are checked offline only:
[list]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2134308519]Vanilla Cooking Expanded[/url] and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2748889667]Vanilla Plants Expanded - More Plants[/url], by Oskar Potocki, Sarg Bjornson and others
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2886512401]Kit's Brazilian Crops (Continued)[/url], by Kitsune, continued by Zaljerem
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2007061826]VGP Vegetable Garden[/url] and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2007062982]VGP Garden Gourmet[/url], by dismarzero
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3448458106]VV - New Harvest[/url], by VVenchov
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2562519366]RimCuisine 2 Core (Continued)[/url], by Crustypeanut, continued by Mlie
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3643012859]TP Sea Plants[/url], by Tanypredator
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2877536640]Chinese Traditional Cultural Things Expanded[/url] (Shenzhou), by Diamond.J, DaJian, Frolg, TangWan, XF and others
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2883208829]RH2 Faction: V.O.I.D.[/url], by Chicken Plucker
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3219596926]Medieval Overhaul[/url], by SirLalaPyon, continued by EvilEyes and ViralReaction
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2542931556]Optimization: Meats - C# Edition[/url], by SeoHyeon
[/list]
And to [b]Malte Schulze[/b] for [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1084452457]RIMMSQOL[/url], which the tests used to reveal and hide this mod's shortcut.

The in-game tests ran on [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678]Pickle[/url] and [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696]RimLogging[/url] by RimWorks, and on [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806142401]PickleTools[/url] by the author of this mod. They are development tools only, never a dependency of this mod.

No explicit upstream permission has been established; see ATTRIBUTION.md and LICENSE for the exact scope. The local MIT notice applies only to rights held by the contributor and grants no rights in the upstream material.

[url=https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais]Source code on GitHub[/url]
```

## Publication by CI (fail fast)

Steam publications go through GitHub Actions (root `PUBLISHING.md`, "Publier par la CI"). The workflow of this mod
is the manual one (`publish-tag.yml`), for an item that already exists (id 3806100488, pre-published in 0.1.0,
private). Generated on 2026-09-25 from the pushed template of Rimworld-Release-Admin (`a94c0fe`, stamp
`683151266dd1`) with the command below, run from the monorepo root (it writes only under `.github/`):

```
bash Rimworld-Release-Admin/scripts/generate-publish-workflow.sh FlavorText/FlavorTextExtendedFR --replace --workshop-id 3806100488 --package-id nelim.flavortextextended.fr --release-title "Flavor Text Extended - Français {version}" --require Assemblies/FlavorTextExtendedFR.dll --description-file PUBLICATION.md --description-heading '^## Steam description$' --gallery-dir Art/Gallery
```

- Fail fast applies to this mod (owner, 2026-09-25): publish after the dry-run and the approval, then the remaining tests in
  small tickets; if one is red, fix and publish the fix.
- **What fail fast lets us skip, and what it does not** (owner, 2026-09-25). It skips the **non-regression pass**: the replay of
  the passes that were already green, which can run after the publication, in small tickets. It does **not** skip the
  **validation of the reds**: every scenario that failed, and every defect found by a person, must be green on the revision to
  publish before it goes out, because publishing a fix that was never seen to work is not fail fast, it is a guess. A green
  ticket on the fix (the fewest scenarios that were red) is the condition; the replay of everything else follows.
- 1.0.1 is sent with **both new options** (owner, 2026-09-25: the new description and the new Preview go with it): dry-run
  `-f update_description=true -f update_preview=true`, and `dispatch-publish.sh ... --description --preview`, the same options in both.
- Order of operations: dry-run of the exact SHA (`gh workflow run publish-tag.yml --ref main -f ref=<SHA> -f version=<version>
  -f mode=dry-run -f update_description=true`), then `Rimworld-Release-Admin/scripts/dispatch-publish.sh` with the full SHA and
  the same option. Only the owner approves `steam-production`. The CI creates the tag `v<version>` and the GitHub release
  after the upload: never create them by hand (the hand-made `v1.0.0` of 2026-09-22 was deleted for that reason).
- Rollback: **no rollback target** (owner, 2026-09-25). If a published version turns out to be wrong, the owner sets the item
  back to private on Steam; nothing is restored. The Steam button "rétablir cette version" of the item's change history exists
  if a target is ever wanted.
- Description and gallery (owner, 2026-09-25): the description is sent by the CI (`## Steam description` above,
  `update_description` on, the same option in the dry-run and in the publish); the gallery is only listed (manual upload,
  `Gallery/` for 1.0.0, `Art/Gallery/` from 1.0.1).
- Preview (owner, 2026-09-25): regenerated without the `(unofficial)` tag (`_tools/Render-Preview.ps1`), 566,527 bytes; it is in `Mod/`, so it
  is uploaded with the mod, but the Steam page image changes only with `update_preview` on. The suffix decision and its justification:
  `_tools/UPSTREAM-PERMISSION-REVIEW.md`, "Decision of 2026-09-25". The page titles (French and English) are edited by hand by the owner.
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
