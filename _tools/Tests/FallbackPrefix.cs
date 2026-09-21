using System;
using System.Collections.Generic;
using System.Reflection;
using FlavorTextExtendedFR;

namespace HarmonyLib
{
    public class HarmonyPatch : Attribute { }
    public class Harmony { public Harmony(string id) { } public void PatchAll(Assembly assembly) { } }
}
namespace Verse
{
    public class Def { public string label; }
    public class ThingDef : Def { }
    public static class Prefs { public static string LangFolderName; }
    public static class Translator
    {
        public static Dictionary<string,string> Resources = new Dictionary<string,string>();
        public static string Translate(this string key) { return Resources[key]; }
    }
}
namespace FlavorText { public class FlavorTextMod { } }
namespace FlavorTextExtendedFR.Tests
{
    public static class FallbackPrefix
    {
        private static void Require(bool value, string message) { if (!value) throw new Exception(message); }
        public static string Run()
        {
            var ingredient = new Verse.ThingDef { label = "huile de noix" };
            var empty = new List<string>();
            var oldResult = new List<string> { "unchanged" };
            List<string> result = oldResult;
            Verse.Prefs.LangFolderName = "English";
            Require(FrenchFallbackPatch.Prefix(ingredient, empty, ref result), "English original must run.");
            Require(object.ReferenceEquals(result, oldResult), "English result mutated.");
            Verse.Prefs.LangFolderName = "French (Français)";
            Require(!FrenchFallbackPatch.Prefix(ingredient, empty, ref result), "English generator ran for French ingredient.");
            Require(result[0] == "à base d'huile de noix" && result[3] == "d'huile de noix", "Translated fallback not used.");
            Require(result[1] == ingredient.label && result[2] == ingredient.label, "Ingredient label changed.");
            var reviewed = new List<string> { "au riz", "riz", "grain de riz", "de riz" };
            Require(FrenchFallbackPatch.Prefix(ingredient, reviewed, ref result), "Reviewed forms overridden.");
            Require(FrenchFallbackPatch.Prefix(new Verse.Def { label = "category" }, empty, ref result), "Non-ThingDef unexpectedly intercepted.");
            ingredient.label = " ";
            Require(!FrenchFallbackPatch.Prefix(ingredient, null, ref result), "Empty label bypassed fallback.");
            Require(result[1] == "ingrédient", "Missing-label key not resolved.");
            return "PASS: production prefix with host doubles and shipped French keys; English bypass, French dispatch, reviewed forms preserved, category exclusion and empty label.";
        }
    }
}
