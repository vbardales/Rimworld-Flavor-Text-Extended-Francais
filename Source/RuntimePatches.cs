using System;
using System.Collections.Generic;
using System.Reflection;
using FlavorText;
using HarmonyLib;
using Verse;

namespace FlavorTextExtendedFR
{
    public static class RuntimePatches
    {
        private static bool installed;
        public static void Install()
        {
            if (installed) return;
            new Harmony("nelim.flavortextextended.fr").PatchAll(typeof(RuntimePatches).Assembly);
            installed = true;
        }
    }

    [HarmonyPatch]
    public static class FrenchFallbackPatch
    {
        public static MethodBase TargetMethod()
        {
            Type type = typeof(FlavorTextMod).Assembly.GetType("FlavorText.InflectionUtility", true);
            MethodInfo method = type.GetMethod("GenerateInflections", BindingFlags.Static | BindingFlags.NonPublic,
                null, new[] { typeof(Def), typeof(List<string>) }, null);
            if (method == null) throw new MissingMethodException(type.FullName, "GenerateInflections");
            return method;
        }

        public static bool Prefix(Def ingredient, List<string> inflections, ref List<string> __result)
        {
            if (!FrenchLanguage.IsFrench(Prefs.LangFolderName) ||
                !(ingredient is ThingDef) || !FrenchFallback.NeedsGeneration(inflections)) return true;

            string label = string.IsNullOrWhiteSpace(ingredient.label)
                ? "FTFR_UnknownIngredient".Translate().ToString() : ingredient.label.Trim();
            bool elision = FrenchFallback.NeedsElision(label);
            // Resource keys contain whole forms, so no English suffix, stem stripping,
            // or assumption about the gender of a third-party noun is introduced.
            string aKey = elision ? "FTFR_FallbackAElided" : "FTFR_FallbackA";
            string deKey = elision ? "FTFR_FallbackDeElided" : "FTFR_FallbackDe";
            __result = FrenchFallback.Create(label, aKey.Translate().ToString(), deKey.Translate().ToString());
            return false;
        }
    }
}
