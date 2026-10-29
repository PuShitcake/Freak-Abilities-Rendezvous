#pragma semicolon 1
#pragma newdecls required

/* This is an instant drain: ammo pickups, resupply and regeneration remain usable.

"rage_ammo_drain"
{
    "slot"                  "0"              // FF2 ability slot; 0 = normal rage.

    "target"                "red"            // red, blue, enemies, allies, all, self.
    "range"                 "0"              // Radius in Hammer units; 0 = unlimited.
    "line_of_sight"         "0"              // 1 = walls block the effect; players do not.
    "affect_self"           "1"              // Allow the caster when target also matches.
    "affect_bosses"         "1"              // Allow FF2 bosses among matching targets.
    "classes"               "all"            // all, or names separated by spaces/commas:
                                               // scout sniper soldier demoman medic heavy pyro spy engineer.

    "weapon_slots"          "0 1"            // Space/comma-separated slots 0..5.
                                               // 0 = primary, 1 = secondary, 2 = melee; 3..5 = tool slots.
    "active_weapon_only"    "0"              // 1 = only the active weapon, if its slot is selected.
    "drain_clip"            "1"              // Drain a real primary clip; never overwrite -1 (no clip).
    "drain_clip2"           "1"              // Drain a real alternate-fire clip, if present.
    "drain_reserve"         "1"              // Drain the selected weapons' actual reserve ammo types.
    "drain_secondary_ammo"  "1"              // Also consider each weapon's alternate-fire ammo type.
    "drain_metal"           "0"              // Also drain metal; requires drain_reserve = 1.
                                               // 0 also protects weapons that consume metal, e.g. Widowmaker.
    "drain_energy"          "0"              // Also drain weapon energy, if m_flEnergy exists.
                                               // Does not drain UberCharge, cloak or item recharge meters.

    "mode"                  "set"            // set = cap remaining ammo at amount;
                                               // subtract = remove amount; percent = remove amount percent.
    "amount"                "0"              // Default amount for clip, reserve and energy.
    // "clip_amount"        "0"              // Optional override; omit to inherit amount.
    // "reserve_amount"     "0"              // Optional override; omit to inherit amount.
    // "energy_amount"      "0"              // Optional override; omit to inherit amount.
    "minimum_ammo"          "0"              // Minimum remaining clip/reserve; never adds ammo.
    "minimum_energy"        "0"              // Minimum remaining energy; never adds energy.
                                               // Ammo results round down; energy may be fractional.
                                               // Shared reserves are drained once per target per cast.
    "message"               ""               // Optional center text for players whose ammo changed.
                                               // Empty/omitted = silent. Literal \n starts a new line.

	"plugin_name"           "ffs_ammo_drain" 
}

 * Examples: mode=percent, amount=50 removes half of the current ammo.
 *           mode=subtract, amount=10 removes 10 rounds from each selected pool.
 *           mode=set, amount=0 empties the selected clips and reserves.
 */

#include <sourcemod>
#include <sdktools>
#include <cfgmap>
#include <ff2r>
#include <tf2_stocks>

#define PLUGIN_NAME "FF2R: Rage Ammo Drain"
#define PLUGIN_AUTHOR "pu_shitcake"
#define PLUGIN_DESC "Configurable instant ammo drain with safe clip and ammo-type handling"
#define PLUGIN_VERSION "1.2.0"
#define AMMO_METAL 3
#define CLASS_MASK_ALL 1022 // TFClassType values 1..9, not presentation-order class numbers.

public Plugin myinfo =
{
    name = PLUGIN_NAME,
    author = PLUGIN_AUTHOR,
    description = PLUGIN_DESC,
    version = PLUGIN_VERSION,
    url = ""
};

enum DrainMode
{
    Drain_Set,
    Drain_Subtract,
    Drain_Percent
}

enum DrainTarget
{
    Target_Red,
    Target_Blue,
    Target_Enemies,
    Target_Allies,
    Target_All,
    Target_Self
}

enum struct DrainOptions
{
    DrainMode Mode;
    DrainTarget Target;
    float Range;
    int ClassMask;
    int SlotMask;
    bool LineOfSight;
    bool AffectSelf;
    bool AffectBosses;
    bool ActiveOnly;
    bool Clip;
    bool Clip2;
    bool Reserve;
    bool SecondaryAmmo;
    bool Metal;
    bool Energy;
    float ClipAmount;
    float ReserveAmount;
    float EnergyAmount;
    int MinimumAmmo;
    float MinimumEnergy;
    char Message[256];
}

public void FF2R_OnAbility(int client, const char[] ability, AbilityData cfg)
{
    if (!cfg.IsMyPlugin() || (!StrEqual(ability, "rage_ammo_drain", false)
        && StrContains(ability, "rage_ammo_drain__", false) != 0))
        return;
    if (client < 1 || client > MaxClients || !IsClientInGame(client) || !IsPlayerAlive(client)
        || GetClientTeam(client) < 2)
        return;

    DrainOptions options;
    if (!ReadDrainOptions(cfg, options))
        return;

    float origin[3];
    GetClientAbsOrigin(client, origin);
    for (int target = 1; target <= MaxClients; target++)
    {
        if (!IsDrainTarget(client, target, options, origin))
            continue;
        if (DrainPlayerAmmo(target, options) && options.Message[0])
            PrintCenterText(target, "%s", options.Message);
    }
}

bool ReadDrainOptions(AbilityData cfg, DrainOptions options)
{
    char text[256];
    cfg.GetString("target", text, sizeof(text), "red");
    TrimString(text);
    if (StrEqual(text, "red", false)) options.Target = Target_Red;
    else if (StrEqual(text, "blue", false)) options.Target = Target_Blue;
    else if (StrEqual(text, "enemies", false)) options.Target = Target_Enemies;
    else if (StrEqual(text, "allies", false)) options.Target = Target_Allies;
    else if (StrEqual(text, "all", false)) options.Target = Target_All;
    else if (StrEqual(text, "self", false)) options.Target = Target_Self;
    else return InvalidDrainSetting("target", text);

    cfg.GetString("mode", text, sizeof(text), "set");
    TrimString(text);
    if (StrEqual(text, "set", false)) options.Mode = Drain_Set;
    else if (StrEqual(text, "subtract", false)) options.Mode = Drain_Subtract;
    else if (StrEqual(text, "percent", false)) options.Mode = Drain_Percent;
    else return InvalidDrainSetting("mode", text);

    cfg.GetString("classes", text, sizeof(text), "all");
    options.ClassMask = ParseDrainClasses(text);
    if (!options.ClassMask)
        return InvalidDrainSetting("classes", text);
    cfg.GetString("weapon_slots", text, sizeof(text), "0 1");
    options.SlotMask = ParseDrainSlots(text);
    if (!options.SlotMask)
        return InvalidDrainSetting("weapon_slots", text);

    float amount, minimum;
    float maximum = options.Mode == Drain_Percent ? 100.0 : 1000000.0;
    if (!ReadDrainNumber(cfg, "range", options.Range, 0.0)
        || !ReadDrainNumber(cfg, "amount", amount, 0.0, maximum)
        || !ReadDrainNumber(cfg, "clip_amount", options.ClipAmount, amount, maximum)
        || !ReadDrainNumber(cfg, "reserve_amount", options.ReserveAmount, amount, maximum)
        || !ReadDrainNumber(cfg, "energy_amount", options.EnergyAmount, amount, maximum)
        || !ReadDrainNumber(cfg, "minimum_ammo", minimum, 0.0)
        || !ReadDrainNumber(cfg, "minimum_energy", options.MinimumEnergy, 0.0))
        return false;
    options.MinimumAmmo = RoundToFloor(minimum);
    options.LineOfSight = cfg.GetBool("line_of_sight", false);
    options.AffectSelf = cfg.GetBool("affect_self", true);
    options.AffectBosses = cfg.GetBool("affect_bosses", true);
    options.ActiveOnly = cfg.GetBool("active_weapon_only", false);
    options.Clip = cfg.GetBool("drain_clip", true);
    options.Clip2 = cfg.GetBool("drain_clip2", true);
    options.Reserve = cfg.GetBool("drain_reserve", true);
    options.SecondaryAmmo = cfg.GetBool("drain_secondary_ammo", true);
    options.Metal = cfg.GetBool("drain_metal", false);
    options.Energy = cfg.GetBool("drain_energy", false);
    cfg.GetString("message", options.Message, sizeof(options.Message));
    ReplaceString(options.Message, sizeof(options.Message), "\\n", "\n");
    return true;
}

bool InvalidDrainSetting(const char[] key, const char[] value)
{
    LogError("rage_ammo_drain: invalid %s '%s'; no ammo was changed", key, value);
    return false;
}

bool ReadDrainNumber(AbilityData cfg, const char[] key, float &value, float fallback, float maximum = 1000000.0)
{
    char text[64];
    if (!cfg.GetString(key, text, sizeof(text)))
    {
        value = fallback;
        return true;
    }
    TrimString(text);
    // The comparison also rejects NaN and infinity before arithmetic or indexing.
    if (!text[0] || StringToFloatEx(text, value) != strlen(text) || !(value >= 0.0 && value <= maximum))
        return InvalidDrainSetting(key, text);
    return true;
}

int ParseDrainClasses(char[] text)
{
    TrimString(text);
    if (StrEqual(text, "all", false))
        return CLASS_MASK_ALL;
    static const char names[][] =
    {
        "", "scout", "sniper", "soldier", "demoman", "medic", "heavy", "pyro", "spy", "engineer"
    };
    ReplaceString(text, 256, ",", " ");
    char tokens[32][24];
    int count = ExplodeString(text, " ", tokens, sizeof(tokens), sizeof(tokens[]));
    int mask;
    for (int i = 0; i < count; i++)
    {
        if (!tokens[i][0])
            continue;
        int playerClass;
        for (int j = 1; j < sizeof(names); j++)
            if (StrEqual(tokens[i], names[j], false))
                playerClass = j;
        if (!playerClass)
            return 0;
        mask |= 1 << playerClass;
    }
    return mask;
}

int ParseDrainSlots(char[] text)
{
    ReplaceString(text, 256, ",", " ");
    char tokens[32][16];
    int count = ExplodeString(text, " ", tokens, sizeof(tokens), sizeof(tokens[]));
    int mask;
    for (int i = 0; i < count; i++)
    {
        if (!tokens[i][0])
            continue;
        int slot;
        if (StringToIntEx(tokens[i], slot) != strlen(tokens[i]) || slot < 0 || slot > 5)
            return 0;
        mask |= 1 << slot;
    }
    return mask;
}

bool IsDrainTarget(int caster, int target, DrainOptions options, const float origin[3])
{
    if (!IsClientInGame(target) || !IsPlayerAlive(target) || GetClientTeam(target) < 2)
        return false;
    if (target == caster && !options.AffectSelf)
        return false;
    if (!options.AffectBosses && FF2R_GetBossData(target))
        return false;
    int team = GetClientTeam(target);
    switch (options.Target)
    {
        case Target_Red: if (team != 2) return false;
        case Target_Blue: if (team != 3) return false;
        case Target_Enemies: if (team == GetClientTeam(caster)) return false;
        case Target_Allies: if (team != GetClientTeam(caster)) return false;
        case Target_Self: if (target != caster) return false;
    }
    int playerClass = view_as<int>(TF2_GetPlayerClass(target));
    if (playerClass < 1 || playerClass > 9 || !(options.ClassMask & (1 << playerClass)))
        return false;
    if (options.Range > 0.0)
    {
        float position[3];
        GetClientAbsOrigin(target, position);
        if (GetVectorDistance(origin, position, true) > options.Range * options.Range)
            return false;
    }
    if (options.LineOfSight && target != caster)
    {
        float start[3], end[3];
        GetClientEyePosition(caster, start);
        GetClientEyePosition(target, end);
        Handle trace = TR_TraceRayFilterEx(start, end, MASK_VISIBLE, RayType_EndPoint, TraceDrainVisibility);
        bool blocked = TR_DidHit(trace);
        delete trace;
        if (blocked)
            return false;
    }
    return true;
}

public bool TraceDrainVisibility(int entity, int contentsMask)
{
    return entity < 1 || entity > MaxClients;
}

bool DrainPlayerAmmo(int client, DrainOptions options)
{
    int ammoCount = GetEntPropArraySize(client, Prop_Send, "m_iAmmo");
    bool[] drainedTypes = new bool[ammoCount];
    bool changed;
    int active = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
    for (int slot = 0; slot < 6; slot++)
    {
        if (!(options.SlotMask & (1 << slot)))
            continue;
        int weapon = GetPlayerWeaponSlot(client, slot);
        if (weapon <= MaxClients || !IsValidEntity(weapon) || (options.ActiveOnly && weapon != active))
            continue;
        if (GetEntPropEnt(weapon, Prop_Send, "m_hOwnerEntity") != client)
            continue;

        // Each operation must run even if an earlier operation already changed ammo.
        if (options.Clip && DrainWeaponClip(weapon, "m_iClip1", options)) changed = true;
        if (options.Clip2 && DrainWeaponClip(weapon, "m_iClip2", options)) changed = true;
        if (options.Reserve)
        {
            if (DrainWeaponReserve(client, weapon, "m_iPrimaryAmmoType", options, drainedTypes, ammoCount)) changed = true;
            if (options.SecondaryAmmo
                && DrainWeaponReserve(client, weapon, "m_iSecondaryAmmoType", options, drainedTypes, ammoCount)) changed = true;
        }
        if (options.Energy && HasEntProp(weapon, Prop_Send, "m_flEnergy"))
        {
            float current = GetEntPropFloat(weapon, Prop_Send, "m_flEnergy");
            float remaining = CalculateDrain(current, options.EnergyAmount, options.Mode, options.MinimumEnergy);
            if (remaining != current)
            {
                SetEntPropFloat(weapon, Prop_Send, "m_flEnergy", remaining);
                changed = true;
            }
        }
    }
    if (options.Reserve && options.Metal
        && DrainAmmoPool(client, AMMO_METAL, options, drainedTypes, ammoCount)) changed = true;
    return changed;
}

bool DrainWeaponClip(int weapon, const char[] property, DrainOptions options)
{
    if (!HasEntProp(weapon, Prop_Send, property))
        return false;
    int current = GetEntProp(weapon, Prop_Send, property);
    // -1 means this weapon does not use this clip. Changing it to zero makes
    // clipless guns fail their empty-clip check even after reserve ammo refills.
    if (current < 0)
        return false;
    int remaining = RoundToFloor(CalculateDrain(float(current), options.ClipAmount, options.Mode, float(options.MinimumAmmo)));
    if (remaining == current)
        return false;
    SetEntProp(weapon, Prop_Send, property, remaining);
    return true;
}

bool DrainWeaponReserve(int client, int weapon, const char[] property, DrainOptions options, bool[] drainedTypes, int ammoCount)
{
    if (!HasEntProp(weapon, Prop_Send, property))
        return false;
    // TF2 ammo indices are not weapon slots. Index 0 is a dummy; weapons may
    // consume primary, secondary, metal or another valid ammo pool.
    int ammoType = GetEntProp(weapon, Prop_Send, property);
    return DrainAmmoPool(client, ammoType, options, drainedTypes, ammoCount);
}

bool DrainAmmoPool(int client, int ammoType, DrainOptions options, bool[] drainedTypes, int ammoCount)
{
    if (ammoType <= 0 || ammoType >= ammoCount || drainedTypes[ammoType])
        return false;
    if (ammoType == AMMO_METAL && !options.Metal)
        return false;
    drainedTypes[ammoType] = true;
    int current = GetEntProp(client, Prop_Send, "m_iAmmo", _, ammoType);
    if (current < 0)
        return false;
    int remaining = RoundToFloor(CalculateDrain(float(current), options.ReserveAmount, options.Mode, float(options.MinimumAmmo)));
    if (remaining == current)
        return false;
    SetEntProp(client, Prop_Send, "m_iAmmo", remaining, _, ammoType);
    return true;
}

float CalculateDrain(float current, float amount, DrainMode mode, float minimum)
{
    if (current <= 0.0)
        return current;
    float remaining = amount;
    if (mode == Drain_Subtract) remaining = current - amount;
    else if (mode == Drain_Percent) remaining = current * (1.0 - amount / 100.0);
    if (minimum > current) minimum = current;
    if (remaining < minimum) remaining = minimum;
    if (remaining > current) remaining = current;
    return remaining;
}
