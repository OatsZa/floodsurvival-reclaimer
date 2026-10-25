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

Confirmed in game: up to v0.13 (purge, Flood speeds, the outbreak death fix, traits including Assault + Grenadier, picker, nests) all work as intended.
