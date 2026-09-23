# TESTING.md, family "translation", the third-party tables. Passes 3 and 4 stage providers of the tables of
# Inflections_ThirdParty_FR.xml and Inflections_ExtendedProviders_FR.xml; a meal of cow and milk never touches
# them, so this reads the tables themselves, on the provider defs of the running game, and compares them with
# the forms written in the mod's own patch files. French pass only. Each scenario needs the providers it
# names, so a pass without them skips it and says so.
Feature: the provider tables read as this mod wrote them

  Background:
    Given the save "test-colony" is loaded

  @requires:VanillaExpanded.VCookE
  Scenario: the tables of the optional providers of pass 3
    Then the loaded third-party ingredient tables read as this mod wrote them, for at least 10 ingredients present in the game
    And no errors were logged

  @requires:Dajian.ChiTeaditional.Expanded
  Scenario: the Shenzhou entries of pass 4
    Then the loaded third-party ingredient tables read as this mod wrote them, for at least 4 ingredients present in the game
    And no errors were logged
