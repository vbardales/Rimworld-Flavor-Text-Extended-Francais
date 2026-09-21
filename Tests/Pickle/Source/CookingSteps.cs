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
        }

        /// <summary>
        /// Looks for a meal that carries Flavor Text's comp anywhere on the map, because the cook drops
        /// it where the stockpile is, not where a scenario could have named in advance.
        /// </summary>
        [Then("a cooked meal lies in the colony and is named by Flavor Text in the language this pass runs")]
        public void CookedMealIsNamed(PickleContext ctx)
        {
            var map = Driver.Map(ctx);
            var meal = map.listerThings.AllThings.FirstOrDefault(t =>
                t.Spawned && t.def.defName.StartsWith("Meal") && t.TryGetComp<CompFlavor>() != null);
            ctx.Require(meal != null, "no spawned meal carrying CompFlavor on the map: nothing was cooked, or it was eaten");
            MealSteps.AssertNamed(ctx, meal);
        }
    }
}
