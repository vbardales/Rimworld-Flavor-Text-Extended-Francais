using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using FlavorText;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// The exact dish, which a random draw cannot give. Flavor Text keeps the dishes it chose in a
    /// meal and, on load, looks for them again first (<c>TryGetFlavorText(List&lt;FlavorDef&gt;)</c>,
    /// the path a saved meal takes). Handing it one dish does the same thing for a fresh meal, with no
    /// stove and no bill, so a name whose shape depends on the dish (an elision, an aspirated h, a
    /// collective form) can be asserted for real.
    ///
    /// Guard: if the dish does not fit the meal, Flavor Text falls back to a random one. The step
    /// therefore compares the dishes the meal ended up with to the dish asked for and fails if they
    /// differ, so a fallback can never pass as the dish under test.
    /// </summary>
    [PickleSteps]
    public class DishSteps
    {
        private static readonly PropertyInfo Tried =
            typeof(CompFlavor).GetProperty("TriedFlavorText", Driver.InstanceAny);

        [When("Flavor Text is made to name the meal at \\({int}, {int}\\) as the dish {string}")]
        public void ForceDish(PickleContext ctx, int x, int z, string defName)
        {
            var meal = MealSteps.MealAt(ctx, x, z);
            var comp = meal.TryGetComp<CompFlavor>();
            ctx.Require(comp != null, "the meal carries no CompFlavor");
            ctx.Require(Tried != null, "CompFlavor.TriedFlavorText is gone: the forcing mechanism changed");
            var dish = DefDatabase<FlavorDef>.GetNamedSilentFail(defName);
            ctx.Require(dish != null, $"no FlavorDef named '{defName}' is loaded");

            // Whatever a first label request already chose is thrown away, then the dish is asked for.
            Tried.SetValue(comp, false, null);
            comp.TryGetFlavorText(new List<FlavorDef> { dish });

            var got = comp.FinalFlavorDefs.Select(d => d.defName).ToList();
            ctx.Assert(got.Count == 1 && got[0] == defName,
                $"the meal was to be named as {defName} but Flavor Text chose [{string.Join(", ", got.ToArray())}]: "
                + "the dish does not fit this meal, so the name below is not the dish under test");
            Log.Message($"[FTFR tests] meal at ({x}, {z}) forced as {defName} reads: {meal.Label}");
        }

        /// <summary>
        /// The French shape of the dish part of the name (before " (Meal)"), as a regular expression,
        /// compared without regard to case because titles capitalise words. Only asserted in the French
        /// pass: in English the dish is still forced and checked, and the name is only kept free of raw slots.
        /// </summary>
        [Then("the meal at \\({int}, {int}\\) is named in French like {string}")]
        public void NamedLike(PickleContext ctx, int x, int z, string pattern)
        {
            var meal = MealSteps.MealAt(ctx, x, z);
            MealSteps.AssertNamed(ctx, meal);
            if (!Driver.Language(ctx).StartsWith("French")) return;
            var label = meal.Label;
            var dish = label.Substring(0, label.LastIndexOf(" (", System.StringComparison.Ordinal));
            ctx.Assert(Regex.IsMatch(dish, pattern, RegexOptions.IgnoreCase | RegexOptions.CultureInvariant),
                $"the French dish name '{dish}' does not match /{pattern}/");
        }

        [Then("the meal at \\({int}, {int}\\) is not named in French like {string}")]
        public void NotNamedLike(PickleContext ctx, int x, int z, string pattern)
        {
            var meal = MealSteps.MealAt(ctx, x, z);
            if (!Driver.Language(ctx).StartsWith("French")) return;
            var label = meal.Label;
            var dish = label.Substring(0, label.LastIndexOf(" (", System.StringComparison.Ordinal));
            ctx.Assert(!Regex.IsMatch(dish, pattern, RegexOptions.IgnoreCase | RegexOptions.CultureInvariant),
                $"the French dish name '{dish}' matches /{pattern}/, which it must not");
        }
    }
}
