# Zombie Survival for Project Reclaimer

A wave-survival mode for Halo 3 in [Project Reclaimer](https://projectreclaimer.dev), inspired by Garry's Mod **Zombie Survival**: Survivors hold out through timed waves while the Flood grow with every Survivor they convert. One Megalo script, any stock map, nothing to install for joining players.

**Version: v0.35** (work in progress, not final). Needs Project Reclaimer **0.9.23** on the host and every player.

## Play it

1. Put [`modes/zombie-survival-v0.35.json`](modes) in `Documents\My Games\Project Reclaimer\Game Modes` (a subfolder is fine).
2. In the game: **Host Game → Game Type → Refresh → Slayer → Zombie Survival v0.35**. Tested on The Pit.
3. You need at least **2 players** (split-screen works). Only the host needs the file.

Mouse and keyboard only: controllers can't use the script's menus.

A light-blue **health bar** at the bottom of the screen shows your health as a share of your maximum (87/100).

**This build is set up for testing:** everything in the arsenal is free (`free_shop` = 1) and **Ability 4** skips the current timer (`test_keys` = 1). Turn both off under **Game Options → Slayer rules → Custom mode options** for a real game.

## How a round works

1. **Pick traits.** Before their first spawn, every Survivor picks boosts (cost points) and drawbacks (give points).
2. **Warmup** (45 s). Everyone is a first-person Spartan with a Magnum and fists. The map's weapons and vehicles are removed: you only get what you buy.
3. **Outbreak.** 10% of players (at least 1) turn Infected.
4. **5 waves** (120 s, then 15 s longer each), with **60 s breaks** between them. A Survivor who dies joins the Infected.
5. Survivors win by outlasting the last wave. The Infected win when nobody is left.

Players who join after wave 2 starts begin as Infected.

## Survivors

- **Traits:** Fast Feet / Slow, Overshield / Frail, Hard Hitter / Weak Arm, Grenadier (2 frags that come back), Tough, Assault (spawn with an Assault Rifle).
- **Arsenal (Ability 1):** open anywhere in warmup and breaks, and near the quartermaster during waves.
  - Guns (8), heavy guns (8, including the Flamethrower and Spartan Laser): dropped at your feet.
  - Equipment (ammo refill, cover, bubble shield, regenerator, trip mine, radar jammer, camo, invincibility).
  - Placeables (machine gun, Hunter barrier, plasma cannon, missile pod): you get a **grav lift**, and the item is built where it lands. Throw it where you're aiming.
  - **Prop Placer** (20 points, one use): the next map prop you pick up comes with a grav lift, so you can throw it into place.
- **Base building (Flashlight):** stand within 8 ft of a map prop (crate, barrier, sandbags...) and press **Flashlight** to pick it up; it rides 5 ft in front of you. Press Flashlight again to let go of it there, turned your way. With a Prop Placer you can throw the grav lift instead, and the prop lands where the lift does. Works on any map: the script uses the map's own props.
- **Points:** 10 per kill, 25 per wave survived, 100 to start.
- **The quartermaster:** a Marine at the first Survivor's spawn. During waves the arsenal opens only near him. Ammo comes only from the arsenal's Ammo refill (20 points): at the quartermaster during a wave, anywhere in a break.

## Infected

Dead Infected pick a form, then press **Spawn** (or **Spawn at Nest**). A new tier of forms opens with each wave:

| Tier | Opens at | Forms |
| --- | --- | --- |
| 1 | wave 1 | Flood Human |
| 2 | wave 2 | Flood Brute, Flood Stalker |
| 3 | wave 3 | Flood Elite (shields), Nest Stalker (builds the team's nest) |
| 4 | wave 4 | Turret Stalker (turns into a turret), Tank Stalker (turns into a Tank), Flood Tank |
| 5 | last wave (5) only | Sword Spartan |

- **Nest Stalker:** builds one nest (Ability 1). It outlives the builder; the Infected can spawn at it until the Survivors destroy it.
- **Turret Stalker / Tank Stalker:** Ability 1 transforms after 1 second, and back again.
- **Breaks:** Infected who die during a break come back as harmless flying Monitors, and turn back into Flood when the wave starts.
- **Bosses** (from wave 2): the Infected player with the most kills (picked at random if tied, so there's always one) gets one boss life, from a gold card at the top of their picker: **Juggernaut** (giant, very tough Tank), **Brute Chieftain** (giant, fastest, very tough, invincibility) or **Master Chief** (invisible, Energy Sword, no shield recharge, can be headshot).

## Status and next steps

- **Size:** 41.5 KiB of 64, about **22.5 KiB free**. The mode stores the script's source text, so the build compiles a copy with 1-2 letter names (`tools/shrink.ps1`, since v0.33): 56 KiB of readable source becomes 34 KiB. The readable script in `scripts/` stays the one to edit. The build proves the copy turns back into it exactly and passes the same checks. [docs/name-key.md](docs/name-key.md) says which short name is which. Rule of thumb: 1 KiB of new readable code costs about 0.6 KiB of the mode.
- **Untested in game:** the bosses, the Sword Spartan, the equipment fix, the health bar and the prices. The checklist is in [docs/testing.md](docs/testing.md).
- **Done:** the v0.27 hint trim, base building with map props (v0.32-v0.35: Flashlight pick up and drop, the one-use Prop Placer), short names (v0.33).

### Limits other than space (v0.35)

| What | Used | Free | What it means |
| --- | --- | --- | --- |
| Host options | 16 / 16 | 0 | No new host setting unless two are merged (e.g. `free_shop` + `test_keys` into one test switch) |
| Trait sets | 15 / 16 | 1 | One new stat effect (speed, damage, resistance...) for the whole list below |
| Widgets | 23 / 32 | 9 | Room for new HUD lines or cards |
| Infected classes | 13 / 16 | 3 | Up to 3 new forms or bosses in total |
| Survivor classes | 4 / 16 | 12 | Room for Survivor roles |
| Per-player numbers, objects, timers | all full | 0 | New per-player state must share a slot or go in the free perk bits (11 used), on the player's body (lost on death) or in team variables |
| Global numbers / objects / players / timers | 10/12, 3/16, 2/8, 3/8 | plenty | Fine for round-wide state |

### Roadmap (in this order, set 2026-10-25)

Costs are rough mode KiB, after short names. Time is a rough guess at the pace of v0.27-v0.35 (9 builds plus a test mode in about 3 hours), including a test round in game for each step.

| # | Step | Cost | Uses | Time | Notes |
| --- | --- | --- | --- | --- | --- |
| 1 | **Arsenal order and price rework:** pages ordered by the wave each item unlocks in, gear locked until its wave, new prices | ~0.5-1 | — | 1-1.5 h | Needs the unlock wave and price for each item |
| 2 | **More Flood forms** (tier 1-3) | ~0.5 each | 1 Infected class each | 1.5-2 h | Per-class stats go in the template (free) |
| 3 | **Boss variety** | ~0.5 each | see note | 1-1.5 h | Only 3 Infected classes are free for steps 2 and 3 together. New bosses could instead be body swaps on an existing boss class (as the Stalker transforms do), which needs no class |
| 4 | **How-to cards** left and right of the trait screen in warmup: building (Flashlight, Prop Placer) and the arsenal | ~0.4 | 2 widgets | 0.5 h | |
| 5 | **Invisible-prop filter**, tried in Test 13 first | ~0.2 | — | 0.5-1 h | e.g. skip objects with 0 health |
| 6 | **Prop safety:** a short cooldown before someone else can take a prop you just placed, and **no prop placed 0-4 ft from any player** (a grav lift spot or drop that close is refused), so nobody gets pushed up or out of the map | ~0.4 | object timer | 0.5-1 h | |
| 7 | **Last Survivor:** the last one standing gets 2x health, a bottomless magazine and faster shield recharge (same shield amount), with a HUD alert | ~0.3 | the last trait set | 0.5 h | |
| 8 | ~~Redemption~~ | — | — | — | Not for now: the Flood are already the weaker side. Maybe later |
| 9 | **Horde armour** (maybe): Infected near other Infected take less damage | ~0.6 | a trait set | 0.5-1 h | No trait set left after step 7: two sets would have to be merged first |
| 10 | **Boss abilities** | ~0.3-0.5 each | — | 1-2 h | |
| 11 | **Wave awards:** "achievements" and point bonuses for the top earners and killers after each wave | ~0.5 | 1-2 widgets | 1 h | |
| 12 | **Frozen, breakable props:** some placed props stay put (no physics), take damage and break or vanish | ? | object vars | 1-2 h | Needs a test first: can a script freeze scenery and give it health? |
| 13 | **Survivor roles** (e.g. an engineer who places teleporters or reaches high spots) | ~1-2 | Survivor classes, perk bits | 2-3 h | Needs a feasibility check; map teleporters may be movable as props |
| 14 | **Vehicles page back:** Mongoose, Warthog, Ghost... by grav lift, on maps that have them | ~4 | — | 1-1.5 h | After everything above; the v0.14 code is a starting point |

**Total:** about 12-17 hours, or 4-6 sessions like the v0.27-v0.35 one. Most of it is the test round in game after each step: steps that can share one test round (4+5+6, 7+11) go faster. All of it together is roughly 10-14 KiB of the 22.5 KiB free.

## Host options

Wave count and lengths, break length, warmup, starting Infected share, waves per tier, points, quartermaster range, placeable and gun limits: all under **Custom mode options**. The full list and defaults are in [docs/rules.md](docs/rules.md).

## Files

| Path | What |
| --- | --- |
| [`modes/`](modes) | The mode to play |
| [`scripts/zombie-survival.rvt`](scripts/zombie-survival.rvt) | The Megalo script |
| [`scripts/zombie-survival-template.json`](scripts/zombie-survival-template.json) | Options, traits and the class roster it compiles with |
| [`docs/rules.md`](docs/rules.md) | Every rule, key, price and option |
| [`docs/how-the-script-works.md`](docs/how-the-script-works.md) | Notes on the code, section by section |
| [`docs/name-key.md`](docs/name-key.md) | Which short name in the mode file is which name in the script (rebuilt every build) |
| [`docs/changelog.md`](docs/changelog.md) | What changed in each build |
| [`docs/testing.md`](docs/testing.md) | What still needs testing |
| [`tools/build.ps1`](tools/build.ps1) | Build a new version: `.\tools\build.ps1 -Version 0.36 -Install` |
| [`tools/shrink.ps1`](tools/shrink.ps1) | Makes the short-name copy the build compiles, and the name key |

The script has no indentation or comments on purpose: the mode stores its source text, and both would count toward the 64 KiB limit. The explanations live in `docs/how-the-script-works.md`, and the mode file's short names are decoded in `docs/name-key.md`.

## Credits

Inspired by Zombie Survival for Garry's Mod by JetBoom. Nothing from it is copied: this is a fresh Megalo script. Built on Project Reclaimer's Megalo scripting and its official examples.
