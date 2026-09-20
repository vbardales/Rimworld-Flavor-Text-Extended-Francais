---
mod: Flavor Text Extended - Français
packageId: nelim.flavortextextended.fr
repo: Rimworld-Flavor-Text-Extended-Francais
remote: https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais.git
visibility: public
visibility_verified_at: 2026-09-13
visibility_evidence: GitHub REST API, private=false, visibility=public
mod_visibility: public (distributed through the public GitHub repository; Workshop publication not established)
detached: yes
stage: dansMonoRepo
stage_meaning: cumulative workflow baseline; repository is physically detached but horsMonoRepo gate is incomplete
audit_revision: 80a77c572465a0437b9766c3b1fa9f0d7784c356
settings_audit: partial
localization: partial
translation_en: partial
translation_fr: partial
licence: silent
licence_declared: MIT (LICENSE and Mod/LICENSE)
licence_at: derivative translation of hekmo's text; no explicit upstream licence found in the installed source; MIT here does not establish upstream permission
upstream_permission: unverified
dependencies: declared
showcase: partial
tested_on:
automated_tested_on: 2026-09-13
workshop:
maintainer: Codex, task responsible for this local repository
updated: 2026-09-13
remaining:
  - "defect: CHANGELOG.md missing; LICENSE scope paragraph is French and mentions added defs absent from this translation."
  - "unverified: upstream permission and consistency of public distribution with established rights."
  - "defect: public silent naming and disclaimer missing; About description predominantly French."
  - "defect: ModIcon is 64x64 instead of 128x128; Preview lacks secondary title treatment and version badge."
  - "unverified: inherited settings technical behavior, persistence and shortcut contract."
  - Manual functional campaign not run; scenarios 0-18 await in-game results.
  - Side-dish clauses remain English.
  - Eleven third-party inflection tables remain untranslated.
  - French agreement and actual game loading require manual verification.
  - Clarify upstream permission for the derivative translated text.
---

# Current workflow audit — 2026-09-13

This section supersedes the historical conclusions below. Previous STATUS content is
preserved in `_tools/audit-2026-09-13/STATUS.before.md`. Workflow names are used literally:
`dansMonoRepo -> horsMonoRepo -> ModIcon générée -> Preview générée -> preOptions -> options -> l10n -> preTest -> done -> tested`.
`dansMonoRepo` denotes the last cumulative baseline, **not a claim that the repository
is still inside the monorepo**. Physical extraction remains validated (`detached: yes`).

Audited HEAD: `80a77c572465a0437b9766c3b1fa9f0d7784c356`. At entry, `Mod/About/About.xml`
and `STATUS.md` were modified, and `_tools/Test-Xml.ps1` was untracked. Tests apply to
those actual working files, not merely HEAD. This audit changes STATUS and adds evidence
only; it preserves those edits and makes no commit, publication or implementation change.
File and dependency SHA-256 inventories and fresh test output are in
`_tools/audit-2026-09-13/`. The distributed directory is this repository's `Mod/`.

Read protocols: `../../PUBLISHING.md`, `../../STYLE_RIMWORLD.md`,
`../../MOD_SETTINGS.md`, `../../TRANSLATIONS.md` and `../../AGENTS.md`.
The user's interpretation overrides their runtime gate and historical-status rules.

| Transition | Result and direct evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | **Defect / unverified.** Own `.git`, correct toplevel, origin and coherent package/repository/folder identity validated. Live `git ls-remote origin HEAD` returned the audited SHA; `gh repo view --json nameWithOwner,visibility,isPrivate,url` confirmed PUBLIC and isPrivate=false. Initial network failure was resolved by the read-only retry. STATUS exists. README and ATTRIBUTION have English main content; their French examples are appropriate. LICENSE has a French scope paragraph mentioning added defs that this mod does not ship; CHANGELOG is absent. LICENSE and ATTRIBUTION distribution copies are byte-identical. Local MIT statements covering derivative translations do not establish upstream permission. Public visibility is established, its consistency with established rights remains unverified. `silent` is retained under the user's four-category definition, not a finding of prohibition. |
| horsMonoRepo -> ModIcon générée | **Defect.** PNG opens and depicts one mascot, but is 64x64, 7,504 bytes, versus the 128x128 specification. No C# source, assembly or build project is shipped: build is **not applicable justified**. Development completion is not established while known translation gaps remain. |
| ModIcon générée -> Preview générée | **Validated independently.** Directly opened `Mod/About/Preview.png`: PNG, 896x504, 774,915 bytes, below 1 MB. Food subject and title are visible, no cut-off text or concrete camera defect identified. No historical generation report or recorded comparison screenshot is required. Source retained as `Art/Preview-source.png`. |
| Preview générée -> preOptions | **Defect.** About description is predominantly French, despite an English summary. Public `silent` suffix `(unofficial)` and opening disclaimer are absent from About and README. Preview uses the same large white text for `Français`, without the secondary suffix treatment, and has no version badge; a distinct secondary/accent pair therefore cannot be validated. The raw GitHub link is correct but lacks the prescribed labeled Steam link. No applicable English linking word requires reduction. |
| preOptions -> options | **Non vérifié**, see Settings audit below. This is not blocked by the absence of an in-game session. |
| options -> l10n | **Defect**, see Translation audit below. Structural successes are retained independently. |
| l10n -> preTest | **Validated independently for inspected local versions.** About declares both actual data providers, Flavor Text 0.3.6 (supports 1.6) and Extended 1.0.0 (1.6), with matching IDs and loadAfter. Harmony is required transitively by Flavor Text, not directly used by this XML mod. No own LoadFolders or conditional integration patches exist. All four target dictionaries are present in the 1.6 base Defs without DLC conditions; DLC ownership is not required merely to patch these string tables. Optional cooking mods are not made mandatory. |
| preTest -> done | **Partial independent validation.** Written scenarios 0-18 include setup/actions/observations, and the actual automated/XML test passes. The same meaningful script supplies both XML and automated checks; no artificial C# test is needed. Scenarios accept known localization failures and scenario 17 allows either persistence outcome, so they do not yet form final acceptance coverage for the requested strict workflow. Earlier gates also block done. |
| done -> tested | **Non vérifié.** No game launched, no current-version FR/EN UI or log validation, no executed new-game/existing-save campaign. Historical probes are not a full campaign. |

## Settings audit

Inventory: this translation ships no settings implementation, page or MainButtonDef;
its ten Keyed strings translate five **inherited Flavor Text options**: extra ingredient
cap, quick search, meal-stack names, lax recipe matching and dynamic meal detection.
The patch changes linguistic data, not user-selectable settings. A new empty page is
unwarranted. However MOD_SETTINGS explicitly includes inherited settings: absence of
local C# alone does not justify a blanket `not_applicable` verdict. The supplied test
checks string presence, not defaults, boundaries, persistence, application timing or
the inherited shortcut/access implementation. Those technical checks remain **unverified**;
no integration with RIMMSQOL or another customization tool was tested. `partial` records
that limited scope without asserting an upstream UI defect. In-game interactions belong
only to `tested`, as the user specified.

## Translation audit

Fresh command `& ./_tools/Test-Xml.ps1` returned exit 0 and:
`PASS: 70 XML files; 1826 dishes with labels and descriptions; 4 patches applied in memory; 150 ingredients; 10 settings.`
Script read before execution. It validates nonempty unique DefInjected handles against
the actual 1,826 source defs, label/description suffixes, ingredient placeholder syntax
and indices, and four XPath replacements in memory. It does not run RimWorld's field
loader or exhaustively proofread meaning, grammatical agreement, rich text or runtime
fallbacks. `FlavorText.FlavorDef` is the supplied injection directory; actual compiled
field translatability/loading remains unverified, not a confirmed path defect.

The ten French Keyed names and their `{0}` usage match the installed English Misc.xml.
English dish labels/descriptions are supplied natively by the dependency Defs: a redundant
English DefInjected folder is unnecessary. Nevertheless the four unconditional French
dictionary patches also affect English, so **full English coverage with this mod active
is defective under the requested EN/FR criterion**; README explicitly documents this.
French coverage is incomplete: installed `RulePacks_SideDishClauses.xml` defines
`FT_SideDishLabels` and `FT_SideDishDescriptions` in English, and no RulePackDef translation
is shipped. Only four of the fifteen source inflection dictionaries are replaced; eleven
optional-mod tables are uncovered. These are observed resource gaps, not newly observed
in-game failures. Native fallback limitations described by upstream remain relevant.

## Next gate and optional recommendations

To reach **horsMonoRepo**, initialize the missing English changelog, bring the licence
scope documentation into English and into agreement with the actual contents and rights,
and establish/document a rights basis coherent with the chosen public/private distribution.
No permission denial is asserted; permission is currently unverified. Do not invent an
upstream licence. Keep required distributed copies synchronized. Later icon, presentation,
settings and localization work does not replace this first gate.

Optional: retain reproducible Preview palette/composition sources when next editing its
overlay. Their absence is not used to demand a historical generation report. No camera
reservation is raised. The old negative English-language scenario remains useful as a
regression observation, but cannot count as successful EN acceptance for this workflow.

## Historical notes — superseded where they conflict with the audit above

# Flavor Text Extended - Français — état du dépôt

## Identité et responsabilité

Cette tâche Codex gère ce dépôt local et maintient ce STATUS.md à chaque changement
significatif de contenu, de tests, de licence ou de publication.

- Dossier : `C:\Users\nelim\Documents\rimworld\FlavorText\FlavorTextExtendedFR`.
- Nom du mod : **Flavor Text Extended - Français** ; auteur déclaré : `Nelim`.
- PackageId : `nelim.flavortextextended.fr`.
- Remote origin : https://github.com/vbardales/Rimworld-Flavor-Text-Extended-Francais.git
- Dépôt autonome : `git rev-parse --show-toplevel` renvoie exactement ce dossier,
  avec son propre répertoire `.git`. Cette tâche ne gère plus le monorepo.
- GitHub **public**, confirmé par l'API GitHub le 2026-09-13 (`private=false`).
  Cette visibilité est un état réel, pas une conclusion sur les droits de publication.
- Aucun `PublishedFileId.txt` présent : publication Workshop non établie.

## Titre et description

Le suffixe **« - Français »** est déjà présent et distingue cette traduction de
Flavor Text Extended. Aucun suffixe supplémentaire nécessaire : ce n'est pas une
reprise de maintenance annoncée comme « Continued ».

Le champ `<url>` pointe vers le bon dépôt. Le même lien GitHub a été ajouté dans
la **description** de `Mod/About/About.xml` le 2026-09-13.

## Licence DU MOD et justification

Classification : **`silent`**. Licence déclarée dans ce dépôt : **MIT**.
Visibilité actuelle du mod : **public via GitHub** ; Workshop non établi.

Ce mod traduit les noms et descriptions de 930 plats de hekmo et de 896 plats de
Flavor Text Extended. Il ne peut donc pas être classé `original` au seul motif
que les fichiers XML français ont été écrits ici. Une traduction dérive aussi du
texte source, même si aucun fichier source anglais n'est livré.

L'inspection du 2026-09-13 n'a trouvé aucune mention de licence ou de permission
dans le README et l'About de la copie Steam installée de Flavor Text ; aucune
licence explicite n'est établie par les éléments disponibles. L'ancienne fiche
rapportait également une recherche infructueuse sur le Workshop ; cette recherche
web n'a pas été refaite lors de cet audit. Une autorisation distincte reste à vérifier.
La MIT locale exprime les conditions déclarées pour les contributions locales,
mais ne démontre pas une autorisation de l'auteur des textes sources.

Vocabulaire retenu pour cette fiche :

- `forbidden` : refus ou interdiction explicite identifié ; aucun établi ici.
- `open` : autorisation explicite couvrant les éléments concernés ; non établie pour l'amont.
- `silent` : absence de licence ou permission explicite établie pour l'amont.
- `original` : création indépendante ; inadapté à cette traduction.

L'ancien classement `alive` est remplacé par `silent`. L'activité de l'auteur
ne constitue pas une licence. L'ancienne affirmation générale de libre
publication est retirée faute de preuve d'autorisation amont.

## Tests automatisés et XML

Commande depuis ce dépôt :

```powershell
& ./_tools/Test-Xml.ps1
```

Le script accepte `-FlavorText` et `-Extended`, chemins vers les répertoires
`Defs` des deux dépendances. Les valeurs par défaut utilisent l'installation
Steam locale de Flavor Text 1.6 et le dépôt voisin de Flavor Text Extended.
Ces sources sont lues uniquement ; les patchs sont simulés en mémoire.
Une dépendance absente fait échouer le contrôle, sans résultat positif partiel.

Résultat du 2026-09-13 : **PASS**.

- 70 fichiers XML analysés avec un parseur XML.
- 1 826 defs sources : chaque nom et description possède une traduction non vide.
- Aucun handle inconnu ou doublon ; syntaxe et indices des paramètres vérifiés
  contre les slots d'ingrédients réels. Les formes grammaticales peuvent changer
  entre l'anglais et le français ; elles ne sont pas comparées à l'identique.
- Quatre `PatchOperationReplace` : chaque XPath atteint exactement une cible
  dans les defs installées ; les remplacements sont appliqués en mémoire.
- 150 ingrédients : clés uniques par table, quatre formes non vides chacun.
- Dix réglages non vides, sans doublon.
- PackageId, dépendances, ordre de chargement et lien GitHub dans la description contrôlés.

Aucun assembly propre à ce mod : pas de compilation C# pertinente.
Ces contrôles ne remplacent ni le chargeur RimWorld ni la relecture du français.
Ils ne démontrent pas la compatibilité avec une future version des dépendances.

## Tests fonctionnels manuels

`_tools/FUNCTIONAL-SCENARIOS.md` contient **19 scénarios (0 à 18)**, avec préparation,
observations et critères de réussite ou d'échec : chargement, DLC désactivés,
inflexions, élisions, accords, descriptions, réglages et limites connues.

**Campagne complète non exécutée et non validée.** `tested_on` reste vide et le
stade reste `preTest`. Une ancienne sonde en jeu a montré que l'injection dans
le dictionnaire d'inflexions échouait ; elle justifie le mod séparé, sans valider
la version complète. Le scénario 15 est prioritaire pour les clauses secondaires.
Le profil et les nombres de plats cuisinables du document datent du 2026-09-12
et doivent être recontrôlés si la liste de mods change.

Virginie lance le jeu et réalise les scénarios ; cette tâche prépare la campagne
et analyse ensuite les résultats et `Player.log`. Ne pas effacer le log original :
en conserver une copie datée pour l'audit.

## Limites connues et prochaines mises à jour

Les clauses secondaires restent anglaises (ex. « with » entre deux plats).
Seules quatre des quinze tables d'inflexions sont traduites : les ingrédients de
mods tiers peuvent rester anglais. Les accords français restent à vérifier en jeu.

Passer à `tested` et renseigner `tested_on` uniquement après une campagne documentée
et lecture du log. Consigner toute publication Workshop et tout élément nouveau
sur la permission amont. Mettre à jour cette fiche après les futurs changements.
