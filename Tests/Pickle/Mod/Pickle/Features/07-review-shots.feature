# TESTING.md, family "manual scenarios, given to a person". Nothing here asserts a name: the dish is
# random among those that match, and whether French reads well is a judgement. Each scenario builds a
# meal of chosen ingredients, opens it in the inspect pane the way a player would, and takes a capture
# for a person to open and validate. The capture is the deliverable; a green scenario only says the
# capture was taken.
#
# They stand in for the manual scenarios of _tools/FUNCTIONAL-SCENARIOS.md that only need looking:
#   F04  a plain meat, an elided meat and an aspirated-h meat in the name (cow, squirrel, husky)
#   F05  the a-form and collective forms in the description
#   F06  side dishes and the French joining sentences (the two lavish meals, four ingredients)
# They do NOT stand in for cooking with a colonist, nor for F14 (an ingredient absent from every table,
# which needs a mod that supplies one).
#
# French pass only, so `@wip`: `-Language French -IncludeWip -Filter '07-review-shots.feature'`.
# In an English game the same captures would show the dependencies' English, which is not what is being
# judged here. The inspect pane needs no camera move: the meal is selected, not looked at on the map.
@wip @review
Feature: captures of French meal names and descriptions for a person to validate

  Background:
    Given the save "test-colony" is loaded

  Scenario: a meal of cow meat and milk
    Given a fine meal made of "Meat_Cow" and "Milk" lies at (140, 150)
    When I select the meal at (140, 150)
    And I take a screenshot "F04 cow meat and milk, inspect pane"

  Scenario: a meal of squirrel meat and milk, elided before a vowel
    Given a fine meal made of "Meat_Squirrel" and "Milk" lies at (141, 150)
    When I select the meal at (141, 150)
    And I take a screenshot "F04 squirrel meat and milk, inspect pane"

  Scenario: a meal of husky meat and milk, no elision before an aspirated h
    Given a fine meal made of "Meat_Husky" and "Milk" lies at (142, 150)
    When I select the meal at (142, 150)
    And I take a screenshot "F04 husky meat and milk, inspect pane"

  Scenario: a lavish meal of four ingredients, squirrel, milk, rice and egg
    Given a lavish meal made of "Meat_Squirrel", "Milk", "RawRice" and "EggChickenUnfertilized" lies at (143, 150)
    When I select the meal at (143, 150)
    And I take a screenshot "F05 F06 lavish meal, squirrel milk rice egg, inspect pane"

  Scenario: a lavish meal of four ingredients, cow, potatoes, corn and milk
    Given a lavish meal made of "Meat_Cow", "RawPotatoes", "RawCorn" and "Milk" lies at (144, 150)
    When I select the meal at (144, 150)
    And I take a screenshot "F05 F06 lavish meal, cow potatoes corn milk, inspect pane"
