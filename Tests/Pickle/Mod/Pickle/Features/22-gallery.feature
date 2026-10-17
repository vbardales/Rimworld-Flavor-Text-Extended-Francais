# 2026-10-16 story rewritten after the director's review: the first plan said "Nelim eats" while she only stood, had one expression, no guest and no hair story. 2026-10-12: Nelim's face by the SanctuaryBacklot recipe (kit neutral, then "Nelim has her own face", verified in 56b0), the map held at 20 degrees for 120 ticks (no heat sweat), a closer frame (zoom 4.5). Food Texture Variety meals named in French by this mod (39de421).
# Workshop pictures of 1.1.0: one staged story, played on Nelim's sanctuary (save Nelims-tribe), the fixture of every mod's gallery (PickleTools docs/GALERIE.md).
# Reuses the scenes of Flavor Text Extended's own gallery "Lunch is served" (FlavorText/FlavorTextExtended, Features/10-gallery-scenes.feature, run 49d4, owner's
# word 2026-10-08), played here with THIS mod loaded, so the dish names and descriptions on the cards are the French ones. Pass:
#   -DepMap wsl-deps.sanctuary.map -Language French -Filter '22-gallery.feature'
# The map is Extended's gallery map plus its Pickle companion (nelim.flavortextextended.pickletests, which owns the steps "Flavor Text Extended: ...").
# Its output is CANDIDATES (Art/Gallery/<index>-candidate-<name>, JPEG q90, under 2 MB): the owner accepts or refuses each. Not proof of the mod.
#
# THE STORY. "Lunch is served", in French: one midday at the sanctuary. Nelim (the protagonist: dark ponytail, teal shirt, cream trousers) welcomes a GUEST, Camille
# (short light hair, orange shirt, blue eyes, generated female so no body-type step: she stands out against Nelim's dark hair and the wood). Nelim's face is the Sanctuary's own, then a small smile
# (mouth, lids, rosy cheeks). Three pictures, 5 game minutes (about 208 ticks) apart, same light, same place (dining-nook).
# SHOT PLAN (place, time, subject, composition, the living, what it says; the English subtitle of each is in PUBLICATION.md, "Gallery subtitles"):
# 1. dining-nook, 12:00. The laid table (four meals), the katsudon card at the right. Nelim smiles, facing South; Camille beside her, neutral and curious.
#    Says: the host shows a table of dishes whose names are French.
# 2. dining-nook, 12:05. The two-dish meal and its card. Nelim smiles, Camille smiles too. Says: a main dish and its side dish, joined by a French joint.
# 3. dining-nook, 12:10. The two-meat blanquette; a hen came to see (in front of them, at (177, 112), facing South). Nelim and Camille smile. Says: a French dish named from the colony's own ingredients.
# NOT claimed by the pictures: nobody is seated and nobody eats (no seat or eating step exists, to ask of Pickle Tools); both stand at the table. The scenario names
# say what is staged, not a job. Camille's hairstyle (vanilla "Bob") and her cell (177, 110) are to be read on the first run; an unknown name fails with the valid list.
# Camille's mouth and lids need the VTE faces, which VEFA resolves (both in the map). The garden picture of Extended is not taken. The settings page is a menu: the
# approved 4-settings-page-in-french.jpg of 1.0.x stays, without a subtitle.
# Order imposed by NPT: waits, paused, dress, stands at LAST, frame, capture, no wait after. After the run every picture is opened and read against this plan;
# anomalies go to Pickle Tools (through the Ticket Manager if unreachable). Review note: a green run proves the path ran, never that the picture is right.
# Nelim and Camille are dressed by the photographer: vanilla garments on the retextured body of Venus Touch Waistlines (owner, 2026-10-07), as in Extended's gallery.
@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.stagedecor
Feature: Lunch is served, in French

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: all animals are removed

  # ORDER OF EVERY SCENARIO (NPT, 2026-10-07): the waits first, then the game paused, then the dressing, then "stands at" LAST, then the framing and the
  # capture with no wait after. A pawn is held only while the game is paused and without a job: a wait after "stands at" lets her go back to her job.
  # 1. 12:00. Four different meals on the table, the katsudon's card beside them, Nelim smiling, Camille curious.
  Scenario: Nelim shows the laid table to her guest
    Given Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And I wait 60 ticks
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 120 ticks pass
    When Flavor Text Extended: a colonist cooks "FTV_CookMealSimple" at the "FueledStove" from "RawRice, Meat_Pig, EggChickenUnfertilized", 100 times
    And Flavor Text Extended: a colonist also cooks "FTV_CookMealFine" at the "FueledStove" from "RawRice, Meat_Pig, EggChickenUnfertilized, RawPotatoes", 50 times
    And Flavor Text Extended: a colonist also cooks "FTV_CookMealSimple" at the "FueledStove" from "EggChickenUnfertilized", 300 times
    And Flavor Text Extended: the meals are put on the table from (175, 108) to (176, 109)
    Given Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (46, 102, 112)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (222, 210, 184)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (70, 46, 32)
    And Nelim's Pickle Tools: a colonist "Camille" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Camille" has the gene "Eyes_Blue"
    And Nelim's Pickle Tools: "Camille" wears "Apparel_BasicShirt" dyed rgb (214, 120, 48)
    And Nelim's Pickle Tools: "Camille" wears "Apparel_Pants" dyed rgb (60, 60, 72)
    And Nelim's Pickle Tools: "Camille" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Camille" hair colour is rgb (214, 196, 150)
    And Nelim's Pickle Tools: "Camille" mouth is "MouthNormal"
    And Nelim's Pickle Tools: "Camille" lids are "LidNormal"
    And Nelim's Pickle Tools: the other colonists are out of frame
    Given Nelim's Pickle Tools: "Nelim" stands at (176, 110) facing South
    And Nelim's Pickle Tools: "Camille" stands at (178, 110) facing South
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinRosyCheeks"
    And Nelim's Pickle Tools: I frame the cell (178, 109) at zoom 7
    And Flavor Text Extended: the info card of a meal named after "FlavorTextFR_Katsudon" is opened
    And Flavor Text Extended: the info card is placed at the "right" of the screen
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then Flavor Text Extended: "Nelim" is logged
    And I take a screenshot "lunch 12:00 - Nelim and Camille at the laid table, the katsudon card beside"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  # 2. 12:05. The meal of two dishes at once and its card; both smile.
  Scenario: Nelim and Camille at the meal with two dishes at once
    Given Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And I wait 268 ticks
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 120 ticks pass
    When Flavor Text Extended: a colonist cooks "FTV_CookMealFine" at the "FueledStove" from "RawRice, Meat_Pig, EggChickenUnfertilized, RawPotatoes", 50 times
    And Flavor Text Extended: the meals are put on the table from (175, 108) to (176, 109)
    Given Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (46, 102, 112)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (222, 210, 184)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (70, 46, 32)
    And Nelim's Pickle Tools: a colonist "Camille" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Camille" has the gene "Eyes_Blue"
    And Nelim's Pickle Tools: "Camille" wears "Apparel_BasicShirt" dyed rgb (214, 120, 48)
    And Nelim's Pickle Tools: "Camille" wears "Apparel_Pants" dyed rgb (60, 60, 72)
    And Nelim's Pickle Tools: "Camille" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Camille" hair colour is rgb (214, 196, 150)
    And Nelim's Pickle Tools: "Camille" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Camille" lids are "LidCheerful"
    And Nelim's Pickle Tools: the other colonists are out of frame
    Given Nelim's Pickle Tools: "Nelim" stands at (176, 110) facing South
    And Nelim's Pickle Tools: "Camille" stands at (177, 110) facing South
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinRosyCheeks"
    And Nelim's Pickle Tools: I frame the cell (178, 109) at zoom 7
    And Flavor Text Extended: the info card of a meal named after 2 dishes at once is opened
    And Flavor Text Extended: the info card is placed at the "right" of the screen
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then Flavor Text Extended: "Nelim" is logged
    And I take a screenshot "lunch 12:05 - Nelim and Camille, the meal with two dishes at once and its card"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  # 3. 12:10. The blanquette (meat and milk), a hen posed after the wait, both pawns smiling.
  Scenario: the blanquette, the guest and a hen that came to see
    Given Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And I wait 477 ticks
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I let 120 ticks pass
    When Flavor Text Extended: a colonist cooks "FTV_CookMealSimple" at the "FueledStove" from "Meat_Cow, Meat_Pig, Milk", 300 times
    And Flavor Text Extended: the meals are put on the table from (175, 108) to (176, 109)
    Given Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (177, 112)
    Given Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (46, 102, 112)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (222, 210, 184)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (70, 46, 32)
    And Nelim's Pickle Tools: a colonist "Camille" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Camille" has the gene "Eyes_Blue"
    And Nelim's Pickle Tools: "Camille" wears "Apparel_BasicShirt" dyed rgb (214, 120, 48)
    And Nelim's Pickle Tools: "Camille" wears "Apparel_Pants" dyed rgb (60, 60, 72)
    And Nelim's Pickle Tools: "Camille" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Camille" hair colour is rgb (214, 196, 150)
    And Nelim's Pickle Tools: "Camille" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Camille" lids are "LidCheerful"
    And Nelim's Pickle Tools: the other colonists are out of frame
    Given Nelim's Pickle Tools: "Nelim" stands at (176, 110) facing South
    And Nelim's Pickle Tools: "Camille" stands at (177, 110) facing South
    And Nelim's Pickle Tools: the animal "Poule" stands at (177, 112) facing South
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinRosyCheeks"
    And Nelim's Pickle Tools: I frame the cell (178, 109) at zoom 7
    And Flavor Text Extended: the info card of a meal named after "FlavorTextExtended_TwoMeatBlanquette" is opened
    And Flavor Text Extended: the info card is placed at the "right" of the screen
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then Flavor Text Extended: "Nelim" is logged
    And I take a screenshot "lunch 12:10 - the blanquette, Nelim, Camille and a hen at the table"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
