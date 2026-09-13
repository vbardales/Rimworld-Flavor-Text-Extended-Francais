using FlavorText;
using RimWorld;
using UnityEngine;
using Verse;

namespace FlavorTextExtendedFR
{
    // Expose the existing useful settings through this mod's name without maintaining
    // a second configuration file or a second set of values.
    public sealed class SettingsBridge : Mod
    {
        public SettingsBridge(ModContentPack content) : base(content)
        {
            ClampIngredientCap();
            RuntimePatches.Install();
        }

        public override string SettingsCategory() { return Content.Name; }

        private static void ClampIngredientCap()
        {
            FlavorTextSettings.ghostIngredientCap =
                SettingsBounds.ClampIngredientCap(FlavorTextSettings.ghostIngredientCap);
        }

        public override void DoSettingsWindowContents(Rect inRect)
        {
            ClampIngredientCap();
            LoadedModManager.GetMod<FlavorTextMod>().DoSettingsWindowContents(inRect);
            ClampIngredientCap();
        }

        public override void WriteSettings()
        {
            ClampIngredientCap();
            LoadedModManager.GetMod<FlavorTextMod>().WriteSettings();
        }

        public static void OpenSettings()
        {
            Find.WindowStack.Add(new Dialog_ModSettings(LoadedModManager.GetMod<SettingsBridge>()));
        }
    }

    public sealed class SettingsButton : MainButtonWorker
    {
        // Inherit Visible so customization tools can change def.buttonVisible.
        public override void Activate() { SettingsBridge.OpenSettings(); }
    }
}
