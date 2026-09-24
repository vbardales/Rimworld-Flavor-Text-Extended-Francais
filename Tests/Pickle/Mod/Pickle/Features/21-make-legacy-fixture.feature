# A TOOL, NOT A TEST. It makes the fixture that feature 18 (F13) loads, and is never part of a pass:
# every pass of TESTING.md names its features one by one, and this one is run alone, in English,
# with `-Filter '@fixture-maker'`.
#
# Why English: the language guard of this mod applies its patches in a French game only, so an English
# game with the mod loaded names meals exactly as one without it would. The save it writes therefore
# holds meals made before this translation had any say in their names, which is what F13 needs. Flavor
# Text stores which dishes a meal received, not the words, so the French pass reads them back and
# has to name them again.
#
# The meals are made by the same steps feature 06 and 07 use, and each is named once before the save
# so that the dishes are chosen and stored. The save is copied to fixture-out/ in the report folder;
# commit it as Tests/Pickle/Mod/Pickle/Fixtures/legacy-meals-before-ftfr.rws.
@fixture-maker
Feature: make the save of meals from before the French translation

  Scenario: a colony with meals already named, saved
    Given the save "test-colony" is loaded
    And the Flavor Text settings are at their documented defaults
    And a fine meal made of "Meat_Cow" and "Milk" lies at (140, 150)
    And a fine meal made of "Meat_Squirrel" and "Milk" lies at (141, 150)
    And a lavish meal made of "Meat_Squirrel", "Milk", "RawRice" and "EggChickenUnfertilized" lies at (142, 150)
    Then the meal at (140, 150) is named by Flavor Text in the language this pass runs
    And the meal at (141, 150) is named by Flavor Text in the language this pass runs
    And the meal at (142, 150) is named by Flavor Text in the language this pass runs
    When the game is saved as "legacy-meals-before-ftfr" and copied to the report folder
    Then no errors were logged
