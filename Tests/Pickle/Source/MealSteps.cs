using System.Text.RegularExpressions;
using FlavorText;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// Naming a meal without a stove. Flavor Text names a meal when its label is asked for
    /// (<c>CompFlavor.TransformLabel</c>), from the ingredients registered on the meal, so a meal made
    /// of chosen ingredients and dropped on the map goes through the same generation a cooked one
    /// does: the French tables, the grammar patches and the runtime patches all run for real.
    ///
    /// What this does NOT reach: the cooking job, the bill, and the moment RimWorld registers
    /// ingredients as a cook works. No vanilla step powers a stove or reads a label, and the
    /// scenarios that need a colonist to cook stay manual.
    ///
    /// The dish chosen is random among those that match, so no exact name is asserted. What is
    /// asserted is what must hold for every name: it was renamed, no grammar slot was left raw, and
    /// the language of the pass shows through.
    /// </summary>
    [PickleSteps]
    public class MealSteps
    {
        [Given("a fine meal made of {string} and {string} lies at \\({int}, {int}\\)")]
        public void MealLies(PickleContext ctx, string first, string second, int x, int z)
        {
            var map = Driver.Map(ctx);
            var meal = ThingMaker.MakeThing(ThingDefOf.MealFine);
            var ingredients = meal.TryGetComp<CompIngredients>();
            ctx.Require(ingredients != null, "MealFine has no CompIngredients: the game changed how meals record ingredients");
            ingredients.RegisterIngredient(Def(ctx, first));
            ingredients.RegisterIngredient(Def(ctx, second));
            GenSpawn.Spawn(meal, new IntVec3(x, 0, z), map);
        }

        /// <summary>
        /// Four ingredients, so that Flavor Text has enough to name a main dish and side dishes, which is
        /// the case the two-ingredient meal above cannot reach. Used for the captures a person judges.
        /// </summary>
        [Given("a lavish meal made of {string}, {string}, {string} and {string} lies at \\({int}, {int}\\)")]
        public void LavishMealLies(PickleContext ctx, string a, string b, string c, string d, int x, int z)
        {
            var map = Driver.Map(ctx);
            var lavish = DefDatabase<ThingDef>.GetNamedSilentFail("MealLavish");
            ctx.Require(lavish != null, "no ThingDef named 'MealLavish'");
            var meal = ThingMaker.MakeThing(lavish);
            var ingredients = meal.TryGetComp<CompIngredients>();
            ctx.Require(ingredients != null, "MealLavish has no CompIngredients: the game changed how meals record ingredients");
            foreach (var name in new[] { a, b, c, d }) ingredients.RegisterIngredient(Def(ctx, name));
            GenSpawn.Spawn(meal, new IntVec3(x, 0, z), map);
        }

        /// <summary>
        /// Selects the meal and opens the inspect tab, so a capture shows the name and the description
        /// Flavor Text wrote, as a player reads them. Frames are awaited rather than ticks: nothing here
        /// pauses the game, but the tab needs a few frames to draw.
        /// </summary>
        [When("I select the meal at \\({int}, {int}\\)")]
        public async System.Threading.Tasks.Task SelectMeal(PickleContext ctx, int x, int z)
        {
            var meal = MealAt(ctx, x, z);
            Find.Selector.ClearSelection();
            Find.Selector.Select(meal);
            Find.MainTabsRoot.SetCurrentTab(MainButtonDefOf.Inspect, false);
            await ctx.WaitFrames(5);
        }

        /// <summary>
        /// The inspect pane cuts a long name ("Burger à la viande d'écureuil, façon...") and shows no
        /// description. The info card, the pane's own "i" button, shows both in full, so a capture of it
        /// is what a person reads to judge a long name. The name and the description are also logged.
        /// </summary>
        [When("I open the info card of the meal at \\({int}, {int}\\)")]
        public async System.Threading.Tasks.Task OpenInfoCard(PickleContext ctx, int x, int z)
        {
            var meal = MealAt(ctx, x, z);
            Log.Message($"[FTFR tests] meal at ({x}, {z}) full name: {meal.LabelCap}");
            Log.Message($"[FTFR tests] meal at ({x}, {z}) description: {meal.DescriptionDetailed}");
            Find.WindowStack.Add(new Dialog_InfoCard(meal));
            await ctx.WaitFrames(5);
        }

        /// <summary>
        /// F13 starts from a save made before this translation was installed.  It must not create
        /// evidence by spawning a new meal: the reviewed object has to be one the save already
        /// contains.  The feature pauses before this call, then ScreenshotMode leaves only this
        /// info card for the reviewer.
        /// </summary>
        [When("I open the info card of an existing meal")]
        public async System.Threading.Tasks.Task OpenExistingMealInfoCard(PickleContext ctx)
        {
            var meal = ExistingMeal(ctx);
            Log.Message($"[FTFR tests] existing meal at ({meal.Position.x}, {meal.Position.z}) full name: {meal.LabelCap}");
            Log.Message($"[FTFR tests] existing meal at ({meal.Position.x}, {meal.Position.z}) description: {meal.DescriptionDetailed}");
            Find.WindowStack.Add(new Dialog_InfoCard(meal));
            await ctx.WaitFrames(5);
        }

        /// <summary>
        /// The label is logged in full so a person reads the actual name in the report, which is the
        /// only place the French agreement can be judged.
        /// </summary>
        [Then("the meal at \\({int}, {int}\\) is named by Flavor Text in the language this pass runs")]
        public void MealIsNamed(PickleContext ctx, int x, int z) => AssertNamed(ctx, MealAt(ctx, x, z));

        [Then("an existing meal is named by Flavor Text in the language this pass runs")]
        public void ExistingMealIsNamed(PickleContext ctx) => AssertNamed(ctx, ExistingMeal(ctx));

        [Then("the meal at \\({int}, {int}\\) does not show the internal name {string}")]
        public void MealHidesDefName(PickleContext ctx, int x, int z, string defName)
        {
            var meal = MealAt(ctx, x, z);
            var text = meal.Label + " " + meal.DescriptionDetailed;
            ctx.Assert(!text.Contains(defName), $"the internal name {defName} shows in the meal text: {text}");
        }

        internal static void AssertNamed(PickleContext ctx, Thing meal)
        {
            var x = meal.Position.x; var z = meal.Position.z;
            ctx.Require(meal.TryGetComp<CompFlavor>() != null,
                "the meal carries no CompFlavor: Flavor Text did not add its comp to MealFine, "
                + "so it is not active or its patch found nothing");

            var label = meal.Label;
            var plain = meal.def.label;
            Log.Message($"[FTFR tests] meal at ({x}, {z}) reads: {label}");

            ctx.Assert(label != plain && label.Contains(" (") && label.EndsWith(")"),
                $"the meal was not renamed: it reads '{label}', which is not '<dish> ({plain})'");
            ctx.Assert(!Regex.IsMatch(label, "[{}]"),
                $"a grammar slot was left raw in '{label}'");

            var folder = Driver.Language(ctx);
            if (folder.StartsWith("French"))
            {
                ctx.Assert(!Regex.IsMatch(label, @"\b(with|alongside|served)\b", RegexOptions.IgnoreCase),
                    $"an English side-dish connector survived in the French name '{label}': the French grammar patch did not apply");
            }
            else if (folder.StartsWith("English"))
            {
                ctx.Assert(!Regex.IsMatch(label, @"à base|\baux\b"),
                    $"French complement text appears in the English name '{label}': the language guard leaked");
            }
        }

        private static ThingDef Def(PickleContext ctx, string defName)
        {
            var def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Require(def != null, $"no ThingDef named '{defName}'");
            return def;
        }

        internal static Thing MealAt(PickleContext ctx, int x, int z)
        {
            var things = Driver.Map(ctx).thingGrid.ThingsListAt(new IntVec3(x, 0, z));
            foreach (var thing in things)
                if (thing.def == ThingDefOf.MealFine || thing.def.defName == "MealLavish") return thing;
            ctx.Require(false, $"no fine or lavish meal at ({x}, {z}): the step that puts it there did not run, or it was carried off");
            return null;
        }

        private static Thing ExistingMeal(PickleContext ctx)
        {
            foreach (var thing in Driver.Map(ctx).listerThings.ThingsInGroup(ThingRequestGroup.HaulableEver))
            {
                if (thing.def.IsIngestible && thing.TryGetComp<CompIngredients>() != null)
                    return thing;
            }

            ctx.Require(false,
                "the legacy fixture contains no stored meal with CompIngredients: add at least one meal made before the translation was installed");
            return null;
        }
    }
}
