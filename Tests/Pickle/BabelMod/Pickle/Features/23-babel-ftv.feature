# 2026-10-13: the French package of Food Texture Variety, made by RimBabel with the LibreTranslate engine of the local server
# (Docker in WSL, container rimbabel-libretranslate, http://localhost:5000, languages en and fr). The package is copied to
# Tests/Pickle/Evidence/babel-ftv for the session to read. A draft for Virginie to review; not a test of this mod.
# Pass: -DepMap wsl-deps.babel.map -Filter '23-babel-ftv.feature'
Feature: Food Texture Variety is translated into French by RimBabel

  Scenario: the package of Food Texture Variety
    Given FTFR Babel: the engine is LibreTranslate at "http://localhost:5000"
    When FTFR Babel: I translate the mod "Food Texture Variety" into "French" and copy the package to "/mnt/c/Users/nelim/Documents/rimworld/FlavorText/FlavorTextExtendedFR/Tests/Pickle/Evidence/babel-ftv"
    Then no errors were logged
