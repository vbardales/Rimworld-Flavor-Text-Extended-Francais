# TESTING.md, family "manual scenarios, given to a person": real cooking, filmed. A colonist cooks a meal
# at a fuelled stove from the colony's stock, the meal is named by Flavor Text as it comes out, and the
# scenario checks what must hold for any name. The film and the capture are the
# deliverable: a person watches the cook, then opens the inspect pane on the result and judges the French.
#
# The film is made by the shared steps of Nelim's Pickle Tools (PickleTools/FilmTicks): one picture every
# 30 game ticks, only between the two steps below, at normal speed so a picture is a tick and not a guess.
# Pickle's own @film would start at the first step and cap at sixty seconds. Staged by the pass
# `-DepMap wsl-deps.cuisson-film.map`; the pictures are encoded into a video when ffmpeg is on the PATH.
#
# What differs from `06` and `07`: here the meal is made by the game's own cooking job, so the ingredients
# are registered by RimWorld as the cook works and the meal is named at the moment it is created, which a
# meal put on the map by a step never goes through. That is F01's "cook a meal" for real.
#
# The stock decides the dish, so no exact name is asserted; the milk and the squirrel meat are added to
# make fricassee available among the candidates. French pass only, so `@wip`:
# `-Language French -IncludeWip -DepMap wsl-deps.cuisson-film.map -Filter '09-cooking.feature'`. Whether a colonist of the fixture can cook
# is checked first, so a failure names its cause instead of timing out.
@wip @review @slow @watch @timeout:300 @requires:nelim.pickletools.filmticks
Feature: a colonist cooks a meal that Flavor Text names, filmed

  Scenario: a colonist cooks at a fuelled stove, and the meal is named in the language of the pass
    Given the save "test-colony" is loaded
    And game speed is normal
    And a colonist "Cook" exists
    And "Cook" skill "Cooking" is set to level 10
    Then "Cook" can do "Cooking"
    Given a fuelled stove stands at (150, 155)
    And 12 "Meat_Squirrel" is spawned at the stockpile
    And 12 "Milk" is spawned at the stockpile
    When Nelim's Pickle Tools: I film every 30 ticks as "cooking"
    And I set "Cook" priority "Cooking" to 1
    And I add bill "CookMealSimple" to the "FueledStove" at (150, 155)
    And I wait for bill "CookMealSimple" to finish
    And Nelim's Pickle Tools: I stop filming
    Then a cooked meal lies in the colony and is named by Flavor Text in the language this pass runs
    And no errors were logged
    When I take a screenshot "cooked meal, colony view"
