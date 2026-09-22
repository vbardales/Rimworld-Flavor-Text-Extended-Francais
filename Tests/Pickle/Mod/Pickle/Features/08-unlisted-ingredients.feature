# TESTING.md, family "unlisted ingredients", F14. The fallback that builds French complements for an
# ingredient no table lists needs an ingredient no table lists, and the game does not have one to spare.
# Three are invented in a mod of their own (Tests/Pickle/FakeIngredients), staged only by the pass that
# names it, so that a fault in how Flavor Text categorizes them cannot break any other pass:
#   -Language French -IncludeWip -DepMap wsl-deps.faux-ingredients.map -Filter '08-unlisted-ingredients.feature'
#
# Nothing here asserts the exact French text: the dish is random among those that match and the fallback
# forms depend on where the dish puts the ingredient. What is asserted is what must hold for any name:
# the meal was renamed, no raw slot, and the internal def name never reaches the player. The names are
# written to the report and the inspect pane is captured, for a person to judge the accents, the
# elisions (d'huile, de yuzu) and that the labels were kept whole ("haricots rouges", not a stem).
#
# Whether Flavor Text puts these defs in a category at all is the first thing this feature tells: if it
# does not, the meals are not renamed and the first scenario says so, which is a finding about the fakes
# (their defNames or labels) rather than about the mod.
@wip @review @requires:nelim.pickletools.screenshotmode
Feature: ingredients absent from every table still read as French

  Background:
    Given the save "test-colony" is loaded
    And mod "nelim.flavortextextended.fr.fakeingredients" is loaded

  Scenario: a bare word, yuzu, with milk
    Given a fine meal made of "FTFR_RawYuzuFruit" and "Milk" lies at (140, 150)
    Then the meal at (140, 150) is named by Flavor Text in the language this pass runs
    And the meal at (140, 150) does not show the internal name "FTFR_RawYuzuFruit"
    When I select the meal at (140, 150)
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "F14 yuzu and milk, inspect pane"
    And Nelim's Pickle Tools: screenshot mode is disabled

  Scenario: a compound with an elision, huile de noix, with squirrel meat
    Given a fine meal made of "FTFR_RawWalnutOil" and "Meat_Squirrel" lies at (141, 150)
    Then the meal at (141, 150) is named by Flavor Text in the language this pass runs
    And the meal at (141, 150) does not show the internal name "FTFR_RawWalnutOil"
    When I select the meal at (141, 150)
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "F14 walnut oil and squirrel meat, inspect pane"
    And Nelim's Pickle Tools: screenshot mode is disabled

  Scenario: a plural compound, haricots rouges, with cow meat
    Given a fine meal made of "FTFR_RawRedBeans" and "Meat_Cow" lies at (142, 150)
    Then the meal at (142, 150) is named by Flavor Text in the language this pass runs
    And the meal at (142, 150) does not show the internal name "FTFR_RawRedBeans"
    When I select the meal at (142, 150)
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "F14 red beans and cow meat, inspect pane"
    And Nelim's Pickle Tools: screenshot mode is disabled

  Scenario: no error was logged while Flavor Text categorized the invented foods
    Then no errors were logged
