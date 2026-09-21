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

  # The value the def holds is what proves the guard. This first read "no def X was patched", which
  # cannot see a patch made through the mod's wrapper operation: on the first French pass it reported
  # "(no mod)" for a def the French patch had certainly reached, so it would pass in a French game too
  # and prove nothing here. The French forms are the ones in Patches/CategoryInflections_FR.xml.
  Scenario: the category overrides keep the values the dependency ships
    Then the inflections override of category "FT_Egg" does not read "aux œufs | œufs | œuf | d'œufs"
    And the inflections override of category "FT_Flour" does not read "à la pâte | pâte | portion de pâte | de pâte"

  Scenario: the dependencies' labels read as their authors wrote them
    Then def "FlavorText_MeatRaw_Fricasee" field "label" is "{0_adj} fricasée"
    And def "FT_Leek" field "label" is "Flavor Text leek"

  @requires:Biotech
  Scenario: the Biotech dish reads in English
    Then def "FlavorText_Milk_Bottle" field "label" is "{0_adj} bottle"

  Scenario: the shortcut reads in English, from the Def itself
    Then def "FTFR_Settings" field "label" is "Flavor Text settings"
    And def "FTFR_Settings" field "description" is "Open the shared Flavor Text configuration."
