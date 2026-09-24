# TESTING.md, family "without a DLC", F09. Played by the pass `-DepMap wsl-deps.sans-anomaly-odyssey.map`.
# Flavor Text declares all fifteen ingredient tables unconditionally, the Anomaly and Odyssey ones included,
# so the mod's patch that replaces each table's dictionary must still find its target when the DLC is absent.
# A patch whose xpath matches nothing is loud in the log, which is what is read here. No save is loaded, for
# the reason given in 16-without-biotech.feature.
Feature: without Anomaly and Odyssey the patches still find their targets

  Scenario: both DLC are left out and the mod is loaded
    Then mod "ludeon.rimworld.anomaly" is not loaded
    And mod "ludeon.rimworld.odyssey" is not loaded
    And mod "nelim.flavortextextended.fr" is loaded

  Scenario: the game started and loaded the mod without an error
    Then no errors were logged
    And no warnings from mod "nelim.flavortextextended.fr"
