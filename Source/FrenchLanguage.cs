using System;

namespace FlavorTextExtendedFR
{
    // RimWorld persists the language folder name, not its translated display name.
    public static class FrenchLanguage
    {
        public static bool Apply(string languageFolder, Func<bool> applyPatch)
        {
            if (!string.Equals(languageFolder, "French", StringComparison.OrdinalIgnoreCase))
                return true;
            return applyPatch();
        }
    }
}
