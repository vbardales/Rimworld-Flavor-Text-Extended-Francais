# Attribution and rights

## Upstream works

- **Flavor Text**, by hekmo: [Workshop 3245374432](https://steamcommunity.com/sharedfiles/filedetails/?id=3245374432).
- **Flavor Text Extended**, by nelim: [source repository](https://github.com/vbardales/Rimworld-Flavor-Text-Extended).

This mod translates their dish names and descriptions. Although it does not distribute their
original files, translated text is derived from those works. The absence of copied source files
must not be interpreted as independent authorship or permission to redistribute translated text.

## Permission status

No explicit licence or permission for the underlying Flavor Text text has been established from
the inspected installed README and About metadata (Flavor Text 0.3.6, RimWorld 1.6).
This is an **unverified permission**, not a finding that the author has prohibited translation.
The Workshop description and visible comment page were reviewed again on 2026-09-13; no explicit permission was found there. This was not an exhaustive historical
comment search. Any later permission must be recorded with its exact source and scope.

The current repository is public and classified `silent` using the audit request's four-category
vocabulary. Its name and description disclose the unofficial status. That disclosure is not
consent and does not resolve the outstanding rights/visibility gate.

The local MIT licence applies only to rights held by the contributor. It does not license
Flavor Text or override rights in derivative translations. LICENSE and its distributed copy
state that scope explicitly. No licence is invented for the upstream work.

## Contributions and technical references

- The original French translations remap ingredient slots to prepositional forms. Their 150
  core/DLC entries were generated using the game's official French labels; those labels are
  credited to Ludeon Studios and its French translation contributors.
- The correction pass adds 36 reviewed forms for eleven predefined optional-mod tables,
  and a compact French grammar for side dishes. Source identifiers remain the upstream IDs.
- `Source/` contains locally written language selection, a shared-settings bridge and French
  runtime corrections using Harmony. Harmony is required but not redistributed. Installed RimWorld 1.6
  `PatchOperation`, `Prefs`, and `LanguageDatabase` behavior was inspected for interoperability;
  no decompiled game or Flavor Text implementation is distributed.
- Tests inspect installed dependency XML and compile against local game references.
  Neither game assemblies nor Flavor Text.dll are copied into this mod.

## AI assistance and images

Initial translation work used Claude (Anthropic), under human direction and review.
The correction pass used Codex (OpenAI). A mascot icon candidate and a Preview candidate
were produced with OpenAI's built-in image generation tool from the existing local artwork.
The user preferred the original icon, which is retained and resized to 128x128. The final Preview uses a reproducible HTML overlay on the original illustration. Original artwork and superseded renders are preserved under `Art/`.
No claim of third-party art permission is inferred from an image being present locally.

## Validation limits

Historical dictionary-injection experiments were narrower than a full functional campaign.
They must not be cited as proof of the current implementation. The language-aware XML patch
replaces the previous unconditional patch and requires fresh in-game regression checks.
Automated tests cannot certify natural French agreement or runtime UI layout.
