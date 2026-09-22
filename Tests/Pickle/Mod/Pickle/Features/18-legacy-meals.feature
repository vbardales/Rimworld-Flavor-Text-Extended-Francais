# F13. This is deliberately a scenario rather than a request to hand-play an old save.  The
# fixture named below must be committed after being made with Flavor Text and Flavor Text Extended,
# but before Flavor Text Extended - Francais was installed.  It must contain at least one stored
# meal.  Pickle loads it, pauses the game, proves that a pre-existing meal still carries Flavor
# Text's naming component, and leaves the reviewer one clean info-card capture to read.
#
# No fixture is currently committed, so this @wip feature is intentionally not runnable yet.
# Do not replace it with a new meal or a manual session: either would defeat F13.
@wip @review @requires:nelim.pickletools.screenshotmode
Feature: a meal saved before the French translation remains readable

  Scenario: an existing meal from the legacy save has a readable Flavor Text name
    Given the save "legacy-meals-before-ftfr" is loaded
    And game speed is paused
    Then an existing meal is named by Flavor Text in the language this pass runs
    When I open the info card of an existing meal
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "F13 existing meal from before the French translation"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
    And no errors were logged
