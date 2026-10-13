using System.IO;
using System.Linq;
using RimBabel;
using RimBabel.Core;
using RimBabel.Game;
using RimWorks.Pickle;
using Verse;

namespace FtfrBabel.PickleSteps
{
    /// <summary>
    /// Translates an installed mod with RimBabel and the LibreTranslate engine of a local server, then copies the package
    /// out of the game's config folder so the session can read it. Phrases carry "FTFR Babel:" because Pickle loads every
    /// installed suite's steps into one vocabulary.
    /// </summary>
    [PickleSteps]
    public class BabelSteps
    {
        [Given("FTFR Babel: the engine is LibreTranslate at {string}")]
        public void UseLibreTranslate(PickleContext ctx, string url)
        {
            ctx.Require(RimBabelMod.Settings != null, "RimBabel's settings are not loaded: the mod did not start");
            RimBabelSettings s = RimBabelMod.Settings;
            s.ResetExceptKeys();
            s.engine = EngineKind.LibreTranslate;
            s.libreUrl = url;
            s.libreKey = "";
        }

        [When("FTFR Babel: I translate the mod {string} into {string} and copy the package to {string}")]
        public void Translate(PickleContext ctx, string modName, string language, string copyTo)
        {
            ModContentPack mod = LoadedModManager.RunningModsListForReading.FirstOrDefault(m => m.Name == modName);
            ctx.Require(mod != null, "no running mod is named '" + modName + "'");
            PackageBuilder.TranslationOutcome outcome = PackageBuilder.Translate(mod, language, "Nelim", RimBabelMod.Settings, new WebHttp());
            PipelineReport r = outcome.Report;
            Log.Message("[FTFR Babel] " + modName + ": translated " + r.Translated + ", failed " + r.Failed + ", aborted " + r.Aborted
                + ". " + string.Join(" | ", r.Failures.ToArray()) + " Package: " + outcome.Package.Root);
            ctx.Assert(r.Translated > 0 && r.Failed == 0 && !r.Aborted,
                "translated " + r.Translated + ", failed " + r.Failed + ", aborted " + r.Aborted + ": " + string.Join(" | ", r.Failures.ToArray()));
            Copy(outcome.Package.Root, copyTo);
        }

        private static void Copy(string from, string to)
        {
            if (Directory.Exists(to)) Directory.Delete(to, true);
            foreach (string dir in Directory.GetDirectories(from, "*", SearchOption.AllDirectories))
                Directory.CreateDirectory(dir.Replace(from, to));
            Directory.CreateDirectory(to);
            foreach (string file in Directory.GetFiles(from, "*", SearchOption.AllDirectories))
                File.Copy(file, file.Replace(from, to), true);
        }
    }
}
