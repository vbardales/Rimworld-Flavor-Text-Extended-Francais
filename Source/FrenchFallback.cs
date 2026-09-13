using System;
using System.Collections.Generic;
using System.Globalization;

namespace FlavorTextExtendedFR
{
    public static class FrenchFallback
    {
        public static bool NeedsGeneration(List<string> forms)
        {
            if (forms == null || forms.Count != 4) return true;
            foreach (string form in forms)
                if (string.IsNullOrWhiteSpace(form) || form == "^" || form == "*" ||
                    form == "_" || form.Contains("{0}")) return true;
            return false;
        }

        public static bool NeedsElision(string label)
        {
            if (string.IsNullOrWhiteSpace(label)) return false;
            string word = label.Trim().ToLowerInvariant();
            if ("aàâäæeéèêëiîïoôöœuùûü".IndexOf(word[0]) >= 0) return true;
            // Do not treat all h as silent (haricot, houblon, husky, héron).
            foreach (string prefix in new[] { "huile", "huître", "huitre", "herbe", "hémog", "hemog", "hydromel" })
                if (word.StartsWith(prefix, StringComparison.Ordinal)) return true;
            return false;
        }

        public static List<string> Create(string label, string aForm, string deForm)
        {
            // Keep the localized label, including accents and existing number. Guessing
            // a singular from an arbitrary third-party label corrupts compound nouns.
            return new List<string> {
                string.Format(CultureInfo.InvariantCulture, aForm, label),
                label,
                label,
                string.Format(CultureInfo.InvariantCulture, deForm, label)
            };
        }
    }
}
