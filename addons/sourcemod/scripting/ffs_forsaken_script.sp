#pragma semicolon 1
#pragma newdecls required

/* 18 spikes, 120-unit spacing, 7 seconds, 15 damage every 0.1 seconds, RED targets.

"rage_corrupted_energy"
{
    "slot"              "0"                   // FF2 ability slot; keep your existing slot if different.

    "count"             "18"                  // Number of rocks, 1..64.
    "spacing"           "120.0"               // Distance between rocks, 1..2000 Hammer units.
    "start_distance"    "120.0"					// First rock's forward distance; blank/omitted = use spacing.
                                               // Set 0 to start at the boss, or a number up to 10000.
    "side_offset"       "0.0"                 // Shift the entire line to the boss's right; negative = left.
    "height_offset"     "0.0"                 // Vertical offset from the boss origin or snapped ground.
    "direction"         "body"                // body = boss facing; view = aim yaw. Both stay horizontal.
    "yaw_offset"        "0.0"                 // Rotate the line relative to the selected direction, degrees.
    "duration"          "7.0"                 // Line lifetime, 0.05..600 seconds.
    "replace"           "1"                   // 1 = remove the previous line before casting; 0 = ignore while active.

    "damage"            "15.0"                // Damage per tick; 0 = visual/collision effect only.
                                               // At interval 0.1, damage 15 means up to 150 damage per second.
    "radius"            "100.0"               // Spherical damage radius around each rock's origin.
    "tick_interval"     "0.1"                 // Seconds between damage ticks, 0.05..5.0.
    "damage_type"       "0"                   // Source damage flags: 0 = generic, 8 = burn, 64 = blast.
    "stack_damage"      "0"                   // 1 = sum overlapping rocks into one hit per target per tick.
                                               // 0 = at most one rock's damage per target per tick.
    "damage_falloff"    "0"                   // 1 = linear damage: full at the rock, zero at radius.
                                               // Without stacking, the nearest eligible rock is used.
    "target"            "red"                 // red, blue, enemies, allies, all, self.
    "affect_self"       "1"                   // Allow the caster if target also matches.
    "affect_bosses"     "1"                   // Allow FF2 bosses among matching targets.
    "line_of_sight"     "0"                   // 1 = geometry blocks damage from each rock; ignores players.

    "model"             "models/snowhail/gasharpoon/spike.mdl" // Precached automatically when used.
                                               // Supply model companions/materials through the boss download config.
    "model_scale"       "1.0"                 // Visual/model scale, 0.05..10. Damage radius stays independent.
    "model_angles"      "0 0 0"               // Absolute world pitch, yaw and roll for every rock, in degrees.
    "skin"              "0"                   // Model skin index; must exist on the selected model.
    "color"             "255 255 255 255"     // Red, green, blue, alpha; each 0..255.
    "solid"             "0"                   // 1 = use model VPhysics collision; requires a collision mesh.
                                               // Solid rocks can block players on any team, including the boss.

    "ground_snap"       "0"                   // 1 = trace down and place each rock on the ground.
    "ground_trace_up"   "128.0"               // Start tracing this far above the planned point.
    "ground_trace_down" "512.0"               // Trace this far below the planned point.
                                               // Points without ground in this span are skipped.

    "plugin_name"       "ffs_forsaken_script" 
}
 */

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <cfgmap>
#include <ff2r>
#include <tf2_stocks>

#define PLUGIN_VERSION "1.1.1"
#define ROCK_MODEL "models/snowhail/gasharpoon/spike.mdl"
#define MAX_ROCKS 64

public Plugin myinfo =
{
    name = "Freak Fortress 2 Rewrite: Forsaken Script",
    author = "pu_shitcake",
    description = "Configurable Corrupted Energy rock line",
    version = PLUGIN_VERSION,
    url = ""
};

enum RockTarget
{
    Rock_Red,
    Rock_Blue,
    Rock_Enemies,
    Rock_Allies,
    Rock_All,
    Rock_Self
}

enum struct RockSettings
{
    int Count;
    float Spacing;
    float StartDistance;
    float SideOffset;
    float HeightOffset;
    bool ViewDirection;
    float YawOffset;
    float Duration;
    bool Replace;
    float Damage;
    float Radius;
    float TickInterval;
    int DamageType;
    bool StackDamage;
    bool Falloff;
    RockTarget Target;
    bool AffectSelf;
    bool AffectBosses;
    bool LineOfSight;
    char Model[PLATFORM_MAX_PATH];
    float Scale;
    float Angles[3];
    int Skin;
    int Color[4];
    bool Solid;
    bool GroundSnap;
    float TraceUp;
    float TraceDown;
}

RockSettings g_Settings[MAXPLAYERS + 1];
int g_RockRefs[MAXPLAYERS + 1][MAX_ROCKS];
int g_CastSerial[MAXPLAYERS + 1];
bool g_Casting[MAXPLAYERS + 1];
bool g_Removing[MAXPLAYERS + 1];
float g_ExpiresAt[MAXPLAYERS + 1];
Handle g_DamageTimer[MAXPLAYERS + 1];
Handle g_LifetimeTimer[MAXPLAYERS + 1];
Handle g_RunningDamageTimer[MAXPLAYERS + 1];
bool g_RoundEnding;

public void OnPluginStart()
{
    HookEvent("player_death", Event_PlayerDeath);
    HookEvent("teamplay_round_start", Event_Reset, EventHookMode_Pre);
    HookEvent("teamplay_round_win", Event_Reset, EventHookMode_Pre);
    HookEvent("arena_win_panel", Event_Reset, EventHookMode_Pre);
}

public void OnMapStart()
{
    g_RoundEnding = false;
    if (FileExists(ROCK_MODEL, true))
        PrecacheModel(ROCK_MODEL, true);
}

public void OnMapEnd() { RemoveAllRocks(); }
public void OnPluginEnd() { RemoveAllRocks(); }
public void OnClientDisconnect(int client) { RemoveRocks(client); }
public void FF2R_OnBossRemoved(int client) { RemoveRocks(client); }

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
    if (event.GetInt("death_flags") & TF_DEATHFLAG_DEADRINGER)
        return;
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (client)
        RemoveRocks(client);
}

public void Event_Reset(Event event, const char[] name, bool dontBroadcast)
{
    RemoveAllRocks();
    if (StrEqual(name, "teamplay_round_start"))
        g_RoundEnding = false;
}

public void FF2R_OnAbility(int client, const char[] ability, AbilityData cfg)
{
    if (!cfg.IsMyPlugin() || (!StrEqual(ability, "rage_corrupted_energy", false)
        && StrContains(ability, "rage_corrupted_energy__", false) != 0))
        return;
    if (g_RoundEnding || !IsValidClient(client) || !IsPlayerAlive(client) || g_Casting[client] || g_Removing[client])
        return;

    RockSettings settings;
    if (!ReadRockSettings(cfg, settings))
        return;
    if (!settings.Replace && HasRocks(client))
        return;
    // Validate assets before replacing a live line. Never spawn an unprecached model.
    if (!FileExists(settings.Model, true) || PrecacheModel(settings.Model, true) <= 0)
    {
        LogError("rage_corrupted_energy: missing or invalid model '%s'", settings.Model);
        return;
    }

    g_Casting[client] = true;
    RemoveRocks(client);
    g_Settings[client] = settings;
    int serial = g_CastSerial[client];
    int count = SpawnRockLine(client, serial, settings);
    g_Casting[client] = false;
    if (serial != g_CastSerial[client])
        return;
    if (g_RoundEnding || !IsValidClient(client) || !IsPlayerAlive(client) || !count)
    {
        RemoveRocks(client);
        return;
    }

    g_ExpiresAt[client] = GetGameTime() + settings.Duration;
    int userid = GetClientUserId(client);
    g_LifetimeTimer[client] = CreateTimer(settings.Duration, Timer_RockLifetime, userid, TIMER_FLAG_NO_MAPCHANGE);
    if (settings.Damage > 0.0)
        g_DamageTimer[client] = CreateTimer(settings.TickInterval, Timer_RockDamage, userid, TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);
}

bool ReadRockSettings(AbilityData cfg, RockSettings settings)
{
    if (!ReadRockInt(cfg, "count", settings.Count, 18, 1, MAX_ROCKS)
        || !ReadRockFloat(cfg, "spacing", settings.Spacing, 120.0, 1.0, 2000.0)
        || !ReadRockFloat(cfg, "start_distance", settings.StartDistance, settings.Spacing, 0.0, 10000.0)
        || !ReadRockFloat(cfg, "side_offset", settings.SideOffset, 0.0, -10000.0, 10000.0)
        || !ReadRockFloat(cfg, "height_offset", settings.HeightOffset, 0.0, -10000.0, 10000.0)
        || !ReadRockFloat(cfg, "yaw_offset", settings.YawOffset, 0.0, -360.0, 360.0)
        || !ReadRockFloat(cfg, "duration", settings.Duration, 7.0, 0.05, 600.0)
        || !ReadRockFloat(cfg, "damage", settings.Damage, 15.0, 0.0, 100000.0)
        || !ReadRockFloat(cfg, "radius", settings.Radius, 100.0, 1.0, 5000.0)
        || !ReadRockFloat(cfg, "tick_interval", settings.TickInterval, 0.1, 0.05, 5.0)
        || !ReadRockInt(cfg, "damage_type", settings.DamageType, DMG_GENERIC, 0, 2147483647)
        || !ReadRockFloat(cfg, "model_scale", settings.Scale, 1.0, 0.05, 10.0)
        || !ReadRockInt(cfg, "skin", settings.Skin, 0, 0, 255)
        || !ReadRockFloat(cfg, "ground_trace_up", settings.TraceUp, 128.0, 0.0, 8192.0)
        || !ReadRockFloat(cfg, "ground_trace_down", settings.TraceDown, 512.0, 1.0, 8192.0))
        return false;

    char text[128];
    cfg.GetString("direction", text, sizeof(text), "body");
    TrimString(text);
    if (!StrEqual(text, "body", false) && !StrEqual(text, "view", false))
        return InvalidRockSetting("direction", text);
    settings.ViewDirection = StrEqual(text, "view", false);
    cfg.GetString("target", text, sizeof(text), "red");
    TrimString(text);
    if (StrEqual(text, "red", false)) settings.Target = Rock_Red;
    else if (StrEqual(text, "blue", false)) settings.Target = Rock_Blue;
    else if (StrEqual(text, "enemies", false)) settings.Target = Rock_Enemies;
    else if (StrEqual(text, "allies", false)) settings.Target = Rock_Allies;
    else if (StrEqual(text, "all", false)) settings.Target = Rock_All;
    else if (StrEqual(text, "self", false)) settings.Target = Rock_Self;
    else return InvalidRockSetting("target", text);

    cfg.GetString("model", settings.Model, sizeof(settings.Model), ROCK_MODEL);
    TrimString(settings.Model);
    ReplaceString(settings.Model, sizeof(settings.Model), "\\", "/");
    int length = strlen(settings.Model);
    if (length < 11 || StrContains(settings.Model, "models/", false) != 0
        || !StrEqual(settings.Model[length - 4], ".mdl", false))
        return InvalidRockSetting("model", settings.Model);

    cfg.GetString("model_angles", text, sizeof(text), "0 0 0");
    if (!ParseRockAngles(text, settings.Angles))
        return InvalidRockSetting("model_angles", text);
    cfg.GetString("color", text, sizeof(text), "255 255 255 255");
    if (!ParseRockColor(text, settings.Color))
        return InvalidRockSetting("color", text);

    settings.Replace = cfg.GetBool("replace", true);
    settings.StackDamage = cfg.GetBool("stack_damage", false);
    settings.Falloff = cfg.GetBool("damage_falloff", false);
    settings.AffectSelf = cfg.GetBool("affect_self", true);
    settings.AffectBosses = cfg.GetBool("affect_bosses", true);
    settings.LineOfSight = cfg.GetBool("line_of_sight", false);
    settings.Solid = cfg.GetBool("solid", false);
    settings.GroundSnap = cfg.GetBool("ground_snap", false);
    return true;
}

bool InvalidRockSetting(const char[] key, const char[] value)
{
    LogError("rage_corrupted_energy: invalid %s '%s'; cast skipped", key, value);
    return false;
}

bool ReadRockFloat(AbilityData cfg, const char[] key, float &value, float fallback, float minimum, float maximum)
{
    char text[64];
    if (!cfg.GetString(key, text, sizeof(text)))
    {
        value = fallback;
        return true;
    }
    TrimString(text);
    return (text[0] && StringToFloatEx(text, value) == strlen(text) && value >= minimum && value <= maximum)
        || InvalidRockSetting(key, text);
}

bool ReadRockInt(AbilityData cfg, const char[] key, int &value, int fallback, int minimum, int maximum)
{
    char text[64];
    if (!cfg.GetString(key, text, sizeof(text)))
    {
        value = fallback;
        return true;
    }
    TrimString(text);
    // Check the original magnitude too, so a wrapped 32-bit integer cannot
    // turn an out-of-range count or skin into a seemingly valid value.
    float magnitude = StringToFloat(text);
    return (text[0] && StringToIntEx(text, value) == strlen(text) && value >= minimum && value <= maximum
        && magnitude >= float(minimum) && magnitude <= float(maximum))
        || InvalidRockSetting(key, text);
}

bool ParseRockAngles(char[] text, float angles[3])
{
    char token[32];
    int position;
    for (int i = 0; i < 3; i++)
    {
        int next = BreakString(text[position], token, sizeof(token));
        if (!token[0] || StringToFloatEx(token, angles[i]) != strlen(token)
            || !(angles[i] >= -360.0 && angles[i] <= 360.0))
            return false;
        if (next == -1)
            return i == 2;
        position += next;
    }
    TrimString(text[position]);
    return !text[position];
}

bool ParseRockColor(char[] text, int color[4])
{
    char token[32];
    int position;
    for (int i = 0; i < 4; i++)
    {
        int next = BreakString(text[position], token, sizeof(token));
        float magnitude = StringToFloat(token);
        if (!token[0] || StringToIntEx(token, color[i]) != strlen(token) || color[i] < 0 || color[i] > 255
            || !(magnitude >= 0.0 && magnitude <= 255.0))
            return false;
        if (next == -1)
            return i == 3;
        position += next;
    }
    TrimString(text[position]);
    return !text[position];
}

int SpawnRockLine(int client, int serial, RockSettings settings)
{
    float origin[3], angles[3], direction[3], right[3];
    GetClientAbsOrigin(client, origin);
    if (settings.ViewDirection) GetClientEyeAngles(client, angles);
    else GetClientAbsAngles(client, angles);
    angles[0] = angles[2] = 0.0;
    angles[1] += settings.YawOffset;
    GetAngleVectors(angles, direction, right, NULL_VECTOR);
    int count;
    for (int i = 0; i < settings.Count; i++)
    {
        if (serial != g_CastSerial[client] || g_RoundEnding || !IsValidClient(client) || !IsPlayerAlive(client))
            break;
        float position[3];
        GetRockPosition(origin, direction, right, settings.StartDistance + settings.Spacing * i, settings.SideOffset, position);
        if (settings.GroundSnap && !SnapRockToGround(position, settings))
            continue;
        position[2] += settings.HeightOffset;
        int entity = CreateEntityByName("prop_dynamic_override");
        if (entity <= MaxClients)
            break;
        int reference = EntIndexToEntRef(entity);
        // Own the entity before DispatchSpawn, which can invoke other plugins.
        if (serial != g_CastSerial[client])
        {
            RemoveEntity(entity);
            break;
        }
        g_RockRefs[client][i] = reference;
        DispatchKeyValue(entity, "model", settings.Model);
        DispatchKeyValue(entity, "solid", settings.Solid ? "6" : "0");
        DispatchKeyValueInt(entity, "skin", settings.Skin);
        DispatchKeyValueFloat(entity, "modelscale", settings.Scale);
        DispatchSpawn(entity);
        if (serial != g_CastSerial[client] || EntRefToEntIndex(reference) <= MaxClients)
            break;
        TeleportEntity(entity, position, settings.Angles, NULL_VECTOR);
        if (settings.Color[3] < 255)
            SetEntityRenderMode(entity, RENDER_TRANSCOLOR);
        SetEntityRenderColor(entity, settings.Color[0], settings.Color[1], settings.Color[2], settings.Color[3]);
        count++;
    }
    return count;
}

void GetRockPosition(const float origin[3], const float direction[3], const float right[3], float distance, float side, float position[3])
{
    for (int axis = 0; axis < 3; axis++)
        position[axis] = origin[axis] + direction[axis] * distance + right[axis] * side;
}

bool SnapRockToGround(float position[3], RockSettings settings)
{
    float start[3], end[3];
    start = position;
    end = position;
    start[2] += settings.TraceUp;
    end[2] -= settings.TraceDown;
    Handle trace = TR_TraceRayFilterEx(start, end, MASK_PLAYERSOLID_BRUSHONLY, RayType_EndPoint, TraceRockGeometry, -1);
    bool hit = TR_DidHit(trace) && !TR_StartSolid(trace);
    if (hit)
        TR_GetEndPosition(position, trace);
    delete trace;
    return hit;
}

public bool TraceRockGeometry(int entity, int contentsMask, any ignore)
{
    return (entity == 0 || entity > MaxClients) && entity != ignore;
}

bool RockCanSeeTarget(int rock, int target)
{
    float start[3], end[3];
    GetEntPropVector(rock, Prop_Send, "m_vecOrigin", start);
    start[2] += 32.0;
    GetClientEyePosition(target, end);
    Handle trace = TR_TraceRayFilterEx(start, end, MASK_VISIBLE, RayType_EndPoint, TraceRockGeometry, rock);
    bool visible = !TR_DidHit(trace);
    delete trace;
    return visible;
}

bool IsRockTarget(int caster, int target, RockSettings settings)
{
    if (!IsValidClient(target) || !IsPlayerAlive(target) || GetClientTeam(target) < 2)
        return false;
    if (target == caster && !settings.AffectSelf)
        return false;
    if (!settings.AffectBosses && FF2R_GetBossData(target))
        return false;
    int team = GetClientTeam(target);
    switch (settings.Target)
    {
        case Rock_Red: return team == 2;
        case Rock_Blue: return team == 3;
        case Rock_Enemies: return team != GetClientTeam(caster);
        case Rock_Allies: return team == GetClientTeam(caster);
        case Rock_Self: return target == caster;
    }
    return true;
}

float GetRockDamage(float distance, RockSettings settings)
{
    if (distance >= settings.Radius)
        return 0.0;
    return settings.Falloff ? settings.Damage * (1.0 - distance / settings.Radius) : settings.Damage;
}

public Action Timer_RockDamage(Handle timer, any userid)
{
    int client = GetClientOfUserId(userid);
    if (!client || g_DamageTimer[client] != timer)
        return Plugin_Stop;
    g_RunningDamageTimer[client] = timer;
    int serial = g_CastSerial[client];
    if (g_RoundEnding || !IsValidClient(client) || !IsPlayerAlive(client)
        || !FF2R_GetBossData(client) || GetGameTime() >= g_ExpiresAt[client] || !HasRocks(client))
        RemoveRocks(client);
    else
        DamageRockTargets(client, serial);
    g_RunningDamageTimer[client] = null;
    return g_DamageTimer[client] == timer ? Plugin_Continue : Plugin_Stop;
}

void DamageRockTargets(int client, int serial)
{
    RockSettings settings;
    settings = g_Settings[client];
    for (int target = 1; target <= MaxClients; target++)
    {
        if (serial != g_CastSerial[client] || g_RoundEnding)
            return;
        if (!IsRockTarget(client, target, settings))
            continue;
        float position[3];
        GetClientAbsOrigin(target, position);
        float total;
        int inflictor = -1;
        for (int i = 0; i < settings.Count; i++)
        {
            int rock = EntRefToEntIndex(g_RockRefs[client][i]);
            if (rock <= MaxClients)
                continue;
            float rockPosition[3];
            GetEntPropVector(rock, Prop_Send, "m_vecOrigin", rockPosition);
            float damage = GetRockDamage(GetVectorDistance(position, rockPosition), settings);
            if (damage <= 0.0 || (settings.LineOfSight && !RockCanSeeTarget(rock, target)))
                continue;
            if (settings.StackDamage)
            {
                total += damage;
                if (inflictor == -1) inflictor = rock;
            }
            else if (damage > total)
            {
                total = damage;
                inflictor = rock;
            }
        }
        if (total > 0.0 && inflictor > MaxClients)
        {
            SDKHooks_TakeDamage(target, inflictor, client, total, settings.DamageType);
            // Damage can end the round, remove the boss, or trigger a new cast.
            if (serial != g_CastSerial[client] || g_RoundEnding)
                return;
        }
    }
}

public Action Timer_RockLifetime(Handle timer, any userid)
{
    int client = GetClientOfUserId(userid);
    if (client && g_LifetimeTimer[client] == timer)
    {
        g_LifetimeTimer[client] = null;
        RemoveRocks(client);
    }
    return Plugin_Stop;
}

bool HasRocks(int client)
{
    for (int i = 0; i < MAX_ROCKS; i++)
        if (EntRefToEntIndex(g_RockRefs[client][i]) > MaxClients)
            return true;
    return false;
}

void RemoveRocks(int client)
{
    if (client < 1 || client > MaxClients || g_Removing[client])
        return;
    g_Removing[client] = true;
    g_CastSerial[client]++;
    // Detach handles first. A damage callback already executing closes itself by
    // returning Plugin_Stop, so never delete that running timer here.
    Handle damageTimer = g_DamageTimer[client];
    g_DamageTimer[client] = null;
    if (damageTimer != null && damageTimer != g_RunningDamageTimer[client])
        delete damageTimer;
    delete g_LifetimeTimer[client];
    for (int i = 0; i < MAX_ROCKS; i++)
    {
        int reference = g_RockRefs[client][i];
        g_RockRefs[client][i] = INVALID_ENT_REFERENCE;
        int entity = EntRefToEntIndex(reference);
        if (entity > MaxClients)
            RemoveEntity(entity);
    }
    g_ExpiresAt[client] = 0.0;
    g_Removing[client] = false;
}

void RemoveAllRocks()
{
    g_RoundEnding = true;
    for (int client = 1; client <= MaxClients; client++)
        RemoveRocks(client);
}

bool IsValidClient(int client)
{
    return client >= 1 && client <= MaxClients && IsClientInGame(client)
        && !IsClientSourceTV(client) && !IsClientReplay(client)
        && !GetEntProp(client, Prop_Send, "m_bIsCoaching");
}
