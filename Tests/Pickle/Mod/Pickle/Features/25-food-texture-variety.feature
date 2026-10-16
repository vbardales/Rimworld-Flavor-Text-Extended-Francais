# 2026-10-16, AUDIT.md 8.f: Food Texture Variety is an optional provider. Its meals (FTV_MealSimple, FTV_MealFine, FTV_MealLavish) come from the FTV_CookMeal*
# recipes; Flavor Text names them and this mod's DefInjected (Mod/FoodTextureVariety, loaded by LoadFolders IfModActive Goat.Food.Texture.Variety) gives their kind
# in French. Played the way feature 09 plays: a colonist really cooks, so the meal is named at the moment it is created. The stock decides the dish, so the
# scenario asserts what must hold for any dish: named by Flavor Text, ending with "(plat simple)", no English kind ("variety simple meal") left.
# Own pass, French only: `-Language French -DepMap wsl-deps.ftv.map -Filter '25-food-texture-variety.feature'` (TESTING.md, pass 11).
@review @slow @requires:Goat.Food.Texture.Variety @requires:nelim.pickletools.screenshotmode
Feature: a Food Texture Variety meal is named in French, kind included

  @timeout:420
  Scenario: a colonist cooks an FTV simple meal, named by Flavor Text with its kind in French
    Given the save "test-colony" is loaded
    And game speed is normal
    And a colonist "Cook" exists
    And "Cook" skill "Cooking" is set to level 10
    Then "Cook" can do "Cooking"
    Given a fuelled stove stands at (150, 155)
    And 20 "Meat_Squirrel" is spawned at the stockpile
    And 12 "Milk" is spawned at the stockpile
    When I set "Cook" priority "Cooking" to 1
    And I add bill "FTV_CookMealSimple" to the "FueledStove" at (150, 155)
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    And the cook works for up to 45 seconds or until a meal is cooked
    Then a cooked meal lies in the colony and is named by Flavor Text in the language this pass runs
    And the name of the cooked meal ends with "(plat simple)" and holds no English kind
    And no errors were logged
    When I open the info card of the cooked meal
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    And I take a screenshot "ftv meal, info card"
    And Nelim's Pickle Tools: screenshot mode is disabled
    And I close all dialogs
