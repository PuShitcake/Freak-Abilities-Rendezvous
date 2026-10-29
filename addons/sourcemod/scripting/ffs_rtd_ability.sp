/**
 * FF2 Rewrite: RTD abilities (68 effects).
 * RTD effect code: Copyright (C) 2023-2024 Filip Tomaszewski.
 * This adapter and the included RTD code are distributed under GPL-3.0-or-later.
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

/* BEGIN RTD CONFIG EXAMPLES
 * Configuration examples for all 68 effects: 

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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Ignition activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Monochromia: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Infinite Double Jump: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Eye for an Eye: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Its Punishment Time! activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Outline: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Strong Recoil: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Cursed: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Fatass: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Spring Shoes: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Fake Lag: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "SkillIssue activated!" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Paranoia: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
    "respect_loadout"    "true" // true = enforce this effect's RTD class and weapon restrictions
    "sound"              "" // Path relative to sound/; empty or omitted = no activation sound
    "message"            "Weapon Mixup: {time}s remaining" // Text shown only to the affected player; empty/omitted = hide the main HUD
    "message_duration"   "3.0" // Seconds for instant messages and event notices; timed main HUD lasts until effect ends
    "message_x"          "-1.0" // HUD horizontal position: 0.0-1.0; -1.0 = centered
    "message_y"          "0.30" // HUD vertical position: 0.0-1.0; -1.0 = centered
    "message_color"      "255 255 255 255" // Red green blue alpha, each 0-255
    // This effect has no additional settings
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    "replace"            "false" // true = remove the target's active effect first; false = skip busy targets
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
    "plugin_name"        "ffs_rtd_ability" // Required subplugin filename, without the .smx extension
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
    author = "Codex, Phil25 (original RTD effects), Xeacring",
    description = "68 configurable, standalone FF2 Rewrite RTD abilities",
    version = "1.1.2"
};

// The original implementations share these private engine types and helpers.
Rollers g_hRollers;
Perk g_ActivePerk;
ConfigData g_ActiveSettings;
bool g_ActiveInstant;
#include "rtd/macros.sp"
#include "rtd/storage/precached.sp"
#include "rtd/storage/cache.sp"
#include "rtd/storage/event_registrar.sp"
#include "rtd/stocks.sp"
#include "rtd/parsing.sp"

// A small private runtime, rather than RTD's roll pool, commands and legacy
// property macros. The original effects and event registrar use these interfaces.
methodmap Perk < StringMap
{
    public Perk() { return view_as<Perk>(new StringMap()); }
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
        Call_Finish();
    }
    public void InitInternal()
    {
        char callback[64]; this.GetString("m_Init", callback, sizeof(callback));
        if (!callback[0]) return;
        Function func = GetFunctionByName(INVALID_HANDLE, callback);
        if (func == INVALID_FUNCTION) ThrowError("Missing RTD initializer %s", callback);
        Call_StartFunction(INVALID_HANDLE, func);
        Call_PushCell(this);
        Call_Finish();
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
    public Rollers() { return view_as<Rollers>(new ArrayList(5, MAXPLAYERS + 1)); }
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
    public void Attack(int client) { NotifyAbility(client, Notice_Attack); }
    public void PlayerDamage(int client, int damage) { NotifyAbility(client, Notice_Damage, 0, 0, damage); }
    public void PlayersIgnited(int client, int count) { NotifyAbility(client, Notice_Ignited, count); }
    public void Dispenser(int client) { NotifyAbility(client, Notice_Dispenser); }
    public void DispenserSpawned(int client, int count, int maximum) { NotifyAbility(client, Notice_DispenserSpawned, count, maximum); }
    public void Sentry(int client) { NotifyAbility(client, Notice_Sentry); }
    public void SentrySpawned(int client, int count, int maximum) { NotifyAbility(client, Notice_SentrySpawned, count, maximum); }
}

AbilityNotifier AbilityNotify;
// Route notices from the original effects through this adapter without editing
// the shared RTD files. Only explicitly configured HUD notices are displayed.
#define Notify AbilityNotify
// Only compile the retained effects into this subplugin.
ClientFlags g_eInGodmode; // Compatibility flag read by the original Sickness helper; remains unset.
// Own delayed effect work without changing the shared RTD sources. Cache timers
// already invalidate their DataPacks on removal; stock speed timers finish cleanup.
#define CreateTimer CreateEffectTimer
#define CreateDataTimer CreateEffectDataTimer
#define CloseHandle CloseEffectHandle
#define SDKHook HookEffectEntity
#include "rtd/perks/toxic.sp"
#include "rtd/perks/noclip.sp"
#include "rtd/perks/infiniteammo.sp"
#include "rtd/perks/scarybullets.sp"
#include "rtd/perks/spawnsentry.sp"
#include "rtd/perks/homingprojectiles.sp"
#include "rtd/perks/explode.sp"
#include "rtd/perks/snail.sp"
// Keep original cosmetics hidden instead of deleting them. Removing Frozen can
// then restore their alpha without a resupply that regenerates an FF2 loadout.
#define RemoveEntity Ability_HideFrozenWearable
#include "rtd/perks/frozen.sp"
#undef RemoveEntity
#include "rtd/perks/timebomb.sp"
#include "rtd/perks/ignition.sp"
#include "rtd/perks/lowhealth.sp"
#include "rtd/perks/drugged.sp"
#include "rtd/perks/blind.sp"
#include "rtd/perks/striptomelee.sp"
#include "rtd/perks/beacon.sp"
#include "rtd/perks/forcedtaunt.sp"
#include "rtd/perks/monochromia.sp"
#include "rtd/perks/earthquake.sp"
#include "rtd/perks/funnyfeeling.sp"
#include "rtd/perks/badsauce.sp"
#include "rtd/perks/spawndispenser.sp"
#include "rtd/perks/infinitejump.sp"
#include "rtd/perks/powerfulhits.sp"
#include "rtd/perks/bighead.sp"
#include "rtd/perks/tinymann.sp"
#include "rtd/perks/firework.sp"
#include "rtd/perks/deadlyvoice.sp"
#include "rtd/perks/eyeforaneye.sp"
#include "rtd/perks/weakened.sp"
#include "rtd/perks/necromash.sp"
#include "rtd/perks/extraammo.sp"
#include "rtd/perks/suffocation.sp"
#include "rtd/perks/fasthands.sp"
#include "rtd/perks/outline.sp"
#include "rtd/perks/teamcriticals.sp"
#include "rtd/perks/firetimebomb.sp"
#include "rtd/perks/firebreath.sp"
#include "rtd/perks/strongrecoil.sp"
#include "rtd/perks/cursed.sp"
#include "rtd/perks/extrathrowables.sp"
#include "rtd/perks/explosivearrows.sp"
#include "rtd/perks/inclineproblem.sp"
#include "rtd/perks/springshoes.sp"
#include "rtd/perks/lag.sp"
#include "rtd/perks/drugbullets.sp"
#include "rtd/perks/longmelee.sp"
#include "rtd/perks/hatthrow.sp"
#include "rtd/perks/madaraswhistle.sp"
#include "rtd/perks/sickness.sp"
#include "rtd/perks/wastedroll.sp"
#include "rtd/perks/drunkwalk.sp"
#include "rtd/perks/hellsreach.sp"
#include "rtd/perks/cursedprojectiles.sp"
#include "rtd/perks/vampire.sp"
#include "rtd/perks/batswarm.sp"
#include "rtd/perks/pumpkintrail.sp"
#include "rtd/perks/acallbeyond.sp"
#include "rtd/perks/smite.sp"
#include "rtd/perks/overhealbonus.sp"
#include "rtd/perks/sunlightspear.sp"
#include "rtd/perks/eldenstars.sp"
#include "rtd/perks/frog.sp"
#include "rtd/perks/paranoia.sp"
#include "rtd/perks/heavyrockets.sp"
#include "rtd/perks/weaponmixup.sp"
#include "rtd/perks/autoheal.sp"
#include "rtd/perks/teamautoheal.sp"
#undef SDKHook
#undef CloseHandle
#undef CreateDataTimer
#undef CreateTimer
#undef Notify
#pragma unused Notify
#undef NoReload
#undef Weapon
#undef Clip
#undef Ammo

bool g_Ready;
bool g_RoundEnding;
int g_RoundSerial;
int g_CastSerial[MAXPLAYERS + 1];
ArrayList g_EffectTimers;
StringMap g_EffectEntities;
Function g_EffectTimerCallbacks[32];
int g_EffectTimerCallbackCount;
int g_DispatchRound = -1;

enum EffectTimerField
{
    ET_Handle, ET_Callback, ET_Flags, ET_Round, ET_Client, ET_Cast,
    ET_Running, ET_Cancelled, ET_Data, ET_Size
}

Handle CreateEffectTimer(float interval, Timer callback, any data = 0, int flags = 0)
{
    Handle timer = CreateTimer(interval, Timer_EffectDispatch, data, flags | TIMER_FLAG_NO_MAPCHANGE);
    int entry[ET_Size];
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
        || callback == Timer_FixAbilityStuck)
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
        entry[ET_Cast] = g_CastSerial[client];
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
        || entry[ET_Cast] != g_CastSerial[client]);
    if (g_RoundEnding || entry[ET_Round] != g_RoundSerial || entry[ET_Cancelled] || stale)
    {
        DiscardEffectTimerData(entry);
        g_EffectTimers.Erase(index);
        return Plugin_Stop;
    }
    g_EffectTimers.Set(index, true, ET_Running);
    int previousRound = g_DispatchRound;
    g_DispatchRound = entry[ET_Round];
    Call_StartFunction(INVALID_HANDLE, g_EffectTimerCallbacks[entry[ET_Callback]]);
    Call_PushCell(timer);
    Call_PushCell(data);
    int result;
    int error = Call_Finish(result);
    g_DispatchRound = previousRound;
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
void HookEffectEntity(int entity, SDKHookType type, SDKHookCB callback)
{
    if (callback == Event_HatThrow_OnHatTouch || callback == SunlightSpear_OnTouch
        || callback == ExplosiveArrows_ArrowTouch)
    {
        char key[16];
        IntToString(entity, key, sizeof(key));
        int client = GetEntPropEnt(entity, Prop_Send, "m_hOwnerEntity");
        int state[3];
        if (IsValidClient(client))
        {
            state[0] = GetClientUserId(client);
            state[1] = g_CastSerial[client];
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
    int state[3];
    if (g_RoundEnding || !g_EffectEntities.GetArray(key, state, sizeof(state)))
        return false;
    int client = GetClientOfUserId(state[0]);
    return IsValidClient(client) && IsPlayerAlive(client)
        && state[1] == g_CastSerial[client] && state[2] == g_RoundSerial;
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
bool g_Applying[MAXPLAYERS + 1];
bool g_Removing[MAXPLAYERS + 1];
bool g_PendingStop[MAXPLAYERS + 1];
int g_OwnerUserId[MAXPLAYERS + 1];
int g_ClientUserId[MAXPLAYERS + 1];
int g_Sharpness[MAXPLAYERS + 1];
int g_ApplyDuration = 10;
Handle g_EndTimer[MAXPLAYERS + 1];

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

AbilityTextState g_Text[MAXPLAYERS + 1];
char g_NoticeOverride[MAXPLAYERS + 1][Notice_Count][512];
Handle g_MessageHud;
Handle g_NoticeHud;
static const char g_NoticeKeys[][] =
{
    "attack", "damage", "ignited", "dispenser", "dispenser_spawned", "sentry", "sentry_spawned"
};

// Preserve the boss/player values that the original effects reset to TF2 defaults.
float g_Gravity[MAXPLAYERS + 1];
float g_ModelScale[MAXPLAYERS + 1];
float g_HeadScale[MAXPLAYERS + 1];
float g_StartOrigin[MAXPLAYERS + 1][3];
MoveType g_MoveType[MAXPLAYERS + 1];
RenderMode g_RenderMode[MAXPLAYERS + 1];
int g_RenderColor[MAXPLAYERS + 1][4];
ArrayList g_AttributeBackup[MAXPLAYERS + 1];

public void OnPluginStart()
{
    g_EffectTimers = new ArrayList(ET_Size);
    g_EffectEntities = new StringMap();
    g_hRollers = new Rollers();
    g_hPerkContainer = new PerkContainer();
    g_MessageHud = CreateHudSynchronizer();
    g_NoticeHud = CreateHudSynchronizer();
    CreateTimer(0.25, Timer_AbilityText, _, TIMER_REPEAT);

    RegisterEffects();

    HookEvent("player_death", Event_Death);
    HookEvent("player_changeclass", Event_ClassChange);
    HookEvent("post_inventory_application", Event_Resupply);
    HookEvent("player_hurt", Event_PlayerHurt);
    HookEvent("player_chargedeployed", Event_UberchargeDeployed);
    HookEvent("teamplay_round_start", Event_Reset);
    HookEvent("teamplay_round_win", Event_Reset);
    HookEvent("arena_win_panel", Event_Reset);
    AddCommandListener(Listener_Voice, "voicemenu");
    AddNormalSoundHook(Listener_Sound);

    for (int client = 1; client <= MaxClients; client++)
    {
        Cache[client].Init(client);
        if (IsClientInGame(client))
            OnClientPutInServer(client);
    }
}

public void OnMapStart()
{
    g_RoundEnding = false;
    Storage_Precache();
    // Stocks_OnMapStart installs its own hook; install it only once here instead.
    PrecacheModel(LASERBEAM);
    PrecacheModel(EMPTY_MODEL);
    PrecacheModel(MODEL_PROJECTILE);
    if (g_hHoming == null)
        g_hHoming = new ArrayList(4);
    else
        g_hHoming.Clear();

    Events.Init();
    for (int i = 0; i < g_hPerkTokenMapper.Length; i++)
    {
        Perk perk = g_hPerkContainer.GetFromId(i);
        char token[32], callback[64];
        perk.GetToken(token, sizeof(token));
        perk.GetInternalCall(callback, sizeof(callback));
        if (GetFunctionByName(INVALID_HANDLE, callback) == INVALID_FUNCTION)
        {
            SetFailState("Missing RTD effect callback: %s (%s)", callback, token);
            return;
        }
        if (StrEqual(token, "heavyrockets"))
        {
            // Original RTD caches sharpness globally at map start. Use a per-rocket
            // snapshot so two bosses can configure different values concurrently.
            Events.OnEntitySpawned(perk, Ability_HeavyRocketSpawned, HeavyRockets_ClassFilter, Retriever_OwnerEntity);
        }
        else
        {
            perk.InitInternal();
        }
    }
    g_Ready = true;
}

public void OnMapEnd()
{
    StopAllEffects(RTDRemove_NoPrint);
    g_Ready = false;
    Events.Cleanup();
}

public void OnPluginEnd()
{
    if (g_hRollers == null)
        return;
    StopAllEffects(RTDRemove_PluginUnload);
}

public void OnClientPutInServer(int client)
{
    ClearAbilityHud(client);
    Cache[client].Init(client);
    g_hRollers.Reset(client);
    g_ClientUserId[client] = GetClientUserId(client);
    g_OwnerUserId[client] = 0;
    g_Applying[client] = g_Removing[client] = g_PendingStop[client] = false;
    g_eInGodmode.Unset(client);
    g_eMuteNextResupply.Unset(client);
    Shared[client]._CritBoosted = 0;
    Shared[client].MaxHealth = 0;
    SDKHook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
}

public void OnClientDisconnect(int client)
{
    if (g_Ready)
        Events.PlayerDisconnected(client);
    FF2R_OnBossRemoved(client);
    RemovePerk(client, RTDRemove_Disconnect);
    ClearAbilityHud(client);
    g_hRollers.Reset(client);
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
    for (int client = 1; client <= MaxClients; client++)
    {
        if (g_OwnerUserId[client] == owner && owner != 0)
            RemovePerk(client, RTDRemove_NoPrint);
        if (g_Text[client].Owner == owner && owner != 0)
            ClearAbilityHud(client);
    }
}

public void FF2R_OnAbility(int boss, const char[] ability, AbilityData cfg)
{
    if (!g_Ready || g_RoundEnding || !cfg.IsMyPlugin() || StrContains(ability, "rage_rtd_", false) != 0)
        return;
    if (!IsValidClient(boss) || !IsPlayerAlive(boss))
        return;

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

    for (int i = 0; i < count; i++)
    {
        if (g_RoundEnding || !IsValidClient(boss) || !IsPlayerAlive(boss) || !FF2R_GetBossData(boss))
            break;
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
    if (g_Applying[client] || g_Removing[client])
        return;
    if (g_hRollers.GetInRoll(client))
    {
        if (!cfg.GetBool("replace", false))
            return;
        RemovePerk(client, RTDRemove_NoPrint);
        if (!IsPlayerAlive(client))
            return;
    }

    g_CastSerial[client]++;
    int originalTime = perk.DefaultTime;
    bool instant = cfg.GetBool("instant", false);
    bool timed = originalTime >= 0 && !instant;
    if (timed)
        SavePlayerState(client);
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
            g_EndTimer[client] = CreateTimer(float(duration), Timer_EndEffect, GetClientUserId(client));
    }
    else
    {
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
    ConfigData messages = cfg.GetSection("messages");
    for (int i = 0; i < view_as<int>(Notice_Count); i++)
    {
        g_NoticeOverride[client][i][0] = '\0';
        if (messages)
            messages.GetString(g_NoticeKeys[i], g_NoticeOverride[client][i], sizeof(g_NoticeOverride[][]));
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
    if (IsFakeClient(client))
        return;
    char message[1024];
    if (notice)
        FormatAbilityText(client, g_Text[client].Notice, message, sizeof(message));
    else
        FormatAbilityText(client, g_Text[client].Message, message, sizeof(message));
    float y = g_Text[client].Y;
    if (notice)
        y = y < 0.0 ? 0.56 : Min(y + 0.065, 0.95);
    SetHudTextParams(g_Text[client].X, y, 0.35,
        g_Text[client].Color[0], g_Text[client].Color[1], g_Text[client].Color[2], g_Text[client].Color[3],
        0, 0.0, 0.0, 0.0);
    ShowSyncHudText(client, notice ? g_NoticeHud : g_MessageHud, "%s", message);
}

void UpdateAbilityText(int client)
{
    float now = GetGameTime();
    if (g_Text[client].Message[0] && g_Text[client].MainUntil > now)
        DrawAbilityText(client, false);
    else if (g_Text[client].MainUntil > 0.0)
        ClearAbilityHud(client, false);

    if (g_Text[client].Notice[0] && g_Text[client].NoticeUntil > now)
        DrawAbilityText(client, true);
    else if (g_Text[client].NoticeUntil > 0.0)
    {
        ClearSyncHud(client, g_NoticeHud);
        g_Text[client].NoticeUntil = 0.0;
        g_Text[client].Notice[0] = '\0';
    }
    if (!g_Text[client].Message[0] && !g_Text[client].Notice[0] && !g_hRollers.GetInRoll(client))
        g_Text[client].Owner = 0;
}

public Action Timer_AbilityText(Handle timer)
{
    if (g_Ready)
    {
        for (int client = 1; client <= MaxClients; client++)
            if (IsClientInGame(client) && (g_Text[client].MainUntil > 0.0 || g_Text[client].NoticeUntil > 0.0))
                UpdateAbilityText(client);
    }
    return Plugin_Continue;
}

void ClearAbilityHud(int client, bool clearNotice = true)
{
    if (IsClientInGame(client) && g_MessageHud != null && g_Text[client].MainUntil > 0.0)
        ClearSyncHud(client, g_MessageHud);
    g_Text[client].MainUntil = 0.0;
    g_Text[client].Message[0] = '\0';
    if (clearNotice)
    {
        if (IsClientInGame(client) && g_NoticeHud != null && g_Text[client].NoticeUntil > 0.0)
            ClearSyncHud(client, g_NoticeHud);
        g_Text[client].NoticeUntil = 0.0;
        g_Text[client].Notice[0] = '\0';
        g_Text[client].Owner = 0;
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
    if (!g_NoticeOverride[client][notice][0])
        return;
    strcopy(g_Text[client].Notice, sizeof(g_Text[].Notice), g_NoticeOverride[client][notice]);
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

public Action Timer_EndEffect(Handle timer, any userid)
{
    int client = GetClientOfUserId(userid);
    if (client && g_EndTimer[client] == timer)
    {
        g_EndTimer[client] = null;
        RemovePerk(client, RTDRemove_WearOff);
    }
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
        RestorePlayerState(client);
    }
    perk.DecrementActiveCount();
    delete g_AttributeBackup[client];
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
    g_RoundEnding = true;
    g_RoundSerial++;
    for (int client = 1; client <= MaxClients; client++)
    {
        RemovePerk(client, reason);
        ClearAbilityHud(client);
        g_hRollers.Reset(client);
    }
    // Invalidate cache DataPacks before killing raw effect timers. Their native
    // TIMER_DATA_HNDL_CLOSE flag still owns and closes the original timer data.
    CancelEffectTimers();
    g_EffectEntities.Clear();
    if (g_hHoming != null)
        g_hHoming.Clear();
}

void SavePlayerState(int client)
{
    GetClientAbsOrigin(client, g_StartOrigin[client]);
    g_Gravity[client] = GetEntityGravity(client);
    g_MoveType[client] = GetEntityMoveType(client);
    g_ModelScale[client] = GetEntPropFloat(client, Prop_Send, "m_flModelScale");
    g_HeadScale[client] = GetEntPropFloat(client, Prop_Send, "m_flHeadScale");
    g_RenderMode[client] = GetEntityRenderMode(client);
    GetEntityRenderColor(client, g_RenderColor[client][0], g_RenderColor[client][1], g_RenderColor[client][2], g_RenderColor[client][3]);

    delete g_AttributeBackup[client];
    g_AttributeBackup[client] = new ArrayList(3);
    int attribs[] = {476, 2048, 394, 241, 26, 264, 326, 819, 275, 535, 11, 329, 178, 238, 359, 400, 68, 107};
    for (int slot = -1; slot < 5; slot++)
    {
        int entity = slot == -1 ? client : GetPlayerWeaponSlot(client, slot);
        if (entity < 1 || !IsValidEntity(entity))
            continue;
        for (int i = 0; i < sizeof(attribs); i++)
        {
            Address address = TF2Attrib_GetByDefIndex(entity, attribs[i]);
            if (address == Address_Null)
                continue;
            int entry[3];
            entry[0] = EntIndexToEntRef(entity);
            entry[1] = attribs[i];
            entry[2] = view_as<int>(TF2Attrib_GetValue(address));
            g_AttributeBackup[client].PushArray(entry);
        }
    }
}

void RestorePlayerState(int client)
{
    SetEntityGravity(client, g_Gravity[client]);
    SetEntityMoveType(client, g_MoveType[client]);
    SetEntPropFloat(client, Prop_Send, "m_flModelScale", g_ModelScale[client]);
    SetEntPropFloat(client, Prop_Send, "m_flHeadScale", g_HeadScale[client]);
    SetEntityRenderMode(client, g_RenderMode[client]);
    SetEntityRenderColor(client, g_RenderColor[client][0], g_RenderColor[client][1], g_RenderColor[client][2], g_RenderColor[client][3]);
    if (g_AttributeBackup[client] != null)
    {
        for (int i = 0; i < g_AttributeBackup[client].Length; i++)
        {
            int entry[3];
            g_AttributeBackup[client].GetArray(i, entry);
            int entity = EntRefToEntIndex(entry[0]);
            if (entity > 0 && IsValidEntity(entity))
                TF2Attrib_SetByDefIndex(entity, entry[1], view_as<float>(entry[2]));
        }
        delete g_AttributeBackup[client];
    }
    if (IsPlayerAlive(client))
        TriggerSpeedRecalc(client);
}

public void Event_Death(Event event, const char[] name, bool dontBroadcast)
{
    if (event.GetInt("death_flags") & TF_DEATHFLAG_DEADRINGER)
        return;
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (!client)
        return;
    Events.PlayerDied(client);
    RemovePerk(client, RTDRemove_Death);
    ClearAbilityHud(client);
}

public void Event_ClassChange(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (client && view_as<int>(TF2_GetPlayerClass(client)) != event.GetInt("class"))
    {
        RemovePerk(client, RTDRemove_ClassChange);
        ClearAbilityHud(client);
    }
}

public void Event_Reset(Event event, const char[] name, bool dontBroadcast)
{
    StopAllEffects(RTDRemove_NoPrint);
    if (StrEqual(name, "teamplay_round_start"))
        g_RoundEnding = false;
}

public void Event_Resupply(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (client)
        Events.Resupply(client);
}

public void Event_PlayerHurt(Event event, const char[] name, bool dontBroadcast)
{
    int victim = GetClientOfUserId(event.GetInt("userid"));
    int attacker = GetClientOfUserId(event.GetInt("attacker"));
    if (victim && attacker)
        Events.PlayerAttacked(attacker, victim, event.GetInt("damageamount"), event.GetInt("health"));
}

public void Event_UberchargeDeployed(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    int target = GetClientOfUserId(event.GetInt("targetid"));
    if (client)
        Events.UberchargeDeployed(client, target);
}

public Action Listener_Voice(int client, const char[] command, int argc)
{
    if (IsValidClient(client))
        Events.Voice(client);
    return Plugin_Continue;
}

public Action Listener_Sound(int clients[MAXPLAYERS], int &numClients, char sample[PLATFORM_MAX_PATH], int &entity, int &channel, float &volume, int &level, int &pitch, int &flags, char entry[PLATFORM_MAX_PATH], int &seed)
{
    if (!IsValidClient(entity))
        return Plugin_Continue;
    return Stocks_Sound(entity, sample) && Events.Sound(entity, sample) ? Plugin_Continue : Plugin_Stop;
}

public void OnEntityCreated(int entity, const char[] classname)
{
    if (g_Ready && Events.ClassnameHasSubscribers(classname))
        SDKHook(entity, SDKHook_SpawnPost, Ability_EntitySpawned);
}

public void Ability_EntitySpawned(int entity)
{
    Events.EntitySpawned(entity);
}

public void OnGameFrame()
{
    if (g_Ready && g_hHoming != null)
        Homing_OnGameFrame();
}

public void TF2_OnConditionAdded(int client, TFCond condition)
{
    if (g_Ready)
        Events.ConditionAdded(client, condition);
}

public void TF2_OnConditionRemoved(int client, TFCond condition)
{
    if (g_Ready)
        Events.ConditionRemoved(client, condition);
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float velocity[3], float angles[3], int &weapon)
{
    if (g_Ready && IsValidClient(client) && Events.PlayerRunCmd(client, buttons, velocity, angles))
        return Plugin_Changed;
    return Plugin_Continue;
}

public Action TF2_CalcIsAttackCritical(int client, int weapon, char[] weaponName, bool &result)
{
    if (!g_Ready || !IsValidClient(client) || !Events.AttackCritCheck(client, weapon))
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