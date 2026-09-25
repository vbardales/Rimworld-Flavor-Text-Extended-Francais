using System.Linq;
using FlavorText;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// What a real cook needs that Pickle's generic vocabulary does not provide: a stove that burns.
    /// No vanilla step builds a fuelled stove or loads its fuel, and an unfuelled one never starts the
    /// bill. Everything else in the scenario (the colonist, the priority, the bill, the wait) is
    /// Pickle's own.
    ///
    /// The meal the colonist makes is chosen by the colony's stock and by Flavor Text at random, so
    /// nothing asserts an exact name: the step below asserts what must hold for any name.
    /// </summary>
    [PickleSteps]
    public class CookingSteps
    {
        [Given("a fuelled stove stands at \\({int}, {int}\\)")]
        public void FuelledStove(PickleContext ctx, int x, int z)
        {
            var def = DefDatabase<ThingDef>.GetNamedSilentFail("FueledStove");
            ctx.Require(def != null, "no ThingDef named 'FueledStove'");
            var stove = ThingMaker.MakeThing(def);
            GenSpawn.Spawn(stove, new IntVec3(x, 0, z), Driver.Map(ctx));
            stove.SetFaction(Faction.OfPlayer);
            var fuel = stove.TryGetComp<CompRefuelable>();
            ctx.Require(fuel != null, "FueledStove has no CompRefuelable: the game changed how stoves burn");
            fuel.Refuel(fuel.Props.fuelCapacity);

            BeforeCooking.Clear();
            foreach (var thing in MealThings(Driver.Map(ctx))) BeforeCooking.Add(thing.thingIDNumber);
            Log.Message($"[FTFR tests] {BeforeCooking.Count} meal things already on the map before cooking");
        }

        /// <summary>
        /// Looks for a meal that carries Flavor Text's comp anywhere on the map, because the cook drops
        /// it where the stockpile is, not where a scenario could have named in advance.
        /// </summary>
        [Then("a cooked meal lies in the colony and is named by Flavor Text in the language this pass runs")]
        public void CookedMealIsNamed(PickleContext ctx)
        {
            var map = Driver.Map(ctx);
            var meal = CookedMeal(map);
            ctx.Require(meal != null, "no spawned meal carrying CompFlavor on the map: nothing was cooked, or it was eaten");
            MealSteps.AssertNamed(ctx, meal);
        }

        /// <summary>
        /// Opens the info card of the dish the cook made, the pane's own "i" button, which shows the whole
        /// name and the description, and logs both so the report carries the words a person judges. The
        /// dish is the one the cook made, never a meal of the fixture colony.
        /// </summary>
        [When("I open the info card of the cooked meal")]
        public async System.Threading.Tasks.Task OpenCookedMealInfoCard(PickleContext ctx)
        {
            var meal = CookedMeal(Driver.Map(ctx));
            ctx.Require(meal != null, "no cooked meal on the map to open the info card of");
            Log.Message($"[FTFR tests] cooked meal at ({meal.Position.x}, {meal.Position.z}) full name: {meal.LabelCap}");
            Log.Message($"[FTFR tests] cooked meal at ({meal.Position.x}, {meal.Position.z}) description: {meal.DescriptionDetailed}");
            Find.WindowStack.Add(new Dialog_InfoCard(meal));
            await ctx.WaitFrames(5);
        }

        /// <summary>
        /// The stock "I wait for bill to finish" gives the whole cook 120 real seconds and then kills the
        /// game with no report (seen 2026-09-24: the first pass 2b died there). This waits in slices of
        /// real time and returns as soon as a meal carrying CompFlavor lies on the map. When the slice
        /// ends without one it logs what the cook, the stove and the stock were doing and how many ticks
        /// the game managed, so a failure names its cause. It never fails by itself: the assertion is
        /// the step that follows, after the last slice.
        /// </summary>
        [When("the cook works for up to {int} seconds or until a meal is cooked", TimeoutSeconds = 60)]
        public async System.Threading.Tasks.Task CookWorks(PickleContext ctx, int seconds)
        {
            var map = Driver.Map(ctx);
            var clock = System.Diagnostics.Stopwatch.StartNew();
            var startTick = Find.TickManager.TicksGame;
            while (clock.Elapsed.TotalSeconds < seconds)
            {
                if (CookedMeal(map) != null) return;
                await ctx.WaitFrames(30);
            }
            var stove = map.listerThings.ThingsOfDef(DefDatabase<ThingDef>.GetNamedSilentFail("FueledStove")).FirstOrDefault() as Building_WorkTable;
            var fuel = stove?.TryGetComp<CompRefuelable>();
            Log.Message($"[FTFR tests] no meal yet after {seconds} s and {Find.TickManager.TicksGame - startTick} ticks (speed {Find.TickManager.CurTimeSpeed}); "
                + $"bills: {stove?.BillStack.Count}, fuel: {fuel?.Fuel}, "
                + $"squirrel meat: {map.resourceCounter.GetCount(DefDatabase<ThingDef>.GetNamedSilentFail("Meat_Squirrel"))}, "
                + $"milk: {map.resourceCounter.GetCount(DefDatabase<ThingDef>.GetNamedSilentFail("Milk"))}");
        }

        // The meals that lay on the map before the stove was lit: the fixture colony holds survival rations
        // (a "Meal..." def carrying the comp) that the first version of this step took for the cook's work
        // and returned at once (2026-09-24, pass 2b failed on "ration de survie x10" after 3.7 s).
        private static readonly System.Collections.Generic.HashSet<int> BeforeCooking = new System.Collections.Generic.HashSet<int>();

        private static bool IsCookedDish(Thing t) => t.Spawned && !BeforeCooking.Contains(t.thingIDNumber)
            && t.TryGetComp<CompFlavor>() != null;

        private static readonly string[] CookedDefs = { "MealSimple", "MealFine", "MealLavish" };

        /// <summary>
        /// The meal things of the map, read def by def. The first version walked <c>listerThings.AllThings</c>, which
        /// holds the pawns too, and the pass that used it died with "Accessing map pawns off main thread" (2026-09-24).
        /// </summary>
        private static System.Collections.Generic.IEnumerable<Thing> MealThings(Map map) =>
            CookedDefs.Select(n => DefDatabase<ThingDef>.GetNamedSilentFail(n)).Where(d => d != null)
                .SelectMany(d => map.listerThings.ThingsOfDef(d).ToList());

        private static Thing CookedMeal(Map map) => MealThings(map).FirstOrDefault(IsCookedDish);
    }
}
