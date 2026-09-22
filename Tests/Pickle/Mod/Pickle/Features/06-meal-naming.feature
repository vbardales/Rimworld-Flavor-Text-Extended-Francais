# TESTING.md, family "naming", the part reachable without a stove. Plays in every pass.
#
# A meal made of chosen ingredients and dropped on the map is named by Flavor Text the moment its
# label is asked for, through the same generation a cooked meal goes through: the French tables,
# the grammar patches, the fallback for unlisted ingredients and the aspirated-h repair all run for
# real. Fricassée takes a raw meat and a dairy, so each meal here has one of each and at least that
# dish can match; the dish actually chosen is random, so no exact name is asserted.
#
# What is asserted is what must hold for every name: the meal was renamed, no grammar slot was left
# raw, no error was logged, and the language of the pass shows through. Each French name is also
# captured in its full info card for review; the report is diagnostic evidence, not a manual task.
# The three meats are the ones the older manual scenarios used: a plain one (cow), an elided
# one (squirrel, d'écureuil) and an aspirated-h one (husky, de husky, never d'husky).
#
# What stays manual: the cooking itself (a colonist, a powered stove, a bill), because no vanilla
# step powers a stove or reads a label, and choosing the exact dish by restricting a bill filter.
@review @requires:nelim.pickletools.screenshotmode
Feature: a meal is named in the language of the pass, without a raw slot

  Background:
    Given the save "test-colony" is loaded

  Scenario: a meal of cow meat and milk
    Given a fine meal made of "Meat_Cow" and "Milk" lies at (140, 150)
    Then the meal at (140, 150) is named by Flavor Text in the language this pass runs
    When I open the info card of the meal at (140, 150)
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "meal naming, cow and milk"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
    And no errors were logged

  Scenario: a meal of squirrel meat and milk, elided before a vowel in French
    Given a fine meal made of "Meat_Squirrel" and "Milk" lies at (141, 150)
    Then the meal at (141, 150) is named by Flavor Text in the language this pass runs
    When I open the info card of the meal at (141, 150)
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "meal naming, squirrel and milk"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
    And no errors were logged

  Scenario: a meal of husky meat and milk, refusing the elision before an aspirated h
    Given a fine meal made of "Meat_Husky" and "Milk" lies at (142, 150)
    Then the meal at (142, 150) is named by Flavor Text in the language this pass runs
    When I open the info card of the meal at (142, 150)
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "meal naming, husky and milk"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
    And no errors were logged
