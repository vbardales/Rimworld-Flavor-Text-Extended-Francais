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
    // words in Flavor Text's final meal strings. No global language-worker patch.
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

        public static string Apply(LanguageWorker worker, string text)
        {
            string result = worker.PostProcessed(text);
            if (!string.Equals(Prefs.LangFolderName, "French", StringComparison.OrdinalIgnoreCase)) return result;
            return AspiratedH.Replace(result, "$1e ");
        }
    }
}
