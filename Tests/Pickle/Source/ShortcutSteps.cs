using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// The optional MainButtons shortcut, and the contract MOD_SETTINGS.md puts on it: available for
    /// RIMMSQOL and the other customization tools to reveal, hidden by default, neither visible nor
    /// greyed, and opening the same settings as Mod options.
    ///
    /// What RIMMSQOL does when a player reveals the button is move <c>MainButtonDef.buttonVisible</c>.
    /// What this mod owes is the other side of that contract, so these steps move that same field
    /// and then ask RimWorld's own worker what the bar would do. Nothing here installs or drives
    /// RIMMSQOL: whether ITS interface can reveal the button, and whether ITS choice survives a
    /// restart, stays manual.
    /// </summary>
    [PickleSteps]
    public class ShortcutSteps
    {
        private const string DefName = "FTFR_Settings";

        [Then("the FTFR shortcut is hidden on a clean configuration")]
        public void AssertHiddenByDefault(PickleContext ctx)
        {
            var def = Shortcut(ctx);
            ctx.Assert(!def.buttonVisible,
                "FTFR_Settings ships with buttonVisible true: it would stand in everyone's main bar "
                + "without anyone asking for it");
            AssertNotDrawn(ctx);
        }

        [When("the FTFR shortcut is revealed, as a customization mod would")]
        public void Reveal(PickleContext ctx) => Shortcut(ctx).buttonVisible = true;

        [When("the FTFR shortcut is hidden again")]
        public void Hide(PickleContext ctx) => Shortcut(ctx).buttonVisible = false;

        /// <summary>
        /// Both halves are asserted. <c>Worker.Visible</c> decides whether the bar draws the def at
        /// all and <c>Worker.Disabled</c> whether it draws it greyed; MOD_SETTINGS.md forbids a
        /// greyed shortcut as firmly as a visible one, and a def can be drawn and still be dead.
        /// </summary>
        [Then("the FTFR shortcut is drawn in the bar")]
        public void AssertDrawn(PickleContext ctx)
        {
            var def = Shortcut(ctx);
            ctx.Assert(def.Worker.Visible,
                "the shortcut has been revealed and its worker still reports Visible false, so a "
                + "customization mod cannot actually put it in the bar");
            ctx.Assert(!def.Worker.Disabled, "the shortcut is drawn but greyed out, which MOD_SETTINGS.md forbids");
        }

        [Then("the FTFR shortcut is not drawn in the bar")]
        public void AssertNotDrawn(PickleContext ctx)
        {
            var def = Shortcut(ctx);
            ctx.Assert(!def.Worker.Visible,
                $"the shortcut reports Visible true with buttonVisible {def.buttonVisible}: it shows "
                + "without anything having revealed it");
        }

        /// <summary>Activating the worker is what a revealed button ends up calling.</summary>
        [When("the FTFR shortcut is activated")]
        public void Activate(PickleContext ctx) => Shortcut(ctx).Worker.Activate();

        private static MainButtonDef Shortcut(PickleContext ctx)
        {
            var def = DefDatabase<MainButtonDef>.GetNamedSilentFail(DefName);
            ctx.Require(def != null,
                $"no MainButtonDef named '{DefName}': the shortcut RIMMSQOL is meant to be able to reveal is not shipped");
            return def;
        }
    }
}
