# TESTING.md, family "language isolation", the French half, and the translation reaching the defs.
# Only true in a French game, so the whole feature is `@wip` and skipped by a default (English)
# pass, following the convention of the other suites here. The language is chosen when the game
# starts, so this is a second pass: `-Language French -Filter '03-french-language.feature'
# -IncludeWip`.
#
# Why a running game is needed: the French texts reach the dish defs by DefInjected paths, one
# folder of them behind a LoadFolders gate, and the grammar reaches hekmo's defs through a wrapper
# operation. Whether the paths resolved and the wrapper let its operations through is the loader's
# answer, not the file's. In developer mode, which every Pickle run is, a missing French key shows
# as accented gibberish rather than English, and these comparisons would fail on it.
#
# Two guesses the steps cannot settle from here, each in a scenario of its own so that a wrong one
# does not hide the rest:
#   - "was patched by mod": Pickle attributes a patched def to the mod whose operation matched. The
#     operation here is a custom wrapper around a sequence; whether attribution follows the outer
#     operation (this mod) or the inner one is not known until a first run.
#   - "field ... inflectionsOverride.0": a dotted path into a list of strings. The dotted path is
#     documented for fields; a numeric segment on a list is assumed to work as an index.
@wip
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

  Scenario: the wrapper let the French operations through
    Then def "FT_Egg" was patched by mod "nelim.flavortextextended.fr"
    And def "FT_SideDishLabels" was patched by mod "nelim.flavortextextended.fr"
    And def "FT_Tags" was patched by mod "nelim.flavortextextended.fr"

  Scenario: the category override holds the French forms
    Then def "FT_Egg" field "inflectionsOverride.0" is "aux œufs"
    And def "FT_Egg" field "inflectionsOverride.3" is "d'œufs"
