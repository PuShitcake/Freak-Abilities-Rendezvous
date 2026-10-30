/**
 * FF2 Rewrite: RTD abilities (68 effects).
 * RTD effect code: Copyright (C) 2023-2024 Filip Tomaszewski.
 * This adapter and the included RTD code are distributed under GPL-3.0-or-later.
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

/* BEGIN RTD CONFIG EXAMPLES
 * Configuration examples for all 68 effects:
 * Different effect types run together on the same player automatically.
 * replace applies only to repeated casts of the same effect type, including __suffix names.
 * Simultaneous HUD messages are combined; the first visible effect in this list supplies position/color.
 * When effects change the same property, the latest active value wins; immobilization blocks flight.

// 0: Toxic — timed
// Hurts enemy players in the specified radius.
// Player damages enemies in specified radius, interval and damage.
// RTD class filter: 0; weapon filter: 0
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

// 1: Flying — timed
// Grants noclip or gravity-less flying.
// Turns on noclip or flying on the player. Flying means noclip controls but without noclipping through solid objects.
// RTD class filter: 0; weapon filter: 0
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

// 2: Infinite Ammo — timed
// Grants infinite ammo.
// Gives the player infinite ammo.
// RTD class filter: 0; weapon filter: 0
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

// 3: Scary Bullets — timed
// Grants ''scary bullets'' which stun victims for a brief moment.
// Player's attacks stun victims for specified amount of seconds. Default required damage to trigger the effect is 5, this is mostly to make bleed or afterburn less overpowered.
// RTD class filter: 0; weapon filter: 0
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

// 4: Erecting a Sentry Here! — timed
// Spawns a Sentry Gun upon a voice command.
// Player can spawn a Sentry Gun upon a voice command.
// RTD class filter: 0; weapon filter: 0
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

// 5: Homing Projectiles — timed
// Grants homing projectiles.
// Player's rockets, flares, arrows, bolts and energy balls are locking onto enemies.
// RTD class filter: 0; weapon filter: rocketl, particle_c, flaregun, crossbow, compound
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

// 6: Explode — timed
// Binds to a bomb which explodes once the perk ends, unless destroyed.
// Binds player to a bomb which explodes them once the perk ends. The bomb can be destroyed to free the victim, potentially with the help of other players.
// RTD class filter: 0; weapon filter: 0
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

// 7: Too Slow — timed
// Slows down movement.
// Multiplies player's movement speed by the specified value.
// RTD class filter: 0; weapon filter: 0
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

// 8: Frozen — timed
// Freezes player, they are unable to move or attack.
// Freezes the player, leaving an ice statue. They are unable to move or attack.
// RTD class filter: 0; weapon filter: 0
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

// 9: Allahu Akbar — timed
// Set a timebomb on a player.
// Turns player's head into a ticking bomb and explodes when the perk ends. The explosion deals damage in specified radius dealing specified amount of damage. Additionally, with the bomb covering the head, the player is extra resistant and cannot die to headshots.
// RTD class filter: 0; weapon filter: 0
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

// 10: Ignition — instant
// Sets player on fire.
// Sets the player on fire.
// RTD class filter: 0; weapon filter: 0
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

// 11: Low Health — instant
// Sets player's health to low.
// Sets the player's health to the specified amount.
// RTD class filter: 0; weapon filter: 0
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

// 12: GET HIGH — timed
// Causes the screen to flicker different colors.
// Drugs the player coloring their screen and punching the view periodically.
// RTD class filter: 0; weapon filter: 0
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

// 13: Blind — timed
// Turns the screen dark.
// Blinds the player's screen by the specified alpha. Their other senses is heightened indicated by visual aid that follow enemy players on the screen. Additionally, each time an attack is landed, the player is briefly unblinded.
// RTD class filter: 0; weapon filter: 0
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

// 14: Strip to Melee — timed
// Packs every non-melee weapons into cases and flings them ahead.
// Removes the player's non-melee weapons and packs them into cases which are flung ahead in a chaotic fashion. Cases can be destroyed by teammates or the player themselves, which effectively retrieves the weapon that was in the particular case.
// RTD class filter: 0; weapon filter: 0
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

// 15: Beacon — timed
// Notifies others of player's position every beep.
// Fires a circular beam with a sound from the player's location every interval, with a specified range.
// RTD class filter: 0; weapon filter: 0
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

// 16: Forced Taunt — timed
// Forces player to taunt.
// Forces the player to taunt with held item every interval.
// RTD class filter: 0; weapon filter: 0
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

// 17: Monochromia — timed
// Makes player's vision black and white.
// Makes player's vision black and white.
// RTD class filter: 0; weapon filter: 0
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

// 18: Earthquake — timed
// Shakes the screen.
// Shakes the player's screen with specified amplitude and frequency.
// RTD class filter: 0; weapon filter: 0
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

// 19: Funny Feeling — timed
// Messes up player's FOV.
// Sets the player's field of view to the specified value.
// RTD class filter: 0; weapon filter: 0
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

// 20: Bad Sauce — timed
// Causes Milked, Jarated and Bleed effect on the player.
// Applies Milked, Jarated and Bleed effects to the roller for specified times.
// RTD class filter: 0; weapon filter: 0
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

// 21: Pootispencerere! — timed
// Spawns a Dispenser upon a voice command.
// Player can spawn a Dispenser upon a voice command.
// RTD class filter: 0; weapon filter: 0
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

// 22: Infinite Double Jump — timed
// As Scout, can double jump infinitely.
// The player can double jump infinitely.
// RTD class filter: 1; weapon filter: 0
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

// 23: Powerful Hits — timed
// Multiplies damage dealt.
// Multiplies damage dealt to enemy players and buildings by the specified amount.
// RTD class filter: 0; weapon filter: 0
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

// 24: Big Ass Head — timed
// Multiplies player's head size.
// Multiplies the player's head size by the specified scale.
// RTD class filter: 0; weapon filter: 0
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

// 25: Tiny Desk Ability — timed
// Makes player tiny and fast.
// Multiplies player's overall size by the specified scale. Additionally, applies a speed boost.
// RTD class filter: 0; weapon filter: 0
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

// 26: Hanabi dayo~ gomene~ — instant
// Launches player high in the air and ignites them.
// Launches the player high in the air with a colorful trail and explodes them after half a second with scenic fireworks. They are set on fire in the process.
// RTD class filter: 0; weapon filter: 0
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

// 27: Deadly Voice — timed
// Makes player's voice deal damage.
// Makes the player's voice commands deal damage with specified minimal rate, radius and damage.
// RTD class filter: 0; weapon filter: 0
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

// 28: Eye for an Eye — timed
// All the damage dealt to others will also be dealt to the player.
// Mirrors the player's dealt damage. Hurts them with the same amount of damage they deal to others.
// RTD class filter: 0; weapon filter: 0
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

// 29: Weakened — timed
// Incoming damage is more powerful.
// Multiplies incoming damage by the specified amount.
// RTD class filter: 0; weapon filter: 0
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

// 30: Its Punishment Time! — instant
// Smashes player with the necro hammer.
// Attempts to smash the player with the Necro Hammer from Halloween Doomsday.
// RTD class filter: 0; weapon filter: 0
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

// 31: Extra Ammo — instant
// Multiplies player's clip and reserve ammo.
// Multiplies the player's clip and reserve ammunition by the specified amount.
// RTD class filter: 0; weapon filter: 0
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

// 32: Suffocation — timed
// Player can no longer breathe in air.
// The player starts suffocating after the specified amount of seconds, being dealt damage at specified rate.
// RTD class filter: 0; weapon filter: 0
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

// 33: Fast Hands — timed
// Increases attack and reload speed.
// Increases attack and reload speed for the player.
// RTD class filter: 0; weapon filter: 0
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

// 34: Outline — timed
// Outlines player, making them visible through walls.
// Outlines the player, making them visible through walls for everybody.
// RTD class filter: 0; weapon filter: 0
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

// 35: Team Criticals — timed
// Grants crits to player and nearby teammates.
// Grants the player and their nearby teammates in the specified range Criticals.
// RTD class filter: 0; weapon filter: 0
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

// 36: Allahu Akbar But On Fire — timed
// Timed bomb which sets enemies on fire upon exploding.
// Turns the player's head into a ticking bomb and explodes when the perk ends. The explosion sets the player and enemies in specified radius on fire. Additionally, with the bomb covering the head, the player is extra resistant and cannot die to headshots.
// RTD class filter: 0; weapon filter: 0
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

// 37: Fire Breath — timed
// Shoots fireballs upon a voice command.
// The player shoots Halloween fireballs upon voice commands with specified rate of fire.
// RTD class filter: 0; weapon filter: 0
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

// 38: Strong Recoil — timed
// Firing weapons shakes the screen.
// Makes it difficult for the player to aim while firing a weapon due to it constantly shaking.
// RTD class filter: 0; weapon filter: 0
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

// 39: Cursed — timed
// Inverts movement.
// Inverts the player's movement.
// RTD class filter: 0; weapon filter: 0
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

// 40: Extra Throwables — instant
// Gives extra throwables (Sandman, Sandviches, etc...).
// Gives the player the specified amount of Sandman balls, Wrap Assassin baubles, Flying Guillotines, Jarates or Sandviches.
// RTD class filter: 0; weapon filter: bat_wood, bat_gift, cleaver, jar, lunchbox
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

// 41: Explosive Arrows — timed
// Makes arrows and bolts explode on impact.
// Makes the player's arrows and crossbow bolts explode upon impact. Explosions deal specified amount of damage, with radius and force.
// RTD class filter: ; weapon filter: crossbow, compound_bow
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

// 42: Fatass — timed
// Makes it difficult to go up inclines.
// Makes it difficult for the player to go up inclines such as stairs or hills.
// RTD class filter: 0; weapon filter: 0
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

// 43: Spring Shoes — timed
// Uncontrollable jumping.
// Causes the player to uncontrollably jump in the air. Blocks manual jumping including double jump.
// RTD class filter: 0; weapon filter: 0
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

// 44: Fake Lag — timed
// Simulates the best online experience.
// Artificially lags the player by teleporting them back every now and then.
// RTD class filter: 0; weapon filter: 0
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

// 45: Drug Bullets — timed
// Grants ''drug bullets'' which color victims' vision.
// The player's ranged damage additionally drugs the enemy by coloring their screen and punching their view.
// RTD class filter: 0; weapon filter: 0
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

// 46: Long Meleeeeeeeeeeee — timed
// Extends melee range.
// Extends the player's melee range by the specified multiplier.
// RTD class filter: 0; weapon filter: 0
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

// 47: Hat Throw — timed
// Throw hats to damage enemies.
// The player can toss a Ghastly Gibus upon a voice command with specified rate of fire. The hat flies straight forward and damages enemies if hit.
// RTD class filter: 0; weapon filter: 0
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

// 48: Bombardino Crocodillo — timed
// Summon an alligator upon a voice command.
// Using voice commands, the player can blow a whistle to summon an alligator underneath themselves within the specified delay. The summon deals damage to the user and enemies if in the way.
// RTD class filter: 0; weapon filter: 0
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

// 49: Sickness — timed
// Violent coughing which deals damage.
// Every random delay the player coughs twice, dealing random damage to themselves between the specified minimal and maximal values.
// RTD class filter: 0; weapon filter: 0
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

// 50: SkillIssue — instant
// Roll is wasted.
// Wastes a roll. Does pretty much nothing.
// RTD class filter: 0; weapon filter: 0
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

// 51: Drunk Walk — timed
// Difficulty walking straight, unless you're used to it.
// When walking, the player's camera gets randomly shifted sideways. Walking speed randomly varies each step, based on the predefined values.
// RTD class filter: 0; weapon filter: 0
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

// 52: Hell's Reach — timed
// Gradually slow down then deal damage periodically.
// Gradually slows down the player's movement speed. When almost fully stopped, player gets damaged by an explosion and the effect resets.
// RTD class filter: 0; weapon filter: 0
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

// 53: Cursed Projectiles — timed
// Projectiles turn against player.
// Upon firing a projectile, if they haven't hit a target in less than the specified time, they get turned against the player.
// RTD class filter: 0; weapon filter: rocketl, particle_c, flaregun, crossbow, compound
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

// 54: Vampire — timed
// Makes player lose health unless they attack others.
// The player rapidly looses health with each heartbeat. When dealing damage to the enemy, the effect briefly pauses and resumes after the specified time.
// RTD class filter: 0; weapon filter: 0
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

// 55: Bat Swarm — timed
// Surround yourself with deadly bats at the cost of movement speed.
// The effect can be freely activated and deactivated. When active, the player is slowed down and invulnerable with friendly bat spells constantly spawning around them.
// RTD class filter: 0; weapon filter: 0
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

// 56: Pumpkin Trail — timed
// Direct pumpkin attacks at foes.
// Upon a voice command, a trail of friendly pumpkins gets gradually spawned in front of the player. The trail does not extend beyond walls and pumpkins detonate automatically.
// RTD class filter: 0; weapon filter: 0
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

// 57: A Call Beyond — timed
// Summon homing projectiles from beyond.
// The player's voice commands summon a cluster of semi-homing projectiles of another world.
// RTD class filter: 0; weapon filter: 0
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

// 58: Kru Thai Strikes — timed
// Get struck by lightning and electrocuted.
// The player gets struck by lightning which damages them and puts them in an electrocuted state. During this state, they are randomly electrocuted at specific intervals for a little damage until the perk ends.
// RTD class filter: 0; weapon filter: 0
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

// 59: Overheal Bonus — timed
// Boosts MediGun overheal.
// Boost overheal capacity of the player's MediGun.
// RTD class filter: 0; weapon filter: tf_weapon_medigun
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

// 60: Sunlight Spear — timed
// Hurl a spear of lightning, dealing moderate damage.
// Upon a voice command, the player hurls a spear of lightning at foes or friends. The spear deals moderate damage and slowdown, or speed boosting teammates.
// RTD class filter: 0; weapon filter: 0
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

// 61: Elden Stars — timed
// Conjure a stream of shooting stars that assail the area.
// Upon a voice command, the player can conjure a stream of shooting stars that assail the area. The main spell travels slowly and spews out many small, short-lived homing projectiles that deal little damage.
// RTD class filter: 0; weapon filter: 0
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

// 62: Frog — timed
// Can move only by jumping.
// The player can move in any direction, but this movement is jumping.
// RTD class filter: 0; weapon filter: 0
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

// 63: Paranoia — timed
// Spy is gonna get you! Or will he?
// The player starts hearing Spy voices and cloak/disguise noises all around them. Briefly, fake Spy disguise smoke can be seen moving about. Effects are hearable/visible only to the player with the perk.
// RTD class filter: 0; weapon filter: 0
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

// 64: Heavy Rockets — timed
// Your rockets fall to the ground, as they should.
// Rockets from the player's Rocket Launchers are affected by gravity and start falling to the ground.
// RTD class filter: 0; weapon filter: RocketLauncher, tf_weapon_rocketlauncher_air
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

// 65: Weapon Mixup — timed
// Mixes up attack patterns so even you won't know what's coming.
// The player instantly switches to the next weapon after firing a shot with the current one. The switch also happens automatically.
// RTD class filter: 1, 2, 3, 4, 6, 7, 8, 9; weapon filter: 0
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

// 66: Autoheal — timed
// Rapid self healing.
// The player gets rapid self healing.
// RTD class filter: 0; weapon filter: 0
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

// 67: Team Autoheal — timed
// Healing for self and nearby teammates.
// The player gets healing for self and nearby teammates.
// RTD class filter: 0; weapon filter: 0
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

END RTD CONFIG EXAMPLES */

#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <tf2_stocks>
#include <tf2attributes>
#include <cfgmap>
#include <ff2r>

#define RTD_PLUGIN_VERSION "1.2.5"

// The original effect callbacks only need this enum from rtd2.inc.
// Keep its original numeric order without declaring any RTD plugin dependency.
enum RTDRemoveReason
{
    RTDRemove_PluginUnload = 0,
    RTDRemove_Death,
    RTDRemove_ClassChange,
    RTDRemove_WearOff,
    RTDRemove_Disconnect,
    RTDRemove_Custom,
    RTDRemove_NoPrint
}

public Plugin myinfo =
{
    name = "FF2 Rewrite: RTD Abilities",
    author = "Codex, Phil25 (original RTD effects), pu_shitcake",
    description = "68 configurable, standalone FF2 Rewrite RTD abilities",
    version = RTD_PLUGIN_VERSION
};

// The original implementations share these private engine types and helpers.
#define RTD_EFFECT_COUNT 68
int g_ContextEffect;
Rollers g_AllRollers[RTD_EFFECT_COUNT];
#define g_hRollers g_AllRollers[g_ContextEffect]
#define Cache g_AllCache[g_ContextEffect]
#define Events g_AllEvents[g_ContextEffect]
Perk g_ActivePerk;
ConfigData g_ActiveSettings;
bool g_ActiveInstant;
#include "rtd/macros.sp"
#include "rtd/storage/precached.sp"
// Private cache storage: each effect owns its entities and timer slots.
enum struct ClientFlags
{
	int iVals[4]; // SM ints are 32 bit, 4 are needed to hold 100 players

	void Set(const int iIndex)
	{
		int iOverflows = iIndex / 32;
		this.iVals[iOverflows] |= 1 << (iIndex - 32 * iOverflows);
	}

	void Unset(const int iIndex)
	{
		int iOverflows = iIndex / 32;
		this.iVals[iOverflows] &= ~(1 << (iIndex - 32 * iOverflows));
	}

	void Bool(const int iIndex, const bool bSet)
	{
		if (bSet)
		{
			this.Set(iIndex);
		}
		else
		{
			this.Unset(iIndex);
		}
	}

	bool Test(const int iIndex)
	{
		int iOverflows = iIndex / 32;
		return view_as<bool>(this.iVals[iOverflows] & (1 << (iIndex - 32 * iOverflows)));
	}

	void Reset()
	{
		this.iVals[0] = 0;
		this.iVals[1] = 0;
		this.iVals[2] = 0;
		this.iVals[3] = 0;
	}
}

methodmap Entity
{
	public Entity(const int iIndex)
	{
		return view_as<Entity>(EntIndexToEntRef(iIndex));
	}

	public bool IsValid()
	{
		return this.Index > MaxClients;
	}

	public void Kill()
	{
		if (this.IsValid())
			AcceptEntityInput(this.Index, "Kill");
	}

	property int Index
	{
		public get()
		{
			return EntRefToEntIndex(view_as<int>(this));
		}
	}

	property int Reference
	{
		public get()
		{
			return view_as<int>(this);
		}
	}
}

enum EntSlot
{
	EntSlot_1,
	EntSlot_2,
	EntSlot_3,
	EntSlot_SIZE,
}

enum EntCleanup
{
	EntCleanup_Auto,
	EntCleanup_None,
}

typedef PerkRepeater = function Action(const int client);
typedef PerkDelay = function void(const int client);
typedef PlayerHurt = function void(const int client, const int iAttacker);

enum struct PlayerCache
{
	int _ClientIndex;
	int _EffectIndex;
	int Int[4];
	float Float[4];
	Entity _Ent[EntSlot_SIZE];
	EntCleanup _EntCleanup[EntSlot_SIZE];
	ClientFlags Flags;

	DataPack _TimerData[2];

	void Init(const int client)
	{
		this._ClientIndex = client;
		this._EffectIndex = g_ContextEffect;
	}

	Entity GetEnt(const EntSlot eSlot)
	{
		return this._Ent[eSlot];
	}

	void SetEnt(const EntSlot eSlot, const int iEntIndex, const EntCleanup eCleanup=EntCleanup_Auto)
	{
		this.GetEnt(eSlot).Kill();
		this._Ent[eSlot] = Entity(iEntIndex);
		this._EntCleanup[eSlot] = eCleanup;
	}

	void KillEnt(const EntSlot eSlot)
	{
		this.GetEnt(eSlot).Kill();
	}

	void LeakEnt(const EntSlot eSlot)
	{
		this._Ent[eSlot] = Entity(0);
	}

	void Repeat(const float fInterval, PerkRepeater hFunc)
	{
		int iDataIndex = this._PreparePerkTimerDataPack();
		this._TimerData[iDataIndex].WriteFunction(hFunc);

		this._CreatePerkTimer(fInterval, Timer_PerkTimer, iDataIndex, TIMER_REPEAT);
	}

	void Delay(const float fDelay, PerkDelay hFunc)
	{
		int iDataIndex = this._PreparePerkTimerDataPack();
		this._TimerData[iDataIndex].WriteFunction(hFunc);

		this._CreatePerkTimer(fDelay, Timer_PerkDelay, iDataIndex);
	}

	int _PreparePerkTimerDataPack()
	{
		int i = this._FindTimerDataIndex();

		this._TimerData[i] = new DataPack();
		this._TimerData[i].WriteCell(i);
		this._TimerData[i].WriteCell(this._ClientIndex);
        this._TimerData[i].WriteCell(GetClientUserId(this._ClientIndex));
        this._TimerData[i].WriteCell(this._EffectIndex);

		return i;
	}

	void _CreatePerkTimer(const float fTime, Timer hFunc, const int iDataIndex, const int iFlags=0)
	{
		CreateTimer(fTime, hFunc, this._TimerData[iDataIndex], iFlags | TIMER_DATA_HNDL_CLOSE | TIMER_FLAG_NO_MAPCHANGE);

#if defined DEBUG
		char sCaller[64];
		GetCallerName(sCaller, sizeof(sCaller), 2);
		LogError("[%s] Created timer for %N<%d>: %x", sCaller, this._ClientIndex, this._ClientIndex, this._TimerData[iDataIndex]);
#endif
	}

	void _NullifyTimerData(const int iIndex)
	{
		// If already nullified the timer was either not used in the first place, or somehow was
		// nullified before its corresponding perk ended but after having been marked for stopping.
		if (this._TimerData[iIndex] == null)
			return;

		this._TimerData[iIndex].Reset();
		this._TimerData[iIndex].WriteCell(-1);

		// Purposefully leak the timer and its DataPack handles. Deleting a timer manually here
		// sometimes errors out as if it were destroyed inside the callback, which is illegal. This
		// way, the first cell of the DataPack will instruct the timer to kill itself lazily.
		this._TimerData[iIndex] = null;
	}

	int _FindTimerDataIndex()
	{
		for (int i = 0; i < sizeof(this._TimerData); ++i)
			if (this._TimerData[i] == null)
				return i;

		// This should never happen
		LogError("Internal error: could not find available timer index");
		return -1;
	}

	void Cleanup()
	{
		switch (this._EntCleanup[EntSlot_1])
		{
			case EntCleanup_Auto: this.KillEnt(EntSlot_1);
			case EntCleanup_None: this.LeakEnt(EntSlot_1);
		}

		switch (this._EntCleanup[EntSlot_2])
		{
			case EntCleanup_Auto: this.KillEnt(EntSlot_2);
			case EntCleanup_None: this.LeakEnt(EntSlot_2);
		}

		switch (this._EntCleanup[EntSlot_3])
		{
			case EntCleanup_Auto: this.KillEnt(EntSlot_3);
			case EntCleanup_None: this.LeakEnt(EntSlot_3);
		}

#if defined DEBUG
		LogError("Cleaning up timers for %N<%d>: %x, %x", this._ClientIndex, this._ClientIndex, this._TimerData[0], this._TimerData[1]);
#endif

		this._NullifyTimerData(0);
		this._NullifyTimerData(1);
	}
}

enum CritBoost
{
	CritBoost_Mini = 1,
	CritBoost_Full = 2,
}

enum struct SharedCache
{
	int MaxHealth;
	TFClassType ClassForPerk;
	int _CritBoosted;
    int _MiniBoosts;
    int _FullBoosts;
    float _SmiteCritUntil;
    bool _TinySpeedBoost;
    float _BatSpeedBuffUntil;
	float TempPowerPlayTimePoint;

	float MaxHealthFloat()
	{
		return float(this.MaxHealth);
	}

	bool IsCritBoosted(const int client)
	{
		return this._CritBoosted > 0;
	}

    void AddCritBoost(const int client, const CritBoost boost)
    {
        if (boost == CritBoost_Mini) this._MiniBoosts++;
        else this._FullBoosts++;
        this.UpdateCritBoost(client);
    }

    void RemoveCritBoost(const int client, const CritBoost boost)
    {
        if (boost == CritBoost_Mini && this._MiniBoosts > 0) this._MiniBoosts--;
        else if (boost == CritBoost_Full && this._FullBoosts > 0) this._FullBoosts--;
        this.UpdateCritBoost(client);
    }

    void UpdateSpeedBoost(const int client)
    {
        if (this._TinySpeedBoost)
            TF2_AddCondition(client, TFCond_SpeedBuffAlly);
        else
        {
            TF2_RemoveCondition(client, TFCond_SpeedBuffAlly);
            float remaining = this._BatSpeedBuffUntil - GetGameTime();
            if (remaining > 0.0)
                TF2_AddCondition(client, TFCond_SpeedBuffAlly, remaining);
        }
    }

    void UpdateCritBoost(const int client)
    {
        this._CritBoosted = this._MiniBoosts + 2 * this._FullBoosts;
        // Add the surviving boost before removing the other condition; nested
        // condition forwards must already see a consistent counter.
        if (this._FullBoosts > 0)
        {
            TF2_AddCondition(client, TFCond_CritOnFirstBlood);
            TF2_RemoveCondition(client, TFCond_Buffed);
        }
        else if (this._SmiteCritUntil > GetGameTime())
        {
            TF2_AddCondition(client, TFCond_CritOnFirstBlood, this._SmiteCritUntil - GetGameTime());
        }
        else if (this._MiniBoosts > 0)
        {
            TF2_AddCondition(client, TFCond_Buffed);
            TF2_RemoveCondition(client, TFCond_CritOnFirstBlood);
        }
        else
        {
            TF2_RemoveCondition(client, TFCond_CritOnFirstBlood);
            TF2_RemoveCondition(client, TFCond_Buffed);
        }
    }
}

PlayerCache g_AllCache[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
SharedCache Shared[MAXPLAYERS + 1];

// should not be necessary but acts as extra failsafe in case an error happens elsewhere
bool ValidatePerkTimerClient(const int client)
{
	if (IsClientInGame(client) && IsPlayerAlive(client))
		return true;

	LogError("Internal error: client \"%L\" is not in game or not alive", client);
	return false;
}

public Action Timer_PerkTimer(Handle hTimer, DataPack hData)
{
	hData.Reset();
	int iIndex = hData.ReadCell();

	// timer marked for deletion
	if (iIndex == -1)
		return Plugin_Stop;

	int client = hData.ReadCell();
	int userid = hData.ReadCell();
    int effect = hData.ReadCell();
    if (GetClientOfUserId(userid) != client || !ValidatePerkTimerClient(client))
	{
		if (g_AllCache[effect][client]._TimerData[iIndex] == hData)
            g_AllCache[effect][client]._NullifyTimerData(iIndex);
		return Plugin_Stop;
	}

	int previous = g_ContextEffect;
    g_ContextEffect = effect;
    Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
	Call_PushCell(client);

	int iResult;
	Call_Finish(iResult);
    g_ContextEffect = previous;

	switch (view_as<Action>(iResult))
	{
		case Plugin_Stop, Plugin_Handled:
			if (g_AllCache[effect][client]._TimerData[iIndex] == hData)
            g_AllCache[effect][client]._NullifyTimerData(iIndex);
	}

	return view_as<Action>(iResult);
}

public Action Timer_PerkDelay(Handle hTimer, DataPack hData)
{
	hData.Reset();
	int iIndex = hData.ReadCell();

	// timer marked for deletion
	if (iIndex == -1)
		return Plugin_Stop;

	int client = hData.ReadCell();
	int userid = hData.ReadCell();
    int effect = hData.ReadCell();
    if (GetClientOfUserId(userid) != client || !ValidatePerkTimerClient(client))
	{
		if (g_AllCache[effect][client]._TimerData[iIndex] == hData)
            g_AllCache[effect][client]._NullifyTimerData(iIndex);
		return Plugin_Stop;
	}

	int previous = g_ContextEffect;
    g_ContextEffect = effect;
    Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
	Call_PushCell(client);
	Call_Finish();
    g_ContextEffect = previous;

	if (g_AllCache[effect][client]._TimerData[iIndex] == hData)
            g_AllCache[effect][client]._NullifyTimerData(iIndex);
	return Plugin_Stop;
}

typedef EREntitySpawned = function void(const int client, const int iEntity);
typedef EREntityClassnameFilter = function bool(const char[] sClassname);
typedef EREntityOwnerRetriever = function int(const int iEntity);
typedef ERConditionChange = function void(const int client, const TFCond eCondition);
typedef ERPlayerAttacked = function void(const int client, const int iVictim, const int iDamage, const int iRemainingHealth);
typedef ERPlayer = function void(const int client);
typedef ERAttackCritCheck = function bool(const int client, const int iWeapon);
typedef ERPlayerRunCmd = function bool(const int client, int& iButtons, float fVel[3], float fAng[3]);
typedef ERUberchargeDeployed = function void(const int client, const int iTarget);
typedef ERSound = function bool(const int client, const char[] sSound);

public int Retriever_OwnerEntity(const int iEnt)
{
	return GetEntPropEnt(iEnt, Prop_Send, "m_hOwnerEntity");
}

public int Retriever_AccountId(const int iEnt)
{
	return AccountIDToClient(GetEntProp(iEnt, Prop_Send, "m_iAccountID"));
}

public bool Classname_DroppedWeapon(const char[] sClassname)
{
	return StrEqual(sClassname, "tf_dropped_weapon");
}

enum SubscriptionType
{
	SubscriptionType_Roller,
	SubscriptionType_Any,
}

enum SubscriptionTypePerk
{
	SubscriptionTypeRoller_Current, // clients who are using the perk
	SubscriptionTypeRoller_Latest, // clients either are using or is the last perk they used
}

enum struct EventRegistrar
{
	ArrayList _OnEntitySpawned;
	ArrayList _OnConditionAdded;
	ArrayList _OnConditionRemoved;
	ArrayList _OnPlayerAttacked;
	ArrayList _OnPlayerDied;
	ArrayList _OnPlayerDisconnected;
	ArrayList _OnAttackCritCheck;
	ArrayList _OnPlayerRunCmd;
	ArrayList _OnUberchargeDeployed;
	ArrayList _OnResupply;
	ArrayList _OnVoice;
	ArrayList _OnSound;

	ArrayList _OnEntitySpawnedSubscribers;

	void Init()
	{
		this._OnEntitySpawned = new ArrayList();
		this._OnConditionAdded = new ArrayList();
		this._OnConditionRemoved = new ArrayList();
		this._OnPlayerAttacked = new ArrayList();
		this._OnPlayerDied = new ArrayList();
		this._OnPlayerDisconnected = new ArrayList();
		this._OnAttackCritCheck = new ArrayList();
		this._OnPlayerRunCmd = new ArrayList();
		this._OnUberchargeDeployed = new ArrayList();
		this._OnResupply = new ArrayList();
		this._OnVoice = new ArrayList();
		this._OnSound = new ArrayList();

		this._OnEntitySpawnedSubscribers = new ArrayList();
	}

	void Cleanup()
	{
		this._CleanupCallbackArray(this._OnEntitySpawned);
		this._CleanupCallbackArray(this._OnConditionAdded);
		this._CleanupCallbackArray(this._OnConditionRemoved);
		this._CleanupCallbackArray(this._OnPlayerAttacked);
		this._CleanupCallbackArray(this._OnPlayerDied);
		this._CleanupCallbackArray(this._OnPlayerDisconnected);
		this._CleanupCallbackArray(this._OnAttackCritCheck);
		this._CleanupCallbackArray(this._OnPlayerRunCmd);
		this._CleanupCallbackArray(this._OnUberchargeDeployed);
		this._CleanupCallbackArray(this._OnResupply);
		this._CleanupCallbackArray(this._OnVoice);
		this._CleanupCallbackArray(this._OnSound);

		delete this._OnEntitySpawnedSubscribers;
	}

	void _CleanupCallbackArray(ArrayList& list)
	{
		for (int i = 0; i < list.Length; ++i)
			CloseHandle(view_as<DataPack>(list.Get(i)));

		delete list;
	}

	void OnEntitySpawned(const Perk perk, EREntitySpawned hSpawned, EREntityClassnameFilter hFilter, EREntityOwnerRetriever hOwner)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hFilter);
		hData.WriteFunction(hOwner);
		hData.WriteCell(perk);
		hData.WriteFunction(hSpawned);

		this._OnEntitySpawnedSubscribers.Push(perk);
		this._OnEntitySpawned.Push(hData);
	}

	bool SubscribesToEntitySpawned(const Perk perk)
	{
		for (int i = 0; i < this._OnEntitySpawnedSubscribers.Length; ++i)
			if (this._OnEntitySpawnedSubscribers.Get(i) == perk)
				return true;

		return false;
	}

	bool ClassnameHasSubscribers(const char[] sClassname)
	{
		for (int i = 0; i < this._OnEntitySpawned.Length; ++i)
		{
			DataPack hData = this._OnEntitySpawned.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushString(sClassname);

			bool bFilter;
			Call_Finish(bFilter);

			if (bFilter)
				return true;
		}

		return false;
	}

	void EntitySpawned(const int iEntity)
	{
		char sClassname[64];
		GetEntityClassname(iEntity, sClassname, sizeof(sClassname));

		for (int i = 0; i < this._OnEntitySpawned.Length; ++i)
		{
			DataPack hData = this._OnEntitySpawned.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushString(sClassname);

			bool bFilter;
			Call_Finish(bFilter);

			if (!bFilter)
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(iEntity);

			int client;
			Call_Finish(client);

			if (!(1 <= client <= MaxClients && IsClientInGame(client)))
				continue;

			// EntitySpawned registered only for clients in a perk, but this is triggered after the
			// perk ends because of the 0.1 delay. The recent check ensures we get all the entities.
			if (!IsRecentPerk(client, hData.ReadCell()))
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(client);
			Call_PushCell(iEntity);
			Call_Finish();
		}
	}

	void OnConditionAdded(const Perk perk, ERConditionChange hCallback, const SubscriptionType eSubType=SubscriptionType_Roller)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hCallback);
		hData.WriteCell(eSubType);
		hData.WriteCell(perk);

		this._OnConditionAdded.Push(hData);
	}

	void ConditionAdded(const int client, const TFCond eCondition)
	{
		Perk clientPerk = GetDispatchPerk(client);

		for (int i = 0; i < this._OnConditionAdded.Length; ++i)
		{
			DataPack hData = this._OnConditionAdded.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());

			if (view_as<SubscriptionType>(hData.ReadCell()) == SubscriptionType_Roller)
			{
				if (clientPerk != hData.ReadCell())
				{
					Call_Cancel();
					continue;
				}
			}

			Call_PushCell(client);
			Call_PushCell(eCondition);
			Call_Finish();
		}
	}

	void OnConditionRemoved(const Perk perk, ERConditionChange hCallback, const SubscriptionType eSubType=SubscriptionType_Roller)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hCallback);
		hData.WriteCell(eSubType);
		hData.WriteCell(perk);

		this._OnConditionRemoved.Push(hData);
	}

	void ConditionRemoved(const int client, const TFCond eCondition)
	{
		Perk clientPerk = GetDispatchPerk(client);

		for (int i = 0; i < this._OnConditionRemoved.Length; ++i)
		{
			DataPack hData = this._OnConditionRemoved.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());

			if (view_as<SubscriptionType>(hData.ReadCell()) == SubscriptionType_Roller)
			{
				if (clientPerk != hData.ReadCell())
				{
					Call_Cancel();
					continue;
				}
			}

			Call_PushCell(client);
			Call_PushCell(eCondition);
			Call_Finish();
		}
	}

	void OnPlayerAttacked(const Perk perk, ERPlayerAttacked hCallback)
	{
		DataPack hData = new DataPack();
		hData.WriteCell(perk);
		hData.WriteFunction(hCallback);

		this._OnPlayerAttacked.Push(hData);
	}

	void PlayerAttacked(const int client, const int iVictim, const int iDamage, const int iRemainingHealth)
	{
		Perk perk = GetDispatchPerk(client);
		if (perk == null)
			return;

		for (int i = 0; i < this._OnPlayerAttacked.Length; ++i)
		{
			DataPack hData = this._OnPlayerAttacked.Get(i);
			hData.Reset();

			if (perk != hData.ReadCell())
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(client);
			Call_PushCell(iVictim);
			Call_PushCell(iDamage);
			Call_PushCell(iRemainingHealth);
			Call_Finish();
		}
	}

	void OnPlayerDied(const Perk perk, ERPlayer hCallback, const SubscriptionType eSubType=SubscriptionType_Roller)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hCallback);
		hData.WriteCell(eSubType);
		hData.WriteCell(perk);

		this._OnPlayerDied.Push(hData);
	}

	void PlayerDied(const int client)
	{
		Perk clientPerk = GetDispatchPerk(client);

		for (int i = 0; i < this._OnPlayerDied.Length; ++i)
		{
			DataPack hData = this._OnPlayerDied.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());

			if (view_as<SubscriptionType>(hData.ReadCell()) == SubscriptionType_Roller)
			{
				if (clientPerk != hData.ReadCell())
				{
					Call_Cancel();
					continue;
				}
			}

			Call_PushCell(client);
			Call_Finish();
		}
	}

	void OnPlayerDisconnected(const Perk perk, ERPlayer hCallback, const SubscriptionType eSubType=SubscriptionType_Roller)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hCallback);
		hData.WriteCell(eSubType);
		hData.WriteCell(perk);

		this._OnPlayerDisconnected.Push(hData);
	}

	void PlayerDisconnected(const int client)
	{
		Perk clientPerk = GetDispatchPerk(client);

		for (int i = 0; i < this._OnPlayerDisconnected.Length; ++i)
		{
			DataPack hData = this._OnPlayerDisconnected.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());

			if (view_as<SubscriptionType>(hData.ReadCell()) == SubscriptionType_Roller)
			{
				if (clientPerk != hData.ReadCell())
				{
					Call_Cancel();
					continue;
				}
			}

			Call_PushCell(client);
			Call_Finish();
		}
	}

	void OnAttackCritCheck(const Perk perk, ERAttackCritCheck hCallback, const SubscriptionType eSubType=SubscriptionType_Roller)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hCallback);
		hData.WriteCell(eSubType);
		hData.WriteCell(perk);

		this._OnAttackCritCheck.Push(hData);
	}

	bool AttackCritCheck(const int client, const int iWeapon)
	{
		Perk clientPerk = GetDispatchPerk(client);

		bool bShouldCrit = false;

		for (int i = 0; i < this._OnAttackCritCheck.Length; ++i)
		{
			DataPack hData = this._OnAttackCritCheck.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());

			if (view_as<SubscriptionType>(hData.ReadCell()) == SubscriptionType_Roller)
			{
				if (clientPerk != hData.ReadCell())
				{
					Call_Cancel();
					continue;
				}
			}

			Call_PushCell(client);
			Call_PushCell(iWeapon);

			bool bResult;
			Call_Finish(bResult);

			bShouldCrit |= bResult;
		}

		return bShouldCrit;
	}

	void OnPlayerRunCmd(const Perk perk, ERPlayerRunCmd hCallback)
	{
		DataPack hData = new DataPack();
		hData.WriteCell(perk);
		hData.WriteFunction(hCallback);

		this._OnPlayerRunCmd.Push(hData);
	}

	bool PlayerRunCmd(const int client, int& iButtons, float fVel[3], float fAng[3])
	{
		Perk perk = GetDispatchPerk(client);
		if (perk == null)
			return false;

		for (int i = 0; i < this._OnPlayerRunCmd.Length; ++i)
		{
			DataPack hData = this._OnPlayerRunCmd.Get(i);
			hData.Reset();

			if (perk != hData.ReadCell())
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(client);
			Call_PushCellRef(iButtons);
			Call_PushArrayEx(fVel, sizeof(fVel), SM_PARAM_COPYBACK);
			Call_PushArrayEx(fAng, sizeof(fVel), SM_PARAM_COPYBACK);

			bool bResult;
			Call_Finish(bResult);

			// We can return right away, `Events.OnPlayerRunCmd()` does not support subscribing to
			// non-roller players (it shouldn't, calls could get a bit too expensive), this is run
			// for a single player and this registrar contains only one effect type.
			if (bResult)
				return true;
		}

		return false;
	}

	void OnUberchargeDeployed(const Perk perk, ERUberchargeDeployed hCallback)
	{
		DataPack hData = new DataPack();
		hData.WriteCell(perk);
		hData.WriteFunction(hCallback);

		this._OnUberchargeDeployed.Push(hData);
	}

	void UberchargeDeployed(const int client, const int iTarget)
	{
		Perk perk = GetDispatchPerk(client);
		if (perk == null)
			return;

		for (int i = 0; i < this._OnUberchargeDeployed.Length; ++i)
		{
			DataPack hData = this._OnUberchargeDeployed.Get(i);
			hData.Reset();

			if (perk != hData.ReadCell())
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(client);
			Call_PushCell(iTarget);
			Call_Finish();
		}
	}

	void OnResupply(const Perk perk, ERPlayer hCallback, const SubscriptionType eSubType=SubscriptionType_Roller)
	{
		DataPack hData = new DataPack();
		hData.WriteFunction(hCallback);
		hData.WriteCell(eSubType);
		hData.WriteCell(perk);

		this._OnResupply.Push(hData);
	}

	void Resupply(const int client)
	{
		Perk clientPerk = GetDispatchPerk(client);

		for (int i = 0; i < this._OnResupply.Length; ++i)
		{
			DataPack hData = this._OnResupply.Get(i);
			hData.Reset();

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());

			if (view_as<SubscriptionType>(hData.ReadCell()) == SubscriptionType_Roller)
			{
				if (clientPerk != hData.ReadCell())
				{
					Call_Cancel();
					continue;
				}
			}

			Call_PushCell(client);
			Call_Finish();
		}
	}

	void OnVoice(const Perk perk, ERPlayer hCallback)
	{
		DataPack hData = new DataPack();
		hData.WriteCell(perk);
		hData.WriteFunction(hCallback);

		this._OnVoice.Push(hData);
	}

	void Voice(const int client)
	{
		Perk perk = GetDispatchPerk(client);
		if (perk == null)
			return;

		for (int i = 0; i < this._OnVoice.Length; ++i)
		{
			DataPack hData = this._OnVoice.Get(i);
			hData.Reset();

			if (perk != hData.ReadCell())
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(client);
			Call_Finish();
		}
	}

	void OnSound(const Perk perk, ERSound hCallback)
	{
		DataPack hData = new DataPack();
		hData.WriteCell(perk);
		hData.WriteFunction(hCallback);

		this._OnSound.Push(hData);
	}

	bool Sound(const int client, const char[] sClassname)
	{
		Perk perk = GetDispatchPerk(client);
		if (perk == null)
			return true;

		bool bAllow = true;

		for (int i = 0; i < this._OnSound.Length; ++i)
		{
			DataPack hData = this._OnSound.Get(i);
			hData.Reset();

			if (perk != hData.ReadCell())
				continue;

			Call_StartFunction(INVALID_HANDLE, hData.ReadFunction());
			Call_PushCell(client);
			Call_PushString(sClassname);

			bool bResult = true;
			Call_Finish(bResult);

			bAllow &= bResult;
		}

		return bAllow;
	}
}

EventRegistrar g_AllEvents[RTD_EFFECT_COUNT];

#include "rtd/stocks.sp"
#include "rtd/parsing.sp"

// A small private runtime, rather than RTD's roll pool, commands and legacy
// property macros. The original effects and event registrar use these interfaces.
methodmap Perk < StringMap
{
    public Perk() { return view_as<Perk>(new StringMap()); }
    property int Id
    {
        public get() { int id; this.GetValue("m_Id", id); return id; }
    }
    property int Time
    {
        public get() { return this == g_ActivePerk && g_ActiveInstant ? -1 : this.DefaultTime; }
    }
    property int DefaultTime
    {
        public get() { int value; this.GetValue("m_Time", value); return value; }
    }
    public void GetToken(char[] value, int length) { this.GetString("m_Token", value, length); }
    public void GetInternalCall(char[] value, int length) { this.GetString("m_Call", value, length); }
    public float GetPrefFloat(const char[] key, float fallback = 0.0)
    {
        if (this == g_ActivePerk && g_ActiveSettings)
        {
            char value[128];
            if (g_ActiveSettings.GetString(key, value, sizeof(value)))
                return StringToFloat(value);
        }
        float value;
        return this.GetValue(key, value) ? value : fallback;
    }
    public int GetPrefCell(const char[] key, int fallback = 0)
    {
        return RoundFloat(this.GetPrefFloat(key, float(fallback)));
    }
    public bool GetPrefBool(const char[] key, bool fallback = false)
    {
        return this.GetPrefCell(key, fallback ? 1 : 0) != 0;
    }
    public void SetPref(const char[] key, const char[] value)
    {
        if (StrContains(key, "m_") != 0)
            this.SetValue(key, StringToFloat(value));
    }
    public void IncrementActiveCount()
    {
        int count; this.GetValue("m_Active", count); this.SetValue("m_Active", count + 1);
    }
    public void DecrementActiveCount()
    {
        int count; this.GetValue("m_Active", count); this.SetValue("m_Active", count > 0 ? count - 1 : 0);
    }
    public int GetActiveCountGlobal() { int count; this.GetValue("m_Active", count); return count; }
    public void CallInternal(int client, bool apply, RTDRemoveReason reason)
    {
        char callback[64]; this.GetInternalCall(callback, sizeof(callback));
        Call_StartFunction(INVALID_HANDLE, GetFunctionByName(INVALID_HANDLE, callback));
        Call_PushCell(client);
        Call_PushCell(this);
        Call_PushCell(apply);
        Call_PushCell(reason);
        int error = Call_Finish();
        if (error != SP_ERROR_NONE)
            LogError("RTD callback %s failed for client %d (apply=%d, SourcePawn error %d). See the SourceMod error log for its stack trace.", callback, client, apply, error);
        if (apply)
            RuntimeTrace("callback=%s; target=%d; error=%d", callback, client, error);
    }
    public bool InitInternal()
    {
        char callback[64]; this.GetString("m_Init", callback, sizeof(callback));
        if (!callback[0]) return true;
        Function func = GetFunctionByName(INVALID_HANDLE, callback);
        if (func == INVALID_FUNCTION)
        {
            StartupFailure("Missing RTD initializer: %s", callback);
            return false;
        }
        Call_StartFunction(INVALID_HANDLE, func);
        Call_PushCell(this);
        int error = Call_Finish();
        if (error != SP_ERROR_NONE)
        {
            char token[32]; this.GetToken(token, sizeof(token));
            StartupFailure("Initializer %s for '%s' failed (SourcePawn error %d). See the SourceMod error log for its stack trace.", callback, token, error);
            return false;
        }
        return true;
    }
    public bool IsAptForSetupOf(int client)
    {
        int classes;
        this.GetValue("m_Classes", classes);
        int converter[] = {0, 1, 8, 2, 4, 7, 5, 3, 9, 6};
        int playerClass = view_as<int>(TF2_GetPlayerClass(client));
        if (playerClass < 1 || playerClass > 9 || !(classes & (1 << (converter[playerClass] - 1))))
            return false;
        ArrayList weapons;
        this.GetValue("m_Weapons", weapons);
        if (!weapons.Length) return true;
        char classname[64], required[64];
        for (int slot = 0; slot < 5; slot++)
        {
            int weapon = GetPlayerWeaponSlot(client, slot);
            if (weapon <= MaxClients || !IsValidEntity(weapon)) continue;
            GetEntityClassname(weapon, classname, sizeof(classname));
            for (int i = 0; i < weapons.Length; i++)
            {
                weapons.GetString(i, required, sizeof(required));
                if (StrContains(classname, required, false) != -1) return true;
            }
        }
        return false;
    }
}

ArrayList g_hPerkTokenMapper;
methodmap PerkContainer < StringMap
{
    public PerkContainer()
    {
        g_hPerkTokenMapper = new ArrayList(32);
        return view_as<PerkContainer>(new StringMap());
    }
    public Perk Get(const char[] token) { Perk perk; this.GetValue(token, perk); return perk; }
    public Perk GetFromId(int id)
    {
        char token[32]; g_hPerkTokenMapper.GetString(id, token, sizeof(token));
        return this.Get(token);
    }
    public Perk Add(const char[] token, const char[] callback, const char[] init, const char[] classes, const char[] weapons, int time)
    {
        Perk perk = new Perk();
        perk.SetValue("m_Id", g_hPerkTokenMapper.Length);
        perk.SetString("m_Token", token);
        perk.SetString("m_Call", callback);
        perk.SetString("m_Init", init);
        perk.SetValue("m_Classes", StringToClass(classes));
        perk.SetValue("m_Weapons", StringToWeaponClass(weapons));
        perk.SetValue("m_Time", time);
        this.SetValue(token, perk);
        g_hPerkTokenMapper.PushString(token);
        return perk;
    }
}
PerkContainer g_hPerkContainer;

methodmap Rollers < ArrayList
{
    public Rollers()
    {
        ArrayList rows = new ArrayList(5, MAXPLAYERS + 1);
        int empty[5] = {0, 0, 0, 0, 0};
        // ArrayList startsize allocates uninitialized memory. Round cleanup
        // visits empty client slots too, so their perk handles must be zero.
        for (int client = 0; client <= MAXPLAYERS; client++)
            rows.SetArray(client, empty, sizeof(empty));
        return view_as<Rollers>(rows);
    }
    public bool GetInRoll(int client) { return view_as<bool>(this.Get(client, 0)); }
    public void SetInRoll(int client, bool value) { this.Set(client, value, 0); }
    public Perk GetPerk(int client) { return view_as<Perk>(this.Get(client, 1)); }
    public void SetPerk(int client, Perk value) { this.Set(client, value, 1); }
    public int GetEndRollTime(int client) { return this.Get(client, 2); }
    public void SetEndRollTime(int client, int value) { this.Set(client, value, 2); }
    public int GetLastRollTime(int client) { return this.Get(client, 3); }
    public void SetLastRollTime(int client, int value) { this.Set(client, value, 3); }
    public void PushToPerkHistory(int client, Perk value) { this.Set(client, value, 4); }
    public bool IsInPerkHistory(int client, Perk value, int limit)
    {
        return limit == 1 && this.Get(client, 4) == view_as<int>(value);
    }
    public void Reset(int client) { for (int i = 0; i < 5; i++) this.Set(client, 0, i); }
}

// The legacy function-generating macros fail after methodmaps in recent spcomp.
// Explicit equivalents are provided below; effect implementations stay original.
#undef DEFINE_CALL_APPLY_REMOVE
#undef DEFINE_CALL_APPLY
#undef DEFINE_CALL_EMPTY
#define DEFINE_CALL_APPLY_REMOVE(%1)
#define DEFINE_CALL_APPLY(%1)
#define DEFINE_CALL_EMPTY(%1)

enum AbilityNotice
{
    Notice_Attack,
    Notice_Damage,
    Notice_Ignited,
    Notice_Dispenser,
    Notice_DispenserSpawned,
    Notice_Sentry,
    Notice_SentrySpawned,
    Notice_Count
}

methodmap AbilityNotifier
{
    public void Attack(int client) { NotifySpecificAbility(view_as<int>(this), client, Notice_Attack); }
    public void PlayerDamage(int client, int damage) { NotifySpecificAbility(view_as<int>(this), client, Notice_Damage, 0, 0, damage); }
    public void PlayersIgnited(int client, int count) { NotifySpecificAbility(view_as<int>(this), client, Notice_Ignited, count); }
    public void Dispenser(int client) { NotifySpecificAbility(view_as<int>(this), client, Notice_Dispenser); }
    public void DispenserSpawned(int client, int count, int maximum) { NotifySpecificAbility(view_as<int>(this), client, Notice_DispenserSpawned, count, maximum); }
    public void Sentry(int client) { NotifySpecificAbility(view_as<int>(this), client, Notice_Sentry); }
    public void SentrySpawned(int client, int count, int maximum) { NotifySpecificAbility(view_as<int>(this), client, Notice_SentrySpawned, count, maximum); }
}

// Route notices from the original effects through this adapter without editing
// the shared RTD files. Only explicitly configured HUD notices are displayed.
// Each original callback is compiled against its own cache and roller store.
// No context switch is required when SourceMod calls an SDK hook directly.
ClientFlags g_eInGodmode;
#undef Cache
#undef g_hRollers
#undef Events

// Effect 0: toxic
#define Cache g_AllCache[0]
#define g_hRollers g_AllRollers[0]
#define Events g_AllEvents[0]
#define Notify view_as<AbilityNotifier>(0)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/toxic.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 1: noclip
#define Cache g_AllCache[1]
#define g_hRollers g_AllRollers[1]
#define Events g_AllEvents[1]
#define Notify view_as<AbilityNotifier>(1)
#define CloseHandle CloseEffectHandle
#define FixPotentialStuck FX1_FixPotentialStuck
#define SetEntityGravity FX1_SetEntityGravity
#define SetEntityMoveType FX1_SetEntityMoveType
#include "rtd/perks/noclip.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef FixPotentialStuck
#undef SetEntityGravity
#undef SetEntityMoveType

// Effect 2: infiniteammo
#define Cache g_AllCache[2]
#define g_hRollers g_AllRollers[2]
#define Events g_AllEvents[2]
#define Notify view_as<AbilityNotifier>(2)
#define CloseHandle CloseEffectHandle
#define SetEntPropFloat FX2_SetEntPropFloat
#include "rtd/perks/infiniteammo.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetEntPropFloat

// Effect 3: scarybullets
#define Cache g_AllCache[3]
#define g_hRollers g_AllRollers[3]
#define Events g_AllEvents[3]
#define Notify view_as<AbilityNotifier>(3)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/scarybullets.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 4: spawnsentry
#define Cache g_AllCache[4]
#define g_hRollers g_AllRollers[4]
#define Events g_AllEvents[4]
#define Notify view_as<AbilityNotifier>(4)
#define CloseHandle CloseEffectHandle
#define RemovePerk FX4_RemovePerk
#define SetEntPropFloat FX4_SetEntPropFloat
#include "rtd/perks/spawnsentry.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef RemovePerk
#undef SetEntPropFloat

// Effect 5: homingprojectiles
#define Cache g_AllCache[5]
#define g_hRollers g_AllRollers[5]
#define Events g_AllEvents[5]
#define Notify view_as<AbilityNotifier>(5)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX5_CreateTimer
#define TF2_AddCondition FX5_AddCondition
#define TF2_RemoveCondition FX5_RemoveCondition
#include "rtd/perks/homingprojectiles.sp"
#undef TF2_AddCondition
#undef TF2_RemoveCondition
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 6: explode
#define Cache g_AllCache[6]
#define g_hRollers g_AllRollers[6]
#define Events g_AllEvents[6]
#define Notify view_as<AbilityNotifier>(6)
#define CloseHandle CloseEffectHandle
#define SDKHook FX6_SDKHook
#define RemovePerk FX6_RemovePerk
#include "rtd/perks/explode.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook
#undef RemovePerk

// Effect 7: snail
#define Cache g_AllCache[7]
#define g_hRollers g_AllRollers[7]
#define Events g_AllEvents[7]
#define Notify view_as<AbilityNotifier>(7)
#define CloseHandle CloseEffectHandle
#define SetSpeedEx FX7_SetSpeedEx
#include "rtd/perks/snail.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetSpeedEx

// Effect 8: frozen
#define Cache g_AllCache[8]
#define g_hRollers g_AllRollers[8]
#define Events g_AllEvents[8]
#define Notify view_as<AbilityNotifier>(8)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX8_CreateTimer
#define SDKHook FX8_SDKHook
#define RemovePerk FX8_RemovePerk
#define SetEntityMoveType FX8_SetEntityMoveType
#define ApplyPreventCapture FX8_ApplyPreventCapture
#define RemovePreventCapture FX8_RemovePreventCapture
#define RemoveEntity Ability_HideFrozenWearable
#include "rtd/perks/frozen.sp"
#undef RemoveEntity
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef SDKHook
#undef RemovePerk
#undef SetEntityMoveType
#undef ApplyPreventCapture
#undef RemovePreventCapture

// Effect 9: timebomb
#define Cache g_AllCache[9]
#define g_hRollers g_AllRollers[9]
#define Events g_AllEvents[9]
#define Notify view_as<AbilityNotifier>(9)
#define CloseHandle CloseEffectHandle
#define SDKHook FX9_SDKHook
#include "rtd/perks/timebomb.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook

// Effect 10: ignition
#define Cache g_AllCache[10]
#define g_hRollers g_AllRollers[10]
#define Events g_AllEvents[10]
#define Notify view_as<AbilityNotifier>(10)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/ignition.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 11: lowhealth
#define Cache g_AllCache[11]
#define g_hRollers g_AllRollers[11]
#define Events g_AllEvents[11]
#define Notify view_as<AbilityNotifier>(11)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/lowhealth.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 12: drugged
#define Cache g_AllCache[12]
#define g_hRollers g_AllRollers[12]
#define Events g_AllEvents[12]
#define Notify view_as<AbilityNotifier>(12)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/drugged.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 13: blind
#define Cache g_AllCache[13]
#define g_hRollers g_AllRollers[13]
#define Events g_AllEvents[13]
#define Notify view_as<AbilityNotifier>(13)
#define CloseHandle CloseEffectHandle
#define SetOverlay FX13_SetOverlay
#include "rtd/perks/blind.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetOverlay

// Effect 14: striptomelee
#define Cache g_AllCache[14]
#define g_hRollers g_AllRollers[14]
#define Events g_AllEvents[14]
#define Notify view_as<AbilityNotifier>(14)
#define CloseHandle CloseEffectHandle
#define SDKHook FX14_SDKHook
#define RemovePerk FX14_RemovePerk
#define SetEntPropFloat FX14_SetEntPropFloat
#include "rtd/perks/striptomelee.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook
#undef RemovePerk
#undef SetEntPropFloat

// Effect 15: beacon
#define Cache g_AllCache[15]
#define g_hRollers g_AllRollers[15]
#define Events g_AllEvents[15]
#define Notify view_as<AbilityNotifier>(15)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/beacon.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 16: forcedtaunt
#define Cache g_AllCache[16]
#define g_hRollers g_AllRollers[16]
#define Events g_AllEvents[16]
#define Notify view_as<AbilityNotifier>(16)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/forcedtaunt.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 17: monochromia
#define Cache g_AllCache[17]
#define g_hRollers g_AllRollers[17]
#define Events g_AllEvents[17]
#define Notify view_as<AbilityNotifier>(17)
#define CloseHandle CloseEffectHandle
#define SetOverlay FX17_SetOverlay
#include "rtd/perks/monochromia.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetOverlay

// Effect 18: earthquake
#define Cache g_AllCache[18]
#define g_hRollers g_AllRollers[18]
#define Events g_AllEvents[18]
#define Notify view_as<AbilityNotifier>(18)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/earthquake.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 19: funnyfeeling
#define Cache g_AllCache[19]
#define g_hRollers g_AllRollers[19]
#define Events g_AllEvents[19]
#define Notify view_as<AbilityNotifier>(19)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/funnyfeeling.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 20: badsauce
#define Cache g_AllCache[20]
#define g_hRollers g_AllRollers[20]
#define Events g_AllEvents[20]
#define Notify view_as<AbilityNotifier>(20)
#define CloseHandle CloseEffectHandle
#define RemovePerk FX20_RemovePerk
#include "rtd/perks/badsauce.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef RemovePerk

// Effect 21: spawndispenser
#define Cache g_AllCache[21]
#define g_hRollers g_AllRollers[21]
#define Events g_AllEvents[21]
#define Notify view_as<AbilityNotifier>(21)
#define CloseHandle CloseEffectHandle
#define RemovePerk FX21_RemovePerk
#include "rtd/perks/spawndispenser.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef RemovePerk

// Effect 22: infinitejump
#define Cache g_AllCache[22]
#define g_hRollers g_AllRollers[22]
#define Events g_AllEvents[22]
#define Notify view_as<AbilityNotifier>(22)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/infinitejump.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 23: powerfulhits
#define Cache g_AllCache[23]
#define g_hRollers g_AllRollers[23]
#define Events g_AllEvents[23]
#define Notify view_as<AbilityNotifier>(23)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX23_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX23_TF2Attrib_RemoveByDefIndex
#include "rtd/perks/powerfulhits.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex

// Effect 24: bighead
#define Cache g_AllCache[24]
#define g_hRollers g_AllRollers[24]
#define Events g_AllEvents[24]
#define Notify view_as<AbilityNotifier>(24)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX24_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX24_TF2Attrib_RemoveByDefIndex
#define SetEntPropFloat FX24_SetEntPropFloat
#include "rtd/perks/bighead.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex
#undef SetEntPropFloat

// Effect 25: tinymann
#define Cache g_AllCache[25]
#define g_hRollers g_AllRollers[25]
#define Events g_AllEvents[25]
#define Notify view_as<AbilityNotifier>(25)
#define CloseHandle CloseEffectHandle
#define FixPotentialStuck FX25_FixPotentialStuck
#define TF2Attrib_SetByDefIndex FX25_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX25_TF2Attrib_RemoveByDefIndex
#define SetEntPropFloat FX25_SetEntPropFloat
#define TF2_AddCondition FX25_AddSpeedBoost
#define TF2_RemoveCondition FX25_RemoveSpeedBoost
#include "rtd/perks/tinymann.sp"
#undef TF2_AddCondition
#undef TF2_RemoveCondition
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef FixPotentialStuck
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex
#undef SetEntPropFloat

// Effect 26: firework
#define Cache g_AllCache[26]
#define g_hRollers g_AllRollers[26]
#define Events g_AllEvents[26]
#define Notify view_as<AbilityNotifier>(26)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX26_CreateTimer
#include "rtd/perks/firework.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 27: deadlyvoice
#define Cache g_AllCache[27]
#define g_hRollers g_AllRollers[27]
#define Events g_AllEvents[27]
#define Notify view_as<AbilityNotifier>(27)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/deadlyvoice.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 28: eyeforaneye
#define Cache g_AllCache[28]
#define g_hRollers g_AllRollers[28]
#define Events g_AllEvents[28]
#define Notify view_as<AbilityNotifier>(28)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/eyeforaneye.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 29: weakened
#define Cache g_AllCache[29]
#define g_hRollers g_AllRollers[29]
#define Events g_AllEvents[29]
#define Notify view_as<AbilityNotifier>(29)
#define CloseHandle CloseEffectHandle
#define SDKHook FX29_SDKHook
#include "rtd/perks/weakened.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook

// Effect 30: necromash
#define Cache g_AllCache[30]
#define g_hRollers g_AllRollers[30]
#define Events g_AllEvents[30]
#define Notify view_as<AbilityNotifier>(30)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX30_CreateTimer
#define CreateDataTimer FX30_CreateDataTimer
#include "rtd/perks/necromash.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef CreateDataTimer

// Effect 31: extraammo
#define Cache g_AllCache[31]
#define g_hRollers g_AllRollers[31]
#define Events g_AllEvents[31]
#define Notify view_as<AbilityNotifier>(31)
#define CloseHandle CloseEffectHandle
#define SetEntPropFloat FX31_SetEntPropFloat
#include "rtd/perks/extraammo.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetEntPropFloat

// Effect 32: suffocation
#define Cache g_AllCache[32]
#define g_hRollers g_AllRollers[32]
#define Events g_AllEvents[32]
#define Notify view_as<AbilityNotifier>(32)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/suffocation.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 33: fasthands
#define Cache g_AllCache[33]
#define g_hRollers g_AllRollers[33]
#define Events g_AllEvents[33]
#define Notify view_as<AbilityNotifier>(33)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX33_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX33_TF2Attrib_RemoveByDefIndex
#include "rtd/perks/fasthands.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex

// Effect 34: outline
#define Cache g_AllCache[34]
#define g_hRollers g_AllRollers[34]
#define Events g_AllEvents[34]
#define Notify view_as<AbilityNotifier>(34)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/outline.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 35: teamcriticals
#define Cache g_AllCache[35]
#define g_hRollers g_AllRollers[35]
#define Events g_AllEvents[35]
#define Notify view_as<AbilityNotifier>(35)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/teamcriticals.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 36: firetimebomb
#define Cache g_AllCache[36]
#define g_hRollers g_AllRollers[36]
#define Events g_AllEvents[36]
#define Notify view_as<AbilityNotifier>(36)
#define CloseHandle CloseEffectHandle
#define SDKHook FX36_SDKHook
#include "rtd/perks/firetimebomb.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook

// Effect 37: firebreath
#define Cache g_AllCache[37]
#define g_hRollers g_AllRollers[37]
#define Events g_AllEvents[37]
#define Notify view_as<AbilityNotifier>(37)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/firebreath.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 38: strongrecoil
#define Cache g_AllCache[38]
#define g_hRollers g_AllRollers[38]
#define Events g_AllEvents[38]
#define Notify view_as<AbilityNotifier>(38)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/strongrecoil.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 39: cursed
#define Cache g_AllCache[39]
#define g_hRollers g_AllRollers[39]
#define Events g_AllEvents[39]
#define Notify view_as<AbilityNotifier>(39)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/cursed.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 40: extrathrowables
#define Cache g_AllCache[40]
#define g_hRollers g_AllRollers[40]
#define Events g_AllEvents[40]
#define Notify view_as<AbilityNotifier>(40)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/extrathrowables.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 41: explosivearrows
#define Cache g_AllCache[41]
#define g_hRollers g_AllRollers[41]
#define Events g_AllEvents[41]
#define Notify view_as<AbilityNotifier>(41)
#define CloseHandle CloseEffectHandle
#define SDKHook FX41_SDKHook
#include "rtd/perks/explosivearrows.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook

// Effect 42: inclineproblem
#define Cache g_AllCache[42]
#define g_hRollers g_AllRollers[42]
#define Events g_AllEvents[42]
#define Notify view_as<AbilityNotifier>(42)
#define CloseHandle CloseEffectHandle
#define SetEntPropFloat FX42_SetEntPropFloat
#include "rtd/perks/inclineproblem.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetEntPropFloat

// Effect 43: springshoes
#define Cache g_AllCache[43]
#define g_hRollers g_AllRollers[43]
#define Events g_AllEvents[43]
#define Notify view_as<AbilityNotifier>(43)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX43_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX43_TF2Attrib_RemoveByDefIndex
#include "rtd/perks/springshoes.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex

// Effect 44: lag
#define Cache g_AllCache[44]
#define g_hRollers g_AllRollers[44]
#define Events g_AllEvents[44]
#define Notify view_as<AbilityNotifier>(44)
#define CloseHandle CloseEffectHandle
#define FixPotentialStuck FX44_FixPotentialStuck
#include "rtd/perks/lag.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef FixPotentialStuck

// Effect 45: drugbullets
#define Cache g_AllCache[45]
#define g_hRollers g_AllRollers[45]
#define Events g_AllEvents[45]
#define Notify view_as<AbilityNotifier>(45)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/drugbullets.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 46: longmelee
#define Cache g_AllCache[46]
#define g_hRollers g_AllRollers[46]
#define Events g_AllEvents[46]
#define Notify view_as<AbilityNotifier>(46)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX46_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX46_TF2Attrib_RemoveByDefIndex
#include "rtd/perks/longmelee.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex

// Effect 47: hatthrow
#define Cache g_AllCache[47]
#define g_hRollers g_AllRollers[47]
#define Events g_AllEvents[47]
#define Notify view_as<AbilityNotifier>(47)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX47_CreateTimer
#define SDKHook FX47_SDKHook
#define SetEntityMoveType FX47_SetEntityMoveType
#include "rtd/perks/hatthrow.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef SDKHook
#undef SetEntityMoveType

// Effect 48: madaraswhistle
#define Cache g_AllCache[48]
#define g_hRollers g_AllRollers[48]
#define Events g_AllEvents[48]
#define Notify view_as<AbilityNotifier>(48)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX48_CreateTimer
#include "rtd/perks/madaraswhistle.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 49: sickness
#define Cache g_AllCache[49]
#define g_hRollers g_AllRollers[49]
#define Events g_AllEvents[49]
#define Notify view_as<AbilityNotifier>(49)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX49_CreateTimer
#include "rtd/perks/sickness.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 50: wastedroll
#define Cache g_AllCache[50]
#define g_hRollers g_AllRollers[50]
#define Events g_AllEvents[50]
#define Notify view_as<AbilityNotifier>(50)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/wastedroll.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 51: drunkwalk
#define Cache g_AllCache[51]
#define g_hRollers g_AllRollers[51]
#define Events g_AllEvents[51]
#define Notify view_as<AbilityNotifier>(51)
#define CloseHandle CloseEffectHandle
#define SetSpeed FX51_SetSpeed
#define ResetSpeed FX51_ResetSpeed
#include "rtd/perks/drunkwalk.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetSpeed
#undef ResetSpeed

// Effect 52: hellsreach
#define Cache g_AllCache[52]
#define g_hRollers g_AllRollers[52]
#define Events g_AllEvents[52]
#define Notify view_as<AbilityNotifier>(52)
#define CloseHandle CloseEffectHandle
#define SetSpeed FX52_SetSpeed
#define ResetSpeed FX52_ResetSpeed
#include "rtd/perks/hellsreach.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SetSpeed
#undef ResetSpeed

// Effect 53: cursedprojectiles
#define Cache g_AllCache[53]
#define g_hRollers g_AllRollers[53]
#define Events g_AllEvents[53]
#define Notify view_as<AbilityNotifier>(53)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX53_CreateTimer
#define SDKHook FX53_SDKHook
#include "rtd/perks/cursedprojectiles.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef SDKHook

// Effect 54: vampire
#define Cache g_AllCache[54]
#define g_hRollers g_AllRollers[54]
#define Events g_AllEvents[54]
#define Notify view_as<AbilityNotifier>(54)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX54_CreateTimer
#include "rtd/perks/vampire.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 55: batswarm
#define Cache g_AllCache[55]
#define g_hRollers g_AllRollers[55]
#define Events g_AllEvents[55]
#define Notify view_as<AbilityNotifier>(55)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX55_CreateTimer
#define SetEntityMoveType FX55_SetEntityMoveType
#define SetSpeedEx FX55_SetSpeedEx
#define TF2_AddCondition FX55_AddCondition
#include "rtd/perks/batswarm.sp"
#undef TF2_AddCondition
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef SetEntityMoveType
#undef SetSpeedEx

// Effect 56: pumpkintrail
#define Cache g_AllCache[56]
#define g_hRollers g_AllRollers[56]
#define Events g_AllEvents[56]
#define Notify view_as<AbilityNotifier>(56)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX56_CreateTimer
#include "rtd/perks/pumpkintrail.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 57: acallbeyond
#define Cache g_AllCache[57]
#define g_hRollers g_AllRollers[57]
#define Events g_AllEvents[57]
#define Notify view_as<AbilityNotifier>(57)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX57_CreateTimer
#include "rtd/perks/acallbeyond.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 58: smite
#define Cache g_AllCache[58]
#define g_hRollers g_AllRollers[58]
#define Events g_AllEvents[58]
#define Notify view_as<AbilityNotifier>(58)
#define CloseHandle CloseEffectHandle
#define SDKHook FX58_SDKHook
#define SetSpeed FX58_SetSpeed
#define ResetSpeed FX58_ResetSpeed
#define TF2_AddCondition FX58_AddCondition
#include "rtd/perks/smite.sp"
#undef TF2_AddCondition
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef SDKHook
#undef SetSpeed
#undef ResetSpeed

// Effect 59: overhealbonus
#define Cache g_AllCache[59]
#define g_hRollers g_AllRollers[59]
#define Events g_AllEvents[59]
#define Notify view_as<AbilityNotifier>(59)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX59_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX59_TF2Attrib_RemoveByDefIndex
#include "rtd/perks/overhealbonus.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex

// Effect 60: sunlightspear
#define Cache g_AllCache[60]
#define g_hRollers g_AllRollers[60]
#define Events g_AllEvents[60]
#define Notify view_as<AbilityNotifier>(60)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX60_CreateTimer
#define SDKHook FX60_SDKHook
#define SetEntityMoveType FX60_SetEntityMoveType
#include "rtd/perks/sunlightspear.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef SDKHook
#undef SetEntityMoveType

// Effect 61: eldenstars
#define Cache g_AllCache[61]
#define g_hRollers g_AllRollers[61]
#define Events g_AllEvents[61]
#define Notify view_as<AbilityNotifier>(61)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX61_CreateTimer
#define SDKHook FX61_SDKHook
#include "rtd/perks/eldenstars.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer
#undef SDKHook

// Effect 62: frog
#define Cache g_AllCache[62]
#define g_hRollers g_AllRollers[62]
#define Events g_AllEvents[62]
#define Notify view_as<AbilityNotifier>(62)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/frog.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 63: paranoia
#define Cache g_AllCache[63]
#define g_hRollers g_AllRollers[63]
#define Events g_AllEvents[63]
#define Notify view_as<AbilityNotifier>(63)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/paranoia.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 64: heavyrockets
#define Cache g_AllCache[64]
#define g_hRollers g_AllRollers[64]
#define Events g_AllEvents[64]
#define Notify view_as<AbilityNotifier>(64)
#define CloseHandle CloseEffectHandle
#define CreateTimer FX64_CreateTimer
#include "rtd/perks/heavyrockets.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef CreateTimer

// Effect 65: weaponmixup
#define Cache g_AllCache[65]
#define g_hRollers g_AllRollers[65]
#define Events g_AllEvents[65]
#define Notify view_as<AbilityNotifier>(65)
#define CloseHandle CloseEffectHandle
#define TF2Attrib_SetByDefIndex FX65_TF2Attrib_SetByDefIndex
#define TF2Attrib_RemoveByDefIndex FX65_TF2Attrib_RemoveByDefIndex
#include "rtd/perks/weaponmixup.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#undef TF2Attrib_SetByDefIndex
#undef TF2Attrib_RemoveByDefIndex

// Effect 66: autoheal
#define Cache g_AllCache[66]
#define g_hRollers g_AllRollers[66]
#define Events g_AllEvents[66]
#define Notify view_as<AbilityNotifier>(66)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/autoheal.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle

// Effect 67: teamautoheal
#define Cache g_AllCache[67]
#define g_hRollers g_AllRollers[67]
#define Events g_AllEvents[67]
#define Notify view_as<AbilityNotifier>(67)
#define CloseHandle CloseEffectHandle
#include "rtd/perks/teamautoheal.sp"
#undef Cache
#undef g_hRollers
#undef Events
#undef Notify
#undef CloseHandle
#define Cache g_AllCache[g_ContextEffect]
#define g_hRollers g_AllRollers[g_ContextEffect]
#define Events g_AllEvents[g_ContextEffect]
#pragma unused Notify
#undef NoReload
#undef Weapon
#undef Clip
#undef Ammo

#define g_CastSerial g_CastSerialStore[g_ContextEffect]
#define g_Applying g_ApplyingStore[g_ContextEffect]
#define g_Removing g_RemovingStore[g_ContextEffect]
#define g_PendingStop g_PendingStopStore[g_ContextEffect]
#define g_OwnerUserId g_OwnerUserIdStore[g_ContextEffect]
#define g_Sharpness g_SharpnessStore[g_ContextEffect]
#define g_EndTimer g_EndTimerStore[g_ContextEffect]
#define g_Text g_TextStore[g_ContextEffect]
#define g_StartOrigin g_StartOriginStore[g_ContextEffect]

bool g_Ready;
bool g_RoundEnding;
char g_LastRoundEvent[64] = "none";
int g_StopAllDepth;
int g_LastStopTick = -1;
bool g_RuntimeInitialized;
int g_InitializedEffects;
char g_StartupLogPath[PLATFORM_MAX_PATH];
ConVar g_RageDebug;
int g_RoundSerial;
int g_CastSerialStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
ArrayList g_EffectTimers;
StringMap g_EffectEntities;
Function g_EffectTimerCallbacks[32];
int g_EffectTimerCallbackCount;
int g_DispatchRound = -1;

enum EffectTimerField
{
    ET_Handle, ET_Callback, ET_Flags, ET_Round, ET_Client, ET_Cast, ET_Effect,
    ET_Running, ET_Cancelled, ET_Data, ET_Size
}

Handle CreateEffectTimer(float interval, Timer callback, any data = 0, int flags = 0, int effect = -1)
{
    Handle timer = CreateTimer(interval, Timer_EffectDispatch, data, flags | TIMER_FLAG_NO_MAPCHANGE);
    int entry[ET_Size];
    entry[ET_Effect] = effect < 0 ? g_ContextEffect : effect;
    entry[ET_Handle] = view_as<int>(timer);
    int callbackId;
    while (callbackId < g_EffectTimerCallbackCount && g_EffectTimerCallbacks[callbackId] != callback)
        callbackId++;
    if (callbackId == g_EffectTimerCallbackCount)
        g_EffectTimerCallbacks[g_EffectTimerCallbackCount++] = callback;
    entry[ET_Callback] = callbackId;
    entry[ET_Flags] = flags;
    entry[ET_Round] = g_DispatchRound == -1 ? g_RoundSerial : g_DispatchRound;
    entry[ET_Data] = data;
    // These callbacks read the current player's shared effect cache. Pin them
    // to the cast that created them so replacement cannot change their values.
    int client;
    if (callback == Vampire_Tick_Followup || callback == Timer_BatSwarm_ChargeEffect
        || callback == Timer_FixAbilityStuck || callback == Timer_NecroMash_Retry)
        client = GetClientOfUserId(data);
    else if (callback == Timer_MadarasWhistle_Attack || callback == Timer_SunlightSpear_Tick)
    {
        DataPack pack = view_as<DataPack>(data);
        DataPackPos position = pack.Position;
        pack.Reset();
        if (callback == Timer_SunlightSpear_Tick)
            for (int i = 0; i < 5; i++)
                pack.ReadCell();
        client = GetClientOfUserId(pack.ReadCell());
        pack.Position = position;
    }
    else if (callback == Timer_EldenStars_ChipStart || callback == Timer_EldenStars_Chip)
    {
        int entity = EntRefToEntIndex(data);
        if (entity > MaxClients)
            client = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
    }
    if (IsValidClient(client))
    {
        entry[ET_Client] = GetClientUserId(client);
        entry[ET_Cast] = g_CastSerialStore[entry[ET_Effect]][client];
    }
    g_EffectTimers.PushArray(entry);
    return timer;
}

Handle CreateEffectDataTimer(float interval, Timer callback, Handle &pack, int flags = 0)
{
    pack = new DataPack();
    return CreateEffectTimer(interval, callback, pack, flags | TIMER_DATA_HNDL_CLOSE);
}

public Action Timer_EffectDispatch(Handle timer, any data)
{
    int index = g_EffectTimers.FindValue(view_as<int>(timer), ET_Handle);
    if (index == -1)
        return Plugin_Stop;
    int entry[ET_Size];
    g_EffectTimers.GetArray(index, entry);
    int client = GetClientOfUserId(entry[ET_Client]);
    bool stale = entry[ET_Client] && (!IsValidClient(client) || !IsPlayerAlive(client)
        || entry[ET_Cast] != g_CastSerialStore[entry[ET_Effect]][client]);
    if (g_RoundEnding || entry[ET_Round] != g_RoundSerial || entry[ET_Cancelled] || stale)
    {
        DiscardEffectTimerData(entry);
        g_EffectTimers.Erase(index);
        return Plugin_Stop;
    }
    g_EffectTimers.Set(index, true, ET_Running);
    int previousEffect = g_ContextEffect;
    g_ContextEffect = entry[ET_Effect];
    int previousRound = g_DispatchRound;
    g_DispatchRound = entry[ET_Round];
    Call_StartFunction(INVALID_HANDLE, g_EffectTimerCallbacks[entry[ET_Callback]]);
    Call_PushCell(timer);
    Call_PushCell(data);
    int result;
    int error = Call_Finish(result);
    g_DispatchRound = previousRound;
    g_ContextEffect = previousEffect;
    // A callback may create other timers or end the round, shifting array rows.
    index = g_EffectTimers.FindValue(view_as<int>(timer), ET_Handle);
    if (index == -1)
        return Plugin_Stop;
    bool stop = error != SP_ERROR_NONE || g_EffectTimers.Get(index, ET_Cancelled) != 0
        || !(entry[ET_Flags] & TIMER_REPEAT) || result == view_as<int>(Plugin_Stop);
    if (stop)
        g_EffectTimers.Erase(index);
    else
        g_EffectTimers.Set(index, false, ET_Running);
    return stop ? Plugin_Stop : view_as<Action>(result);
}

void DiscardEffectTimerData(const int entry[ET_Size])
{
    // This original callback transfers its DataPack to a second timer rather
    // than closing it. Cancellation must release the untransferred pack.
    if (g_EffectTimerCallbacks[entry[ET_Callback]] == Timer_Firework_Followup_Trigger)
        CloseHandle(view_as<Handle>(entry[ET_Data]));
}

void CloseEffectHandle(Handle handle)
{
    int index = g_EffectTimers.FindValue(view_as<int>(handle), ET_Handle);
    if (index != -1)
    {
        if (g_EffectTimers.Get(index, ET_Running))
        {
            g_EffectTimers.Set(index, true, ET_Cancelled);
            return;
        }
        int entry[ET_Size];
        g_EffectTimers.GetArray(index, entry);
        DiscardEffectTimerData(entry);
        g_EffectTimers.Erase(index);
    }
    CloseHandle(handle);
}

void CancelEffectTimers()
{
    for (int i = g_EffectTimers.Length - 1; i >= 0; i--)
    {
        if (g_EffectTimers.Get(i, ET_Running))
            g_EffectTimers.Set(i, true, ET_Cancelled);
        else
            CloseEffectHandle(view_as<Handle>(g_EffectTimers.Get(i, ET_Handle)));
    }
}

// Projectiles with touch callbacks can also outlive the cast whose cache they
// use. Keep their owner identity and cast serial until the entity is destroyed.
void HookEffectEntity(int entity, SDKHookType type, SDKHookCB callback, int effect = -1)
{
    if (callback == Event_HatThrow_OnHatTouch || callback == SunlightSpear_OnTouch
        || callback == ExplosiveArrows_ArrowTouch)
    {
        char key[16];
        IntToString(entity, key, sizeof(key));
        int client = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
        int state[4];
        state[3] = effect < 0 ? g_ContextEffect : effect;
        if (IsValidClient(client))
        {
            state[0] = GetClientUserId(client);
            state[1] = g_CastSerialStore[state[3]][client];
        }
        state[2] = g_RoundSerial;
        g_EffectEntities.SetArray(key, state, sizeof(state));
        if (callback == Event_HatThrow_OnHatTouch)
            SDKHook(entity, type, Ability_HatTouch);
        else if (callback == SunlightSpear_OnTouch)
            SDKHook(entity, type, Ability_SpearTouch);
        else
            SDKHook(entity, type, Ability_ArrowTouch);
        return;
    }
    SDKHook(entity, type, callback);
}

bool IsEffectEntityCurrent(int entity)
{
    char key[16];
    IntToString(entity, key, sizeof(key));
    int state[4];
    if (g_RoundEnding || !g_EffectEntities.GetArray(key, state, sizeof(state)))
        return false;
    int client = GetClientOfUserId(state[0]);
    return IsValidClient(client) && IsPlayerAlive(client)
        && state[1] == g_CastSerialStore[state[3]][client] && state[2] == g_RoundSerial;
}

public Action Ability_HatTouch(int entity, int other)
{
    if (IsEffectEntityCurrent(entity))
        return Event_HatThrow_OnHatTouch(entity, other);
    AcceptEntityInput(entity, "KillHierarchy");
    return Plugin_Handled;
}

public Action Ability_SpearTouch(int entity, int other)
{
    if (IsEffectEntityCurrent(entity))
        return SunlightSpear_OnTouch(entity, other);
    AcceptEntityInput(entity, "KillHierarchy");
    return Plugin_Handled;
}

public void Ability_ArrowTouch(int entity, int other)
{
    if (IsEffectEntityCurrent(entity))
        ExplosiveArrows_ArrowTouch(entity, other);
}

public void OnEntityDestroyed(int entity)
{
    if (entity <= MaxClients || g_EffectEntities == null)
        return;
    char key[16];
    IntToString(entity, key, sizeof(key));
    g_EffectEntities.Remove(key);
}
bool g_ApplyingStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
bool g_RemovingStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
RTDRemoveReason g_RemovalReasonStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
bool g_PendingStopStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
int g_OwnerUserIdStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
int g_ClientUserId[MAXPLAYERS + 1];
int g_SharpnessStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
int g_ApplyDuration = 10;
Handle g_EndTimerStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];

enum struct AbilityTextState
{
    char Message[512];
    char Notice[512];
    float EndsAt;
    float MainUntil;
    float NoticeUntil;
    float Lifetime;
    float X;
    float Y;
    int Color[4];
    int Duration;
    int Count;
    int Maximum;
    int Damage;
    int Owner;
    bool Timed;
}

AbilityTextState g_TextStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
StringMap g_NoticeStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1];
Handle g_MessageHud;
Handle g_NoticeHud;
static const char g_NoticeKeys[][] =
{
    "attack", "damage", "ignited", "dispenser", "dispenser_spawned", "sentry", "sentry_spawned"
};

// Origins are private to each cast.
float g_StartOriginStore[RTD_EFFECT_COUNT][MAXPLAYERS + 1][3];

enum StateKind { State_Attribute, State_Gravity, State_Move, State_Model, State_Head, State_Step, State_Overlay }
enum StateLayer { SL_Entity, SL_Kind, SL_Key, SL_Effect, SL_Client, SL_Value, SL_Present, SL_Order, SL_Size }
ArrayList g_StateLayers;
int g_StateOrder;

// These diagnostics go to the server console and a dedicated file, never chat.
// A binary rejected before OnPluginStart cannot run this logger; SourceMod
// reports those missing-native, extension, or invalid-binary errors itself.
void StartupLog(const char[] format, any ...)
{
    char message[1024];
    VFormat(message, sizeof(message), format, 2);
    PrintToServer("[ffs_rtd_ability] %s", message);
    LogToFileEx(g_StartupLogPath, "[ffs_rtd_ability] %s", message);
}

// Runtime diagnostics go only to the server console and log. No player text.
// Set ffs_rtd_ability_debug 0 after capturing a failed rage to disable them.
void RuntimeTrace(const char[] format, any ...)
{
    if (g_RageDebug == null || !g_RageDebug.BoolValue)
        return;
    char message[1024];
    VFormat(message, sizeof(message), format, 2);
    // Temporarily muted. Uncomment this line to restore runtime debug output.
    // StartupLog("[rage-debug] %s", message);
}

void StartupFailure(const char[] format, any ...)
{
    char message[1024];
    VFormat(message, sizeof(message), format, 2);
    StartupLog("ERROR: %s", message);
    LogError("[ffs_rtd_ability] %s", message);
    SetFailState("%s", message);
}

bool HookStartupEvent(const char[] name, EventHook callback)
{
    if (HookEventEx(name, callback))
        return true;
    StartupFailure("Cannot hook required TF2 event '%s'. Check the game and SourceMod versions.", name);
    return false;
}

public void OnPluginStart()
{
    BuildPath(Path_SM, g_StartupLogPath, sizeof(g_StartupLogPath), "logs/ffs_rtd_ability.log");
    g_RageDebug = CreateConVar("ffs_rtd_ability_debug", "1", "Log FF2R RTD ability dispatch, rejection reasons and callback results to the server console and log.", FCVAR_NONE, true, 0.0, true, 1.0);

    g_EffectTimers = new ArrayList(ET_Size);
    g_EffectEntities = new StringMap();
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
        g_AllRollers[effect] = new Rollers();
    g_StateLayers = new ArrayList(SL_Size);
    g_hPerkContainer = new PerkContainer();
    g_MessageHud = CreateHudSynchronizer();
    g_NoticeHud = CreateHudSynchronizer();
    CreateTimer(0.25, Timer_AbilityText, _, TIMER_REPEAT);

    RegisterEffects();
    if (g_hPerkTokenMapper.Length != RTD_EFFECT_COUNT)
    {
        StartupFailure("Registered %d abilities; expected %d.", g_hPerkTokenMapper.Length, RTD_EFFECT_COUNT);
        return;
    }

    if (!HookStartupEvent("player_death", Event_Death)
        || !HookStartupEvent("player_changeclass", Event_ClassChange)
        || !HookStartupEvent("post_inventory_application", Event_Resupply)
        || !HookStartupEvent("player_hurt", Event_PlayerHurt)
        || !HookStartupEvent("player_chargedeployed", Event_UberchargeDeployed)
        || !HookStartupEvent("teamplay_round_start", Event_Reset)
        || !HookStartupEvent("arena_round_start", Event_Reset)
        || !HookStartupEvent("teamplay_setup_finished", Event_Reset)
        || !HookStartupEvent("teamplay_round_win", Event_Reset)
        || !HookStartupEvent("arena_win_panel", Event_Reset))
        return;
    AddCommandListener(Listener_Voice, "voicemenu");
    AddNormalSoundHook(Listener_Sound);
    RegServerCmd("sm_ffs_rtd_status", Command_RtdStatus, "Show RTD ability initialization status in the server console and log.");

    for (int client = 1; client <= MaxClients; client++)
    {
        for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
        {
            g_ContextEffect = effect;
            Cache[client].Init(client);
        }
        if (IsClientInGame(client))
            OnClientPutInServer(client);
    }
    g_RuntimeInitialized = true;
}

public void OnAllPluginsLoaded()
{
    static const char requiredNatives[][] =
    {
        "SDKHook", "TeleportEntity", "FF2R_GetBossData",
        "TF2Attrib_SetByDefIndex", "TF2Attrib_GetByDefIndex",
        "TF2Attrib_RemoveByDefIndex", "TF2Attrib_GetValue"
    };
    for (int i = 0; i < sizeof(requiredNatives); i++)
    {
        if (GetFeatureStatus(FeatureType_Native, requiredNatives[i]) != FeatureStatus_Available)
        {
            StartupFailure("Required native '%s' is unavailable. Check SDKHooks, SDKTools, FF2 Rewrite and TF2Attributes.", requiredNatives[i]);
            return;
        }
    }
}

public Action Command_RtdStatus(int args)
{
    char filename[PLATFORM_MAX_PATH], map[PLATFORM_MAX_PATH];
    GetPluginFilename(INVALID_HANDLE, filename, sizeof(filename));
    GetCurrentMap(map, sizeof(map));
    int engineState = -1;
    if (g_Ready)
        engineState = view_as<int>(GameRules_GetRoundState());
    StartupLog("STATUS v%s; file=%s; map=%s; loaded=%d; ready=%d; initialized=%d/%d; round_ending=%d; engine_state=%d; last_round_event=%s",
        RTD_PLUGIN_VERSION, filename, map, g_RuntimeInitialized, g_Ready,
        g_InitializedEffects, RTD_EFFECT_COUNT, g_RoundEnding, engineState, g_LastRoundEvent);
    LogBossAbilityStatus();
    return Plugin_Handled;
}

// Explicit status command: inspect what FF2R actually loaded, rather than the
// config file on disk. Missing/nested sections never reach the ability forward.
void LogBossAbilityStatus()
{
    int bosses;
    for (int client = 1; client <= MaxClients; client++)
    {
        if (!IsClientInGame(client))
            continue;
        BossData boss = FF2R_GetBossData(client);
        if (!boss)
            continue;
        bosses++;
        int count;
        StringMapSnapshot keys = boss.Snapshot();
        for (int i = 0; i < keys.Length; i++)
        {
            char ability[128];
            keys.GetKey(i, ability, sizeof(ability));
            if (StrContains(ability, "rage_rtd_", false) != 0)
                continue;
            AbilityData cfg = boss.GetAbility(ability);
            if (!cfg)
                continue;
            char plugin[64];
            cfg.GetString("plugin_name", plugin, sizeof(plugin), "<omitted>");
            StartupLog("CONFIG boss=%d; ability=%s; slot=%d; plugin_name=%s; matches_plugin=%d",
                client, ability, cfg.GetInt("slot", cfg.GetInt("arg0", 0)), plugin, cfg.IsMyPlugin());
            count++;
        }
        delete keys;
        StartupLog("CONFIG boss=%d; RTD abilities=%d", client, count);
    }
    if (!bosses)
        StartupLog("CONFIG no active FF2R bosses; run sm_ffs_rtd_status again while playing the affected boss.");
}

public void OnMapStart()
{
    g_Ready = false;
    g_InitializedEffects = 0;
    g_RoundEnding = false;
    strcopy(g_LastRoundEvent, sizeof(g_LastRoundEvent), "map_start");
    Storage_Precache();
    // Stocks_OnMapStart installs its own hook; install it only once here instead.
    PrecacheModel(LASERBEAM);
    PrecacheModel(EMPTY_MODEL);
    PrecacheModel(MODEL_PROJECTILE);
    if (g_hHoming == null)
        g_hHoming = new ArrayList(4);
    else
        g_hHoming.Clear();

    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
        g_AllEvents[effect].Init();
    for (int i = 0; i < g_hPerkTokenMapper.Length; i++)
    {
        Perk perk = g_hPerkContainer.GetFromId(i);
        g_ContextEffect = perk.Id;
        char token[32], callback[64];
        perk.GetToken(token, sizeof(token));
        perk.GetInternalCall(callback, sizeof(callback));
        if (GetFunctionByName(INVALID_HANDLE, callback) == INVALID_FUNCTION)
        {
            StartupFailure("Missing RTD effect callback: %s (%s)", callback, token);
            return;
        }
        if (StrEqual(token, "heavyrockets"))
        {
            // Original RTD caches sharpness globally at map start. Use a per-rocket
            // snapshot so two bosses can configure different values concurrently.
            Events.OnEntitySpawned(perk, Ability_HeavyRocketSpawned, HeavyRockets_ClassFilter, Retriever_OwnerEntity);
        }
        else if (!perk.InitInternal())
        {
            return;
        }
        g_InitializedEffects++;
    }
    g_Ready = true;
    StartupLog("loaded %d/%d", g_InitializedEffects, RTD_EFFECT_COUNT);
}

public void OnMapEnd()
{
    StopAllEffects(RTDRemove_NoPrint);
    g_Ready = false;
    g_InitializedEffects = 0;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
        g_AllEvents[effect].Cleanup();
}

public void OnPluginEnd()
{
    if (!g_RuntimeInitialized)
        return;
    StopAllEffects(RTDRemove_PluginUnload);
}

public void OnClientPutInServer(int client)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        g_ContextEffect = effect;
        ClearAbilityHud(client);
        Cache[client].Init(client);
        g_hRollers.Reset(client);
        g_OwnerUserId[client] = 0;
        g_Applying[client] = g_Removing[client] = g_PendingStop[client] = false;
    }
    g_ContextEffect = previous;
    g_ClientUserId[client] = GetClientUserId(client);
    g_eInGodmode.Unset(client);
    g_eMuteNextResupply.Unset(client);
    Shared[client]._CritBoosted = 0;
    Shared[client]._MiniBoosts = 0;
    Shared[client]._FullBoosts = 0;
    Shared[client]._SmiteCritUntil = 0.0;
    Shared[client]._TinySpeedBoost = false;
    Shared[client]._BatSpeedBuffUntil = 0.0;
    Shared[client].MaxHealth = 0;
    SDKHook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
}

public void OnClientDisconnect(int client)
{
    if (g_Ready)
        DispatchPlayerDisconnected(client);
    FF2R_OnBossRemoved(client);
    RemoveClientEffects(client, RTDRemove_Disconnect);
    g_ClientUserId[client] = 0;
    SDKUnhook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
}

public Action OnGetMaxHealth(int client, int &maxHealth)
{
    Shared[client].MaxHealth = maxHealth;
    return Plugin_Continue;
}

public void FF2R_OnBossRemoved(int boss)
{
    if (g_hRollers == null || boss < 1 || boss > MaxClients)
        return;
    int owner = g_ClientUserId[boss];
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
    g_ContextEffect = effect;
    for (int client = 1; client <= MaxClients; client++)
    {
        if (g_OwnerUserId[client] == owner && owner != 0)
            RemovePerk(client, RTDRemove_NoPrint);
        if (g_Text[client].Owner == owner && owner != 0)
            ClearAbilityHud(client);
    }
    }
    g_ContextEffect = previous;
}

// Observe the global pre-forward even when the main callback is routed to a
// different plugin, or a later pre-hook prevents the ability from executing.
public Action FF2R_OnAbilityPre(int boss, const char[] ability, AbilityData cfg, bool &result)
{
    if (StrContains(ability, "rage_rtd_", false) == 0)
    {
        char plugin[64];
        cfg.GetString("plugin_name", plugin, sizeof(plugin), "<omitted>");
        RuntimeTrace("PRE boss=%d; ability=%s; plugin_name=%s; slot=%d; result_on_entry=%d",
            boss, ability, plugin, cfg.GetInt("slot", cfg.GetInt("arg0", 0)), result);
    }
    return Plugin_Continue;
}

public void FF2R_OnAbilityPost(int boss, const char[] ability, AbilityData cfg)
{
    if (StrContains(ability, "rage_rtd_", false) == 0)
        RuntimeTrace("POST boss=%d; ability=%s", boss, ability);
}

// A missed/suppressed start event must not permanently disable every ability.
// Recover only when the engine confirms live combat, after cleanup has fully
// unwound and at least one tick after the stop event. Round-end callbacks can
// still see the old engine state while that event is being processed.
void TryResumeRtdRound(RoundState state)
{
    if (!g_Ready || !g_RoundEnding || g_StopAllDepth > 0 || GetGameTickCount() <= g_LastStopTick)
        return;
    if (state != RoundState_RoundRunning && state != RoundState_Stalemate)
        return;
    g_RoundEnding = false;
    RuntimeTrace("RECOVER v%s: cleared stale round_ending; engine_state=%d; last_round_event=%s",
        RTD_PLUGIN_VERSION, state, g_LastRoundEvent);
}

public void FF2R_OnAbility(int boss, const char[] ability, AbilityData cfg)
{
    if (StrContains(ability, "rage_rtd_", false) != 0)
        return;
    int engineState = -1;
    if (g_Ready)
    {
        engineState = view_as<int>(GameRules_GetRoundState());
        TryResumeRtdRound(view_as<RoundState>(engineState));
    }
    RuntimeTrace("MAIN v%s; boss=%d; ability=%s; ready=%d; round_ending=%d; engine_state=%d; last_round_event=%s",
        RTD_PLUGIN_VERSION, boss, ability, g_Ready, g_RoundEnding, engineState, g_LastRoundEvent);
    if (!g_Ready || g_RoundEnding)
    {
        RuntimeTrace("REJECT %s: map not ready or round ending", ability);
        return;
    }
    if (!cfg.IsMyPlugin())
    {
        RuntimeTrace("REJECT %s: plugin_name does not match the loaded filename", ability);
        return;
    }
    if (!IsValidClient(boss) || !IsPlayerAlive(boss))
    {
        RuntimeTrace("REJECT %s: caster is not in game or alive", ability);
        return;
    }

    char token[64];
    strcopy(token, sizeof(token), ability[9]);
    int suffix = StrContains(token, "__");
    if (suffix != -1)
        token[suffix] = '\0';
    Perk perk = g_hPerkContainer.Get(token);
    if (perk == null)
    {
        LogError("Unknown RTD ability '%s'; use rage_rtd_<exact token>[__suffix]", ability);
        return;
    }
    bool instant = cfg.GetBool("instant", false);
    if (instant && perk.DefaultTime >= 0 && !StrEqual(token, "explode") && !StrEqual(token, "smite") && !StrEqual(token, "striptomelee"))
    {
        LogError("%s: instant mode is supported only by explode, smite and striptomelee", ability);
        return;
    }
    if (!ValidateSettings(perk, cfg.GetSection("settings")))
        return;

    char target[16];
    cfg.GetString("target", target, sizeof(target), "self");
    if (!StrEqual(target, "self") && !StrEqual(target, "enemies") && !StrEqual(target, "allies")
        && !StrEqual(target, "team") && !StrEqual(target, "all"))
    {
        LogError("%s: invalid target '%s'", ability, target);
        return;
    }
    float range = cfg.GetFloat("range", 0.0);
    int duration = cfg.GetInt("duration", perk.DefaultTime > 0 ? perk.DefaultTime : 10);
    if (range < 0.0 || (!instant && perk.DefaultTime >= 0 && duration < 1))
    {
        LogError("%s: range must be >= 0 and timed duration must be >= 1", ability);
        return;
    }

    // Build the list first: instant effects can kill the caster during iteration.
    int targets[MAXPLAYERS], count;
    float origin[3], pos[3];
    GetClientAbsOrigin(boss, origin);
    int team = GetClientTeam(boss);
    for (int client = 1; client <= MaxClients; client++)
    {
        if (!IsValidClient(client) || !IsPlayerAlive(client) || GetClientTeam(client) < 2)
            continue;
        bool sameTeam = GetClientTeam(client) == team;
        if (StrEqual(target, "self") && client != boss)
            continue;
        if (StrEqual(target, "enemies") && sameTeam)
            continue;
        if (StrEqual(target, "allies") && (!sameTeam || client == boss))
            continue;
        if (StrEqual(target, "team") && !sameTeam)
            continue;
        if (client != boss && !cfg.GetBool("affect_bosses", true) && FF2R_GetBossData(client))
            continue;
        GetClientAbsOrigin(client, pos);
        if (range > 0.0 && GetVectorDistance(origin, pos, true) > range * range)
            continue;
        if (client != boss && cfg.GetBool("line_of_sight", false) && !CanEntitySeeTarget(boss, client))
            continue;
        if (cfg.GetBool("respect_loadout", true) && !perk.IsAptForSetupOf(client))
            continue;
        targets[count++] = GetClientUserId(client);
    }

    RuntimeTrace("TARGETS %s: selected=%d; target=%s; range=%.1f; respect_loadout=%d; duration=%d",
        ability, count, target, range, cfg.GetBool("respect_loadout", true), duration);
    for (int i = 0; i < count; i++)
    {
        if (g_RoundEnding || !IsValidClient(boss) || !IsPlayerAlive(boss) || !FF2R_GetBossData(boss))
        {
            RuntimeTrace("REJECT %s: round ended or caster no longer an alive FF2R boss", ability);
            break;
        }
        int client = GetClientOfUserId(targets[i]);
        if (IsValidClient(client) && IsPlayerAlive(client))
            ApplyAbility(boss, client, perk, cfg, duration);
    }
}

bool ValidateSettings(Perk perk, ConfigData settings)
{
    if (!settings)
        return true;
    StringMapSnapshot keys = settings.Snapshot();
    bool valid = true;
    char key[128], value[128], token[32];
    perk.GetToken(token, sizeof(token));
    for (int i = 0; i < keys.Length; i++)
    {
        keys.GetKey(i, key, sizeof(key));
        float baseline, numeric;
        if (StrContains(key, "m_") == 0 || !perk.GetValue(key, baseline))
        {
            LogError("rage_rtd_%s: unknown setting '%s'", token, key);
            valid = false;
            continue;
        }
        if (!settings.GetString(key, value, sizeof(value)) || StringToFloatEx(value, numeric) != strlen(value))
        {
            LogError("rage_rtd_%s: setting '%s' must be numeric", token, key);
            valid = false;
            continue;
        }
        bool divisor = (StrEqual(token, "fasthands") && (StrEqual(key, "attack") || StrEqual(key, "reload")))
            || ((StrEqual(token, "bighead") || StrEqual(token, "tinymann")) && StrEqual(key, "scale"));
        if (divisor && numeric <= 0.0)
        {
            LogError("rage_rtd_%s: setting '%s' must be greater than zero", token, key);
            valid = false;
        }
    }
    delete keys;
    return valid;
}

void ApplyAbility(int boss, int client, Perk perk, AbilityData cfg, int duration)
{
    int previous = g_ContextEffect;
    g_ContextEffect = perk.Id;
    ApplyOneAbility(boss, client, perk, cfg, duration);
    g_ContextEffect = previous;
}

void ApplyOneAbility(int boss, int client, Perk perk, AbilityData cfg, int duration)
{
    if (g_Applying[client] || g_Removing[client])
    {
        RuntimeTrace("SKIP effect=%d; target=%d; applying=%d; removing=%d", perk.Id, client, g_Applying[client], g_Removing[client]);
        return;
    }
    if (g_hRollers.GetInRoll(client))
    {
        if (!cfg.GetBool("replace", false))
        {
            RuntimeTrace("SKIP effect=%d; target=%d; already active and replace=false", perk.Id, client);
            return;
        }
        RemovePerk(client, RTDRemove_NoPrint);
        if (!IsPlayerAlive(client))
            return;
    }

    g_CastSerial[client]++;
    int originalTime = perk.DefaultTime;
    bool instant = cfg.GetBool("instant", false);
    bool timed = originalTime >= 0 && !instant;
    GetClientAbsOrigin(client, g_StartOrigin[client]);
    Shared[client].ClassForPerk = TF2_GetPlayerClass(client);
    Shared[client].MaxHealth = GetTargetMaxHealth(client);
    g_Applying[client] = true;
    g_PendingStop[client] = false;
    g_OwnerUserId[client] = GetClientUserId(boss);
    int previousDuration = g_ApplyDuration;
    Perk previousPerk = g_ActivePerk;
    ConfigData previousSettings = g_ActiveSettings;
    bool previousInstant = g_ActiveInstant;
    // Settings are read only while the original apply callback runs; the effect
    // copies them into its client cache. Never mutate shared effect defaults.
    // Saving the context also handles a nested ability cast on another client.
    g_ActivePerk = perk;
    g_ActiveSettings = cfg.GetSection("settings");
    g_ActiveInstant = instant;
    g_ApplyDuration = duration;
    g_Sharpness[client] = ClampInt(perk.GetPrefCell("sharpness", 8), 1, 100);
    ConfigureAbilityText(client, boss, cfg, timed, duration);
    PlayAbilitySound(client, cfg);
    RuntimeTrace("APPLY effect=%d; boss=%d; target=%d; timed=%d; duration=%d", perk.Id, boss, client, timed, duration);
    perk.CallInternal(client, true, RTDRemove_NoPrint);
    g_ApplyDuration = previousDuration;
    g_ActivePerk = previousPerk;
    g_ActiveSettings = previousSettings;
    g_ActiveInstant = previousInstant;
    g_Applying[client] = false;
    g_hRollers.PushToPerkHistory(client, perk);
    g_hRollers.SetLastRollTime(client, GetTime());

    if (timed)
    {
        perk.IncrementActiveCount();
        g_hRollers.SetPerk(client, perk);
        g_hRollers.SetInRoll(client, true);
        g_hRollers.SetEndRollTime(client, GetTime() + duration);
        g_Text[client].EndsAt = GetGameTime() + float(duration);
        g_Text[client].MainUntil = g_Text[client].EndsAt;
        if (g_PendingStop[client] || !IsPlayerAlive(client))
            RemovePerk(client, RTDRemove_NoPrint);
        else
        {
            DataPack end;
            g_EndTimer[client] = CreateDataTimer(float(duration), Timer_EndEffect, end, TIMER_FLAG_NO_MAPCHANGE);
            end.WriteCell(GetClientUserId(client));
            end.WriteCell(g_ContextEffect);
        }
    }
    else
    {
        if (g_PendingStop[client] || g_RoundEnding || !IsValidClient(client) || !IsPlayerAlive(client))
        {
            Cache[client].Cleanup();
            ReleaseEffectState(g_ContextEffect, client);
            g_CastSerial[client]++;
            ClearAbilityHud(client);
        }
        g_OwnerUserId[client] = 0;
    }
}

void ConfigureAbilityText(int client, int boss, AbilityData cfg, bool timed, int duration)
{
    ClearAbilityHud(client);
    g_Text[client].Owner = GetClientUserId(boss);
    g_Text[client].Timed = timed;
    g_Text[client].Duration = timed ? duration : 0;
    g_Text[client].Count = 0;
    g_Text[client].Maximum = 0;
    g_Text[client].Damage = 0;
    g_Text[client].EndsAt = GetGameTime() + float(g_Text[client].Duration);
    g_Text[client].Lifetime = cfg.GetFloat("message_duration", 3.0);
    if (g_Text[client].Lifetime < 0.1)
        g_Text[client].Lifetime = 0.1;
    g_Text[client].X = cfg.GetFloat("message_x", -1.0);
    g_Text[client].Y = cfg.GetFloat("message_y", 0.30);
    g_Text[client].X = g_Text[client].X < 0.0 ? -1.0 : Min(g_Text[client].X, 1.0);
    g_Text[client].Y = g_Text[client].Y < 0.0 ? -1.0 : Min(g_Text[client].Y, 1.0);

    char color[64], components[4][16];
    cfg.GetString("message_color", color, sizeof(color), "255 255 255 255");
    int count = ExplodeString(color, " ", components, sizeof(components), sizeof(components[]));
    for (int i = 0; i < 4; i++)
        g_Text[client].Color[i] = i < count ? ClampInt(StringToInt(components[i]), 0, 255) : 255;

    cfg.GetString("message", g_Text[client].Message, sizeof(g_Text[].Message));
    g_Text[client].MainUntil = timed ? g_Text[client].EndsAt : GetGameTime() + g_Text[client].Lifetime;
    delete g_NoticeStore[g_ContextEffect][client];
    g_NoticeStore[g_ContextEffect][client] = new StringMap();
    ConfigData messages = cfg.GetSection("messages");
    for (int i = 0; i < view_as<int>(Notice_Count); i++)
    {
        char message[512];
        if (messages && messages.GetString(g_NoticeKeys[i], message, sizeof(message)) && message[0])
            g_NoticeStore[g_ContextEffect][client].SetString(g_NoticeKeys[i], message);
    }
    UpdateAbilityText(client);
}

void FormatAbilityText(int client, const char[] pattern, char[] buffer, int length)
{
    strcopy(buffer, length, pattern);
    char number[24];
    int remaining = g_Text[client].Timed ? RoundToCeil(g_Text[client].EndsAt - GetGameTime()) : 0;
    IntToString(remaining > 0 ? remaining : 0, number, sizeof(number));
    ReplaceString(buffer, length, "{time}", number);
    IntToString(g_Text[client].Duration, number, sizeof(number));
    ReplaceString(buffer, length, "{duration}", number);
    IntToString(g_Text[client].Count, number, sizeof(number));
    ReplaceString(buffer, length, "{count}", number);
    IntToString(g_Text[client].Maximum, number, sizeof(number));
    ReplaceString(buffer, length, "{max}", number);
    IntToString(g_Text[client].Damage, number, sizeof(number));
    ReplaceString(buffer, length, "{damage}", number);
    ReplaceString(buffer, length, "\\n", "\n");
}

void DrawAbilityText(int client, bool notice)
{
    if (IsFakeClient(client)) return;
    int previous = g_ContextEffect, style = -1;
    char combined[2048], line[1024];
    float now = GetGameTime();
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        g_ContextEffect = effect;
        if (notice ? !g_Text[client].Notice[0] || g_Text[client].NoticeUntil <= now
                   : !g_Text[client].Message[0] || g_Text[client].MainUntil <= now)
            continue;
        if (style == -1) style = effect;
        FormatAbilityText(client, notice ? g_Text[client].Notice : g_Text[client].Message, line, sizeof(line));
        if (combined[0]) StrCat(combined, sizeof(combined), "\n");
        StrCat(combined, sizeof(combined), line);
    }
    if (style != -1)
    {
        g_ContextEffect = style;
        float y = g_Text[client].Y;
        if (notice) y = y < 0.0 ? 0.56 : Min(y + 0.065, 0.95);
        SetHudTextParams(g_Text[client].X, y, 0.35,
            g_Text[client].Color[0], g_Text[client].Color[1], g_Text[client].Color[2], g_Text[client].Color[3],
            0, 0.0, 0.0, 0.0);
        ShowSyncHudText(client, notice ? g_NoticeHud : g_MessageHud, "%s", combined);
    }
    else ClearSyncHud(client, notice ? g_NoticeHud : g_MessageHud);
    g_ContextEffect = previous;
}

void UpdateAbilityText(int client)
{
    DrawAbilityText(client, false);
    DrawAbilityText(client, true);
}

public Action Timer_AbilityText(Handle timer)
{
    if (g_Ready)
    {
        for (int client = 1; client <= MaxClients; client++)
        {
            if (!IsClientInGame(client)) continue;
            DrawAbilityText(client, false);
            DrawAbilityText(client, true);
        }
    }
    return Plugin_Continue;
}

void ClearAbilityHud(int client, bool clearNotice = true)
{
    g_Text[client].MainUntil = 0.0;
    g_Text[client].Message[0] = '\0';
    if (clearNotice)
    {
        g_Text[client].NoticeUntil = 0.0;
        g_Text[client].Notice[0] = '\0';
        g_Text[client].Owner = 0;
    }
    if (IsClientInGame(client) && g_MessageHud != null)
    {
        DrawAbilityText(client, false);
        if (clearNotice) DrawAbilityText(client, true);
    }
}

void NotifyAbility(int client, AbilityNotice notice, int count = 0, int maximum = 0, int damage = 0)
{
    if (!IsValidClient(client))
        return;
    g_Text[client].Count = count;
    g_Text[client].Maximum = maximum;
    g_Text[client].Damage = damage;
    // Omitted and explicitly empty event messages are both silent.
    if (g_NoticeStore[g_ContextEffect][client] == null
        || !g_NoticeStore[g_ContextEffect][client].GetString(g_NoticeKeys[notice], g_Text[client].Notice, sizeof(g_Text[].Notice)))
        return;
    g_Text[client].NoticeUntil = GetGameTime() + g_Text[client].Lifetime;
    DrawAbilityText(client, true);
}

void PlayAbilitySound(int client, AbilityData cfg)
{
    char sound[PLATFORM_MAX_PATH];
    cfg.GetString("sound", sound, sizeof(sound));
    TrimString(sound);
    if (!sound[0])
        return;

    // Config paths are relative to the game's sound directory. No default sound
    // is selected when this key is omitted or left empty.
    if (!PrecacheSound(sound, true))
    {
        LogError("Unable to precache ability sound '%s'", sound);
        return;
    }
    EmitSoundToAll(sound, client);
}

// Keep the effective max health observed by SDKHooks, including weapon and
// player attributes. The raw entity field is only a fallback before the hook runs.
int GetTargetMaxHealth(int client)
{
    BossData boss = FF2R_GetBossData(client);
    if (boss)
        return boss.MaxHealth;
    return Shared[client].MaxHealth > 0 ? Shared[client].MaxHealth
        : GetEntProp(client, Prop_Data, "m_iMaxHealth");
}

public Action Timer_EndEffect(Handle timer, DataPack data)
{
    data.Reset();
    int client = GetClientOfUserId(data.ReadCell());
    int previous = g_ContextEffect;
    g_ContextEffect = data.ReadCell();
    if (client && g_EndTimer[client] == timer)
    {
        g_EndTimer[client] = null;
        RemovePerk(client, RTDRemove_WearOff);
    }
    g_ContextEffect = previous;
    return Plugin_Stop;
}

Perk RemovePerk(int client, RTDRemoveReason reason = RTDRemove_WearOff)
{
    if (g_Applying[client])
    {
        g_PendingStop[client] = true;
        return null;
    }
    Perk perk = g_hRollers.GetPerk(client);
    if (perk == null || g_Removing[client])
        return perk;
    g_Removing[client] = true;
    g_RemovalReasonStore[g_ContextEffect][client] = reason;
    g_CastSerial[client]++;
    delete g_EndTimer[client];
    // Clear the countdown before the original removal callback. Natural expiry
    // may produce a result notice, such as damage dealt or buildings spawned.
    ClearAbilityHud(client, reason != RTDRemove_WearOff);
    if (IsClientInGame(client))
    {
        if (reason != RTDRemove_WearOff)
        {
            // Original bombs check their clocks instead of the removal reason.
            // Suppress detonation when the boss/round/plugin ends or on replace.
            g_hRollers.SetEndRollTime(client, GetTime() + 60);
            char token[32];
            perk.GetToken(token, sizeof(token));
            if (StrEqual(token, "timebomb") || StrEqual(token, "firetimebomb"))
                Cache[client].Float[3] = GetEngineTime() + 60.0;
        }
        perk.CallInternal(client, false, reason);
    }
    ReleaseEffectState(g_ContextEffect, client);
    perk.DecrementActiveCount();
    Cache[client].Cleanup();
    g_hRollers.SetInRoll(client, false);
    g_hRollers.SetPerk(client, null);
    g_hRollers.SetLastRollTime(client, GetTime());
    g_OwnerUserId[client] = 0;
    g_Removing[client] = false;
    return perk;
}

void StopAllEffects(RTDRemoveReason reason)
{
    g_StopAllDepth++;
    g_LastStopTick = GetGameTickCount();
    g_RoundEnding = true;
    g_RoundSerial++;
    for (int client = 1; client <= MaxClients; client++)
        RemoveClientEffects(client, reason);
    // Invalidate cache DataPacks before killing raw effect timers. Their native
    // TIMER_DATA_HNDL_CLOSE flag still owns and closes the original timer data.
    CancelEffectTimers();
    g_EffectEntities.Clear();
    if (g_hHoming != null)
        g_hHoming.Clear();
    // Pending apply callbacks retain their original layers until they unwind.
    g_StopAllDepth--;
}

public void Event_Death(Event event, const char[] name, bool dontBroadcast)
{
    if (event.GetInt("death_flags") & TF_DEATHFLAG_DEADRINGER)
        return;
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (!client)
        return;
    DispatchPlayerDied(client);
    RemoveClientEffects(client, RTDRemove_Death);
}

public void Event_ClassChange(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (client && view_as<int>(TF2_GetPlayerClass(client)) != event.GetInt("class"))
    {
        RemoveClientEffects(client, RTDRemove_ClassChange);
    }
}

public void Event_Reset(Event event, const char[] name, bool dontBroadcast)
{
    strcopy(g_LastRoundEvent, sizeof(g_LastRoundEvent), name);
    StopAllEffects(RTDRemove_NoPrint);
    // FF2R starts combat on arena_round_start or teamplay_setup_finished.
    // Listening only for teamplay_round_start can leave the previous round's
    // ending flag set and silently reject every RTD ability in the new round.
    if (StrEqual(name, "teamplay_round_start") || StrEqual(name, "arena_round_start")
        || StrEqual(name, "teamplay_setup_finished"))
        g_RoundEnding = false;
    RuntimeTrace("ROUND event=%s; round_ending=%d", name, g_RoundEnding);
}

public void Event_Resupply(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (client)
        DispatchResupply(client);
}

public void Event_PlayerHurt(Event event, const char[] name, bool dontBroadcast)
{
    int victim = GetClientOfUserId(event.GetInt("userid"));
    int attacker = GetClientOfUserId(event.GetInt("attacker"));
    if (victim && attacker)
        DispatchPlayerAttacked(attacker, victim, event.GetInt("damageamount"), event.GetInt("health"));
}

public void Event_UberchargeDeployed(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    int target = GetClientOfUserId(event.GetInt("targetid"));
    if (client)
        DispatchUberchargeDeployed(client, target);
}

public Action Listener_Voice(int client, const char[] command, int argc)
{
    if (IsValidClient(client))
        DispatchVoice(client);
    return Plugin_Continue;
}

public Action Listener_Sound(int clients[MAXPLAYERS], int &numClients, char sample[PLATFORM_MAX_PATH], int &entity, int &channel, float &volume, int &level, int &pitch, int &flags, char entry[PLATFORM_MAX_PATH], int &seed)
{
    if (!IsValidClient(entity))
        return Plugin_Continue;
    return Stocks_Sound(entity, sample) && DispatchSound(entity, sample) ? Plugin_Continue : Plugin_Stop;
}

public void OnEntityCreated(int entity, const char[] classname)
{
    if (g_Ready && DispatchClassnameHasSubscribers(classname))
        SDKHook(entity, SDKHook_SpawnPost, Ability_EntitySpawned);
}

public void Ability_EntitySpawned(int entity)
{
    DispatchEntitySpawned(entity);
}

public void OnGameFrame()
{
    if (g_Ready && g_hHoming != null)
        Homing_OnGameFrame();
}

public void TF2_OnConditionAdded(int client, TFCond condition)
{
    if (g_Ready)
        DispatchConditionAdded(client, condition);
}

public void TF2_OnConditionRemoved(int client, TFCond condition)
{
    if (g_Ready)
        DispatchConditionRemoved(client, condition);
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float velocity[3], float angles[3], int &weapon)
{
    if (g_Ready && IsValidClient(client) && DispatchPlayerRunCmd(client, buttons, velocity, angles))
        return Plugin_Changed;
    return Plugin_Continue;
}

public Action TF2_CalcIsAttackCritical(int client, int weapon, char[] weaponName, bool &result)
{
    if (!g_Ready || !IsValidClient(client) || !DispatchAttackCritCheck(client, weapon))
        return Plugin_Continue;
    result = true;
    return Plugin_Changed;
}

public void Ability_HeavyRocketSpawned(int client, int rocket)
{
    DataPack data;
    CreateEffectDataTimer(0.0, Timer_HeavyRocket, data, TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);
    data.WriteCell(EntIndexToEntRef(rocket));
    data.WriteCell(g_Sharpness[client]);
}

public Action Timer_HeavyRocket(Handle timer, DataPack data)
{
    data.Reset();
    int rocket = EntRefToEntIndex(data.ReadCell());
    int sharpness = data.ReadCell();
    if (rocket <= MaxClients)
        return Plugin_Stop;
    float pos[3];
    GetEntPropVector(rocket, Prop_Send, "m_vecOrigin", pos);
    pos[2] -= 100.0;
    Homing_TurnToTarget(pos, rocket, sharpness);
    return Plugin_Continue;
}

void Ability_HideFrozenWearable(int entity)
{
    Frozen_SetEntityAlpha(entity, 0);
}

// Generic wearable detection shared with the retained Frozen effect.
stock bool IsCorrectWearable(const int client, const int iEnt, char[] sClass, const int iBufferSize)
{
	if (!IsValidEntity(iEnt))
		return false;

	GetEdictClassname(iEnt, sClass, iBufferSize);
	if (StrContains(sClass, "tf_wearable", false) < 0 && StrContains(sClass, "tf_powerup", false) < 0)
		return false;

	if (GetEntPropEnt(iEnt, Prop_Send, "m_hOwnerEntity") != client)
		return false;

	return true;
}

// Compatibility helpers used by the included original effect code.
void FixPotentialStuck(int client)
{
    if (IsValidClient(client))
        CreateEffectTimer(0.1, Timer_FixAbilityStuck, GetClientUserId(client), TIMER_FLAG_NO_MAPCHANGE);
}

public Action Timer_FixAbilityStuck(Handle timer, any userid)
{
    int client = GetClientOfUserId(userid);
    if (!IsValidClient(client) || !IsPlayerAlive(client) || !IsEntityStuck(client))
        return Plugin_Stop;
    // Returning to the cast location preserves FF2 boss health and loadout.
    float previous[3];
    GetClientAbsOrigin(client, previous);
    TeleportEntity(client, g_StartOrigin[client], NULL_VECTOR, NULL_VECTOR);
    if (IsEntityStuck(client))
        TeleportEntity(client, previous, NULL_VECTOR, NULL_VECTOR);
    return Plugin_Stop;
}

int GetPerkTime(Perk perk) { return g_ApplyDuration > 0 ? g_ApplyDuration : (perk.Time > 0 ? perk.Time : 10); }
float GetPerkTimeFloat(Perk perk) { return float(GetPerkTime(perk)); }
bool IsPlayerFriendly(int client) { return !IsValidClient(client); }

bool IsRecentPerk(int client, Perk perk, int delta = 2)
{
    Perk current = g_hRollers.GetPerk(client);
    if (current == perk)
        return true;
    return current == null && g_hRollers.IsInPerkHistory(client, perk, 1)
        && GetTime() - g_hRollers.GetLastRollTime(client) <= delta;
}

bool CanPlayerBeHurt(int client, int by = 0, bool allowSelf = false)
{
    if (!IsValidClient(client) || !IsPlayerAlive(client))
        return false;
    if (IsValidClient(by) && GetClientTeam(by) == GetClientTeam(client) && (client != by || !allowSelf))
        return false;
    return !TF2_IsPlayerInCondition(client, TFCond_Ubercharged)
        && !TF2_IsPlayerInCondition(client, TFCond_UberchargedCanteen)
        && GetEntProp(client, Prop_Data, "m_takedamage") == 2 && !g_eInGodmode.Test(client);
}

// Compatibility signature for unused utilities declared in the shared RTD stocks.
// This subplugin never prints the original RTD chat messages.
stock void RTDPrint(int client, const char[] format, any ...)
{
    #pragma unused client
    #pragma unused format
}

// Explicit RTD entry points (equivalent to DEFINE_CALL_* in rtd/macros.sp).
public void Toxic_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Toxic_ApplyPerk(client, perk); else Toxic_RemovePerk(client, reason); }
public void Noclip_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Noclip_ApplyPerk(client, perk); else Noclip_RemovePerk(client, reason); }
public void InfiniteAmmo_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) InfiniteAmmo_ApplyPerk(client, perk); }
public void ScaryBullets_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) ScaryBullets_ApplyPerk(client, perk); }
public void SpawnSentry_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) SpawnSentry_ApplyPerk(client, perk); }
public void HomingProjectiles_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) HomingProjectiles_ApplyPerk(client, perk); else HomingProjectiles_RemovePerk(client, reason); }
public void Explode_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Explode_ApplyPerk(client, perk); else Explode_RemovePerk(client, reason); }
public void Snail_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Snail_ApplyPerk(client, perk); else Snail_RemovePerk(client, reason); }
public void Frozen_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{
    if (apply)
    {
        Frozen_ApplyPerk(client, perk);
        // Original wearables still exist and Frozen_Set restores them on removal.
        // No resupply or delayed health correction may leak into a later cast.
        Cache[client].Flags.Unset(view_as<int>(Frozen_State_ResupplyNeeded));
    }
    else
        Frozen_RemovePerk(client, reason);
}
public void Timebomb_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Timebomb_ApplyPerk(client, perk); else Timebomb_RemovePerk(client, reason); }
public void LowHealth_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) LowHealth_ApplyPerk(client, perk); }
public void Drugged_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Drugged_ApplyPerk(client, perk); }
public void Blind_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Blind_ApplyPerk(client, perk); else Blind_RemovePerk(client, reason); }
public void StripToMelee_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) StripToMelee_ApplyPerk(client, perk); }
public void Beacon_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Beacon_ApplyPerk(client, perk); }
public void ForcedTaunt_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) ForcedTaunt_ApplyPerk(client, perk); }
public void Monochromia_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Monochromia_ApplyPerk(client, perk); else Monochromia_RemovePerk(client, reason); }
public void Earthquake_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Earthquake_ApplyPerk(client, perk); else Earthquake_RemovePerk(client, reason); }
public void FunnyFeeling_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) FunnyFeeling_ApplyPerk(client, perk); else FunnyFeeling_RemovePerk(client, reason); }
public void BadSauce_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) BadSauce_ApplyPerk(client, perk); }
public void SpawnDispenser_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) SpawnDispenser_ApplyPerk(client, perk); }
public void InfiniteJump_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ }
public void PowerfulHits_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) PowerfulHits_ApplyPerk(client, perk); else PowerfulHits_RemovePerk(client, reason); }
public void BigHead_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) BigHead_ApplyPerk(client, perk); else BigHead_RemovePerk(client, reason); }
public void TinyMann_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) TinyMann_ApplyPerk(client, perk); else TinyMann_RemovePerk(client, reason); }
public void Firework_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Firework_ApplyPerk(client, perk); }
public void DeadlyVoice_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) DeadlyVoice_ApplyPerk(client, perk); }
public void EyeForAnEye_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ }
public void Weakened_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Weakened_ApplyPerk(client, perk); else Weakened_RemovePerk(client, reason); }
public void NecroMash_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) NecroMash_ApplyPerk(client, perk); }
public void ExtraAmmo_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) ExtraAmmo_ApplyPerk(client, perk); }
public void Suffocation_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Suffocation_ApplyPerk(client, perk); }
public void FastHands_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) FastHands_ApplyPerk(client, perk); else FastHands_RemovePerk(client, reason); }
public void Outline_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Outline_ApplyPerk(client, perk); else Outline_RemovePerk(client, reason); }
public void TeamCriticals_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) TeamCriticals_ApplyPerk(client, perk); else TeamCriticals_RemovePerk(client, reason); }
public void FireTimebomb_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) FireTimebomb_ApplyPerk(client, perk); else FireTimebomb_RemovePerk(client, reason); }
public void FireBreath_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) FireBreath_ApplyPerk(client, perk); }
public void StrongRecoil_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ }
public void Cursed_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ }
public void ExtraThrowables_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) ExtraThrowables_ApplyPerk(client, perk); }
public void ExplosiveArrows_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) ExplosiveArrows_ApplyPerk(client, perk); }
public void InclineProblem_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) InclineProblem_ApplyPerk(client, perk); else InclineProblem_RemovePerk(client, reason); }
public void SpringShoes_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) SpringShoes_ApplyPerk(client, perk); else SpringShoes_RemovePerk(client, reason); }
public void Lag_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Lag_ApplyPerk(client, perk); else Lag_RemovePerk(client, reason); }
public void DrugBullets_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) DrugBullets_ApplyPerk(client, perk); }
public void LongMelee_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) LongMelee_ApplyPerk(client, perk); else LongMelee_RemovePerk(client, reason); }
public void HatThrow_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) HatThrow_ApplyPerk(client, perk); }
public void MadarasWhistle_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) MadarasWhistle_ApplyPerk(client, perk); }
public void Sickness_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Sickness_ApplyPerk(client, perk); }
public void WastedRoll_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ }
public void DrunkWalk_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) DrunkWalk_ApplyPerk(client, perk); else DrunkWalk_RemovePerk(client, reason); }
public void HellsReach_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) HellsReach_ApplyPerk(client, perk); else HellsReach_RemovePerk(client, reason); }
public void CursedProjectiles_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) CursedProjectiles_ApplyPerk(client, perk); }
public void Vampire_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Vampire_ApplyPerk(client, perk); }
public void BatSwarm_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) BatSwarm_ApplyPerk(client, perk); else BatSwarm_RemovePerk(client, reason); }
public void PumpkinTrail_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) PumpkinTrail_ApplyPerk(client, perk); }
public void ACallBeyond_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) ACallBeyond_ApplyPerk(client, perk); }
public void Smite_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Smite_ApplyPerk(client, perk); else Smite_RemovePerk(client, reason); }
public void OverhealBonus_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) OverhealBonus_ApplyPerk(client, perk); else OverhealBonus_RemovePerk(client, reason); }
public void SunlightSpear_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) SunlightSpear_ApplyPerk(client, perk); }
public void EldenStars_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) EldenStars_ApplyPerk(client, perk); else EldenStars_RemovePerk(client, reason); }
public void Frog_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Frog_ApplyPerk(client, perk); else Frog_RemovePerk(client, reason); }
public void Paranoia_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Paranoia_ApplyPerk(client, perk); }
public void HeavyRockets_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ }
public void WeaponMixup_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) WeaponMixup_ApplyPerk(client, perk); else WeaponMixup_RemovePerk(client, reason); }
public void Autoheal_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) Autoheal_ApplyPerk(client, perk); else Autoheal_RemovePerk(client, reason); }
public void TeamAutoheal_Call(int client, Perk perk, bool apply, RTDRemoveReason reason)
{ if (apply) TeamAutoheal_ApplyPerk(client, perk); else TeamAutoheal_RemovePerk(client, reason); }

// BEGIN EMBEDDED EFFECT DEFAULTS
void RegisterEffects()
{
    Perk perk;
    perk = g_hPerkContainer.Add("toxic", "Toxic_Call", "Toxic_Init", "0", "0", 0);
    perk.SetPref("radius", "192.0");
    perk.SetPref("interval", "0.2");
    perk.SetPref("damage", "20.0");
    perk = g_hPerkContainer.Add("flying", "Noclip_Call", "Noclip_Init", "0", "0", 0);
    perk.SetPref("mode", "0");
    perk = g_hPerkContainer.Add("infiniteammo", "InfiniteAmmo_Call", "", "0", "0", 0);
    perk.SetPref("reload", "0");
    perk = g_hPerkContainer.Add("scarybullets", "ScaryBullets_Call", "ScaryBullets_Init", "0", "0", 0);
    perk.SetPref("duration", "3");
    perk.SetPref("min_damage", "5");
    perk = g_hPerkContainer.Add("spawnsentry", "SpawnSentry_Call", "SpawnSentry_Init", "0", "0", 0);
    perk.SetPref("level", "3");
    perk.SetPref("keep", "0");
    perk.SetPref("amount", "1");
    perk = g_hPerkContainer.Add("homingprojectiles", "HomingProjectiles_Call", "HomingProjectiles_Init", "0", "rocketl, particle_c, flaregun, crossbow, compound", 0);
    perk.SetPref("crits", "0");
    perk = g_hPerkContainer.Add("explode", "Explode_Call", "Explode_Init", "0", "0", 0);
    perk.SetPref("range", "100");
    perk.SetPref("health", "1500");
    perk = g_hPerkContainer.Add("snail", "Snail_Call", "", "0", "0", 0);
    perk.SetPref("multiplier", "0.4");
    perk = g_hPerkContainer.Add("frozen", "Frozen_Call", "Frozen_Init", "0", "0", 0);
    perk.SetPref("ice_health", "500");
    perk.SetPref("resistance", "0.1");
    perk.SetPref("flame_buff", "5.0");
    perk.SetPref("breakable", "1");
    perk.SetPref("muffle", "1");
    perk.SetPref("volume", "50");
    perk.SetPref("legacy", "0");
    perk = g_hPerkContainer.Add("timebomb", "Timebomb_Call", "Timebomb_Init", "0", "0", 10);
    perk.SetPref("radius", "512.0");
    perk.SetPref("damage", "800.0");
    perk.SetPref("resistance", "1.0");
    perk.SetPref("headshot", "0.1");
    perk = g_hPerkContainer.Add("ignition", "Ignition_Call", "", "0", "0", -1);
    perk = g_hPerkContainer.Add("lowhealth", "LowHealth_Call", "", "0", "0", -1);
    perk.SetPref("health", "7");
    perk = g_hPerkContainer.Add("drugged", "Drugged_Call", "", "0", "0", 0);
    perk.SetPref("interval", "1.0");
    perk = g_hPerkContainer.Add("blind", "Blind_Call", "Blind_Init", "0", "0", 0);
    perk.SetPref("alpha", "254");
    perk.SetPref("annotations", "0");
    perk.SetPref("unblind", "0");
    perk = g_hPerkContainer.Add("striptomelee", "StripToMelee_Call", "StripToMelee_Init", "0", "0", 0);
    perk.SetPref("fullhealth", "0");
    perk.SetPref("boxhealth", "300");
    perk.SetPref("flingspeed", "2000");
    perk = g_hPerkContainer.Add("beacon", "Beacon_Call", "Beacon_Init", "0", "0", 0);
    perk.SetPref("interval", "0.5");
    perk.SetPref("radius", "375.0");
    perk = g_hPerkContainer.Add("forcedtaunt", "ForcedTaunt_Call", "ForcedTaunt_Init", "0", "0", 0);
    perk.SetPref("interval", "1.0");
    perk = g_hPerkContainer.Add("monochromia", "Monochromia_Call", "", "0", "0", 0);
    perk = g_hPerkContainer.Add("earthquake", "Earthquake_Call", "", "0", "0", 0);
    perk.SetPref("amplitude", "25.0");
    perk.SetPref("frequency", "25.0");
    perk = g_hPerkContainer.Add("funnyfeeling", "FunnyFeeling_Call", "FunnyFeeling_Init", "0", "0", 0);
    perk.SetPref("fov", "360");
    perk = g_hPerkContainer.Add("badsauce", "BadSauce_Call", "BadSauce_Init", "0", "0", 0);
    perk.SetPref("milk", "0");
    perk.SetPref("jarate", "0");
    perk.SetPref("bleed", "5.0");
    perk = g_hPerkContainer.Add("spawndispenser", "SpawnDispenser_Call", "SpawnDispenser_Init", "0", "0", 0);
    perk.SetPref("level", "3");
    perk.SetPref("keep", "1");
    perk.SetPref("amount", "1");
    perk = g_hPerkContainer.Add("infinitejump", "InfiniteJump_Call", "InfiniteJump_Init", "1", "0", 0);
    perk = g_hPerkContainer.Add("powerfulhits", "PowerfulHits_Call", "PowerfulHits_Init", "0", "0", 0);
    perk.SetPref("multiplier", "3.0");
    perk = g_hPerkContainer.Add("bighead", "BigHead_Call", "BigHead_Init", "0", "0", 0);
    perk.SetPref("scale", "4.0");
    perk = g_hPerkContainer.Add("tinymann", "TinyMann_Call", "", "0", "0", 0);
    perk.SetPref("scale", "0.35");
    perk.SetPref("boost", "0");
    perk = g_hPerkContainer.Add("firework", "Firework_Call", "Firework_Init", "0", "0", -1);
    perk.SetPref("force", "4096");
    perk.SetPref("damage", "-1");
    perk.SetPref("ignite", "0");
    perk = g_hPerkContainer.Add("deadlyvoice", "DeadlyVoice_Call", "DeadlyVoice_Init", "0", "0", 0);
    perk.SetPref("rate", "0.8");
    perk.SetPref("range", "200.0");
    perk.SetPref("damage", "150.0");
    perk = g_hPerkContainer.Add("eyeforaneye", "EyeForAnEye_Call", "EyeForAnEye_Init", "0", "0", 0);
    perk = g_hPerkContainer.Add("weakened", "Weakened_Call", "", "0", "0", 0);
    perk.SetPref("multiplier", "2.5");
    perk = g_hPerkContainer.Add("necromash", "NecroMash_Call", "NecroMash_Init", "0", "0", -1);
    perk = g_hPerkContainer.Add("extraammo", "ExtraAmmo_Call", "", "0", "0", -1);
    perk.SetPref("multiplier", "5.0");
    perk = g_hPerkContainer.Add("suffocation", "Suffocation_Call", "", "0", "0", 0);
    perk.SetPref("delay", "12.0");
    perk.SetPref("rate", "1.0");
    perk.SetPref("damage", "5");
    perk = g_hPerkContainer.Add("fasthands", "FastHands_Call", "FastHands_Init", "0", "0", 0);
    perk.SetPref("attack", "2.0");
    perk.SetPref("reload", "2.5");
    perk = g_hPerkContainer.Add("outline", "Outline_Call", "", "0", "0", 0);
    perk = g_hPerkContainer.Add("teamcriticals", "TeamCriticals_Call", "TeamCriticals_Init", "0", "0", 0);
    perk.SetPref("range", "325");
    perk.SetPref("crits", "1");
    perk.SetPref("mark_death", "0");
    perk = g_hPerkContainer.Add("firetimebomb", "FireTimebomb_Call", "FireTimebomb_Init", "0", "0", 10);
    perk.SetPref("radius", "750.0");
    perk.SetPref("resistance", "0.75");
    perk.SetPref("headshot", "0.1");
    perk = g_hPerkContainer.Add("firebreath", "FireBreath_Call", "FireBreath_Init", "0", "0", 0);
    perk.SetPref("rate", "2.7");
    perk.SetPref("crit", "0.05");
    perk = g_hPerkContainer.Add("strongrecoil", "StrongRecoil_Call", "StrongRecoil_Init", "0", "0", 0);
    perk = g_hPerkContainer.Add("cursed", "Cursed_Call", "Cursed_Init", "0", "0", 0);
    perk = g_hPerkContainer.Add("extrathrowables", "ExtraThrowables_Call", "", "0", "bat_wood, bat_gift, cleaver, jar, lunchbox", -1);
    perk.SetPref("amount", "20");
    perk = g_hPerkContainer.Add("explosivearrows", "ExplosiveArrows_Call", "ExplosiveArrows_Init", "", "crossbow, compound_bow", 0);
    perk.SetPref("damage", "50");
    perk.SetPref("radius", "80");
    perk.SetPref("force", "150");
    perk = g_hPerkContainer.Add("inclineproblem", "InclineProblem_Call", "", "0", "0", 0);
    perk = g_hPerkContainer.Add("springshoes", "SpringShoes_Call", "SpringShoes_Init", "0", "0", 0);
    perk = g_hPerkContainer.Add("lag", "Lag_Call", "", "0", "0", 0);
    perk = g_hPerkContainer.Add("drugbullets", "DrugBullets_Call", "DrugBullets_Init", "0", "0", 0);
    perk.SetPref("min_damage", "5");
    perk = g_hPerkContainer.Add("longmelee", "LongMelee_Call", "LongMelee_Init", "0", "0", 0);
    perk.SetPref("multiplier", "10");
    perk = g_hPerkContainer.Add("hatthrow", "HatThrow_Call", "HatThrow_Init", "0", "0", 0);
    perk.SetPref("rate", "2.5");
    perk.SetPref("speed", "1100");
    perk.SetPref("damage", "150");
    perk = g_hPerkContainer.Add("madaraswhistle", "MadarasWhistle_Call", "MadarasWhistle_Init", "0", "0", 0);
    perk.SetPref("rate", "2.0");
    perk.SetPref("delay", "1.0");
    perk.SetPref("range", "100");
    perk.SetPref("damage", "500");
    perk.SetPref("selfdamage", "200");
    perk = g_hPerkContainer.Add("sickness", "Sickness_Call", "Sickness_Init", "0", "0", 0);
    perk.SetPref("infect", "0");
    perk.SetPref("range", "100.0");
    perk.SetPref("mindamage", "5");
    perk.SetPref("maxdamage", "10");
    perk = g_hPerkContainer.Add("wastedroll", "WastedRoll_Call", "", "0", "0", -1);
    perk = g_hPerkContainer.Add("drunkwalk", "DrunkWalk_Call", "DrunkWalk_Init", "0", "0", 0);
    perk.SetPref("minspeed", "0.15");
    perk.SetPref("maxspeed", "2.0");
    perk.SetPref("turnangle", "25.0");
    perk = g_hPerkContainer.Add("hellsreach", "HellsReach_Call", "HellsReach_Init", "0", "0", 0);
    perk.SetPref("mindamage", "5");
    perk.SetPref("maxdamage", "35");
    perk = g_hPerkContainer.Add("cursedprojectiles", "CursedProjectiles_Call", "CursedProjectiles_Init", "0", "rocketl, particle_c, flaregun, crossbow, compound", 0);
    perk.SetPref("delay", "1.0");
    perk = g_hPerkContainer.Add("vampire", "Vampire_Call", "Vampire_Init", "0", "0", 0);
    perk.SetPref("mindamage", "1");
    perk.SetPref("maxdamage", "3");
    perk.SetPref("resistance", "3.0");
    perk = g_hPerkContainer.Add("batswarm", "BatSwarm_Call", "BatSwarm_Init", "0", "0", 0);
    perk.SetPref("rate", "0.35");
    perk.SetPref("lifetime", "1.0");
    perk.SetPref("amount", "2");
    perk.SetPref("speed", "0.25");
    perk.SetPref("legacy", "1");
    perk = g_hPerkContainer.Add("pumpkintrail", "PumpkinTrail_Call", "PumpkinTrail_Init", "0", "0", 0);
    perk.SetPref("rate", "3.0");
    perk.SetPref("range", "150.0");
    perk.SetPref("damage", "80.0");
    perk.SetPref("amount", "5");
    perk = g_hPerkContainer.Add("acallbeyond", "ACallBeyond_Call", "ACallBeyond_Init", "0", "0", 0);
    perk.SetPref("rate", "3.0");
    perk.SetPref("damage", "40.0");
    perk.SetPref("amount", "6");
    perk = g_hPerkContainer.Add("smite", "Smite_Call", "Smite_Init", "0", "0", 0);
    perk.SetPref("initial_damage", "1.0");
    perk.SetPref("damage_ticks", "3");
    perk.SetPref("tick_damage", "0.04");
    perk.SetPref("slowdown", "0.2");
    perk = g_hPerkContainer.Add("overhealbonus", "OverhealBonus_Call", "OverhealBonus_Init", "0", "tf_weapon_medigun", 0);
    perk.SetPref("scale", "5.0");
    perk = g_hPerkContainer.Add("sunlightspear", "SunlightSpear_Call", "SunlightSpear_Init", "0", "0", 0);
    perk.SetPref("ticks", "5");
    perk.SetPref("slowdown", "0.2");
    perk.SetPref("ally_speed", "2.0");
    perk.SetPref("rate", "1.2");
    perk.SetPref("speed", "2500");
    perk.SetPref("damage", "10.0");
    perk = g_hPerkContainer.Add("eldenstars", "EldenStars_Call", "EldenStars_Init", "0", "0", 0);
    perk.SetPref("rate", "1.0");
    perk.SetPref("lifetime", "3.5");
    perk.SetPref("speed", "300");
    perk.SetPref("damage", "45");
    perk = g_hPerkContainer.Add("frog", "Frog_Call", "Frog_Init", "0", "0", 0);
    perk.SetPref("rate", "0.5");
    perk.SetPref("vertical", "300.0");
    perk.SetPref("horizontal", "600.0");
    perk = g_hPerkContainer.Add("paranoia", "Paranoia_Call", "Paranoia_Init", "0", "0", 45);
    perk = g_hPerkContainer.Add("heavyrockets", "HeavyRockets_Call", "HeavyRockets_Init", "0", "RocketLauncher, tf_weapon_rocketlauncher_air", 0);
    perk.SetPref("sharpness", "8");
    perk = g_hPerkContainer.Add("weaponmixup", "WeaponMixup_Call", "WeaponMixup_Init", "1, 2, 3, 4, 6, 7, 8, 9", "0", 0);
    perk = g_hPerkContainer.Add("autoheal", "Autoheal_Call", "Autoheal_Init", "0", "0", 0);
    perk.SetPref("rate", "0.1");
    perk.SetPref("health", "4");
    perk = g_hPerkContainer.Add("teamautoheal", "TeamAutoheal_Call", "TeamAutoheal_Init", "0", "0", 0);
    perk.SetPref("range", "350");
    perk.SetPref("rate", "0.1");
    perk.SetPref("health", "2");
}
// END EMBEDDED EFFECT DEFAULTS
// Independent ownership is by (effect type, target). Recasting the same type
// follows replace; applying a different type never invalidates this slot.
Perk RemoveSpecificPerk(int effect, int client, RTDRemoveReason reason = RTDRemove_WearOff)
{
    int previous = g_ContextEffect;
    g_ContextEffect = effect;
    Perk removed = RemovePerk(client, reason);
    g_ContextEffect = previous;
    return removed;
}

void RemoveClientEffects(int client, RTDRemoveReason reason)
{
    int previous = g_ContextEffect;
    for (int effect = RTD_EFFECT_COUNT - 1; effect >= 0; effect--)
    {
        g_ContextEffect = effect;
        RemovePerk(client, reason);
        ClearAbilityHud(client);
        if (g_Applying[client] || g_Removing[client])
            continue;
        Cache[client].Cleanup();
        ReleaseEffectState(effect, client);
        g_CastSerial[client]++;
        g_hRollers.Reset(client);
        delete g_NoticeStore[effect][client];
    }
    if (reason != RTDRemove_WearOff)
    {
        bool activeBonus = Shared[client]._BatSpeedBuffUntil > GetGameTime();
        Shared[client]._BatSpeedBuffUntil = 0.0;
        if (activeBonus && IsClientInGame(client)) Shared[client].UpdateSpeedBoost(client);
    }
    g_ContextEffect = previous;
}

void NotifySpecificAbility(int effect, int client, AbilityNotice notice, int count = 0, int maximum = 0, int damage = 0)
{
    int previous = g_ContextEffect;
    g_ContextEffect = effect;
    NotifyAbility(client, notice, count, maximum, damage);
    g_ContextEffect = previous;
}

void FixSpecificStuck(int effect, int client)
{
    int previous = g_ContextEffect;
    g_ContextEffect = effect;
    FixPotentialStuck(client);
    g_ContextEffect = previous;
}

// A property has one original value and one layer for each owning effect.
// Removing a lower layer must not restore an expired value later. Attributes
// are keyed by entity reference so a new weapon cannot inherit an old layer.


int StateOwner(int entity)
{
    if (entity >= 1 && entity <= MaxClients)
        return entity;
    if (entity > MaxClients && IsValidEntity(entity) && HasEntProp(entity, Prop_Send, "m_hOwnerEntity"))
    {
        int owner = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
        if (owner >= 1 && owner <= MaxClients)
            return owner;
    }
    return 0;
}

bool SameState(const int a[SL_Size], const int b[SL_Size])
{
    return a[SL_Entity] == b[SL_Entity] && a[SL_Kind] == b[SL_Kind] && a[SL_Key] == b[SL_Key];
}

void ReadBaseState(int entity, StateKind kind, int key, int &value, bool &present)
{
    present = true;
    switch (kind)
    {
        case State_Attribute:
        {
            Address address = TF2Attrib_GetByDefIndex(entity, key);
            present = address != Address_Null;
            value = present ? view_as<int>(TF2Attrib_GetValue(address)) : 0;
        }
        case State_Gravity: value = view_as<int>(GetEntityGravity(entity));
        case State_Move: value = view_as<int>(GetEntityMoveType(entity));
        case State_Model: value = view_as<int>(GetEntPropFloat(entity, Prop_Send, "m_flModelScale"));
        case State_Head: value = view_as<int>(GetEntPropFloat(entity, Prop_Send, "m_flHeadScale"));
        case State_Step: value = view_as<int>(GetEntPropFloat(entity, Prop_Send, "m_flStepSize"));
        case State_Overlay: value = view_as<int>(ClientOverlay_None);
    }
}

void ApplyResolvedState(const int target[SL_Size])
{
    int entity = EntRefToEntIndex(target[SL_Entity]);
    if (entity < 1 || !IsValidEntity(entity))
        return;
    int chosen[SL_Size], row[SL_Size];
    bool found;
    int priority = -1;
    for (int i = 0; i < g_StateLayers.Length; i++)
    {
        g_StateLayers.GetArray(i, row);
        if (!SameState(row, target)) continue;
        int order = row[SL_Order];
        // An active immobilization must continue to block movement while a
        // flight layer is added or removed underneath it.
        if (row[SL_Kind] == view_as<int>(State_Move) && row[SL_Effect] >= 0 && row[SL_Value] == view_as<int>(MOVETYPE_NONE))
            order = 2147483647;
        if (!found || order >= priority)
        {
            chosen = row;
            priority = order;
            found = true;
        }
    }
    if (!found) return;
    switch (view_as<StateKind>(chosen[SL_Kind]))
    {
        case State_Attribute:
        {
            if (chosen[SL_Present]) TF2Attrib_SetByDefIndex(entity, chosen[SL_Key], view_as<float>(chosen[SL_Value]));
            else TF2Attrib_RemoveByDefIndex(entity, chosen[SL_Key]);
            if (chosen[SL_Key] == 107 && IsValidClient(entity) && IsPlayerAlive(entity)) TriggerSpeedRecalc(entity);
        }
        case State_Gravity: SetEntityGravity(entity, view_as<float>(chosen[SL_Value]));
        case State_Move: SetEntityMoveType(entity, view_as<MoveType>(chosen[SL_Value]));
        case State_Model: SetEntPropFloat(entity, Prop_Send, "m_flModelScale", view_as<float>(chosen[SL_Value]));
        case State_Head: SetEntPropFloat(entity, Prop_Send, "m_flHeadScale", view_as<float>(chosen[SL_Value]));
        case State_Step: SetEntPropFloat(entity, Prop_Send, "m_flStepSize", view_as<float>(chosen[SL_Value]));
        case State_Overlay: SetOverlay(entity, view_as<ClientOverlay>(chosen[SL_Value]));
    }
}

void ForgetUnusedBase(const int target[SL_Size])
{
    int row[SL_Size], base = -1;
    for (int i = 0; i < g_StateLayers.Length; i++)
    {
        g_StateLayers.GetArray(i, row);
        if (!SameState(row, target)) continue;
        if (row[SL_Effect] >= 0) return;
        base = i;
    }
    if (base >= 0) g_StateLayers.Erase(base);
}

void WriteEffectState(int effect, int entity, StateKind kind, int key, int value, bool present = true)
{
    int client = StateOwner(entity);
    if (!client || g_RemovingStore[effect][client]) return;
    int row[SL_Size], target[SL_Size], base = -1, own = -1;
    target[SL_Entity] = EntIndexToEntRef(entity);
    target[SL_Kind] = view_as<int>(kind);
    target[SL_Key] = key;
    target[SL_Effect] = effect;
    target[SL_Client] = client;
    for (int i = 0; i < g_StateLayers.Length; i++)
    {
        g_StateLayers.GetArray(i, row);
        if (!SameState(row, target)) continue;
        if (row[SL_Effect] == -1) base = i;
        if (row[SL_Effect] == effect) own = i;
    }
    if (!present)
    {
        if (own < 0) return;
        g_StateLayers.Erase(own);
        ApplyResolvedState(target);
        ForgetUnusedBase(target);
        return;
    }
    if (base < 0)
    {
        row = target;
        row[SL_Effect] = -1;
        bool exists;
        ReadBaseState(entity, kind, key, row[SL_Value], exists);
        row[SL_Present] = exists;
        g_StateLayers.PushArray(row);
    }
    target[SL_Value] = value;
    target[SL_Present] = true;
    target[SL_Order] = ++g_StateOrder;
    if (own < 0) g_StateLayers.PushArray(target);
    else g_StateLayers.SetArray(own, target);
    ApplyResolvedState(target);
}

void ReleaseEffectState(int effect, int client)
{
    int row[SL_Size];
    for (int i = g_StateLayers.Length - 1; i >= 0; i--)
    {
        g_StateLayers.GetArray(i, row);
        if (row[SL_Effect] != effect || row[SL_Client] != client) continue;
        g_StateLayers.Erase(i);
        ApplyResolvedState(row);
        ForgetUnusedBase(row);
        // ForgetUnusedBase may erase a row below this one.
        i = g_StateLayers.Length;
    }
}

void EffectSetFloat(int effect, int entity, PropType type, const char[] prop, float value, int element = 0)
{
    if (IsValidClient(entity) && type == Prop_Send && element == 0)
    {
        if (StrEqual(prop, "m_flModelScale")) { WriteEffectState(effect, entity, State_Model, 0, view_as<int>(value)); return; }
        if (StrEqual(prop, "m_flHeadScale")) { WriteEffectState(effect, entity, State_Head, 0, view_as<int>(value)); return; }
        if (StrEqual(prop, "m_flStepSize")) { WriteEffectState(effect, entity, State_Step, 0, view_as<int>(value)); return; }
    }
    SetEntPropFloat(entity, type, prop, value, element);
}

void EffectMove(int effect, int entity, MoveType type)
{
    if (IsValidClient(entity)) WriteEffectState(effect, entity, State_Move, 0, view_as<int>(type), type != MOVETYPE_WALK);
    else SetEntityMoveType(entity, type);
}

void EffectSpeed(int effect, int client, float multiplier)
{
    WriteEffectState(effect, client, State_Attribute, 107, view_as<int>(multiplier), multiplier != 1.0);
}

void EffectCapture(int effect, int client, bool prevent)
{
    WriteEffectState(effect, client, State_Attribute, 400, view_as<int>(1.0), prevent);
    WriteEffectState(effect, client, State_Attribute, 68, view_as<int>(-GetCaptureValue(client)), prevent);
    if (prevent) FakeClientCommandEx(client, "dropitem");
}

void DispatchPlayerDisconnected(int client)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnPlayerDisconnected.Length) continue;
        g_ContextEffect = effect;
        Events.PlayerDisconnected(client);
    }
    g_ContextEffect = previous;
}

void DispatchPlayerDied(int client)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnPlayerDied.Length) continue;
        g_ContextEffect = effect;
        Events.PlayerDied(client);
    }
    g_ContextEffect = previous;
}

void DispatchResupply(int client)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnResupply.Length) continue;
        g_ContextEffect = effect;
        Events.Resupply(client);
    }
    g_ContextEffect = previous;
}

void DispatchPlayerAttacked(int client, int victim, int damage, int health)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnPlayerAttacked.Length) continue;
        g_ContextEffect = effect;
        Events.PlayerAttacked(client, victim, damage, health);
    }
    g_ContextEffect = previous;
}

void DispatchUberchargeDeployed(int client, int target)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnUberchargeDeployed.Length) continue;
        g_ContextEffect = effect;
        Events.UberchargeDeployed(client, target);
    }
    g_ContextEffect = previous;
}

void DispatchVoice(int client)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnVoice.Length) continue;
        g_ContextEffect = effect;
        Events.Voice(client);
    }
    g_ContextEffect = previous;
}

bool DispatchSound(int client, const char[] sample)
{
    int previous = g_ContextEffect;
    bool result = true;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnSound.Length) continue;
        g_ContextEffect = effect;
        result &= Events.Sound(client, sample);
    }
    g_ContextEffect = previous;
    return result;
}

bool DispatchClassnameHasSubscribers(const char[] classname)
{
    int previous = g_ContextEffect;
    bool result = false;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnEntitySpawned.Length) continue;
        g_ContextEffect = effect;
        result |= Events.ClassnameHasSubscribers(classname);
    }
    g_ContextEffect = previous;
    return result;
}

void DispatchEntitySpawned(int entity)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnEntitySpawned.Length) continue;
        g_ContextEffect = effect;
        Events.EntitySpawned(entity);
    }
    g_ContextEffect = previous;
}

void DispatchConditionAdded(int client, TFCond condition)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnConditionAdded.Length) continue;
        g_ContextEffect = effect;
        Events.ConditionAdded(client, condition);
    }
    g_ContextEffect = previous;
}

void DispatchConditionRemoved(int client, TFCond condition)
{
    int previous = g_ContextEffect;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnConditionRemoved.Length) continue;
        g_ContextEffect = effect;
        Events.ConditionRemoved(client, condition);
    }
    g_ContextEffect = previous;
}

bool DispatchPlayerRunCmd(int client, int &buttons, float velocity[3], float angles[3])
{
    int previous = g_ContextEffect;
    bool result = false;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnPlayerRunCmd.Length) continue;
        g_ContextEffect = effect;
        result |= Events.PlayerRunCmd(client, buttons, velocity, angles);
    }
    g_ContextEffect = previous;
    return result;
}

bool DispatchAttackCritCheck(int client, int weapon)
{
    int previous = g_ContextEffect;
    bool result = false;
    for (int effect = 0; effect < RTD_EFFECT_COUNT; effect++)
    {
        if (!g_AllEvents[effect]._OnAttackCritCheck.Length) continue;
        g_ContextEffect = effect;
        result |= Events.AttackCritCheck(client, weapon);
    }
    g_ContextEffect = previous;
    return result;
}

stock void FX1_FixPotentialStuck(int client) { FixSpecificStuck(1, client); }

stock void FX1_SetEntityGravity(int entity, float value) { WriteEffectState(1, entity, State_Gravity, 0, view_as<int>(value)); }

stock void FX1_SetEntityMoveType(int entity, MoveType type) { EffectMove(1, entity, type); }

stock void FX2_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(2, entity, type, prop, value, element); }

stock Perk FX4_RemovePerk(int client) { return RemoveSpecificPerk(4, client); }

stock void FX4_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(4, entity, type, prop, value, element); }

stock Handle FX5_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 5); }

stock void FX6_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 6); }

stock Perk FX6_RemovePerk(int client) { return RemoveSpecificPerk(6, client); }

stock void FX7_SetSpeedEx(int client, float multiplier = 1.0) { EffectSpeed(7, client, multiplier); }

stock Handle FX8_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 8); }

stock void FX8_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 8); }

stock Perk FX8_RemovePerk(int client) { return RemoveSpecificPerk(8, client); }

stock void FX8_SetEntityMoveType(int entity, MoveType type) { EffectMove(8, entity, type); }

stock void FX8_ApplyPreventCapture(int client) { EffectCapture(8, client, true); }

stock void FX8_RemovePreventCapture(int client) { EffectCapture(8, client, false); }

stock void FX9_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 9); }

stock void FX13_SetOverlay(int client, ClientOverlay overlay) { WriteEffectState(13, client, State_Overlay, 0, view_as<int>(overlay), overlay != ClientOverlay_None); }

stock void FX14_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 14); }

stock Perk FX14_RemovePerk(int client) { return RemoveSpecificPerk(14, client); }

stock void FX14_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(14, entity, type, prop, value, element); }

stock void FX17_SetOverlay(int client, ClientOverlay overlay) { WriteEffectState(17, client, State_Overlay, 0, view_as<int>(overlay), overlay != ClientOverlay_None); }

stock Perk FX20_RemovePerk(int client) { return RemoveSpecificPerk(20, client); }

stock Perk FX21_RemovePerk(int client) { return RemoveSpecificPerk(21, client); }

stock bool FX23_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(23, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX23_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(23, entity, State_Attribute, index, 0, false); return true; }

stock bool FX24_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(24, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX24_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(24, entity, State_Attribute, index, 0, false); return true; }

stock void FX24_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(24, entity, type, prop, value, element); }

stock void FX25_FixPotentialStuck(int client) { FixSpecificStuck(25, client); }

stock bool FX25_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(25, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX25_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(25, entity, State_Attribute, index, 0, false); return true; }

stock void FX25_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(25, entity, type, prop, value, element); }

stock Handle FX26_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 26); }

stock void FX29_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 29); }

stock Handle FX30_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 30); }

stock Handle FX30_CreateDataTimer(float interval, Timer callback, Handle &pack, int flags = 0) { pack = new DataPack(); return CreateEffectTimer(interval, callback, pack, flags | TIMER_DATA_HNDL_CLOSE, 30); }

stock void FX31_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(31, entity, type, prop, value, element); }

stock bool FX33_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(33, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX33_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(33, entity, State_Attribute, index, 0, false); return true; }

stock void FX36_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 36); }

stock void FX41_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 41); }

stock void FX42_SetEntPropFloat(int entity, PropType type, const char[] prop, float value, int element = 0) { EffectSetFloat(42, entity, type, prop, value, element); }

stock bool FX43_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(43, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX43_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(43, entity, State_Attribute, index, 0, false); return true; }

stock void FX44_FixPotentialStuck(int client) { FixSpecificStuck(44, client); }

stock bool FX46_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(46, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX46_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(46, entity, State_Attribute, index, 0, false); return true; }

stock Handle FX47_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 47); }

stock void FX47_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 47); }

stock void FX47_SetEntityMoveType(int entity, MoveType type) { EffectMove(47, entity, type); }

stock Handle FX48_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 48); }

stock Handle FX49_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 49); }

stock void FX51_SetSpeed(int client, float base, float multiplier = 1.0) {
 #pragma unused base
 EffectSpeed(51, client, multiplier); }

stock void FX51_ResetSpeed(int client) { EffectSpeed(51, client, 1.0); }

stock void FX52_SetSpeed(int client, float base, float multiplier = 1.0) {
 #pragma unused base
 EffectSpeed(52, client, multiplier); }

stock void FX52_ResetSpeed(int client) { EffectSpeed(52, client, 1.0); }

stock Handle FX53_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 53); }

stock void FX53_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 53); }

stock Handle FX54_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 54); }

stock Handle FX55_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 55); }

stock void FX55_SetEntityMoveType(int entity, MoveType type) { EffectMove(55, entity, type); }

stock void FX55_SetSpeedEx(int client, float multiplier = 1.0) { EffectSpeed(55, client, multiplier); }

stock Handle FX56_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 56); }

stock Handle FX57_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 57); }

stock void FX58_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 58); }

stock void FX58_SetSpeed(int client, float base, float multiplier = 1.0) {
 #pragma unused base
 EffectSpeed(58, client, multiplier);
 if (multiplier == 1.0)
 {
     Shared[client]._SmiteCritUntil = 0.0;
     Shared[client].UpdateCritBoost(client);
 }
}

stock void FX58_ResetSpeed(int client)
{
    EffectSpeed(58, client, 1.0);
    Shared[client]._SmiteCritUntil = 0.0;
    Shared[client].UpdateCritBoost(client);
}

stock bool FX59_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(59, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX59_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(59, entity, State_Attribute, index, 0, false); return true; }

stock Handle FX60_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 60); }

stock void FX60_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 60); }

stock void FX60_SetEntityMoveType(int entity, MoveType type) { EffectMove(60, entity, type); }

stock Handle FX61_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 61); }

stock void FX61_SDKHook(int entity, SDKHookType type, SDKHookCB callback) { HookEffectEntity(entity, type, callback, 61); }

stock Handle FX64_CreateTimer(float interval, Timer callback, any data = 0, int flags = 0) { return CreateEffectTimer(interval, callback, data, flags, 64); }

stock bool FX65_TF2Attrib_SetByDefIndex(int entity, int index, float value) { WriteEffectState(65, entity, State_Attribute, index, view_as<int>(value)); return true; }

stock bool FX65_TF2Attrib_RemoveByDefIndex(int entity, int index) { WriteEffectState(65, entity, State_Attribute, index, 0, false); return true; }

stock void FX5_AddCondition(int client, TFCond condition)
{
    Shared[client].AddCritBoost(client, condition == TFCond_Buffed ? CritBoost_Mini : CritBoost_Full);
}

stock void FX5_RemoveCondition(int client, TFCond condition)
{
    Shared[client].RemoveCritBoost(client, condition == TFCond_Buffed ? CritBoost_Mini : CritBoost_Full);
}

Perk GetDispatchPerk(int client)
{
    return g_Removing[client] ? null : g_hRollers.GetPerk(client);
}

stock void FX58_AddCondition(int client, TFCond condition, float duration)
{
    if (condition == TFCond_CritOnFirstBlood)
    {
        Shared[client]._SmiteCritUntil = GetGameTime() + duration;
        Shared[client].UpdateCritBoost(client);
    }
    else TF2_AddCondition(client, condition, duration);
}

stock void FX25_AddSpeedBoost(int client, TFCond condition)
{
    #pragma unused condition
    Shared[client]._TinySpeedBoost = true;
    Shared[client].UpdateSpeedBoost(client);
}

stock void FX25_RemoveSpeedBoost(int client, TFCond condition)
{
    #pragma unused condition
    Shared[client]._TinySpeedBoost = false;
    Shared[client].UpdateSpeedBoost(client);
}

stock void FX55_AddCondition(int client, TFCond condition, float duration = TFCondDuration_Infinite)
{
    if (condition == TFCond_SpeedBuffAlly)
    {
        // Forced lifecycle cleanup must not grant a new post-effect bonus.
        Shared[client]._BatSpeedBuffUntil = g_RoundEnding || !IsPlayerAlive(client)
            || (g_RemovingStore[55][client] && g_RemovalReasonStore[55][client] != RTDRemove_WearOff)
            ? 0.0 : GetGameTime() + duration;
        Shared[client].UpdateSpeedBoost(client);
    }
    else TF2_AddCondition(client, condition, duration);
}
