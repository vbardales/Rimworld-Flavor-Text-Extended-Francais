using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Text.RegularExpressions;
using FlavorText;
using HarmonyLib;
using Verse;

namespace FlavorTextExtendedFR
{
    // Keep the game's normal processing, correcting only known aspirated-h food
    // words in Flavor Text's final meal strings, and the capital that Flavor Text gives
    // to the first letter of every side dish, which is wrong after a French joint
    // ("Dolma, façon Œufs de poule", not "façon œufs"). No global language-worker patch.
    [HarmonyPatch]
    public static class FrenchMealPostProcessing
    {
        private static readonly Regex AspiratedH = new Regex(
            @"\b([dD])'(?=h(?:aricots?|oublon|usk(?:y|ies)|érons?)\b)", RegexOptions.IgnoreCase);

        public static IEnumerable<MethodBase> TargetMethods()
        {
            Type type = typeof(FlavorTextMod).Assembly.GetType("FlavorText.CompFlavor", true);
            foreach (string name in new[] { "CompileFlavorLabels", "CompileFlavorDescriptions" })
            {
                MethodInfo method = type.GetMethod(name, BindingFlags.Instance | BindingFlags.NonPublic);
                if (method == null) throw new MissingMethodException(type.FullName, name);
                yield return method;
            }
        }

        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            MethodInfo original = typeof(LanguageWorker).GetMethod("PostProcessed", new[] { typeof(string) });
            MethodInfo replacement = typeof(FrenchMealPostProcessing).GetMethod("Apply");
            int matches = 0;
            foreach (CodeInstruction instruction in instructions)
            {
                if (instruction.Calls(original))
                {
                    instruction.opcode = OpCodes.Call;
                    instruction.operand = replacement;
                    matches++;
                }
                yield return instruction;
            }
            if (matches != 1) throw new InvalidOperationException("Expected one meal language-processing call, found " + matches);
        }

        // Flavor Text builds a meal label from the main dish and each side dish, and title-cases every
        // dish label first ("œufs de poule" becomes "Œufs de poule") because in English a joint is
        // followed by a capitalized name. After a French joint ("façon", "avec", "et", ": ") the side dish
        // reads in lower case, unless its own label starts with a capital (a proper noun). The raw labels
        // are the ones Flavor Text keeps in CompFlavor.flavorLabels; the main dish (index 0) is untouched.
        // The capitalizer is the game's own (Find.ActiveLanguageWorker.ToTitleCase); a test passes the worker's.
        // Last to first, because each side dish was appended after the previous ones.
        public static string LowerSideDishes(string label, IList<string> rawLabels, Func<string, string> capitalizeAsTitle = null)
        {
            capitalizeAsTitle = capitalizeAsTitle ?? GenText.CapitalizeAsTitle;
            if (string.IsNullOrEmpty(label) || rawLabels == null) return label;
            for (int i = rawLabels.Count - 1; i >= 1; i--)
            {
                string raw = rawLabels[i];
                if (string.IsNullOrEmpty(raw) || char.IsUpper(raw[0])) continue;
                string capitalized = capitalizeAsTitle(raw);
                if (capitalized == raw) continue;
                int at = label.LastIndexOf(capitalized, StringComparison.Ordinal);
                if (at < 0) continue;
                label = label.Substring(0, at) + raw + label.Substring(at + capitalized.Length);
            }
            return label;
        }

        // After CompileFlavorLabels: French only, labels only (the descriptions already use the raw labels).
        // If the game's own post-processing changed the side dish's text (an aspirated-h repair inside it),
        // the capitalized form is not found and the label is left as the game made it.
        public static void Postfix(object __instance, MethodBase __originalMethod)
        {
            if (__originalMethod.Name != "CompileFlavorLabels" || !FrenchLanguage.IsFrench(Prefs.LangFolderName)) return;
            Type type = __instance.GetType();
            FieldInfo labels = AccessTools.Field(type, "flavorLabels");
            FieldInfo final = AccessTools.Field(type, "finalFlavorLabel");
            if (labels == null || final == null) return;
            string current = final.GetValue(__instance) as string;
            string lowered = LowerSideDishes(current, labels.GetValue(__instance) as IList<string>);
            if (lowered != current) final.SetValue(__instance, lowered);
        }

        public static string Apply(LanguageWorker worker, string text)
        {
            string result = worker.PostProcessed(text);
            if (!FrenchLanguage.IsFrench(Prefs.LangFolderName)) return result;
            return AspiratedH.Replace(result, "$1e ");
        }
    }
}
