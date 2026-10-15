using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace FlavorTextExtendedFR
{
    // A French text cannot say "pané" or "cru" after an ingredient token without knowing the
    // ingredient's gender and number: the tokens give "de poisson" or "aux baies", never a gender.
    // A text marks the word to agree between tildes, written in the masculine singular
    // ("{0_adj} ~pané~"); this class replaces the mark by the form that agrees with the nearest
    // ingredient form written before it. No Verse reference here: the offline tests load it alone.
    public static class FrenchAgreement
    {
        public const char Mark = '~';

        private static readonly Regex Marked = new Regex(@"~([^~\s]+)~", RegexOptions.CultureInvariant);

        // Irregular words: feminine singular, masculine plural, feminine plural. Anything else follows
        // the regular rule in Inflect.
        private static readonly Dictionary<string, string[]> Irregular = new Dictionary<string, string[]>(StringComparer.OrdinalIgnoreCase)
        {
            { "un", new[] { "une", "uns", "unes" } },
            { "le", new[] { "la", "les", "les" } },
            { "du", new[] { "de la", "des", "des" } },
            { "ce", new[] { "cette", "ces", "ces" } },
            { "entier", new[] { "entière", "entiers", "entières" } },
            { "épais", new[] { "épaisse", "épais", "épaisses" } },
            { "frais", new[] { "fraîche", "frais", "fraîches" } },
            { "doux", new[] { "douce", "doux", "douces" } },
            { "mou", new[] { "molle", "mous", "molles" } },
            { "gras", new[] { "grasse", "gras", "grasses" } },
            { "blanc", new[] { "blanche", "blancs", "blanches" } },
            { "sec", new[] { "sèche", "secs", "sèches" } },
            { "long", new[] { "longue", "longs", "longues" } },
            { "cru", new[] { "crue", "crus", "crues" } },
            { "mi-cuit", new[] { "mi-cuite", "mi-cuits", "mi-cuites" } },
        };

        // Masculine singular lemma plus a two letter code (m or f, then s or p).
        public static string Inflect(string lemma, string code)
        {
            if (string.IsNullOrEmpty(lemma) || string.IsNullOrEmpty(code) || code.Length != 2) return lemma;
            bool feminine = code[0] == 'f';
            bool plural = code[1] == 'p';
            if (!feminine && !plural) return lemma;
            string[] irregular;
            if (Irregular.TryGetValue(lemma, out irregular))
                return feminine ? (plural ? irregular[2] : irregular[0]) : irregular[1];
            string result = lemma;
            if (feminine && !EndsWithAny(result, "e")) result += "e";
            if (plural && !EndsWithAny(result, "s", "x", "z")) result += "s";
            return result;
        }

        // forms: every ingredient form string (lower case) with its code. For each mark, the nearest
        // form that ends before it decides the code; none found, or a form with no code, leaves the lemma.
        // A mark is always removed, so a text never shows a tilde.
        public static string Resolve(string text, IDictionary<string, string> forms)
        {
            if (string.IsNullOrEmpty(text) || text.IndexOf(Mark) < 0) return text;
            StringBuilder output = new StringBuilder(text.Length);
            int last = 0;
            foreach (Match mark in Marked.Matches(text))
            {
                output.Append(text, last, mark.Index - last);
                string lemma = mark.Groups[1].Value;
                bool following = lemma[0] == '+';
                if (following) lemma = lemma.Substring(1);
                string code = forms == null || lemma.Length == 0 ? null
                    : following ? NextCode(text, mark.Index + mark.Length, forms) : NearestCode(text, mark.Index, forms);
                output.Append(code == null ? lemma : Inflect(lemma, code));
                last = mark.Index + mark.Length;
            }
            output.Append(text, last, text.Length - last);
            return output.ToString();
        }

        private static string NearestCode(string text, int before, IDictionary<string, string> forms)
        {
            string bestCode = null;
            int bestEnd = -1;
            int bestLength = 0;
            foreach (KeyValuePair<string, string> form in forms)
            {
                string key = form.Key;
                if (key.Length == 0 || key.Length > before) continue;
                int from = before - 1;
                while (from >= key.Length - 1)
                {
                    int at = text.LastIndexOf(key, from, StringComparison.OrdinalIgnoreCase);
                    if (at < 0) break;
                    int end = at + key.Length;
                    bool leftOk = at == 0 || !char.IsLetter(text[at - 1]);
                    bool rightOk = end >= text.Length || !char.IsLetter(text[end]);
                    if (end <= before && leftOk && rightOk)
                    {
                        if (end > bestEnd || (end == bestEnd && key.Length > bestLength))
                        {
                            bestEnd = end;
                            bestLength = key.Length;
                            bestCode = form.Value;
                        }
                        break;
                    }
                    from = at - 1;
                }
            }
            return bestCode;
        }

        // The form that starts first after `from`, for a word that stands before its noun ("~+un~ {0_sing}").
        private static string NextCode(string text, int from, IDictionary<string, string> forms)
        {
            string bestCode = null;
            int bestStart = int.MaxValue;
            int bestLength = 0;
            foreach (KeyValuePair<string, string> form in forms)
            {
                string key = form.Key;
                if (key.Length == 0 || from + key.Length > text.Length) continue;
                int at = from;
                while (at <= text.Length - key.Length)
                {
                    at = text.IndexOf(key, at, StringComparison.OrdinalIgnoreCase);
                    if (at < 0 || at > bestStart) break;
                    int end = at + key.Length;
                    bool leftOk = at == 0 || !char.IsLetter(text[at - 1]);
                    bool rightOk = end >= text.Length || !char.IsLetter(text[end]);
                    if (leftOk && rightOk)
                    {
                        if (at < bestStart || (at == bestStart && key.Length > bestLength))
                        {
                            bestStart = at;
                            bestLength = key.Length;
                            bestCode = form.Value;
                        }
                        break;
                    }
                    at++;
                }
            }
            return bestCode;
        }

        private static bool EndsWithAny(string word, params string[] endings)
        {
            foreach (string ending in endings)
                if (word.EndsWith(ending, StringComparison.Ordinal)) return true;
            return false;
        }
    }
}
