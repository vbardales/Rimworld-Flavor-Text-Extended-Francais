# TESTING.md, family "restart", second launch. A new process, which read the settings file at startup:
# the values written by 10-restart-write.feature must be the ones the game loaded, not the defaults.
# The last scenario puts everything back and writes it, so the profile is left as it was found.
Feature: settings written by the previous launch are the ones this launch loaded

  Scenario: the two values survived the restart
    Then the Flavor Text ingredient cap reads 4
    And the Flavor Text quick search reads true

  Scenario: the defaults are put back and written, leaving the profile as it was found
    Given the Flavor Text settings are at their documented defaults
    When the Flavor Text settings are written to disk
    Then the Flavor Text ingredient cap reads 0
    And the Flavor Text quick search reads false
    And no errors were logged
