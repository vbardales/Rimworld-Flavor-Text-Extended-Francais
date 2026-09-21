# TESTING.md, family "translation", the interface half. Plays in every pass and asserts against the
# language the pass runs: English through hekmo's own keys and this mod's English fallback keys,
# French through this mod's Keyed resources. The language is never switched inside a scenario.
#
# What a person still reads, because no step can judge it: the French wording of the descriptions
# and the agreement in generated names. The captures of feature 04 and the labels logged by
# feature 06 are for that.
Feature: every text the mod owns resolves in the language of the pass

  Scenario: no owned key is missing from the active language
    Then every FTFR text exists in the language this pass runs

  Scenario: the settings label is the one written for this language
    Then the Flavor Text ingredient cap label reads as written for the language this pass runs
