# Boss Ability Configurations

Configuration examples for Freak Fortress 2 Rewrite. Copy an ability's code block into your boss config.

## Contents

- [Ammo Drain](#ammo-drain)
- [Corrupted Energy](#corrupted-energy)
- [RTD abilities (68 effects)](#rtd-abilities)

## Ammo Drain

Ability: `rage_ammo_drain`

```text
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
```

## Corrupted Energy

Ability: `rage_corrupted_energy`

```text
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
```

## RTD Abilities

Use the index below to jump to an ability and copy its configuration.

<details>
<summary>Browse all 68 RTD abilities</summary>

| Effect | Ability |
| --- | --- |
| [Toxic](#toxic) | `rage_rtd_toxic` |
| [Flying](#flying) | `rage_rtd_flying` |
| [Infinite Ammo](#infinite-ammo) | `rage_rtd_infiniteammo` |
| [Scary Bullet](#scary-bullet) | `rage_rtd_scarybullets` |
| [Spawn Sentry](#spawn-sentry) | `rage_rtd_spawnsentry` |
| [Homing Projectile](#homing-projectile) | `rage_rtd_homingprojectiles` |
| [Explode](#explode) | `rage_rtd_explode` |
| [Snail](#snail) | `rage_rtd_snail` |
| [Frozen](#frozen) | `rage_rtd_frozen` |
| [Time Bomb](#time-bomb) | `rage_rtd_timebomb` |
| [Ignition](#ignition) | `rage_rtd_ignition` |
| [Low Health](#low-health) | `rage_rtd_lowhealth` |
| [Drugged](#drugged) | `rage_rtd_drugged` |
| [Blind](#blind) | `rage_rtd_blind` |
| [Stripped To Melee](#stripped-to-melee) | `rage_rtd_striptomelee` |
| [Beacon](#beacon) | `rage_rtd_beacon` |
| [Forced Taunt](#forced-taunt) | `rage_rtd_forcedtaunt` |
| [Monochromia](#monochromia) | `rage_rtd_monochromia` |
| [Earthquake](#earthquake) | `rage_rtd_earthquake` |
| [Funny Feeling](#funny-feeling) | `rage_rtd_funnyfeeling` |
| [Bad Sauce](#bad-sauce) | `rage_rtd_badsauce` |
| [Spawn Dispenser](#spawn-dispenser) | `rage_rtd_spawndispenser` |
| [Infinite Jump](#infinite-jump) | `rage_rtd_infinitejump` |
| [Powerful Hits](#powerful-hits) | `rage_rtd_powerfulhits` |
| [Big Head](#big-head) | `rage_rtd_bighead` |
| [Tiny Mann](#tiny-mann) | `rage_rtd_tinymann` |
| [Firework](#firework) | `rage_rtd_firework` |
| [Deadly Voice](#deadly-voice) | `rage_rtd_deadlyvoice` |
| [Eye For An Eye](#eye-for-an-eye) | `rage_rtd_eyeforaneye` |
| [Weakended](#weakended) | `rage_rtd_weakened` |
| [Necro Smash](#necro-smash) | `rage_rtd_necromash` |
| [Extra Ammo](#extra-ammo) | `rage_rtd_extraammo` |
| [Suffocation](#suffocation) | `rage_rtd_suffocation` |
| [Fast Hands](#fast-hands) | `rage_rtd_fasthands` |
| [Outline](#outline) | `rage_rtd_outline` |
| [Team Criticals](#team-criticals) | `rage_rtd_teamcriticals` |
| [Fire Time Bomb](#fire-time-bomb) | `rage_rtd_firetimebomb` |
| [Fire Breath](#fire-breath) | `rage_rtd_firebreath` |
| [Strong Recoil](#strong-recoil) | `rage_rtd_strongrecoil` |
| [Cursed](#cursed) | `rage_rtd_cursed` |
| [Extra Throwables](#extra-throwables) | `rage_rtd_extrathrowables` |
| [Explosive Arrows](#explosive-arrows) | `rage_rtd_explosivearrows` |
| [Incline Problem](#incline-problem) | `rage_rtd_inclineproblem` |
| [Spring Shoes](#spring-shoes) | `rage_rtd_springshoes` |
| [Lag](#lag) | `rage_rtd_lag` |
| [Drug Bullets](#drug-bullets) | `rage_rtd_drugbullets` |
| [Long Melee](#long-melee) | `rage_rtd_longmelee` |
| [Hat Throw](#hat-throw) | `rage_rtd_hatthrow` |
| [Madaras Whistle](#madaras-whistle) | `rage_rtd_madaraswhistle` |
| [Sickness](#sickness) | `rage_rtd_sickness` |
| [Wasted Roll](#wasted-roll) | `rage_rtd_wastedroll` |
| [Drunk Walk](#drunk-walk) | `rage_rtd_drunkwalk` |
| [Hell's Reach](#hells-reach) | `rage_rtd_hellsreach` |
| [Curse Projectile](#curse-projectile) | `rage_rtd_cursedprojectiles` |
| [Vampire](#vampire) | `rage_rtd_vampire` |
| [Bat Swarm](#bat-swarm) | `rage_rtd_batswarm` |
| [Pumkin Trail](#pumkin-trail) | `rage_rtd_pumpkintrail` |
| [A Call Beyond](#a-call-beyond) | `rage_rtd_acallbeyond` |
| [Smite](#smite) | `rage_rtd_smite` |
| [Overheal Bonus](#overheal-bonus) | `rage_rtd_overhealbonus` |
| [Sunlight Spear](#sunlight-spear) | `rage_rtd_sunlightspear` |
| [Elden Stars](#elden-stars) | `rage_rtd_eldenstars` |
| [Frog](#frog) | `rage_rtd_frog` |
| [Paranoia](#paranoia) | `rage_rtd_paranoia` |
| [Heavy Rockets](#heavy-rockets) | `rage_rtd_heavyrockets` |
| [Weapon Mixup](#weapon-mixup) | `rage_rtd_weaponmixup` |
| [Autoheal](#autoheal) | `rage_rtd_autoheal` |
| [Team Autoheal](#team-autoheal) | `rage_rtd_teamautoheal` |

</details>

### Toxic

```text
"rage_rtd_toxic"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Toxic: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // radius <float>: Toxic cloud radius.
        "radius" "192.0"
        // interval <float>: Interval in seconds damaging occurs.
        "interval" "0.2"
        // damage <float>: Amount of damage dealt.
        "damage" "20.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Flying

```text
"rage_rtd_flying"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Flying: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // mode 0: Flying.
        // mode 1: Noclip.
        "mode" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Infinite Ammo

```text
"rage_rtd_infiniteammo"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Infinite Ammo: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // reload 0: No need to reload.
        // reload 1: Reloading required.
        "reload" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Scary Bullet

```text
"rage_rtd_scarybullets"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Scary Bullets: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // duration <float>: Stun duration.
        "duration" "3"
        // min_damage <integer>: Minimum amount of damage required to trigger the effect.
        "min_damage" "5"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Spawn Sentry

```text
"rage_rtd_spawnsentry"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Erecting a Sentry Here!: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // level <integer[0 - 3]>: Sentry level, 0 = minisentry.
        "level" "3"
        // keep 0: Sentry Gun disappears after perk's ended.
        // keep 1: Sentry Gun remains after the perk's ended.
        "keep" "0"
        // amount <integer[1 - 3]>: Amount of Sentries that can be placed (max 3).
        "amount" "1"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "sentry" "Call MEDIC! to build a Sentry. {time}s remaining" // Instruction shown when the effect starts
        "sentry_spawned" "Sentries built: {count}/{max}" // Updated after each successful build
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Homing Projectile

```text
"rage_rtd_homingprojectiles"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Homing Projectiles: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // crits 0: No Crits.
        // crits 1: MiniCrits.
        // crits 2: FullCrits.
        "crits" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Explode

```text
"rage_rtd_explode"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "instant"            "false" // true = explode immediately; false = create a timed bomb
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Explode: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // range <float>: Range of the bomb tether, the player cannot move outside of it.
        "range" "100"
        // health <integer>: Bomb's health.
        "health" "1500"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Snail

```text
"rage_rtd_snail"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Too Slow: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // multiplier <float>: Movement speed multiplier.
        "multiplier" "0.4"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Frozen

```text
"rage_rtd_frozen"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Frozen: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // ice_health <integer>: Health of the ice statue to be destroyed.
        "ice_health" "500"
        // resistance <float>: Multiplier to incoming damage while the player is frozen.
        "resistance" "0.1"
        // flame_buff <float>: Damage multiplier against the ice statue (no the player) for fire attacks.
        "flame_buff" "5.0"
        // breakable 0: Ice statue is unbreakable and victim remains frozen until the perk ends.
        // breakable 1: Ice statue takes damage and can be broken to free the victim early.
        "breakable" "1"
        // muffle 0: Victim's voice commands use their class' voice lines.
        // muffle 1: Victim's voice commands use Pyro's voice lines, giving a muffled effect.
        "muffle" "1"
        // volume 0: Victim makes no sound whatsoever.
        // volume 100: Volume of victim's voice lines remains unchanged.
        // volume <integer[0 - 100]>: Custom volume percentage of victim's voice lines.
        "volume" "50"
        // legacy 0: Use modern Frozen featuring a breakable ice statue with custom visuals.
        // legacy 1: Use legacy Frozen imitating a Spy-cicle death.
        "legacy" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Time Bomb

```text
"rage_rtd_timebomb"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Allahu Akbar: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // radius <float>: Explosion radius.
        "radius" "512.0"
        // damage <float>: Explosion damage.
        "damage" "800.0"
        // resistance <float>: Multiplier of incoming damage for extra resistance.
        "resistance" "1.0"
        // headshot <float>: Multiplier of headshot damage for extra resistance.
        "headshot" "0.1"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "damage" "Damage dealt: {damage}" // Result shown when the bomb detonates
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Ignition

```text
"rage_rtd_ignition"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Ignition activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Low Health

```text
"rage_rtd_lowhealth"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Low Health activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // health <integer>: Set player health to this amount.
        "health" "7"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Drugged

```text
"rage_rtd_drugged"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "GET HIGH: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // interval <float>: Interval with which overlay color changes.
        "interval" "1.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Blind

```text
"rage_rtd_blind"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Blind: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // alpha <integer[0 - 255]>: 0 = transparent, 255 = full black
        "alpha" "254"
        // annotations 0: Do not display annotations over enemies' heads.
        // annotations 1: Display annotations over enemies' heads.
        "annotations" "0"
        // unblind 0: Do not trigger a brief unblind when attacking enemies.
        // unblind 1: Trigger a brief unblind when attacking enemies.
        "unblind" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Stripped To Melee

```text
"rage_rtd_striptomelee"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "instant"            "false" // true = strip non-melee weapons immediately; false = use timed weapon boxes
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Strip to Melee: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // fullhealth 0: Player's health stays same.
        // fullhealth 1: Player gets a bonus of full health.
        "fullhealth" "0"
        // boxhealth <float>: Health of the spawned weapon cases.
        "boxhealth" "300"
        // flingspeed <float>: Speed at which the cases and flung.
        "flingspeed" "2000"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Beacon

```text
"rage_rtd_beacon"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Beacon: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // interval <float>: Fire interval in seconds.
        "interval" "0.5"
        // radius <float[10.0+]>: Radius of the beams. No less than 10.0, otherwise the effect is not shown.
        "radius" "375.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Forced Taunt

```text
"rage_rtd_forcedtaunt"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Forced Taunt: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // interval <float>: Interval to taunt in seconds, after that last taunt's end.
        "interval" "1.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Monochromia

```text
"rage_rtd_monochromia"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Monochromia: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Earthquake

```text
"rage_rtd_earthquake"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Earthquake: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // amplitude <float>: Shake amplitude.
        "amplitude" "25.0"
        // frequency <float>: Shake frequency.
        "frequency" "25.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Funny Feeling

```text
"rage_rtd_funnyfeeling"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Funny Feeling: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // fov <float>: New FOV value.
        "fov" "360"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Bad Sauce

```text
"rage_rtd_badsauce"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Bad Sauce: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // milk 0: Apply Milk effect for the perk's duration.
        // milk -1: Do not apply Milk effect.
        // milk <float>: Apply Milk effect for a custom amount of time.
        "milk" "0"
        // jarate 0: Apply Jarate effect for the perk's duration.
        // jarate -1: Do not apply Jarate effect.
        // jarate <float>: Apply Jarate effect for a custom amount of time.
        "jarate" "0"
        // bleed 0: Apply Bleed effect for the perk's duration.
        // bleed -1: Do not apply Bleed effect.
        // bleed <float>: Apply Bleed effect for a custom amount of time.
        "bleed" "5.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Spawn Dispenser

```text
"rage_rtd_spawndispenser"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Pootispencerere!: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // level <integer[1 - 3]>: Dispenser level.
        "level" "3"
        // keep 0: Dispenser disappears after perk's ended.
        // keep 1: Dispenser remains after the perk's ended.
        "keep" "1"
        // amount <integer[1 - 3]>: Amount of Dispensers that can be placed (max 3).
        "amount" "1"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "dispenser" "Call MEDIC! to build a Dispenser. {time}s remaining" // Instruction shown when the effect starts
        "dispenser_spawned" "Dispensers built: {count}/{max}" // Updated after each successful build
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Infinite Jump

```text
"rage_rtd_infinitejump"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Infinite Double Jump: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Powerful Hits

```text
"rage_rtd_powerfulhits"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Powerful Hits: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // multiplier <float>: Damage multiplier.
        "multiplier" "3.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Big Head

```text
"rage_rtd_bighead"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Big Ass Head: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // scale <float>: Head scale multiplier.
        "scale" "4.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Tiny Mann

```text
"rage_rtd_tinymann"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Tiny Desk Ability: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // scale <float>: Scale multiplier.
        "scale" "0.35"
        // boost 0: Do not apply speed boost.
        // boost 1: Apply speed boost.
        "boost" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Firework

```text
"rage_rtd_firework"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Hanabi dayo~ gomene~ activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // force <float>: Force to launch the player with.
        "force" "4096"
        // damage 0: No explosion happens and no damage is dealt. Ignite works irrespectively of this setting.
        // damage -1: Explode the player in air, killing them regardless of health.
        // damage <integer>: Deal a custom damage value with an explosion.
        "damage" "-1"
        // ignite 0: Do not ignite the player.
        // ignite 1: Ignite the player. Has no effect if the player died.
        "ignite" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Deadly Voice

```text
"rage_rtd_deadlyvoice"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Deadly Voice: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Minimal attack interval.
        "rate" "0.8"
        // range <float>: Attack radius.
        "range" "200.0"
        // damage <float>: Attack damage.
        "damage" "150.0"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Eye For An Eye

```text
"rage_rtd_eyeforaneye"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Eye for an Eye: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Weakended

```text
"rage_rtd_weakened"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Weakened: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // multiplier <float>: Incoming damage multiplier.
        "multiplier" "2.5"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Necro Smash

```text
"rage_rtd_necromash"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Its Punishment Time! activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Extra Ammo

```text
"rage_rtd_extraammo"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Extra Ammo activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // multiplier <float>: Ammo multiplier.
        "multiplier" "5.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Suffocation

```text
"rage_rtd_suffocation"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Suffocation: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // delay <float>: Seconds before suffocation kicks in.
        "delay" "12.0"
        // rate <float>: How often should damage be dealt (in seconds).
        "rate" "1.0"
        // damage <float>: Amount of damage dealt.
        "damage" "5"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Fast Hands

```text
"rage_rtd_fasthands"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Fast Hands: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // attack <float>: Attack speed multiplier.
        "attack" "2.0"
        // reload <float>: Reload speed multiplier.
        "reload" "2.5"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Outline

```text
"rage_rtd_outline"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Outline: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Team Criticals

```text
"rage_rtd_teamcriticals"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Team Criticals: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // range <float>: Effect's range.
        "range" "325"
        // crits 0: MiniCrits.
        // crits 1: FullCrits.
        "crits" "1"
        // mark_death 0: Do not mark the player for death.
        // mark_death 1: Mark the player for death.
        "mark_death" "0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Fire Time Bomb

```text
"rage_rtd_firetimebomb"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Allahu Akbar But On Fire: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // radius <float>: Explosion radius.
        "radius" "750.0"
        // resistance <float>: Multiplier of incoming damage for extra resistance.
        "resistance" "0.75"
        // headshot <float>: Multiplier of headshot damage for extra resistance.
        "headshot" "0.1"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "ignited" "Players ignited: {count}" // Result shown when the fire bomb detonates
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Fire Breath

```text
"rage_rtd_firebreath"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Fire Breath: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate of fire.
        "rate" "2.7"
        // crit <float[0.0 - 1.0]>: Chance for a critical fireball.
        "crit" "0.05"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Strong Recoil

```text
"rage_rtd_strongrecoil"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Strong Recoil: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Cursed

```text
"rage_rtd_cursed"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Cursed: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Extra Throwables

```text
"rage_rtd_extrathrowables"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Extra Throwables activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // amount <integer>: Amount of the item that should be given.
        "amount" "20"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Explosive Arrows

```text
"rage_rtd_explosivearrows"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Explosive Arrows: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // damage <float>: Explosion damage.
        "damage" "50"
        // radius <float>: Explosion radius.
        "radius" "80"
        // force <float>: Explosion force.
        "force" "150"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Incline Problem

```text
"rage_rtd_inclineproblem"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Fatass: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Spring Shoes

```text
"rage_rtd_springshoes"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Spring Shoes: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Lag

```text
"rage_rtd_lag"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Fake Lag: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Drug Bullets

```text
"rage_rtd_drugbullets"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Drug Bullets: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // min_damage <float>: Minimum amount of damage required to trigger the effect.
        "min_damage" "5"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Long Melee

```text
"rage_rtd_longmelee"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Long Meleeeeeeeeeeee: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // multiplier <float>: Multiply the melee range by this amount.
        "multiplier" "10"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Hat Throw

```text
"rage_rtd_hatthrow"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Hat Throw: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate of fire.
        "rate" "2.5"
        // speed <float>: Hat's speed.
        "speed" "1100"
        // damage <float>: Hat's damage.
        "damage" "150"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Madaras Whistle

```text
"rage_rtd_madaraswhistle"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Bombardino Crocodillo: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate at which the whistle can be blown.
        "rate" "2.0"
        // delay <float>: Delay before the alligator attack.
        "delay" "1.0"
        // range <float>: Area of effect of the attack.
        "range" "100"
        // damage <float>: Damage being dealt to enemies.
        "damage" "500"
        // selfdamage <float>: Damage being dealt to the summoner.
        "selfdamage" "200"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Sickness

```text
"rage_rtd_sickness"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Sickness: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // infect 0: Do not infect enemies.
        // infect 1: Infect enemies in range when coughing.
        "infect" "0"
        // range <float>: Maximum range within which enemies can be infected.
        "range" "100.0"
        // mindamage <float>: Minimum randomized damage.
        "mindamage" "5"
        // maxdamage <float>: Maximum randomized damage.
        "maxdamage" "10"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Wasted Roll

```text
"rage_rtd_wastedroll"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    // Instant effect: duration is ignored
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "SkillIssue activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Drunk Walk

```text
"rage_rtd_drunkwalk"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Drunk Walk: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // minspeed <float>: Minimum walking speed multiplier.
        "minspeed" "0.15"
        // maxspeed <float>: Maximum walking speed multiplier.
        "maxspeed" "2.0"
        // turnangle <float>: Angle to rotate the player camera each step.
        "turnangle" "25.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Hell's Reach

```text
"rage_rtd_hellsreach"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Hell's Reach: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // mindamage <float>: Minimum randomized explosion damage.
        "mindamage" "5"
        // maxdamage <float>: Maximum randomized explosion damage.
        "maxdamage" "35"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Curse Projectile

```text
"rage_rtd_cursedprojectiles"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Cursed Projectiles: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // delay <float>: Seconds before the projectile is turned.
        "delay" "1.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Vampire

```text
"rage_rtd_vampire"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Vampire: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // mindamage <float>: Minimal amount of damage dealt each heartbeat.
        "mindamage" "1"
        // maxdamage <float>: Maximal amount of damage dealt each heartbeat.
        "maxdamage" "3"
        // resistance <float>: Seconds of respite after damaging an enemy.
        "resistance" "3.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Bat Swarm

```text
"rage_rtd_batswarm"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Bat Swarm: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate at which new bat swarm spawns.
        "rate" "0.35"
        // lifetime <float>: Bats' lifetime in seconds.
        "lifetime" "1.0"
        // amount <integer>: The amount of bat spells spawned per rate tick.
        "amount" "2"
        // speed <float>: The multiplier for player's speed when the effect is active.
        "speed" "0.25"
        // legacy 0: Use modern Bat Swarm featuring effect toggling and invulnerability.
        // legacy 1: Use legacy Bat Swarm with bats spawning without restrictions.
        "legacy" "1"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Pumkin Trail

```text
"rage_rtd_pumpkintrail"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Pumpkin Trail: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate of usage.
        "rate" "3.0"
        // range <float>: Explosion range per pumpkin.
        "range" "150.0"
        // damage <float>: Explosion damage per pumpkin.
        "damage" "80.0"
        // amount <integer>: Amount of pumpkins per each trail spawned.
        "amount" "5"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### A Call Beyond

```text
"rage_rtd_acallbeyond"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "A Call Beyond: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate of fire.
        "rate" "3.0"
        // damage <float>: Damage per projectile.
        "damage" "40.0"
        // amount <float>: Amount of projectiles spawned per cast.
        "amount" "6"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Smite

```text
"rage_rtd_smite"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "instant"            "false" // true = use the immediate 999-damage lightning strike; false = timed electrocution
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Kru Thai Strikes: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // initial_damage <float>: Percentage of max health to damage on perk activation.
        "initial_damage" "1.0"
        // damage_ticks <integer>: The number of electrocution ticks, separated by a random interval during perk runtime.
        "damage_ticks" "3"
        // tick_damage <float>: Percentage of max health to damage during a damage tick.
        "tick_damage" "0.04"
        // slowdown <float>: Percentage that the player is slowed down by during damage ticks.
        "slowdown" "0.2"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Overheal Bonus

```text
"rage_rtd_overhealbonus"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Overheal Bonus: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // scale <float>: Overheal bonus multiplier.
        "scale" "5.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Sunlight Spear

```text
"rage_rtd_sunlightspear"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Sunlight Spear: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // ticks <float>: Number of electrocution ticks (0.1s each).
        "ticks" "5"
        // slowdown <float>: Movement speed multiplier during electrocution when hitting enemies.
        "slowdown" "0.2"
        // ally_speed <float>: Duration in seconds of speed boost when hitting teammates.
        "ally_speed" "2.0"
        // rate <float>: Attack rate.
        "rate" "1.2"
        // speed <integer>: Projectile speed.
        "speed" "2500"
        // damage <float>: Damage per tick, first tick deals double.
        "damage" "10.0"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Elden Stars

```text
"rage_rtd_eldenstars"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Elden Stars: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Attack rate.
        "rate" "1.0"
        // lifetime <float>: Lifetime in seconds of the small projectile.
        "lifetime" "3.5"
        // speed <integer>: Speed of the small projectile.
        "speed" "300"
        // damage <float>: Damage of the small projectile, susceptible to falloff.
        "damage" "45"
    }
    "messages" // Optional event-specific HUD text; an omitted or empty key displays nothing
    {
        "attack" "Call MEDIC! to attack. {time}s remaining" // Instruction shown when the effect starts
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Frog

```text
"rage_rtd_frog"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Frog: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Wait time in seconds after landing until player can jump.
        "rate" "0.5"
        // vertical <float>: Vertical jump velocity (should be high enough to lift player off ground).
        "vertical" "300.0"
        // horizontal <float>: Horizontal jump velocity.
        "horizontal" "600.0"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Paranoia

```text
"rage_rtd_paranoia"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "45" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Paranoia: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Heavy Rockets

```text
"rage_rtd_heavyrockets"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Heavy Rockets: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // sharpness <integer[1 - 100]>: Defines how sharp rockets turn towards ground (should be under 20 for decent effect).
        "sharpness" "8"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Weapon Mixup

```text
"rage_rtd_weaponmixup"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Weapon Mixup: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability"
}
```

### Autoheal

```text
"rage_rtd_autoheal"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Autoheal: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // rate <float>: Rate of regen.
        "rate" "0.1"
        // health <integer>: Health gained each regen tick.
        "health" "4"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```

### Team Autoheal

```text
"rage_rtd_teamautoheal"
{
    "slot"               "0" // FF2R ability slot; 0 = normal rage
    "duration"           "10" // Duration in seconds
    "target"             "self" // self / enemies / allies (excluding self) / team (including self) / all
    "range"              "0" // Target selection range; 0 = unlimited
    "line_of_sight"      "false" // true = require a clear line of sight from the boss to each target
    "affect_bosses"      "true" // true = allow other bosses as targets; false = exclude other bosses
    "replace"            "false" // true = replace this effect type; false = skip if this type is active. Other types stack
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Team Autoheal: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    "settings" // Effect-specific options; omitted keys use embedded defaults
    {
        // range <float>: Range of the healing radius.
        "range" "350"
        // rate <float>: Rate of regen.
        "rate" "0.1"
        // health <integer>: Health gained each regen tick.
        "health" "2"
    }
    "plugin_name"        "ffs_rtd_ability"
}
```
