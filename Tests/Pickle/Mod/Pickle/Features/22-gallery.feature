# Workshop pictures of 1.1.0: one staged story, played on Nelim's sanctuary (save Nelims-tribe), the fixture of every mod's gallery (PickleTools docs/GALERIE.md).
# Reuses the scenes of Flavor Text Extended's own gallery "Lunch is served" (FlavorText/FlavorTextExtended, Features/10-gallery-scenes.feature, run 49d4, owner's
# word 2026-10-08), played here with THIS mod loaded, so the dish names and descriptions on the cards are the French ones. Pass:
#   -DepMap wsl-deps.sanctuary.map -Language French -Filter '22-gallery.feature'
# The map is Extended's gallery map plus its Pickle companion (nelim.flavortextextended.pickletests, which owns the steps "Flavor Text Extended: ...").
# Its output is CANDIDATES (Art/Gallery/<index>-candidate-<name>, JPEG q90, under 2 MB): the owner accepts or refuses each. Not proof of the mod.
#
# THE STORY. "Lunch is served" in French: one midday at the sanctuary, Nelim at the table, the cooked meals and their French names. Three pictures, 5 game
# minutes (about 208 ticks) apart, the same light and place (dining-nook, chosen by Extended's author on the empty photographs of every place).
# SHOT PLAN (place, time, subject, composition, the living, what it says):
# 1. dining-nook, 12:00, the laid table (four meals) and the katsudon card at the right of the screen; Nelim seated (stands at facing South on the chair); says: a table of dishes with French names.
# 2. dining-nook, 12:05, the meal of two dishes at once and its card; Nelim at the table; says: the main dish and its side dish, joined by a French joint.
# 3. dining-nook, 12:10, the two-meat blanquette and a hen that came to see; says: a French dish name with the ingredients of the colony.
# The garden picture of Extended is not taken. The settings page is a menu: the approved 4-settings-page-in-french.jpg of 1.0.x stays.
# Order imposed by NPT: waits, paused, dress, stands at LAST, frame, capture, no wait after. Open points: the seated pose (standing facing South on the chair), no face
# (no face expression step yet). After the run every picture is opened and read against this plan; anomalies go to Pickle Tools (through the Ticket Manager if unreachable).
# Review note: a green run proves the path ran, never that the picture is right.
# Nelim is dressed by the photographer: vanilla garments on the retextured body of Venus Touch Waistlines (owner, 2026-10-07), as in Extended's gallery.
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
  # 1. 12:00. Four different meals on the table, the katsudon's card beside them, Nelim at the table.
  Scenario: the table is laid
    Given Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And I wait 60 ticks
    And game speed is paused
    When Flavor Text Extended: a colonist cooks "CookMealSimple" at the "FueledStove" from "RawRice, Meat_Pig, EggChickenUnfertilized", 100 times
    And Flavor Text Extended: a colonist also cooks "CookMealFine" at the "FueledStove" from "RawRice, Meat_Pig, EggChickenUnfertilized, RawPotatoes", 50 times
    And Flavor Text Extended: a colonist also cooks "CookMealSimple" at the "FueledStove" from "EggChickenUnfertilized", 300 times
    And Flavor Text Extended: the meals are put on the table from (175, 108) to (176, 109)
    Given Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (46, 102, 112)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (222, 210, 184)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (70, 46, 32)
    Given Nelim's Pickle Tools: "Nelim" stands at (176, 110) facing South
    And Nelim's Pickle Tools: I frame the cell (181, 108) at zoom 6.5
    And Flavor Text Extended: the info card of a meal named after "FlavorTextFR_Katsudon" is opened
    And Flavor Text Extended: the info card is placed at the "right" of the screen
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then Flavor Text Extended: "Nelim" is logged
    And I take a screenshot "lunch 12:00 - the table is laid, the katsudon card beside it"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  # 2. 12:05. Nelim at the table. A seated pose is the open question (no step known, ASK PICKLE TOOLS): until then she stands at the table.
  Scenario: Nelim eats the meal with two dishes at once
    Given Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And I wait 268 ticks
    And game speed is paused
    When Flavor Text Extended: a colonist cooks "CookMealFine" at the "FueledStove" from "RawRice, Meat_Pig, EggChickenUnfertilized, RawPotatoes", 50 times
    And Flavor Text Extended: the meals are put on the table from (175, 108) to (176, 109)
    Given Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (46, 102, 112)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (222, 210, 184)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (70, 46, 32)
    Given Nelim's Pickle Tools: "Nelim" stands at (176, 110) facing South
    And Nelim's Pickle Tools: I frame the cell (181, 108) at zoom 6.5
    And Flavor Text Extended: the info card of a meal named after 2 dishes at once is opened
    And Flavor Text Extended: the info card is placed at the "right" of the screen
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then Flavor Text Extended: "Nelim" is logged
    And I take a screenshot "lunch 12:05 - Nelim and the meal with two dishes at once, its card beside"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  # 3. 12:10. The blanquette (meat and milk) and a hen. The hen is posed after the wait.
  Scenario: the blanquette and a hen that came to see
    Given Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And I wait 477 ticks
    And game speed is paused
    When Flavor Text Extended: a colonist cooks "CookMealSimple" at the "FueledStove" from "Meat_Cow, Meat_Pig, Milk", 300 times
    And Flavor Text Extended: the meals are put on the table from (175, 108) to (176, 109)
    Given Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (177, 106)
    Given Nelim's Pickle Tools: "Nelim" body type is Female
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (46, 102, 112)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (222, 210, 184)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (70, 46, 32)
    Given Nelim's Pickle Tools: "Nelim" stands at (176, 110) facing South
    And Nelim's Pickle Tools: I frame the cell (181, 108) at zoom 6.5
    And Flavor Text Extended: the info card of a meal named after "FlavorTextExtended_TwoMeatBlanquette" is opened
    And Flavor Text Extended: the info card is placed at the "right" of the screen
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then Flavor Text Extended: "Nelim" is logged
    And I take a screenshot "lunch 12:10 - the blanquette and a hen at the table"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
