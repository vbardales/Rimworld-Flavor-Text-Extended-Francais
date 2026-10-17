using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using FlavorText;
using HarmonyLib;
using Verse;

namespace FlavorTextExtendedFR
{
    // Builds, once, the table FrenchAgreement needs: every French ingredient form that Flavor Text
    // holds, with the gender and number given by Mod/Data/ingredient-agreement.txt for that ingredient.
    // Flavor Text keeps four forms per ingredient, in this order: plural (a-form), collective,
    // singular, de-form. The first, second and fourth show the ingredient as a whole and share the
    // first code; the third shows one piece of it and takes the second code.
    public static class FrenchAgreementData
    {
        private const string PackageId = "nelim.flavortextextended.fr";
        private const string DataFile = "Data/ingredient-agreement.txt";

        private static IDictionary<string, string> forms;
        private static bool failed;

        public static string Resolve(string text)
        {
            if (string.IsNullOrEmpty(text) || text.IndexOf(FrenchAgreement.Mark) < 0) return text;
            if (failed) return FrenchAgreement.Resolve(text, null);
            try
            {
                return FrenchAgreement.Resolve(text, forms ?? (forms = Build()));
            }
            catch (Exception exception)
            {
                failed = true;
                Log.Error("[Flavor Text Extended - Français] word agreement failed, the marked words stay in the masculine singular: " + exception);
                return FrenchAgreement.Resolve(text, null);
            }
        }

        // Parsing is kept apart from the game so a test can feed it lines.
        public static Dictionary<string, string[]> Parse(IEnumerable<string> lines)
        {
            Dictionary<string, string[]> table = new Dictionary<string, string[]>();
            foreach (string line in lines)
            {
                if (line.Length == 0 || line[0] == '#') continue;
                string[] cells = line.Split(new[] { '\t' });
                if (cells.Length < 3 || cells[1].Length != 2 || cells[2].Length != 2) continue;
                table[cells[0].Trim()] = new[] { cells[1], cells[2] };
            }
            return table;
        }

        // A form string shared by two ingredients with different codes is dropped: no guess.
        public static IDictionary<string, string> Index(IDictionary<string, IList<string>> inflections, IDictionary<string, string[]> codes)
        {
            Dictionary<string, string> index = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            HashSet<string> conflicted = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (KeyValuePair<string, IList<string>> entry in inflections)
            {
                string[] code;
                if (entry.Value == null || entry.Value.Count != 4 || !codes.TryGetValue(entry.Key, out code)) continue;
                for (int i = 0; i < 4; i++)
                {
                    string form = entry.Value[i];
                    if (string.IsNullOrWhiteSpace(form)) continue;
                    string value = i == 2 ? code[1] : code[0];
                    string known;
                    if (index.TryGetValue(form, out known) && known != value) conflicted.Add(form);
                    else index[form] = value;
                }
            }
            foreach (string form in conflicted) index.Remove(form);
            return index;
        }

        private static IDictionary<string, string> Build()
        {
            ModContentPack mod = LoadedModManager.RunningModsListForReading.FirstOrDefault(
                m => string.Equals(m.PackageId, PackageId, StringComparison.OrdinalIgnoreCase));
            if (mod == null) throw new InvalidOperationException("the mod " + PackageId + " is not running");
            string path = Path.Combine(mod.RootDir, DataFile);
            Dictionary<string, string[]> codes = Parse(File.ReadAllLines(path));

            Type utility = typeof(FlavorTextMod).Assembly.GetType("FlavorText.InflectionUtility", true);
            IDictionary dictionary = AccessTools.Field(utility, "ThingInflectionsDictionary").GetValue(null) as IDictionary;
            if (dictionary == null) throw new InvalidOperationException("Flavor Text's inflection dictionary is not readable");
            Dictionary<string, IList<string>> inflections = new Dictionary<string, IList<string>>();
            foreach (DictionaryEntry entry in dictionary)
            {
                ThingDef thing = entry.Key as ThingDef;
                IList<string> list = entry.Value as IList<string>;
                if (thing != null && list != null) inflections[thing.defName] = list;
            }
            return Index(inflections, codes);
        }
    }
}
