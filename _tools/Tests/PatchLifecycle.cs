using System;
using System.Xml;

// Minimal lifecycle doubles, not a substitute for RimWorld runtime validation.
namespace Verse
{
    public static class Prefs { public static string LangFolderName; }
    public class PatchOperation
    {
        private bool succeeded;
        public bool Apply(XmlDocument xml)
        {
            bool result = ApplyWorker(xml);
            if (result) succeeded = true;
            return result;
        }
        protected virtual bool ApplyWorker(XmlDocument xml) { return false; }
        public virtual void Complete(string modIdentifier)
        {
            if (!succeeded) throw new Exception("Never-succeeded operation completed: " + modIdentifier);
        }
    }
}

namespace FlavorTextExtendedFR.Tests
{
    public sealed class Payload : Verse.PatchOperation
    {
        public int Calls;
        public bool Result = true;
        protected override bool ApplyWorker(XmlDocument xml)
        {
            Calls++;
            if (Result) xml.DocumentElement.SetAttribute("language", "French");
            return Result;
        }
    }
    public static class PatchLifecycle
    {
        private static void Require(bool condition, string message)
        {
            if (!condition) throw new Exception(message);
        }
        public static string Run()
        {
            foreach (string language in new[] { "English", "French", "German", "French" })
            {
                Verse.Prefs.LangFolderName = language;
                var xml = new XmlDocument(); xml.LoadXml("<Defs />");
                var payload = new Payload();
                var operation = new PatchOperationFrench { patch = payload };
                Require(operation.Apply(xml), "Valid operation failed.");
                operation.Complete("test");
                bool french = language == "French";
                Require(payload.Calls == (french ? 1 : 0), "Wrong payload invocation count.");
                Require(xml.DocumentElement.HasAttribute("language") == french, "XML leaked across languages.");
            }
            Verse.Prefs.LangFolderName = "French";
            var failed = new PatchOperationFrench { patch = new Payload { Result = false } };
            var doc = new XmlDocument(); doc.LoadXml("<Defs />");
            Require(!failed.Apply(doc), "Failure must propagate.");
            bool reported = false;
            try { failed.Complete("test"); } catch { reported = true; }
            Require(reported, "Failed outer operation must report failure at completion.");
            return "PASS: production wrapper with lifecycle doubles; French mutation, English/German isolation, reload sequence, skipped completion and failure reporting.";
        }
    }
}
