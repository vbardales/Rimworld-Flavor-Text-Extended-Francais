using System.Linq;
using FlavorText;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// What the settings scenarios need that Pickle's generic vocabulary does not cover: opening the
    /// real Dialog_ModSettings the primary Options entry opens, and reading the five values that
    /// belong to hekmo's FlavorTextSettings and are shared with this mod's page.
    ///
    /// The clamp itself (SettingsBounds) is proved outside the game by Test-SettingsBridge. What
    /// only a running game shows is that the real dialog draws through the bridge, that drawing it
    /// applies the clamp, and that the dialog belongs to this mod and not to another.
    /// </summary>
    [PickleSteps]
    public class SettingsSteps
    {
        /// <summary>
        /// Waits for its own frames rather than leaving that to the scenario. Dialog_ModSettings
        /// force-pauses the game, so a tick wait in the scenario can never be satisfied. Frames
        /// still pass while the game is paused.
        /// </summary>
        [When("I open the FTFR settings dialog")]
        public async System.Threading.Tasks.Task OpenDialog(PickleContext ctx)
        {
            Find.WindowStack.Add(new Dialog_ModSettings(Driver.Mod(ctx)));
            await ctx.WaitFrames(3);
        }

        /// <summary>
        /// The claim is not "a settings window opened" but "the SAME settings opened": a dialog
        /// built for another mod would look identical in a screenshot, so the window is asked which
        /// mod it was built for.
        /// </summary>
        [Then("the FTFR settings dialog is open for this mod")]
        public void AssertDialogFor(PickleContext ctx)
        {
            var stack = Find.WindowStack;
            ctx.Require(stack != null, "there is no window stack: no game and no main menu is running");

            var dialogs = stack.Windows.OfType<Dialog_ModSettings>().ToList();
            ctx.Assert(dialogs.Count > 0, "no Dialog_ModSettings is open");

            var mine = Driver.Mod(ctx);
            ctx.Assert(dialogs.Any(d => ModOf(ctx, d) == mine),
                "a settings dialog is open, but not this mod's: it was built for "
                + string.Join(", ", dialogs.Select(d => ModOf(ctx, d)?.Content?.Name ?? "an unknown mod").ToArray())
                + ". The shortcut and Mod options must lead to the same place");
        }

        /// <summary>
        /// Dialog_ModSettings keeps the mod it was built for in a private field whose name has moved
        /// between game versions: the first Mod-typed field is taken, and a miss lists what exists.
        /// </summary>
        private static Mod ModOf(PickleContext ctx, Dialog_ModSettings dialog)
        {
            var type = typeof(Dialog_ModSettings);
            var field = type.GetFields(Driver.InstanceAny).FirstOrDefault(f => typeof(Mod).IsAssignableFrom(f.FieldType));
            ctx.Require(field != null,
                "Dialog_ModSettings holds no Mod field in this version; it has: "
                + string.Join(", ", type.GetFields(Driver.InstanceAny).Select(f => f.Name).ToArray()));
            return field.GetValue(dialog) as Mod;
        }

        /// <summary>The five shared values, put back to what a clean profile starts with.</summary>
        [Given("the Flavor Text settings are at their documented defaults")]
        public void ResetToDefaults(PickleContext ctx)
        {
            FlavorTextSettings.ghostIngredientCap = 0;
            FlavorTextSettings.quickSearch = false;
            FlavorTextSettings.flavorTextForStacks = true;
            FlavorTextSettings.laxRecipeMatching = true;
            FlavorTextSettings.dynamicMealIncorporation = true;
        }

        /// <summary>
        /// The write the settings window does when it closes, through hekmo's own mod class so the file
        /// that lands is the one a restart will read.
        /// </summary>
        [When("the Flavor Text settings are written to disk")]
        public void WriteToDisk(PickleContext ctx)
        {
            var mod = LoadedModManager.GetMod<FlavorTextMod>();
            ctx.Require(mod != null, "LoadedModManager.GetMod<FlavorTextMod>() returned nothing: Flavor Text is not loaded");
            mod.WriteSettings();
        }

        [Given("the Flavor Text quick search is set to {word}")]
        public void SetQuickSearch(PickleContext ctx, string value) => FlavorTextSettings.quickSearch = bool.Parse(value);

        [Then("the Flavor Text quick search reads {word}")]
        public void AssertQuickSearch(PickleContext ctx, string expected)
        {
            ctx.Assert(FlavorTextSettings.quickSearch == bool.Parse(expected),
                $"quick search reads {FlavorTextSettings.quickSearch}, expected {expected}");
        }

        [Given("the Flavor Text ingredient cap is set to {int}")]
        public void SetCap(PickleContext ctx, int value) => FlavorTextSettings.ghostIngredientCap = value;

        [Then("the Flavor Text ingredient cap reads {int}")]
        public void AssertCap(PickleContext ctx, int expected)
        {
            ctx.Assert(FlavorTextSettings.ghostIngredientCap == expected,
                $"the ingredient cap reads {FlavorTextSettings.ghostIngredientCap}, expected {expected}");
        }
    }
}
