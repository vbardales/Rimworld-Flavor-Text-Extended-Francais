# TESTING.md, family "restart", first launch. The Scribe round trip is proved outside the game; what
# only two real processes show is that the file the game writes when the settings are saved is the file
# the next process reads at startup. A restart cannot be faked by reading a file back in the same
# process, because the values are still in memory.
#
# Played as the first of two launches under one hold of the lock (`-Then` stages once and keeps the
# profile between launches), with 11-restart-read.feature second:
#   -Filter '10-restart-write.feature' -Then '11-restart-read.feature'
#
# If this launch dies after writing, the values stay on disk and the next staging does not clean them:
# 11 puts them back, so a pair that ran to its end leaves the defaults, and a pair that did not is to be
# cleaned by hand (the ingredient cap back to 0, quick search back to off) before anything else runs.
Feature: settings changed in one launch are written for the next

  Scenario: two values are changed and written where the game writes them
    Given the Flavor Text ingredient cap is set to 4
    And the Flavor Text quick search is set to true
    When the Flavor Text settings are written to disk
    Then the Flavor Text ingredient cap reads 4
    And the Flavor Text quick search reads true
    And no errors were logged
