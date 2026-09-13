namespace FlavorTextExtendedFR
{
    public static class SettingsBounds
    {
        public static int ClampIngredientCap(int value)
        {
            return value < 0 ? 0 : value > 6 ? 6 : value;
        }
    }
}
