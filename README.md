# Flood Survival for Project Reclaimer

A wave-survival mode for Halo 3 in [Project Reclaimer](https://projectreclaimer.dev), inspired by Garry's Mod **Zombie Survival**: Survivors hold out through timed waves while the Flood grow with every Survivor they convert. One Megalo script, any stock map, nothing to install for joining players.

**Version: v0.66** (work in progress, not final; called Zombie Survival up to v0.36). Needs Project Reclaimer **0.9.23** on the host and every player.

## Play it

1. Put [`modes/flood-survival-v0.66.json`](modes) in `Documents\My Games\Project Reclaimer\Game Modes` (a subfolder is fine).
2. In the game: **Host Game → Game Type → Refresh → Slayer → Flood Survival v0.66**. Tested on The Pit.
3. You need at least **2 players** (split-screen works). Only the host needs the file.

Mouse and keyboard only: controllers can't use the script's menus.

A light-blue **health bar** at the bottom of the screen shows your health as a share of your maximum (87/100).

**Testing:** under **Game Options → Slayer rules → Custom mode options**, `free_shop` = 1 makes the arsenal and traits free and `test_keys` = 1 lets **Ability 4** skip the current timer. Both are off by default (since v0.61).

## How a round works

1. **Pick traits.** Before their first spawn, every Survivor picks boosts (cost points) and drawbacks (give points).
2. **Warmup** (45 s). Everyone is a first-person Spartan with a Magnum and fists. The map's weapons and vehicles are removed: you only get what you buy.
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
- **Base building (Flashlight):** stand within 8 ft of a map prop (crate, barrier, sandbags...) and press **Flashlight** to pick it up; it rides 5 ft in front of you. Press Flashlight again to let go of it there, turned your way (not within 4 ft of anyone; a prop someone just placed is theirs for 5 s). With a Prop Placer you can throw the grav lift instead, and the prop lands where the lift does. Works on any map: the script uses the map's own props.
- **Points:** 10 per kill, 25 per wave survived, 100 to start.
- **Wave award:** at the end of each wave (not the last), the living Survivor with the most kills since the last award gets every weapon tier opened for them and their next weapon free.
- **Quartermasters (like ZS arsenal crates):** bought (100 points, 2 per team) and thrown into place with a grav lift. During waves you can only shop within 20 ft of one, in breaks they mean normal prices, and the owner earns 10% of what other Survivors buy there. Ammo comes only from the arsenal's Ammo refill (20 points).

## Infected

Dead Infected pick a form, then press **Spawn** (or **Spawn at Nest**). A new tier of forms opens with each wave:

| Tier | Opens at | Forms |
| --- | --- | --- |
| 1 | wave 1 | Flood Human (200 health), Baby Stalker (tiny, fast, fragile), Breacher (big, 300 health, 2 at a time) |
| 2 | wave 2 | Flood Brute (headshot-immune), Flood Stalker, Jumper Brute (low gravity, headshot-immune, 1 at a time) |
| 3 | wave 3 | Flood Elite (shields, 3 at a time), Nest Stalker (builds the team's nest), Invis Stalker (nearly invisible, 2 at a time) |
| 4 | wave 4 | Shifter Stalker (turns into a turret or a Tank, 2 at a time), Flood Tank |
| 5 | last wave (5) only | Sword Spartan |

- **Nest Stalker:** builds one nest (Ability 1). It outlives the builder; the Infected can spawn at it until the Survivors destroy it.
- **Leap (Crouch):** Flood Humans, Breachers, Brutes, Jumper Brutes and Elites leap the way they face: half a second after Crouch they're thrown forward and up (Humans the least, the Jumper Brute the farthest), then 2 s before the next.
- **Shifter Stalker:** Ability 1 turns into a turret, Ability 2 into a Tank, after 1 second; either key turns it back.
- **Breaks:** Infected who die during a break come back as harmless flying Monitors, and turn back into Flood when the wave starts.
- **Bosses** (from wave 2): the Infected player with the most kills (picked at random if tied, so there's always one) gets one boss life, from a gold card at the top of their picker: **Juggernaut** (giant, very tough Tank; Ability 1 tank mode: slow but takes far less damage), **Brute Chieftain** (a big Flood Brute: fastest, very tough, 300% damage, headshot-immune; Brutes can spawn on him) or **Master Chief** (invisible, Energy Sword, no shield recharge, can be headshot; Ability 1 gives a random piece of equipment every 20 s). Survivors see the boss's health at the top of the screen; when the boss dies every Survivor gets 10 points and the killer 25 more.

## Status and next steps

- **Size:** 56.1 KiB of 64, about **8 KiB free**. The mode stores the script's source text, so the build stores a compact copy: `tools/shrink.ps1` renames everything to 1-2 letters (since v0.33) and `tools/pack.ps1` drops spare spaces and line breaks (since v0.62, about 6 KiB saved). Both prove the copy matches the readable script (same names back, same tokens), and megalo-check must read each the same. The readable script in `scripts/` stays the one to edit; [docs/name-key.md](docs/name-key.md) says which short name is which.
- **Untested in game:** the bosses, the Sword Spartan, the equipment fix, the health bar and the prices. The checklist is in [docs/testing.md](docs/testing.md).
- **Done:** roadmap step 11 (v0.52, untested: wave awards), roadmap step 6 (v0.51, untested: prop safety), roadmap step 7 (v0.47, untested: the Last Survivor bonuses and alert), roadmap step 4 (v0.44-v0.45: how-to cards for building and the arsenal beside the trait screen, and for bosses beside the Infected picker), the Flood leap (v0.42, proven in Test 15), roadmap step 1 (v0.36-v0.37: arsenal grouped and locked by wave, new prices), the rename to Flood Survival (v0.37), roadmap step 2 (v0.38: four new Flood forms, Turret and Tank Stalker merged into the Shifter Stalker), roadmap step 3 (v0.40-v0.43: a Flood Hunter and a Mega Carrier boss were tried and dropped: a Hunter body keeps its blue colours, and a player Carrier can't be made to respawn after its blast), the v0.27 hint trim, base building with map props (v0.32-v0.35: Flashlight pick up and drop, the one-use Prop Placer), short names (v0.33).

### Limits other than space (v0.38)

| What | Used | Free | What it means |
| --- | --- | --- | --- |
| Host options | 16 / 16 | 0 | No new host setting unless two are merged (e.g. `free_shop` + `test_keys` into one test switch) |
| Trait sets | 16 / 16 | 0 | Full since v0.47 (Last Survivor): a new stat effect needs two sets merged first |
| Widgets | 32 / 32 | 0 | Full: new HUD text has to share a widget (step 11's wave awards can use the message line, 6) |
| Infected classes | 16 / 16 | 0 | Full: new bosses (step 3) have to be body swaps on the existing boss classes |
| Survivor classes | 4 / 16 | 12 | Room for Survivor roles |
| Per-player numbers, objects, timers | all full | 0 | New per-player state must share a slot or go in the free perk bits (11 used), on the player's body (lost on death) or in team variables |
| Global numbers / objects / players / timers | 12/12, 3/16, 4/8, 3/8 | numbers full since v0.47 | Fine for round-wide state |

### Roadmap (in this order, set 2026-10-25)

Costs are rough mode KiB, after short names. Time is a rough guess at the pace of v0.27-v0.35 (9 builds plus a test mode in about 3 hours), including a test round in game for each step.

| # | Step | Cost | Uses | Time | Notes |
| --- | --- | --- | --- | --- | --- |
| 1 | ~~**Arsenal order and price rework:**~~ **Done in v0.36.** pages ordered by the wave each item unlocks in, gear locked until its wave, new prices | ~0.5-1 | — | 1-1.5 h | Needs the unlock wave and price for each item |
| 2 | ~~**More Flood forms** (tier 1-3)~~ **Done in v0.38.** | ~0.5 each | 1 Infected class each | 1.5-2 h | Per-class stats go in the template (free) |
| 3 | ~~**Boss variety**~~ **Tried in v0.40-v0.43, both new bosses dropped** (see Done above); the three original bosses stay. | ~0.5 each | body swaps | 1-1.5 h | No Infected classes are free after step 2, so new bosses are body swaps on the existing boss classes (as the Shifter Stalker does), which needs no class. Agreed on 2026-10-25 |
| 4 | ~~**How-to cards**~~ **Done in v0.44.** left and right of the trait screen in warmup: building (Flashlight, Prop Placer) and the arsenal | ~0.4 | 2 widgets | 0.5 h | |
| 5 | **Invisible-prop filter**, tried in Test 13 first | ~0.2 | — | 0.5-1 h | e.g. skip objects with 0 health |
| 6 | ~~**Prop safety**~~ **Done in v0.51 (untested).** a short cooldown before someone else can take a prop you just placed, and **no prop placed 0-4 ft from any player** (a grav lift spot or drop that close is refused), so nobody gets pushed up or out of the map | ~0.4 | object timer | 0.5-1 h | |
| 7 | ~~**Last Survivor**~~ **Done in v0.47 (untested).** the last one standing gets 2x health, a bottomless magazine and faster shield recharge (same shield amount), with a HUD alert | ~0.3 | the last trait set | 0.5 h | |
| 8 | ~~Redemption~~ | — | — | — | Not for now: the Flood are already the weaker side. Maybe later |
| 9 | **Horde armour** (maybe): Infected near other Infected take less damage | ~0.6 | a trait set | 0.5-1 h | No trait set left after step 7: two sets would have to be merged first |
| 10 | **Boss abilities** | ~0.3-0.5 each | — | 1-2 h | |
| 11 | ~~**Wave awards**~~ **Done in v0.52 (untested):** most kills = next weapon free, most props placed = next placeable or equipment free. Planned as: "achievements" and point bonuses for the top earners and killers after each wave | ~0.5 | 1-2 widgets | 1 h | |
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
| [`scripts/flood-survival.rvt`](scripts/flood-survival.rvt) | The Megalo script |
| [`scripts/flood-survival-template.json`](scripts/flood-survival-template.json) | Options, traits and the class roster it compiles with |
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
