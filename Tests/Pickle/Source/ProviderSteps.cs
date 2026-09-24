using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using FlavorText;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// The third-party ingredient tables, read where they end up: the def of the provider, in the running
    /// game. A French pass with the providers loaded has to show that this mod's French forms replaced the
    /// English ones of each provider table that is present, and that the ingredients those tables name
    /// exist in the game (otherwise a pass with the provider "loaded" would prove nothing about it).
    ///
    /// The expected forms are not copied into this suite: they are read from the mod's own patch files
    /// (<c>Patches/Inflections_ThirdParty_FR.xml</c> and <c>Inflections_ExtendedProviders_FR.xml</c>) in
    /// the folder the game loaded the mod from, so a form corrected in the mod is corrected in the test.
    /// A table whose def is not loaded (its provider is not part of the pass) is counted and skipped.
    /// </summary>
    [PickleSteps]
    public class ProviderSteps
    {
        private const string ModPackageId = "nelim.flavortextextended.fr";
        private static readonly string[] Files = { "Inflections_ThirdParty_FR.xml", "Inflections_ExtendedProviders_FR.xml" };

        [Then("the loaded third-party ingredient tables read as this mod wrote them, for at least {int} ingredients present in the game")]
        public void TablesReadAsWritten(PickleContext ctx, int minimum)
        {
            ctx.Require(Driver.Language(ctx).StartsWith("French"), "the third-party tables are French: this step belongs to a French pass");
            var mod = LoadedModManager.RunningModsListForReading.FirstOrDefault(m => m.PackageId == ModPackageId);
            ctx.Require(mod != null, $"the mod {ModPackageId} is not running");

            var inflections = typeof(FlavorTextSettings).Assembly.GetType("FlavorText.InflectionUtility");
            var field = inflections == null ? null : inflections.GetField("ThingInflectionsDictionary", Driver.StaticAny);
            var dictionary = field == null ? null : field.GetValue(null) as Dictionary<ThingDef, List<string>>;
            ctx.Require(dictionary != null, "FlavorText.InflectionUtility.ThingInflectionsDictionary is gone: Flavor Text changed, update the steps");

            var checkedTables = new List<string>();
            var skippedTables = new List<string>();
            var present = 0;
            foreach (var file in Files)
            {
                var path = Path.Combine(mod.RootDir, "Patches", file);
                ctx.Require(File.Exists(path), $"the patch file {path} is not in the loaded mod folder");
                foreach (var table in Tables(XDocument.Load(path)))
                {
                    var def = DefDatabase<ThingInflectionsData>.GetNamedSilentFail(table.Key);
                    if (def == null) { skippedTables.Add(table.Key); continue; }
                    ctx.Assert(def.dictionary != null, $"the table {table.Key} holds no dictionary");
                    foreach (var entry in table.Value)
                    {
                        List<string> actual;
                        var found = def.dictionary.TryGetValue(entry.Key, out actual);
                        ctx.Assert(found, $"the table {table.Key} has no entry for {entry.Key}: the French patch did not replace it");
                        if (!found) continue;
                        ctx.Assert(actual.SequenceEqual(entry.Value),
                            $"the table {table.Key} reads [{string.Join(" | ", actual.ToArray())}] for {entry.Key}, "
                            + $"this mod wrote [{string.Join(" | ", entry.Value.ToArray())}]");
                        var thing = DefDatabase<ThingDef>.GetNamedSilentFail(entry.Key);
                        if (thing == null) continue;
                        present++;
                        List<string> live;
                        ctx.Assert(dictionary.TryGetValue(thing, out live) && live != null && live.Count == 4 && live.All(f => !string.IsNullOrEmpty(f)),
                            $"{entry.Key} has no four forms in Flavor Text's own table");
                    }
                    checkedTables.Add(table.Key);
                }
            }
            Log.Message($"[FTFR tests] provider tables checked: {string.Join(", ", checkedTables.ToArray())}; "
                + $"not loaded in this pass: {string.Join(", ", skippedTables.ToArray())}; ingredients present in the game: {present}");
            ctx.Assert(present >= minimum,
                $"only {present} ingredients named by the loaded tables exist in the game, expected at least {minimum}: the providers are not really loaded");
        }

        /// <summary>
        /// The (table def name, entries) of every provider table a patch file sets. Two shapes exist: a
        /// PatchOperationReplace whose xpath names the table (the table lives in Flavor Text's own data), and a
        /// PatchOperationAdd whose value holds SEVERAL new tables, one element each (ExtendedProviders). The first
        /// version of this step read one table per operation and so checked 12 tables and none of Shenzhou's
        /// (found 2026-09-24, pass 4).
        /// </summary>
        private static IEnumerable<KeyValuePair<string, List<KeyValuePair<string, List<string>>>>> Tables(XDocument doc)
        {
            foreach (var op in doc.Descendants().Where(e => e.Attribute("Class") != null && e.Attribute("Class").Value.StartsWith("PatchOperation") && e.Element("value") != null))
            {
                var value = op.Element("value");
                var xpath = op.Element("xpath");
                var m = Regex.Match(xpath == null ? "" : xpath.Value, "ThingInflectionsData\\[defName=\"([^\"]+)\"\\]");
                var dataElements = value.Elements().Where(e => e.Name.LocalName == "FlavorText.ThingInflectionsData").ToList();
                if (dataElements.Count > 0)
                {
                    foreach (var data in dataElements)
                    {
                        var name = data.Element("defName");
                        var dict = data.Element("dictionary");
                        if (name != null && dict != null) yield return new KeyValuePair<string, List<KeyValuePair<string, List<string>>>>(name.Value.Trim(), Entries(dict));
                    }
                }
                else if (m.Success)
                {
                    var dict = value.Element("dictionary");
                    if (dict != null) yield return new KeyValuePair<string, List<KeyValuePair<string, List<string>>>>(m.Groups[1].Value, Entries(dict));
                }
            }
        }

        private static List<KeyValuePair<string, List<string>>> Entries(XElement dict)
        {
            var entries = new List<KeyValuePair<string, List<string>>>();
            foreach (var li in dict.Elements("li"))
                entries.Add(new KeyValuePair<string, List<string>>(li.Element("key").Value.Trim(),
                    li.Element("value").Elements("li").Select(f => f.Value.Trim()).ToList()));
            return entries;
        }
    }
}
