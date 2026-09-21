# TESTING.md, family "loading". Plays in every pass, English or French.
#
# This mod is XML plus a small assembly, and every line of it runs inside hekmo's code or
# RimWorld's loader. The offline suite proves the files parse, that every DefInjected handle names
# a def that exists, and that the patches apply to an in-memory copy of the dependencies' Defs.
# What only a running game shows is that the REAL patch pipeline accepts them, that the assembly
# loaded and its Mod class constructed, and that a game loads and saves with all of it active.
#
# A guarded operation whose xpath matches nothing is loud in the log, which is why "no errors were
# logged" after the fixture loads is the assertion that carries this feature.
Feature: the translation loads after the mods it translates, and a game runs with it

  Scenario: the mods are active and load in the documented order
    Then mod "brrainz.harmony" is loaded
    And mod "hekmo.FlavorText" is loaded
    And mod "nelim.flavortextextended" is loaded
    And mod "nelim.flavortextextended.fr" is loaded
    And mod "nelim.flavortextextended.fr" loads after "brrainz.harmony"
    And mod "nelim.flavortextextended.fr" loads after "hekmo.FlavorText"
    And mod "nelim.flavortextextended.fr" loads after "nelim.flavortextextended"

  # One def from each of the four places the mod reaches into: a Flavor Text dish, an Extended dish,
  # a category and a rule pack that the patches target, and the shortcut the mod owns.
  Scenario: the defs the translation and its patches aim at exist
    Then def "FlavorText_MeatRaw_Fricasee" exists
    And def "FlavorTextExtended_Altang" exists
    And def "FT_Egg" exists
    And def "FT_SideDishLabels" of type "RulePackDef" exists
    And def "FTFR_Settings" of type "MainButtonDef" exists

  # The dish is Biotech-only: its translation sits in Biotech/Languages, loaded by the LoadFolders
  # gate, and the def only exists with Biotech active. The staging mounts every DLC.
  @requires:Biotech
  Scenario: the Biotech-only dish exists when Biotech is active
    Then def "FlavorText_Milk_Bottle" exists

  # The assertion of the feature. The custom PatchOperationFrench wraps ordinary operations, and a
  # wrapper that misreports success or failure shows only here, as a "Patch operation ... failed"
  # error, in whichever language the pass runs.
  Scenario: loading a game with the mod raises no error and no warning of its own
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.flavortextextended.fr"

  Scenario: a game with the mod saves and reloads
    Given the save "test-colony" is loaded
    Then the save round trips
    When I save and reload
    Then no errors were logged
