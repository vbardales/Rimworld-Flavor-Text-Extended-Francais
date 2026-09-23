# TESTING.md, family "naming", the exact-dish half. Flavor Text is handed one dish for a fresh meal
# (the path a saved meal takes on load), so a name whose shape depends on the dish can be asserted:
# the elision before a vowel, the refusal of it before an aspirated h, the collective form, the egg
# form. A guard in the step fails the scenario if the dish did not fit the meal and Flavor Text fell
# back to a random one. The French shape is only asserted in the French pass; in English the dish is
# still forced and the name is kept free of raw slots.
Feature: the dish asked for is the dish named, in the language of the pass

  Background:
    Given the save "test-colony" is loaded

  Scenario: a dish of squirrel elides before the vowel
    Given a fine meal made of "Meat_Squirrel" and "Milk" lies at (143, 150)
    When Flavor Text is made to name the meal at (143, 150) as the dish "FlavorText_Baked_Ingredients"
    Then the meal at (143, 150) is named in French like "d'écureuil.* au four$"
    And no errors were logged

  Scenario: a dish of husky does not elide before the aspirated h
    Given a fine meal made of "Meat_Husky" and "Milk" lies at (144, 150)
    When Flavor Text is made to name the meal at (144, 150) as the dish "FlavorText_Baked_Ingredients"
    Then the meal at (144, 150) is named in French like "de husky"
    And the meal at (144, 150) is not named in French like "d'husky"
    And no errors were logged

  Scenario: a dish of cow reads with the plain preposition
    Given a fine meal made of "Meat_Cow" and "Milk" lies at (145, 150)
    When Flavor Text is made to name the meal at (145, 150) as the dish "FlavorText_Baked_Ingredients"
    Then the meal at (145, 150) is named in French like "de bœuf.* au four$"
    And no errors were logged
