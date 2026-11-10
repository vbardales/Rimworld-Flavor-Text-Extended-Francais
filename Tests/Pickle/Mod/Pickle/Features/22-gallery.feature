# SHOTLIST of 1.1.0, rewritten 2026-11-10 at shootGallery[1.1.0] (first job, before any scenario). Director pass (Opus, one call) kept in part, see KEPT/DROPPED below.
# Played on Nelim's sanctuary (save Nelims-tribe), place `dining-nook` (176, 108). Pass: -DepMap wsl-deps.sanctuary.map -Language French -Filter '22-gallery.feature'
# Output is CANDIDATES (Art/Gallery/<index>-candidate-<name>, JPEG q90, under 2 MB): the owner accepts or refuses each. Not proof of the mod.
#
# STORY. "Lunch is served", in French: one midday at the sanctuary, 12:00 to 12:10 (5 game minutes, about 208 ticks, between pictures). Nelim, the host, sets a table of dishes
# whose names are French; her guest Soren (NSB colonist) arrives, sits nowhere (no seat step), the table goes from half set, to full, to half cleared; a hen from the colony's own
# fauna comes to see. The table state carries the passing of time (set, served, eaten). Hour never leaves midday, clear sky, map held at 20 degrees.
# CAST (rule 1 NSB: free). Nelim: played as the roster (own face, hair `Roo_HD_Hair_Highpony` from the save, NO hair or colour override; body Female as validated 2026-10-07 for the VTW retextured body),
#   smile (MouthSmile, LidCheerful, SkinRosyCheeks: expression, not a roster property). Outfit (free): vanilla `Apparel_BasicShirt` teal rgb (46, 102, 112) + `Apparel_Pants` cream rgb (222, 210, 184).
#   Soren (NSB, validated look: `Roo_HD_Hair_Tidy`, `Eyes_DarkGreen`, `MouthClassicSmile`, `MonoScarredBrows`, `Male_AverageNormal`): created by the scenario as `a colonist "Soren" of kind "Colonist"`,
#   appearance by NSB-ROSTER; outfit (free) vanilla `Apparel_BasicShirt` orange rgb (214, 120, 48) + `Apparel_Pants` charcoal rgb (60, 60, 72), chosen to stand out from Nelim's teal.
#   Camille (the 2026-10-16 guest, outside NSB, never validated) and Nelim's "Ponytails" override are DROPPED: no question to the owner left open.
#   Hen: anonymous Chicken of the save (Poulet 8 in the fauna, decor, no validation). The mod adds no animal (rule 5: nothing to show).
# DEPMAP: Sanctuary base + `rooboid.hdhair.continued` 3559870636 (NSB dependency, so Nelim's own hairstyle loads; to add to wsl-deps.sanctuary.map before the first ticket).
# CARD: the info card is a UI window, its size does not follow the camera zoom: the French title stays readable at 268 px in every shot. It sits at the right of the screen.
#
# SHOT 1  index 1, `1-set`. dining-nook, 12:00, Clear, 20 degrees. Subject: the table being set. Zoom 5.5 on cell (177, 109), wide: table (175..176, 108..109) and chairs, 
#   `TorchLamp` lit at (172, 108) behind (warm light at noon, GALLERY-PROPS), `Plant_Daylily` in `PlantPot` at (180, 108) in the background right; two meals on the table (the other places empty).
#   Nelim at (175, 111) facing East, holding nothing (no carry step used), smile; Soren at (178, 111) facing West, just arrived, smile. Card: katsudon (FTV simple meal), right.
#   Says: the host sets a table of dishes with French names. Subtitle: "Nelim sets the table: the dishes already speak French."
# SHOT 2  index 2, `2-served`. Same place, 12:05. Subject: a meal of two dishes at once. Zoom 7 on (177, 109), medium: the table full (four meals), pawns face each other across the table
#   (Nelim (175, 110) facing East, Soren (178, 110) facing West), both smile. Card of the 2-dish meal (main + side joined by the French joint), right. Decor of shot 1 stays (same hall).
#   Says: a main dish and its side dish, named with a French joint. Subtitle: "A main dish and its side, joined by a French word."
# SHOT 3  index 3, `3-farm`. Same place, 12:10. Subject: a French dish named after the colony's own ingredients (blanquette). Zoom 9 on (177, 111), close, low-left framing: the hen in the
#   foreground bottom-left at (177, 112) facing South (seen from the FRONT), two of the four meals removed (half eaten), Nelim and Soren behind her, partly cropped, smiling, facing South.
#   Card: the two-meat blanquette, right. Says: the blanquette is named after the colony's own animals. Subtitle: "From the colony's own farm: the blanquette."
# WINDOW  index 4: the French settings page (interface window, taken on `window-backdrop-for-height`, cropped, no subtitle). The approved 4-settings-page-in-french.jpg of 1.0.x stays until replaced.
# INSTANT AND HOW IT IS OBTAINED (criterion e: game paused mid-play). The game is paused; the meals are put by the cooking step just before the pause, the pawns are placed LAST by `stands at ... facing`
#   (no job, held in place), the face by the face-part steps.
#   1: just after the cook step put the second meal down, Nelim (facing East) turns toward Soren, who has just stepped into the nook (facing West), both gazes on the table; next: they sit down to the meal.
#   2: the table has just been filled, Nelim and Soren face each other across it, gazes on the two-dish meal; next: the first bite.
#   3: the first meals are gone (two removed after the cook step), the hen has just wandered in and stops, looking at the camera (placed facing South, gaze front); Nelim and Soren, behind, look down at her and laugh (smile); next: the hen is shooed.
# SUBJECT READ IN THE IMAGE (criterion g): 1 = a table half set, a host and a guest just meeting over it, a card naming a French dish; 2 = a full table, two people facing it, a card naming a main dish and its side;
#   3 = a half-cleared table, a hen in front, two smiling people, a card naming a dish from the colony's animals. Every shot has its card in frame: the dish name is what says "French".
# THUMBNAIL (criterion j): the card sits at the right of the screen; the director crops each accepted capture to the table-and-card region (the right 60 percent, 16:9) so the dish title is about twice as large; each
#   capture is shrunk to 268 px with ffmpeg and read at rate-gallery: if the French title is not identifiable, the shot is REDO (tighter frame, card larger). Nothing asked of NPT beyond the steps already used.
# DECOR (criterion b): `TorchLamp` (lit), `PlantPot` with `Plant_Daylily` placed fully grown, the nook's own table, two chairs, desk, wardrobes and flowerpot stay (SANCTUAIRE-CASES.md, dining-nook): grouped around the table,
#   ground covered by the room; the placed decor is removed at the end of each scenario (`I place the decor` remembers it for removal, steps.md) so each scenario starts clean.
#
# KEPT from the director pass: table state as the clock (two, four, two meals); a different zoom per shot (5.5, 7, 9); pawns face each other (facing steps exist); lamp and daylily in the background
#   (shots 1 and 2, kept in 3); hen in the foreground. DROPPED: no card in shot 1 (a UI card does not shrink with camera zoom); held meal (no carry step used); clock times 12:20 and 12:45
#   (light does not change at noon, 5 minutes stays). RISKS: hen may wander after being placed (re-shoot), doorway cell for Soren unverified (cells read on the first run), `TorchLamp` and `PlantPot`
#   placement cells in the nook may be refused (the step names the cell), Soren's roster steps (`Male` body under VTW) unplayed.
# NOT claimed: nobody sits and nobody eats (no seat step); the story says "stands at the table".
# Order imposed by NPT: waits, paused, dress, stands at LAST, frame, capture, no wait after. After the run every picture is opened and read against this plan; anomalies go to Pickle Tools.
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
