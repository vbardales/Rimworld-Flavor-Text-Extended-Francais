# Workshop pictures of 1.1.0: one staged story, played on the shared fixture of every mod's gallery, Nelim's sanctuary (PickleTools docs/GALERIE.md,
# docs/SANCTUAIRE-LIEUX.md; PUBLISHING.md gallery rules of 2026-10-02 to 10-06). Written 2026-10-08. French pass only:
#   -DepMap wsl-deps.sanctuary.map -Language French -Filter '22-gallery.feature'
# Its output is CANDIDATES (Art/Gallery/<index>-candidate-<name>): the owner accepts or refuses each one. Never filed as green proof of the mod itself.
#
# WHICH STEPS ARE WHOSE.
#   Nelim's Sanctuary:     `I am at the sanctuary "<place>"` (named places of the Sanctuary Backlot, staged by the first line of wsl-deps.sanctuary.map).
#   Nelim's Pickle Tools:  `"Nelim" stands at (x, z) facing West`, `I let N ticks pass` (240 s timeout), `screenshot mode is enabled around the open windows`.
#   Pickle's own:          the save load, `game speed is paused`, `I close all dialogs`, `I set the hour to`, `I set the weather to`, `I take a screenshot`.
#   This mod's own:        the meal steps of MealSteps.cs (a lavish meal lies at, I select the meal, I open the info card). No new step.
#
# THE STORY. "A French dinner at the sanctuary": Nelim, the only colonist, sits down to a meal at noon and the game gives it the name a French
# menu would. The meal changes place with the hour: first at the dining table, then by the hearth, then the full card of the dish. Rhythm chosen by the
# author of the series: from noon, clear weather, 5 game minutes (about 208 ticks) between two pictures, the same light, the same afternoon.
#
# SHOT PLAN (place, time, subject, composition, the living around it, what the picture says):
# 1. dining-nook, camera (173, 109) zoom 3.7 so the table sits right of the inspect pane, 12:00. Subject: the lavish meal of squirrel, milk, rice and egg on the
#    table (175, 109). Composition: table and the two chairs in the middle ground, the shelf behind, the pane at the lower left. Living: Nelim standing at
#    (178, 110) looking at the table; the sanctuary's cats nearby. Says: a hermit's dinner whose name reads like a French menu, with a lower-case side dish.
# 2. fire-pit, camera (179, 116) zoom 5, 12:05. Subject: the lavish meal of cow, potatoes, corn and milk on the floor by the hearth (180, 116). Composition: the
#    central fire behind the meal, the pane at the lower left. Living: Nelim at (182, 116) facing West. Says: the same dinner an hour later by the fire, other dish,
#    other French name and joint.
# 3. window-backdrop-for-height, 12:10. Subject: the info card of the squirrel dish, a full-screen window, so it goes on the Sanctuary's backdrop place
#    and is cropped sideways by hand afterwards. Says: the whole name and the whole French description, which the pane cuts.
# The settings page (4) is a menu: a plain screen capture of what it is, the approved 4-settings-page-in-french.jpg of 1.0.x stays.
#
# Order imposed by NPT (lesson of FlavorTextExtended, 2026-10-08): waits, paused, dress, `stands at` LAST, frame, capture, no wait after the frame.
# After the run every picture is opened and read against this plan; an anomaly that comes from the scene or from a shared tool is described to Pickle Tools
# with the capture (through the Ticket Manager when the session is unreachable), never worked around here.
# The cells of the dining nook and of the fire pit are read from PickleTools docs/SANCTUAIRE-CASES.md (the table at (175, 108), the free row z 116 at the fire pit);
# the cell (90, 140) of the backdrop place is its centre and was not read as free: the step will say so if it is not standable.
@review @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.screenshotmode
Feature: Workshop pictures of the French meal names

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I close all dialogs
    And I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the eclipse of the map is ended

  Scenario: the dinner at the dining table
    When Nelim's Pickle Tools: I let 60 ticks pass
    And a lavish meal made of "Meat_Squirrel", "Milk", "RawRice" and "EggChickenUnfertilized" lies at (175, 109)
    And Nelim's Pickle Tools: "Nelim" stands at (178, 110) facing West
    Then the side dishes of the meal at (175, 109) do not start with a capital after a French joint
    When Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And Nelim's Pickle Tools: I frame the cell (173, 109) at zoom 3.7
    And I select the meal at (175, 109)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "workshop-1-the-dinner-at-the-dining-table"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  Scenario: the same dinner by the fire
    When Nelim's Pickle Tools: I let 268 ticks pass
    And a lavish meal made of "Meat_Cow", "RawPotatoes", "RawCorn" and "Milk" lies at (180, 116)
    And Nelim's Pickle Tools: "Nelim" stands at (182, 116) facing West
    Then the side dishes of the meal at (180, 116) do not start with a capital after a French joint
    When Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: I frame the cell (178, 116) at zoom 5
    And I select the meal at (180, 116)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "workshop-2-the-same-dinner-by-the-fire"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  Scenario: the whole name on the card
    When Nelim's Pickle Tools: I let 476 ticks pass
    And a lavish meal made of "Meat_Squirrel", "Milk", "RawRice" and "EggChickenUnfertilized" lies at (90, 140)
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And I open the info card of the meal at (90, 140)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "workshop-3-the-whole-name-on-the-card"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
