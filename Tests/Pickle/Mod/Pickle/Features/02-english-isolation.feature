# TESTING.md, family "language isolation", the English half. Only true in an English game, so it
# belongs to the default pass; the French pass is aimed at 03-french-language.feature by file name.
#
# The mod's central promise is that it does nothing unless French is selected: every ordinary XML
# patch is wrapped in PatchOperationFrench, which reads Prefs.LangFolderName. Offline doubles prove
# the wrapper's logic; only the game can show that in an English game nothing was actually applied
# to the real defs and that the English text of the dependencies reads as they wrote it.
#
# The language is chosen when the game starts, never during a run, so the switch itself
# (English -> French -> English) is not a scenario: it is the two passes taken together, and the
# menu-level switch stays manual (see README).
Feature: in an English game the French patches and text stay out of the way

  # None of the three rule packs and the category is patched by anything else in this modlist:
  # Flavor Text Extended's own operations do not target them (checked against its Patches/), so
  # "was patched" here can only mean this mod's wrapper let an operation through.
  Scenario: none of the guarded patches was applied
    Then no def "FT_Egg" was patched
    And no def "FT_SideDishLabels" was patched
    And no def "FT_SideDishDescriptions" was patched
    And no def "FT_Tags" was patched

  Scenario: the dependencies' labels read as their authors wrote them
    Then def "FlavorText_MeatRaw_Fricasee" field "label" is "{0_adj} fricasée"
    And def "FT_Leek" field "label" is "Flavor Text leek"

  @requires:Biotech
  Scenario: the Biotech dish reads in English
    Then def "FlavorText_Milk_Bottle" field "label" is "{0_adj} bottle"

  Scenario: the shortcut reads in English, from the Def itself
    Then def "FTFR_Settings" field "label" is "Flavor Text settings"
    And def "FTFR_Settings" field "description" is "Open the shared Flavor Text configuration."
