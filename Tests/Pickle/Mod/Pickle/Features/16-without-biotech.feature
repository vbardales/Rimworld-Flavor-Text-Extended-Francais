# TESTING.md, family "without a DLC", F08. Played by the pass `-DepMap wsl-deps.sans-biotech.map`, which leaves
# Biotech out of ModsConfig. The mod ships twelve translations for six Biotech-only dishes in Biotech/Languages,
# loaded only when Biotech is active (LoadFolders, IfModActive). Without Biotech nothing of it may load, and no
# def it names may be looked for.
#
# No save is loaded: the fixture was written with every DLC active, and its own errors about missing content
# would be read as this mod's. What is asserted is the start of the game and its load of the mod. Whether the
# game really leaves a DLC out is what the first run of this pass has to show, which the first scenario checks.
Feature: without Biotech the Biotech-only translation stays out of the way

  Scenario: Biotech is left out, and so is its dish
    Then mod "ludeon.rimworld.biotech" is not loaded
    And mod "nelim.flavortextextended.fr" is loaded
    And no def "FlavorText_Milk_Bottle" exists

  Scenario: the game started and loaded the mod without an error
    Then no errors were logged
    And no warnings from mod "nelim.flavortextextended.fr"
