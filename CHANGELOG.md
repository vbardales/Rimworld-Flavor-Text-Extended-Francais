# Changelog

## Unreleased

- Fix: French was never detected in a real game. RimWorld stores the official French translation as `French (Français)`, and the language guard compared the stored value to `French` alone, so no French patch, side-dish grammar, ingredient fallback or aspirated-h repair was applied. Found by the first in-game test run; the guard now applies RimWorld's own rule (the part before the bracket), and the offline tests use the stored value.

- Translate the five FoodCourt-discovered Extended dishes and add four provider-scoped Shenzhou ingredient entries; retain the explicit altang adaptation and exclude zongzi wrappers.

- Expose the five existing settings under this mod's name, sharing the upstream configuration, with a hidden MainButtons shortcut and ingredient-cap validation.
- Generate neutral French forms for unlisted ingredients without English singularization; translate all seven category overrides and hairy-meal prefixes.
- Preserve known aspirated-h ingredient complements during final meal-text processing, scoped to Flavor Text's two compilation methods.
- Add actual-assembly persistence and Harmony checks, plus settings and fallback regression coverage.
- Apply French inflection and grammar patches only when RimWorld's selected language is French.
- Translate the eleven remaining predefined third-party ingredient tables.
- Use French sentence templates for side dishes without assuming the gender of a dish name.
- Gate Biotech-only dish translations on Biotech.
- Add regression checks for language isolation, patch targets and language resources.
- Update the English description, unofficial notices and licence scope documentation.
- Preserve the user's preferred original 64x64 icon artwork at 128x128; revise the Preview title, subtitle and version badge.

These changes have not been validated in a running game or published as a release.

## 1.0.0 — Initial repository content

- French names and descriptions for 930 Flavor Text dishes and 896 Flavor Text Extended dishes.
- Four French inflection tables covering 150 ingredient entries.
- French labels and tooltips for the five Flavor Text settings.

No release date is inferred from repository extraction or audit dates.
