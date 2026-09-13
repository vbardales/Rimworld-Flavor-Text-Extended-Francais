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
stage: preTest
licence: silent
licence_declared: MIT (LICENSE and Mod/LICENSE)
licence_at: derivative translation of hekmo's text; no explicit upstream licence found in the installed source; MIT here does not establish upstream permission
upstream_permission: unverified
dependencies: declared
showcase: complete
tested_on:
automated_tested_on: 2026-09-13
workshop:
maintainer: Codex, task responsible for this local repository
updated: 2026-09-13
remaining:
  - Manual functional campaign not run; scenarios 0-18 await in-game results.
  - Side-dish clauses remain English.
  - Eleven third-party inflection tables remain untranslated.
  - French agreement and actual game loading require manual verification.
  - Clarify upstream permission for the derivative translated text.
---

# Flavor Text Extended - Français — état du dépôt

## Identité et responsabilité

Cette tâche Codex gère ce dépôt local et maintient ce STATUS.md à chaque changement
significatif de contenu, de tests, de licence ou de publication.

- Dossier : `C:\Users\nelim\Documents\rimworld\FlavorText\FlavorTextExtendedFR`.
- Nom du mod : **Flavor Text Extended - Français** ; auteur déclaré : `nelim`.
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
