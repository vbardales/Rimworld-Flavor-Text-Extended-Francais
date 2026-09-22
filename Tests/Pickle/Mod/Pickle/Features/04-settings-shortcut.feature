# TESTING.md, families "settings" and "shortcut", the parts a running game is needed for. Plays in
# every pass; in the French pass the captures show the French page.
#
# The clamp (0-6), the defaults and the bridge's routing are proved outside the game with the
# production classes and UI doubles (Test-SettingsBridge, Test-UpstreamSettings). What only a game
# shows is that the real Dialog_ModSettings draws through the bridge, that it belongs to THIS mod,
# and that drawing it really applies the clamp to hekmo's own field.
#
# Revealing and re-hiding the shortcut in RIMMSQOL, and that this choice survives a restart, are not here:
# RIMMSQOL is not in the default staging, which mounts hard dependencies only. They are features 12 to 15,
# played by pass 7 ("avec-rimmsqol") through the shared steps of PickleTools/RimmsqolSteps. This feature
# stays what it was: the contract on THIS mod's side, in every pass, with nothing else installed.
@review @requires:nelim.pickletools.screenshotmode
Feature: the settings page and its hidden shortcut

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs
    And the Flavor Text settings are at their documented defaults

  Scenario: hidden by default, and it opens this mod's own page when activated
    Then the FTFR shortcut is hidden on a clean configuration
    When the FTFR shortcut is activated
    Then the FTFR settings dialog is open for this mod
    When Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "flavor text settings, opened by the shortcut"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  Scenario: the Options entry opens the same page, in the language of the pass
    When I open the FTFR settings dialog
    Then the FTFR settings dialog is open for this mod
    And the Flavor Text ingredient cap label reads as written for the language this pass runs
    When Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "flavor text settings, opened from mod options"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs

  # The bridge clamps on construction, on drawing and on saving. Drawing is the one a player
  # triggers by opening the page, so the out-of-range value is planted first and the dialog is
  # opened over it. Restored at the end so nothing leaks into the next scenario.
  Scenario: an out-of-range ingredient cap is clamped when the page is drawn
    Given the Flavor Text ingredient cap is set to 9
    When I open the FTFR settings dialog
    Then the Flavor Text ingredient cap reads 6
    When I close all dialogs
    And the Flavor Text ingredient cap is set to -3
    And I open the FTFR settings dialog
    Then the Flavor Text ingredient cap reads 0
    When I close all dialogs
    And the Flavor Text settings are at their documented defaults
    Then no errors were logged

  # RIMMSQOL moves MainButtonDef.buttonVisible. This is the other side of that contract: invisible
  # until something moves it, then properly drawn rather than refused or greyed, and gone again.
  Scenario: revealed it is drawn and live, hidden it is gone again
    Then the FTFR shortcut is not drawn in the bar
    When the FTFR shortcut is revealed, as a customization mod would
    Then the FTFR shortcut is drawn in the bar
    When the FTFR shortcut is hidden again
    Then the FTFR shortcut is not drawn in the bar
