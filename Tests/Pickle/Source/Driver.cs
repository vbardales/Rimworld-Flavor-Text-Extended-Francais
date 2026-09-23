using System.Reflection;
using RimWorks.Pickle;
using Verse;

namespace FlavorTextExtendedFR.PickleSteps
{
    /// <summary>
    /// Shared lookups for every step class here. Nothing is cached: a save reload replaces every
    /// object in the game. And every miss names itself: a report keeps no stack trace, so an
    /// unguarded hop comes back as "Object reference not set" and the run is already over.
    /// </summary>
    public static class Driver
    {
        internal const BindingFlags InstanceAny = BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic;
        internal const BindingFlags StaticAny = BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic;

        public static SettingsBridge Mod(PickleContext ctx)
        {
            var mod = LoadedModManager.GetMod<SettingsBridge>();
            ctx.Require(mod != null,
                "LoadedModManager.GetMod<SettingsBridge>() returned nothing: FlavorTextExtendedFR.dll is not "
                + "loaded in this session, so no step here can reach the settings page");
            return mod;
        }

        public static Map Map(PickleContext ctx)
        {
            ctx.Require(Current.Game != null && Find.CurrentMap != null,
                "no current map: load the fixture ('the save \"test-colony\" is loaded') before this step");
            return Find.CurrentMap;
        }

        public static string Language(PickleContext ctx)
        {
            var folder = LanguageDatabase.activeLanguage?.folderName;
            ctx.Require(!string.IsNullOrEmpty(folder), "no active language: the game has not finished loading one");
            return folder;
        }
    }
}
