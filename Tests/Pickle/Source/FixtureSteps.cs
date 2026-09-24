using System;
using System.IO;
using System.Linq;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// Makes the F13 fixture: a save with meals already in it, taken in an English game where this mod
    /// changes nothing, so that the French pass has to name meals it did not name when they were made.
    /// A tool, not a test: nothing asserts here, and feature 21 is never part of a pass. The game writes
    /// the save into its own Saves folder inside the WSL profile, where nothing else can reach it, so the
    /// step also copies the file to <c>fixture-out/</c> in the report folder, which the launcher shares
    /// with Windows. The file is then committed as <c>Mod/Pickle/Fixtures/legacy-meals-before-ftfr.rws</c>.
    /// </summary>
    [PickleSteps]
    public class FixtureSteps
    {
        [When("the game is saved as {string} and copied to the report folder")]
        public void SaveAsFixture(PickleContext ctx, string name)
        {
            GameDataSaveLoader.SaveGame(name);
            var source = GenFilePaths.FilePathForSavedGame(name);
            ctx.Require(File.Exists(source), $"the game did not write {source}");

            var arg = Environment.GetCommandLineArgs().FirstOrDefault(a => a.StartsWith("-pickle-report-dir="));
            ctx.Require(arg != null, "no -pickle-report-dir argument: the launcher did not pass the report folder");
            var target = Path.Combine(arg.Substring("-pickle-report-dir=".Length), "fixture-out");
            Directory.CreateDirectory(target);
            var copy = Path.Combine(target, name + ".rws");
            File.Copy(source, copy, true);
            Log.Message($"[FTFR tests] fixture '{name}' written to {source} and copied to {copy} ({new FileInfo(copy).Length} bytes)");
        }
    }
}
