# Flood Survival for Project Reclaimer

A wave-survival mode for Halo 3 in [Project Reclaimer](https://projectreclaimer.dev), inspired by Garry's Mod **Zombie Survival**: Survivors hold out through timed waves while the Flood grow with every Survivor they convert. One Megalo script, any stock map, nothing to install for joining players.

**Version: V1.0** (called Zombie Survival up to v0.36). Needs Project Reclaimer **0.9.23** on the host and every player.

## Play it

1. Put [`modes/flood-survival-v1.0.json`](modes) in `Documents\My Games\Project Reclaimer\Game Modes` (a subfolder is fine).
2. In the game: **Host Game → Game Type → Refresh → Slayer → Flood Survival v1.0**. Tested on The Pit and Guardian.
3. You need at least **2 players** (split-screen works). Only the host needs the file.

Mouse and keyboard only: controllers can't use the script's menus.

**Testing:** under **Game Options → Slayer rules → Custom mode options**, `free_shop` = 1 makes the arsenal and traits free and `test_keys` = 1 lets **Ability 4** skip the current timer. Both are off by default (since v0.61).

## How a round works

1. **Pick traits.** Before their first spawn, every Survivor picks boosts (cost points) and drawbacks (give points).
2. **Warmup** (45 s). Everyone is a first-person Spartan with a Magnum and fists. The map's weapons are removed (vehicles stay): you only get the guns you buy.
3. **Outbreak.** 10% of players (at least 1) turn Infected.
4. **5 waves** (90 s, then 15 s longer each), with **60 s breaks** between them. A Survivor who dies joins the Infected.
5. Survivors win by outlasting the last wave. The Infected win when nobody is left.

Players who join after wave 2 starts begin as Infected.

## Survivors

- **Traits:** Fast Feet / Slow, Overshield / Frail, Hard Hitter / Weak Arm, Grenadier (2 frags that come back), Tough, Assault (spawn with an Assault Rifle).
- **Arsenal (Ability 1):** open anywhere in warmup; anywhere in breaks but 50% dearer away from a quartermaster; only near a quartermaster during waves.
  - Pages: **Weapons** (two pages, grouped by the wave they open in), **Placeables**, then **Equipment**. Each page is sorted by opening wave; locked items are grey and say which wave. Gear for the next wave opens in the break before it.
  - Weapons (16, from the SMG to the Spartan Laser): dropped at your feet.
  - Equipment (ammo refill, cover, bubble shield, regenerator, trip mine, radar jammer, camo, invincibility).
  - Placeables (machine gun, Hunter barrier, plasma cannon, quartermaster, Resupply Box): you get a **grav lift**, and the item is built where it lands. Throw it where you're aiming.
  - **Resupply Box** (80 points, from wave 2, 2 per team): a floating Sentinel Constructor that refills the ammo of every Survivor within 10 ft every 20 s; its owner gets 1 point per Survivor refilled.
  - **Prop Placer** (20 points, one use): the next map prop you pick up comes with a grav lift, so you can throw it into place.
- **Base building (Flashlight):** stand within 8 ft of a map prop (crate, barrier, sandbags...) and press **Flashlight** to pick it up; it rides 5 ft in front of you. Press Flashlight again to let go of it there, turned your way (not within 4 ft of anyone; a prop someone just placed is theirs for 5 s). With a Prop Placer you can throw the grav lift instead, and the prop lands where the lift does. Works on any map: the script uses the map's own props. **Props are temporary barricades:** the map respawns moved props, so 30-60 s after you place one it vanishes and comes back at its original spot about 30 s later. Use them to plug a gap for a fight, then grab them again; for cover that lasts, buy placeables (Hunter barriers, turrets). The Juggernaut's Siege Smash clears every prop and Survivor build around him.
- **Points:** 10 per kill, 25 per wave survived, 100 to start.
- **Wave award:** at the end of each wave (not the last), the living Survivor with the most kills since the last award gets every weapon tier opened for them and their next weapon free.
- **Quartermasters (like ZS arsenal crates):** bought (100 points, 2 per team) and thrown into place with a grav lift. During waves you can only shop within 20 ft of one, in breaks they mean normal prices, and the owner earns 10% of what other Survivors buy there. Ammo comes only from the arsenal's Ammo refill (20 points).

## Infected

Dead Infected pick a form, then press **Spawn** (or **Spawn at Nest**). A new tier of forms opens with each wave:

| Tier | Opens at | Forms |
| --- | --- | --- |
| 1 | wave 1 | Flood Human (200 health), Baby Stalker (tiny, fast, fragile), Breacher (big, 300 health, 2 at a time) |
| 2 | wave 2 | Flood Brute, Flood Stalker, Jumper Brute (low gravity, 1 at a time) |
| 3 | wave 3 | Flood Elite (shields, 3 at a time), Nest Stalker (builds the team's nest), Invis Stalker (nearly invisible, 2 at a time) |
| 4 | wave 4 | Shifter Stalker (turns into a turret or a Tank, 2 at a time), Flood Tank |
| 5 | last wave (5) only | Sword Spartan |

- **Nest Stalker:** builds one nest (Ability 1). It outlives the builder; the Infected can spawn at it until the Survivors destroy it.
- **Feeding:** a Flood player who scores a kill heals to full (bosses heal 25% of their health instead).
- **Aim for the head:** in Project Reclaimer the Flood combat forms (Human, Breacher, Brute, Elite) and the Tank body only take damage in the head; body shots do nothing unless a long spray finishes them. Stalkers can be hit anywhere.
- **Leap (Crouch):** Flood Humans, Breachers, Brutes, Jumper Brutes, Elites and every boss leap the way they face: half a second after Crouch they're thrown forward and up (Humans the least, the Jumper Brute the farthest), then 2 s before the next.
- **Shifter Stalker:** Ability 1 turns into a turret, Ability 2 into a Tank, after 1 second; either key turns it back.
- **Breaks:** Infected who die during a break come back as harmless flying Monitors, and turn back into Flood when the wave starts.
- **Bosses** (from wave 2): the Infected player with the most kills (picked at random if tied, so there's always one) gets one boss life, from a gold card at the top of their picker: **Juggernaut** (giant, very tough Tank; Ability 1 Siege Smash destroys Survivor builds and every map prop within 20 ft; Flood Humans, Breachers, Brutes and Tanks can spawn on him), **Brute Chieftain** (a big Flood Brute: fastest, very tough, 300% damage; Brutes can spawn on him), **Stalker Matriarch** (a 250% Shifter Stalker at max speed with 150 health: turret transformation, the strongest leap, and every Stalker form can spawn on her) or **Master Chief** (invisible, Energy Sword, no shield recharge, can be headshot; Ability 1 gives a random piece of equipment every 20 s). A boss arrives with a big red "HAS RISEN" banner that shrinks away, then everyone sees its health at the top of the screen; when the boss dies every Survivor gets 10 points and the killer 25 more.

## Status

- **V1.0** (2026-10-26), played in split-screen and small tests on The Pit and Guardian. The few checks still open (mainly a big lobby, Feeding and the boss entrance banner) are in [docs/testing.md](docs/testing.md); every change is in [docs/changelog.md](docs/changelog.md).
- **Known limits:**
  - Moved props are temporary: the map respawns them 30-60 s after they're placed (a script can't switch that off).
  - Flood combat forms and the Tank body only take damage in the head (Project Reclaimer behaviour).
  - Controllers can't use the script's menus.
  - Script-made bodies (the quartermaster, Hunter barriers, Resupply drones) show red, as enemies: a script can't give them a team.
- **Size:** 57.7 KiB of 64, about **6 KiB free**. The mode stores the script's source text, so the build stores a compact copy: `tools/shrink.ps1` renames everything to 1-2 letters and `tools/pack.ps1` drops spare spaces and line breaks. Both prove the copy matches the readable script (same names back, same tokens), and megalo-check must read each the same. The readable script in `scripts/` is the one to edit; [docs/name-key.md](docs/name-key.md) says which short name is which.

### What's full

| What | Used | What it means |
| --- | --- | --- |
| Host options | 16 / 16 | A new host setting means merging two |
| Trait sets | 16 / 16 | A new stat effect means merging two sets |
| Widgets | 31 / 32 | One free (widget 23) |
| Infected classes | 16 / 16 | New Flood forms or bosses must be variants of an existing class, like the Stalker Matriarch |
| Survivor classes | 4 / 16 | Room for Survivor roles |
| Per-player numbers, objects, timers | all full | New per-player state goes in free perk bits, on the player's body or in team variables |
| Global numbers | 12 / 12 | Global objects, players and timers still have room |

### Ideas for later

Survivor roles (for example an engineer), a vehicles page in the arsenal, horde armour (needs a trait set), nest gas that hurts Survivors near the Flood nest.
## Host options

Wave count and lengths, break length, warmup, starting Infected share, waves per tier, points, quartermaster range, placeable and gun limits: all under **Custom mode options**. The full list and defaults are in [docs/rules.md](docs/rules.md).

## Files

| Path | What |
| --- | --- |
| [`modes/`](modes) | The mode to play |
| [`scripts/flood-survival.rvt`](scripts/flood-survival.rvt) | The Megalo script |
| [`scripts/flood-survival-template.json`](scripts/flood-survival-template.json) | Options, traits and the class roster it compiles with |
| [`docs/rules.md`](docs/rules.md) | Every rule, key, price and option |
| [`docs/how-the-script-works.md`](docs/how-the-script-works.md) | Notes on the code, section by section |
| [`docs/name-key.md`](docs/name-key.md) | Which short name in the mode file is which name in the script (rebuilt every build) |
| [`docs/changelog.md`](docs/changelog.md) | What changed in each build |
| [`docs/testing.md`](docs/testing.md) | What still needs testing |
| [`tools/build.ps1`](tools/build.ps1) | Build a new version: `.\tools\build.ps1 -Version 1.1 -Install` |
| [`tools/shrink.ps1`](tools/shrink.ps1) | Makes the short-name copy the build compiles, and the name key |
| [`tools/pack.ps1`](tools/pack.ps1) | Packs the short-name copy (no spare spaces or line breaks) |

The script has no indentation or comments on purpose: the mode stores its source text, and both would count toward the 64 KiB limit. The explanations live in `docs/how-the-script-works.md`, and the mode file's short names are decoded in `docs/name-key.md`.

## Credits

Inspired by Zombie Survival for Garry's Mod by JetBoom and the NoXiousNet community. Nothing from it is copied: this is a fresh Megalo script. Built on Project Reclaimer's Megalo scripting and its official examples.
