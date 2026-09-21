using System;

namespace FlavorTextExtendedFR
{
    // RimWorld persists the language folder name, not its translated display name, and for the
    // official translations that name carries the native name in brackets: French is stored as
    // "French (Français)", not "French". A mod's own Languages/French folder is matched against the
    // part before the bracket (LoadedLanguage.LegacyFolderName), so the same rule is applied here.
    // Comparing the stored value to "French" alone never matched a real French game.
    public static class FrenchLanguage
    {
        public static bool IsFrench(string languageFolder)
        {
            if (string.IsNullOrEmpty(languageFolder)) return false;
            int bracket = languageFolder.IndexOf('(');
            string legacyName = (bracket >= 0 ? languageFolder.Substring(0, bracket) : languageFolder).Trim();
            return string.Equals(legacyName, "French", StringComparison.OrdinalIgnoreCase);
        }

        public static bool Apply(string languageFolder, Func<bool> applyPatch)
        {
            if (!IsFrench(languageFolder))
                return true;
            return applyPatch();
        }
    }
}
