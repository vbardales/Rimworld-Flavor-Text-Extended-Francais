using System.Collections.Generic;
using FlavorText;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// Reads the field the mod's guarded patches replace, on the real def, in the running game.
    ///
    /// Written after the first French pass (2026-09-21) showed that Pickle's two generic ways of asking
    /// cannot see this. "def X was patched by mod Y" reported "(no mod)" for a patch made through the
    /// mod's wrapper operation, so it cannot tell whether the wrapper let the operation through, and it
    /// is just as blind in an English game, where it would pass without proving anything. And a dotted
    /// path takes no numeric index into a list ("List has no field or property '0'"). What proves the
    /// patch is the value the def holds afterwards, so that is what is read.
    /// </summary>
    [PickleSteps]
    public class CategorySteps
    {
        private const string Separator = " | ";

        [Then("the inflections override of category {string} reads {string}")]
        public void OverrideReads(PickleContext ctx, string defName, string expected)
        {
            var actual = Joined(ctx, defName);
            ctx.Assert(actual == expected,
                $"the inflections override of {defName} reads '{actual}', expected '{expected}'");
        }

        [Then("the inflections override of category {string} does not read {string}")]
        public void OverrideDoesNotRead(PickleContext ctx, string defName, string unexpected)
        {
            var actual = Joined(ctx, defName);
            ctx.Assert(actual != unexpected,
                $"the inflections override of {defName} reads '{actual}', which is the value a French game gives it: "
                + "the language guard let a French patch through in this game");
        }

        private static string Joined(PickleContext ctx, string defName)
        {
            var def = DefDatabase<FlavorCategoryDef>.GetNamedSilentFail(defName);
            ctx.Require(def != null, $"no FlavorCategoryDef named '{defName}'");
            // The C# member is internal in Flavor Text, so it is read by reflection. The XML field is
            // tried first, then the property; a miss lists what exists, since a report keeps no stack.
            var type = typeof(FlavorCategoryDef);
            object value = null;
            var field = type.GetField("inflectionsOverride", Driver.InstanceAny);
            var property = type.GetProperty("InflectionsOverride", Driver.InstanceAny);
            ctx.Require(field != null || property != null,
                "FlavorCategoryDef has neither an 'inflectionsOverride' field nor an 'InflectionsOverride' property: "
                + "Flavor Text renamed it, update the steps. Fields: "
                + string.Join(", ", System.Array.ConvertAll(type.GetFields(Driver.InstanceAny), f => f.Name)));
            value = field != null ? field.GetValue(def) : property.GetValue(def, null);
            var forms = value as List<string>;
            ctx.Require(forms != null, $"{defName} has no inflections override in this game: nothing to read");
            return string.Join(Separator, forms.ToArray());
        }
    }
}
