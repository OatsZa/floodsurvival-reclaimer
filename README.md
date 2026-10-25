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

### What fits next

Costs are rough mode KiB, after short names.

| # | Idea | Cost | Uses | Notes |
| --- | --- | --- | --- | --- |
| 1 | **Arsenal by wave:** reorder the pages by the wave each item unlocks in, then lock gear until its wave | ~0.5-1 | — | Already planned |
| 2 | **New prices** | ~0 | — | Already planned |
| 3 | **Per-class Infected stats** in the template | 0 | — | Already planned: health, speed and damage per class cost no script space |
| 4 | **Up to 3 more tier 1-3 Flood forms** | ~0.5 each | 1 Infected class each | Already planned; shares the 3 free Infected classes with #11 |
| 5 | **How-to card in warmup:** Ability 1 arsenal, Flashlight props, Prop Placer, the quartermaster | ~0.3 | 1 widget | Helps new players find base building |
| 6 | **Fewer invisible props:** test a filter (e.g. skip objects with 0 health, or the ones under spawn points) in Test 13 first | ~0.2 | — | Flashlight sometimes grabs an invisible marker |
| 7 | **Prop anti-grief:** a short cooldown before someone else can take a prop you just placed | ~0.3 | object timer | So one player can't pull apart a team's base |
| 8 | **Last Survivor bonus** (as in ZS): the last one standing gets a boost and a HUD alert | ~0.3 | the last trait set | Competes with #10 for the trait set |
| 9 | **Redemption** (as in ZS): an Infected with enough kills can come back as a Survivor once | ~0.8 | a perk bit | Gives dead players a goal |
| 10 | **Horde armour** (as in ZS): Infected near other Infected take less damage | ~0.6 | the last trait set | Competes with #8 |
| 11 | **More bosses or boss abilities** | ~0.5 each | 1 Infected class each | Shares the 3 free Infected classes with #4 |
| 12 | **Wave summary:** top killer and top earner after each wave | ~0.4 | 1 widget | |
| 13 | **Barrier repair:** Survivors standing by a damaged Hunter barrier slowly mend it | ~0.4 | — | Makes base building last longer |
| 14 | **Survivor roles** (Medic, Engineer...) as Survivor classes picked like traits | ~1-2 | Survivor classes, perk bits | Bigger design job |
| 15 | **Vehicles page back:** Mongoose, Warthog, Ghost... by grav lift, on maps that have them | ~4 | — | Cut in v0.15 for space; the map check (`avail` bits) is still there |

Everything above together is roughly 10-14 KiB, inside the 22.5 KiB free. The real limits are the 1 trait set and the 3 Infected classes.
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
