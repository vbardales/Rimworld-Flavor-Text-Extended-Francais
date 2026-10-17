# 2026-10-17, AUDIT.md 8.f: Food Texture Variety is an optional provider. Its meals (FTV_MealSimple, FTV_MealFine, FTV_MealLavish) get their kind in French from
# this mod's DefInjected (Mod/FoodTextureVariety, loaded by LoadFolders IfModActive Goat.Food.Texture.Variety). A meal of the FTV def is made directly (the
# real cook of the first try, ticket f382, needed more game time than the 300 s watchdog allows once FTV is loaded: no meal after about 4000 ticks). The name
# Flavor Text gives must end with the French kind and hold no English kind ("variety simple meal"). The cooking of FTV recipes is proved by the gallery run
# (the FTV meals cooked there carry the French kind on their cards). Own pass, French only: `-Language French -DepMap wsl-deps.ftv.map -Filter '25-food-texture-variety.feature'`.
@review @requires:Goat.Food.Texture.Variety @requires:nelim.pickletools.screenshotmode
Feature: a Food Texture Variety meal is named in French, kind included

  Background:
    Given the save "test-colony" is loaded

  Scenario: an FTV simple meal
    Given a meal of def "FTV_MealSimple" made of "Meat_Pig" alone lies at (140, 150)
    Then the meal at (140, 150) is named by Flavor Text in the language this pass runs
    And the name of the meal at (140, 150) ends with "(plat simple)" and holds no English kind
    And no errors were logged

  Scenario: an FTV fine meal
    Given a meal of def "FTV_MealFine" made of "Meat_Pig" alone lies at (141, 150)
    Then the name of the meal at (141, 150) ends with "(plat raffiné)" and holds no English kind
    And no errors were logged

  Scenario: an FTV lavish meal
    Given a meal of def "FTV_MealLavish" made of "Meat_Pig" alone lies at (142, 150)
    Then the name of the meal at (142, 150) ends with "(plat gastronomique)" and holds no English kind
    And no errors were logged
