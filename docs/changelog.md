# Changelog

| Build | Change |
| --- | --- |
| v0.1 | First build: warmup, outbreak, 4 timed waves and breaks, conversion, Flood unlocks, Monitor breaks, arsenal, crate. |
| v0.2 | Fix: with 2 players the outbreak turned both Infected (counts now update as it picks). |
| v0.3 | One equipment or placeable at a time. |
| v0.4 | Placeables placed by throwing a grav lift (aim placement); marker and Ability 2 removed. |
| v0.5 | Equipment and placeable cards grey out while you hold one. |
| v0.6 | Lasting Cover removed (renewed covers faced one map direction). |
| v0.7 | Trait picker; Survivors Magnum + fists, half shields; Flood Human faster; map purge; heavy guns, Plasma Cannon, Missile Pod, vehicles page; breakable Barrier. |
| v0.8 | Slimming pass; Grenadier class with frags; purge also removes grenades and equipment; Flood speeds forced; late-break picker; select-then-Spawn picker; Flood Carrier with nest. |
| v0.9 | Assault trait; nest 5 ft ahead; thrown spore carrier. |
| v0.10 | Comments moved out of the script into docs/how-the-script-works.md. |
| v0.11 | Fix: outbreak picks died a second time (as a suicide) on their first Flood spawn. |
| v0.12 | Carrier faster and tougher; spore seed throw; nest shielded look; nest button shows health. |
| v0.13 | Flood Carrier and spore throw removed; nest kept as build_nest() for a future class. |
| v0.14 | Nest Stalker (nest + turret toggle). |
| v0.15 | Vehicles page removed (about 7.8 KiB). |
| v0.16 | Flood tiers 1–5: Elite with shields, Nest Stalker (one lasting nest), Turret Stalker, Tank Stalker, Flood Tank, last-wave Sword Spartan; Infected team green-yellow; 9 picker cards. |
| v0.17 | Space pass: prices written into card text, picker title shows the next tier, indentation removed. |
| v0.18 | Juggernaut boss. |
| v0.19 | Brute Chieftain and Spartan bosses on a cycling boss card; crate stays a fixed spawn. |
| v0.20 | Spartan boss: no shield recharge. |
| v0.21 | Flood tiers open **by wave** instead of by Survivors converted (testable 1v1): wave 1 tier 1 ... wave 4 tier 4, Sword Spartan on the last wave. 5 waves, wave 1 shortened to 120 s. Option unlock_step_percent replaced by tier_step_waves (default 1). |
| v0.22 | Fix: the purge no longer deletes equipment or grenades (it was deleting bought or picked-up equipment, leaving the arsenal stuck on 'use what you carry first'). Picker cards laid out one tier per row (the arsenal and trait screens share the rows). Turret/Tank Stalker transform moved to Ability 1. Tank Stalker weaker than the Flood Tank (125% health, Tank form 120%, normal damage). Sword Spartan 150% speed. The Spartan boss is now Master Chief. |
| v0.23 | Bosses: picked even when every Infected has zero kills (random among the tied leaders), so 1v1 tests get a boss from wave 2. Card layout reverted to two columns on all screens (the v0.22 tier rows looked off). |
| v0.24 | Juggernaut takes 67% less damage (resistance 300%, class trait) on top of its 4x health: about 3x a Flood Tank's toughness. The Flood Tank stays at 50% less damage. |
| v0.25 | The boss's card is now a full-width row at the top of the picker (the other forms move down a row, for the boss only). Brute Chieftain much tougher: 300% health and takes 67% less damage (it had normal health and no resistance, so a few Magnum headshots killed it). Master Chief boss can now be headshot. |
| v0.26 | Health bar for every living player: a light-blue bar at the bottom centre with the health share as a number (e.g. 87/100). It's a share of max health, so a full Juggernaut shows 100/100 too. The mode is now at the 64 KiB limit (about 0.3 KiB left). |
| v0.27 | Hint trim (63.8 to 62.3 KiB): repeated hints removed (the Infected and Monitor HUD lines, 'arsenal open anywhere', the per-placeable grav-lift lines, 'click' on the other boss cards), purchases all say 'Bought', the two 'use it first' errors merged, other messages shortened. |
| v0.28 | No map weapons on any map ("map.weapons": 11 in the template, as in the stock Gun Game), so the purge no longer has to race players to them. Ammo only outside waves: no crate refill and no Ammo refill purchase during a wave (card greyed, crate line says so). |
| v0.29 | The crate's ammo refill costs 20 points, once per break (first time you come close; a perk bit remembers it until the break ends). No crate refill in warmup. Arsenal Ammo refill 10 -> 20 points. |
| v0.30 | No free ammo: the quartermaster's automatic refill is gone; ammo only from the arsenal's Ammo refill (20 points), at the quartermaster during a wave or anywhere in a break. The 'crate' is now called the quartermaster everywhere (HUD, messages, docs; host option crate_radius renamed quartermaster_radius). Script saved with LF line endings: 63.2 to 59.4 KiB (the source is stored in the mode). |
| v0.31 | "map.weapons": 11 removed: in 0.9.23 it makes the lobby say 'Native engine rejected game options' (the stock Gun Game too), so v0.28-v0.30 didn't load. Map weapons are handled by the script again, now every tick: a weapon nobody has ever carried is deleted at once, even with someone standing on it, so campers can't grab a respawning map weapon. Weapons a player has carried keep the 6 ft rule. |
| v0.32 | Base building with map props: Flashlight picks up the nearest map prop within 8 ft and puts it down 5 ft ahead, facing your way (through a stand-in grav lift, as proven in Test 13). New Placeables card: Prop Placer (50 points, once a round): picking up a prop also gives a grav lift to throw it into place. 59.5 to 63.1 KiB. |
| v0.33 | Flashlight drop back to the plain one from Test 13 v1-v4 (let go, turn your way): v0.32's stand-in grav lift launched players forward. Prop Placer is now one use for 20 points (a throw uses it up; a Flashlight drop keeps it). The build compiles a short-name copy of the script (tools/shrink.ps1, proven to turn back into the source exactly, same megalo-check output): 63.1 to 41.4 KiB. |
| v0.34 | Fix: Survivors always looked like they carried a prop (HUD 'Carrying a prop', Flashlight just said 'Placed'), and in v0.32 Flashlight threw them forward. The Infected transform start ran for Survivors too (`form` shares a slot with `points`) and put the Survivor's own body in the carried-prop slot every tick, so a drop moved the player. The transform start now checks the Infected role. |
| v0.35 | A ready Prop Placer now takes your equipment slot: while you have one, the other equipment and placeable cards are grey and can't be bought (Ammo refill still can). In v0.34 nothing was greyed and other equipment could be bought. |

Confirmed in game: up to v0.13 (purge, Flood speeds, the outbreak death fix, traits including Assault + Grenadier, picker, nests) all work as intended.
