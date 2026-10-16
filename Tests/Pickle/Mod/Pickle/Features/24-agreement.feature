# 2026-10-16, French agreement after an ingredient token (STATUS.md, route b). A word written between tildes in a
# description (`{0_coll} ~mixé~ jusqu'au lisse et ~distribué~`) must take the gender and number of the ingredient
# written before it. Flavor Text is handed one dish for a fresh meal (the path of feature 19) and the description is read.
# FlavorText_Vegetable_Paste reads `{0_coll} ~mixé~ jusqu'au lisse et ~distribué~ en monticule`.
#   potatoes: "pommes de terre" (feminine plural) -> mixées ... distribuées
#   fungus:   "champignons" (masculine plural)    -> mixés ... distribués
# The shape is asserted in the French pass only; in every pass no tilde may be left in the text.
Feature: a marked French word agrees with its ingredient

  Background:
    Given the save "test-colony" is loaded
    And the Flavor Text settings are at their documented defaults

  Scenario: a feminine plural ingredient
    Given a fine meal made of "RawPotatoes" alone lies at (143, 151)
    When Flavor Text is made to name the meal at (143, 151) as the dish "FlavorText_Vegetable_Paste"
    Then the description of the meal at (143, 151) reads in French like "pommes de terre mixées jusqu'au lisse et distribuées"
    And no errors were logged

  Scenario: a masculine plural ingredient
    Given a fine meal made of "RawFungus" alone lies at (144, 151)
    When Flavor Text is made to name the meal at (144, 151) as the dish "FlavorText_Vegetable_Paste"
    Then the description of the meal at (144, 151) reads in French like "champignons mixés jusqu'au lisse et distribués"
    And no errors were logged
