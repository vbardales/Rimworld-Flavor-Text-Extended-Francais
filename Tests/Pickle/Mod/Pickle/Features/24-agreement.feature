# 2026-10-16, French agreement after an ingredient token (STATUS.md, route b). A word written between tildes in a description
# (`{0_coll} ~cuit~ à la poêle basse`) must take the gender and number of the ingredient written before it. Flavor Text is handed one dish for a fresh
# meal (the path of feature 19) and the description is read. The first run (c958) failed at the forcing step: Vegetable_Paste needs a paste meal kind, a fine
# meal does not fit it. FlavorText_Fried_Ingredients takes one ingredient of any kind (FT_Ingredients, meal kind FT_MealsNonSpecial).
#   potatoes: "pommes de terre" (feminine plural) -> cuites
#   fungus:   "champignons" (masculine plural)    -> cuits
# The shape is asserted in the French pass only; in every pass no tilde may be left in the text.
Feature: a marked French word agrees with its ingredient

  Background:
    Given the save "test-colony" is loaded
    And the Flavor Text settings are at their documented defaults

  Scenario: a feminine plural ingredient
    Given a fine meal made of "RawPotatoes" alone lies at (143, 151)
    When Flavor Text is made to name the meal at (143, 151) as the dish "FlavorText_Fried_Ingredients"
    Then the description of the meal at (143, 151) reads in French like "pommes de terre cuites à la poêle basse"
    And no errors were logged

  Scenario: a masculine plural ingredient
    Given a fine meal made of "RawFungus" alone lies at (144, 151)
    When Flavor Text is made to name the meal at (144, 151) as the dish "FlavorText_Fried_Ingredients"
    Then the description of the meal at (144, 151) reads in French like "champignons cuits à la poêle basse"
    And no errors were logged
