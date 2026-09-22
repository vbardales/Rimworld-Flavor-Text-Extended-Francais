# Changelog

## 1.0.0 — 2026-09-22

- French names and descriptions for 930 Flavor Text dishes and 901 Flavor Text Extended dishes, including
  the five FoodCourt-discovered Extended dishes and four provider-scoped Shenzhou ingredient entries;
  retains the explicit altang adaptation and excludes zongzi wrappers.
- Four French inflection tables covering 150 predefined ingredient entries, plus the eleven remaining
  third-party tables and neutral French forms for unlisted ingredients, without English singularization.
- French labels and tooltips for the five Flavor Text settings, exposed under this mod's own name and
  sharing the upstream configuration, with a hidden MainButtons shortcut and ingredient-cap validation.
- French sentence templates for side dishes, without assuming the gender of a dish name; all seven
  category overrides and hairy-meal prefixes translated.
- Known aspirated-h ingredient complements preserved during final meal-text processing.
- French inflection and grammar patches apply only when RimWorld's selected language is French. Fixed
  2026-09-21: RimWorld stores the official French translation as `French (Français)`, and the language
  guard compared the stored value to `French` alone, so nothing above had ever applied in a real French
  game. Found by the first in-game Pickle run; the guard now applies RimWorld's own rule for matching a
  language folder (the part before the bracket).
- Keep the name of the American dish "funeral potatoes" in English instead of a literal French rendering
  ("pommes de terre des funérailles"), which is not a name anyone uses. Its French description still
  explains where the name comes from.
- Biotech-only dish translations gated on Biotech.
- Actual-assembly persistence, Harmony and settings/fallback regression coverage; an in-game Pickle suite
  (`Tests/Pickle/`) covering loading, language isolation, the settings page and shortcut, meal naming and
  RIMMSQOL. The English, French and RIMMSQOL passes played green on 2026-09-21; see `STATUS.md` and
  `TESTING.md` for pending capture/film evidence. F13 legacy-meal coverage is out of scope.
