using System;
using System.Collections.Generic;
using FlavorTextExtendedFR;

// UI/manager doubles exercise production routing; no Unity or customization mod runs here.
namespace UnityEngine { public struct Rect { public int Marker; } }
namespace Verse
{
    public class ModContentPack { public string Name; }
    public class Mod
    {
        public ModContentPack Content;
        public Mod(ModContentPack content) { Content = content; }
        public virtual string SettingsCategory() { return ""; }
        public virtual void DoSettingsWindowContents(UnityEngine.Rect rect) { }
        public virtual void WriteSettings() { }
    }
    public static class LoadedModManager
    {
        public static readonly Dictionary<Type, Mod> Mods = new Dictionary<Type, Mod>();
        public static T GetMod<T>() where T : Mod { return (T)Mods[typeof(T)]; }
    }
    public class WindowStack
    {
        public RimWorld.Dialog_ModSettings Last;
        public void Add(RimWorld.Dialog_ModSettings dialog) { Last = dialog; }
    }
    public static class Find { public static WindowStack WindowStack = new WindowStack(); }
}
namespace RimWorld
{
    public class Dialog_ModSettings
    {
        public readonly Verse.Mod Target;
        public Dialog_ModSettings(Verse.Mod target) { Target = target; }
        public void Close() { Target.WriteSettings(); }
    }
    public class MainButtonDef { public bool buttonVisible; }
    public abstract class MainButtonWorker
    {
        public MainButtonDef def;
        public virtual bool Visible { get { return def.buttonVisible; } }
        public abstract void Activate();
    }
}
namespace FlavorText
{
    public static class FlavorTextSettings { public static int ghostIngredientCap; }
    public class FlavorTextMod : Verse.Mod
    {
        public int Draws, Writes, LastMarker, SavedCap;
        public FlavorTextMod() : base(new Verse.ModContentPack()) { }
        public override void DoSettingsWindowContents(UnityEngine.Rect rect) { Draws++; LastMarker = rect.Marker; }
        public override void WriteSettings() { Writes++; SavedCap = FlavorTextSettings.ghostIngredientCap; }
    }
}
namespace FlavorTextExtendedFR
{
    public static class RuntimePatches { public static void Install() { } }
    public static class SettingsBridgeTests
    {
        private static void Require(bool condition, string message) { if (!condition) throw new Exception(message); }
        public static string Run()
        {
            foreach (int value in new[] { int.MinValue, -1, 0, 1, 6, 7, int.MaxValue })
                Require(SettingsBounds.ClampIngredientCap(value) == Math.Max(0, Math.Min(6, value)), "Incorrect input limit.");
            var backend = new FlavorText.FlavorTextMod();
            Verse.LoadedModManager.Mods[typeof(FlavorText.FlavorTextMod)] = backend;
            FlavorText.FlavorTextSettings.ghostIngredientCap = -9;
            var mod = new SettingsBridge(new Verse.ModContentPack { Name = "Translation identity" });
            Verse.LoadedModManager.Mods[typeof(SettingsBridge)] = mod;
            Require(FlavorText.FlavorTextSettings.ghostIngredientCap == 0, "Loaded invalid value not clamped.");
            Require(mod.SettingsCategory() == "Translation identity", "Primary access has wrong name.");
            mod.DoSettingsWindowContents(new UnityEngine.Rect { Marker = 42 });
            Require(backend.Draws == 1 && backend.LastMarker == 42, "Primary access did not forward UI.");
            var button = new SettingsButton { def = new RimWorld.MainButtonDef { buttonVisible = false } };
            Require(!button.Visible, "Default shortcut visible.");
            button.def.buttonVisible = true;
            Require(button.Visible, "Customization cannot reveal shortcut.");
            button.Activate();
            var dialog = Verse.Find.WindowStack.Last;
            Require(object.ReferenceEquals(dialog.Target, mod), "Shortcut opens a different configuration.");
            FlavorText.FlavorTextSettings.ghostIngredientCap = 99;
            dialog.Close();
            Require(backend.Writes == 1 && backend.SavedCap == 6, "Shortcut failed shared, bounded persistence.");
            FlavorText.FlavorTextSettings.ghostIngredientCap = 2;
            mod.WriteSettings();
            Require(backend.Writes == 2 && backend.SavedCap == 2, "Primary access has separate state.");
            button.def.buttonVisible = false;
            Require(!button.Visible, "Customization cannot hide shortcut again.");
            return "PASS: production settings bridge with UI doubles; existing backend, matching routes, no second state, input bounds and reveal/hide contract. No real UI or RIMMSQOL execution.";
        }
    }
}
