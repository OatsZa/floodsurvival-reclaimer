# Zombie Survival for Project Reclaimer

A wave-survival mode for Halo 3 in [Project Reclaimer](https://projectreclaimer.dev), inspired by Garry's Mod **Zombie Survival**: Survivors hold out through timed waves while the Flood grow with every Survivor they convert. One Megalo script, any stock map, nothing to install for joining players.

**Version: v0.26** (work in progress, not final). Needs Project Reclaimer **0.9.23** on the host and every player.

## Play it

1. Put [`modes/zombie-survival-v0.26.json`](modes) in `Documents\My Games\Project Reclaimer\Game Modes` (a subfolder is fine).
2. In the game: **Host Game → Game Type → Refresh → Slayer → Zombie Survival v0.26**. Tested on The Pit.
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
- **Arsenal (Ability 1):** open anywhere in warmup and breaks, and near the crate during waves.
  - Guns (8), heavy guns (8, including the Flamethrower and Spartan Laser): dropped at your feet.
  - Equipment (ammo refill, cover, bubble shield, regenerator, trip mine, radar jammer, camo, invincibility).
  - Placeables (machine gun, Hunter barrier, plasma cannon, missile pod): you get a **grav lift**, and the item is built where it lands. Throw it where you're aiming.
- **Points:** 10 per kill, 25 per wave survived, 100 to start.
- **The crate:** a quartermaster Marine at the first Survivor's spawn. It refills your ammo when you're close.

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
- **Bosses** (from wave 2): the Infected player with the most kills (picked at random if tied, so there's always one) gets one boss life, from a gold card at the top of their picker: **Juggernaut** (giant, very tough Tank), **Brute Chieftain** (giant, fastest, very tough, invincibility) or **Master Chief** (invisible Energy Sword, no shield recharge).

## Host options

Wave count and lengths, break length, warmup, starting Infected share, waves per tier, points, crate range, placeable and gun limits: all under **Custom mode options**. The full list and defaults are in [docs/rules.md](docs/rules.md).

## Files

| Path | What |
| --- | --- |
| [`modes/`](modes) | The mode to play |
| [`scripts/zombie-survival.rvt`](scripts/zombie-survival.rvt) | The Megalo script |
| [`scripts/zombie-survival-template.json`](scripts/zombie-survival-template.json) | Options, traits and the class roster it compiles with |
| [`docs/rules.md`](docs/rules.md) | Every rule, key, price and option |
| [`docs/how-the-script-works.md`](docs/how-the-script-works.md) | Notes on the code, section by section |
| [`docs/changelog.md`](docs/changelog.md) | What changed in each build |
| [`docs/testing.md`](docs/testing.md) | What still needs testing |
| [`tools/build.ps1`](tools/build.ps1) | Build a new version: `.\tools\build.ps1 -Version 0.21 -Install` |

The script has no indentation or comments on purpose: both count toward the 64 KiB mode limit, so the explanations live in `docs/how-the-script-works.md`.

## Credits

Inspired by Zombie Survival for Garry's Mod by JetBoom. Nothing from it is copied: this is a fresh Megalo script. Built on Project Reclaimer's Megalo scripting and its official examples.
