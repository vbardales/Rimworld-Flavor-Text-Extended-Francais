# FoodCourt registry follow-up — 2026-09-13

Source: `../../FlavorTextExtended/Audit-FoodCourt/README.md` and `comparison.json`.
Registry snapshot: 2026-09-13T13:02:45, 11,339 rows; SHA256
`1d43194596ed51375ce0ccde3bccbf8b0fc16d536a74ed66623badc3d14976ea`.
The report compares 930 base dishes, 896 Extended dishes and 177 categories.
Its 294 raw-ingredient rows without direct or lexical matches are review candidates,
not 294 proven incompatibilities. No runtime compatibility is certified here.

## Initial French review

At initial review, none of these five identifiers occurred in the companion's explicit resources.
The generic fallback may still handle them; absence of a dictionary key does not prove failure.
The following table records that initial review; the integration outcome below supersedes its pending status.

| Identifier | French wording to review | Integration prerequisite |
| --- | --- | --- |
| RawDaBaiCai | chou chinois; au chou chinois / de chou chinois | Verify FT_Cabbage assignment and the supplying package. |
| RawLianOu | rhizome de lotus; au rhizome de lotus / de rhizome de lotus | Verify FT_Lotus assignment and source meaning. |
| RawLvDou | haricots mungo; aux haricots mungo / de haricots mungo | Verify bean category and actual ingredient eligibility. |
| WorkedFenTiao | vermicelles; aux vermicelles / de vermicelles | Verify starch source and category; do not assume rice noodles. |
| RawZongYe | feuilles pour zongzi | Verify wrapper role; do not classify as an edible vegetable without evidence. |

The current Shenzhou provider is `dajian.chiteaditional.expanded`; an older wrapper entry
uses `dajian.chiteaditional.expanded.oldmode`. The registry also contains overlapping
identifiers under `nelim.edengarden` and `nelim.foodcourt`, with different labels and
distribution status. Match packageId, defName and actual loaded source together before
adding a conditional table. Do not copy content from either private derivative into a
public distribution. Source Shenzhou versions in this snapshot declare 1.3/1.5;
RimWorld 1.6 compatibility remains unverified.

## Dish candidates

Altang, Beondegi, Bungeoppang, Jjapaghuri and Kimchijeon are lexical candidates from
Korean Cuisine. The Extended project must first verify recipe equivalence and decide
whether new source dishes are warranted. Only then should this companion add French
labels, descriptions and any required forms against the exact finalized identifiers.
All French implementation belongs here; no new source dishes or translations were installed
as part of recording this follow-up.

## Acceptance before implementation

Inspect actual provider defs, conditions, loaded version and rights scope; resolve duplicate
identifiers; verify category selection with the runtime; review all four French forms and
the selected recipe placeholders. Test provider present/absent and French/English isolation.
The registry's lexical search and key inventory do not establish any of these outcomes.
This optional expansion queue does not invalidate existing scoped resource checks.

## Authorized integration outcome

After the user requested integration, Extended added FlavorTextExtended_Altang, _Beondegi,
_Bungeoppang, _Jjapaghuri and _Kimchijeon. All ten label/description fields now exist in
Mod/Languages/French/DefInjected/FlavorText.FlavorDef/Ext_FoodCourtDiscovery.xml.
The repertoire is now 930 base + 901 Extended dishes. Ingredient indices match the source;
French slots use the appropriate complete complements rather than adding duplicate prepositions.
Altang explicitly remains a colony adaptation, not a claim that ordinary eggs are fish roe.

RawDaBaiCai, RawLianOu, RawLvDou and WorkedFenTiao each have four explicit French forms in
the existing dajian.chiteaditional.expanded table in Inflections_ExtendedProviders_FR.xml.
They follow Extended's four provider-scoped category additions. No corresponding entries were
added for EdenGarden, FoodCourt or the old Shenzhou package. RawZongYe remains excluded.
Technical resource checks pass; actual provider activation and recipe output in 1.6 remain
unverified. Evidence is in foodcourt-2026-09-13/. No changes were made to the EN project here.
