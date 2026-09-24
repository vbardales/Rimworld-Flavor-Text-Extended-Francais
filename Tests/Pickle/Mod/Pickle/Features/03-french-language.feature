# TESTING.md, family "language isolation", the French half, and the translation reaching the defs.
# Only true in a French game, so it is named only by the French passes and never by a default (English)
# pass, following the convention of the other suites here. The language is chosen when the game
# starts, so this is a second pass: `-Language French -Filter '03-french-language.feature'
#`.
#
# Why a running game is needed: the French texts reach the dish defs by DefInjected paths, one
# folder of them behind a LoadFolders gate, and the grammar reaches hekmo's defs through a wrapper
# operation. Whether the paths resolved and the wrapper let its operations through is the loader's
# answer, not the file's. In developer mode, which every Pickle run is, a missing French key shows
# as accented gibberish rather than English, and these comparisons would fail on it.
#
# Played once on 2026-09-21: the four label scenarios passed, and the two that rested on guesses failed,
# for reasons in Pickle's vocabulary and not in the mod. "was patched by mod" reported "(no mod)" for a
# patch made through the wrapper operation, and a numeric index in a dotted path is refused ("List has no
# field or property '0'"). Both were replaced by a step that reads the value itself.
Feature: French text and grammar reach the defs in a French game

  Scenario: the dish labels are French, templates and slots intact
    Then def "FlavorText_MeatRaw_Fricasee" field "label" is "fricassée {0_adj}"
    And def "FlavorTextExtended_Altang" field "label" is "altang"

  Scenario: the category label of an Extended ingredient is French
    Then def "FT_Leek" field "label" is "Flavor Text : poireau"

  # The folder is loaded only because Biotech is active, which is exactly what the gate asks.
  @requires:Biotech
  Scenario: the Biotech-gated translation was loaded
    Then def "FlavorText_Milk_Bottle" field "label" is "biberon {0_adj}"

  Scenario: the shortcut is French, injected onto the mod's own def
    Then def "FTFR_Settings" field "label" is "Réglages de Flavor Text"
    And def "FTFR_Settings" field "description" is "Ouvrir la configuration partagée de Flavor Text."

  # The proof that the wrapper let the French operations through: the value each def holds afterwards, read
  # by a companion step because two generic steps cannot. The forms are the ones in
  # Patches/CategoryInflections_FR.xml. The rule packs (side dishes, the hairy prefix) and the ingredient
  # tables are not read here: their content is checked against an in-memory copy by Test-Xml, and their
  # effect shows in the names of 06 and the captures of 07.
  Scenario: the wrapper let the French category overrides through
    Then the inflections override of category "FT_Egg" reads "aux œufs | œufs | œuf | d'œufs"
    And the inflections override of category "FT_Flour" reads "à la pâte | pâte | portion de pâte | de pâte"
