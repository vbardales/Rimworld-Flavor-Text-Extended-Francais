using System.Xml;
using Verse;

namespace FlavorTextExtendedFR
{
    // Prefs is updated before PlayDataLoader reloads XML after a language change.
    // The payload remains ordinary RimWorld patch operations with normal error reporting.
    public sealed class PatchOperationFrench : PatchOperation
    {
        public PatchOperation patch;

        protected override bool ApplyWorker(XmlDocument xml)
        {
            return FrenchLanguage.Apply(Prefs.LangFolderName, () => patch.Apply(xml));
        }

        public override string ToString()
        {
            // Complete belongs to the outer operation. Completing a skipped child would
            // incorrectly report "never succeeded" in an English game.
            return base.ToString() + "(" + patch + ")";
        }
    }
}
