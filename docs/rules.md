# Zombie Survival v0.35: rules

Everything a player or host needs, as built in v0.35. Launch: **Host Game → Game Type → Refresh → Slayer → Zombie Survival v0.35**. At least 2 players (split-screen works); lobby teams don't matter, the script puts everyone on Survivors when the game starts. Mouse and keyboard only.

## How the round runs

1. **Traits first.** Each Survivor picks traits before their first spawn. The **purge** clears the map's vehicles, and the moment a map weapon appears it's deleted, even with someone standing on it. A weapon a player has held (your Magnum, a boss's sword) stays while someone is within 6 ft of it (grenades and equipment on the map stay).
2. **Warmup** (45 s, needs 2 players). Survivors are first-person Spartans with a **Magnum and fists**, no grenades, at **half shields**. The arsenal is open anywhere.
3. **Outbreak.** 10% of players, rounded up, become Infected (at least 1, never everyone). Their Survivor body is killed without the death counting.
4. **Waves** (120 s, +15 s each, 5 waves). Each wave opens the next tier of Flood forms. A dead Survivor turns Infected. Dead Infected pick a form, then press **Spawn** (or **Spawn at Nest**).
5. **Breaks** (60 s). Living Flood fight on. Infected who die get only the **Monitor** (flies, harmless). It dies by itself when the wave starts. In the last 6 s of a break the picker offers Flood forms instead.
6. **End.** Survivors win when the last wave ends with any Survivor left. Infected win when none is left.

New players are Survivors until wave 2 starts, then Infected. Survivors earn 10 points per kill and 25 per wave survived (start 100).

## Survivors

### Traits (before the first spawn)

Gold cards are chosen; opposite pairs switch each other off. **Ready: spawn** pays and spawns you. Traits last the whole round.

| Trait | Effect | Points |
| --- | --- | --- |
| Fast Feet / Slow | 125% / 90% speed | costs 40 / gives 30 |
| Overshield / Frail | 2× shields / no shields | costs 50 / gives 40 |
| Hard Hitter / Weak Arm | 125% / 75% damage | costs 40 / gives 30 |
| Grenadier | spawn with 2 frags, grenades regenerate | costs 30 |
| Tough | takes less damage (150% resistance) | costs 40 |
| Assault | spawn with an Assault Rifle too | costs 50 |

### Keys

| Key | Does |
| --- | --- |
| Ability 1 | Open the arsenal: anywhere in warmup and breaks, within 30 ft of the quartermaster during waves. Close it with **Close** |
| Use Equipment | Use equipment, or throw a placeable's **grav lift** where you want it: the item is built where it lands |
| Flashlight | Pick up the nearest map prop within 8 ft (it rides 5 ft in front of you); press again to let go of it there, turned your way |
| Ability 4 | **Test only** (`test_keys` = 1): end the current warmup, wave or break at once |

### Arsenal (4 pages)

| Page | Items |
| --- | --- |
| 1 Guns | Shotgun 40, Battle Rifle 30, SMG 20, Sniper Rifle 60, Rocket Launcher 100, Carbine 30, Mauler 40, Energy Sword 80 |
| 2 Heavy guns | Flamethrower 80, Spartan Laser 120, Brute Shot 60, Gravity Hammer 80, Needler 30, Plasma Rifle 30, Beam Rifle 60, Fuel Rod Gun 100 |
| 3 Equipment | Ammo refill 20, Deployable Cover 30, Bubble Shield 40, Regenerator 40, Trip Mine 30, Radar Jammer 20, Active Camo 50, Invincibility 80 |
| 4 Placeables | Machine Gun 80, Barrier (Hunter, 3× health, breakable) 60, Plasma Cannon 100, Missile Pod 120, Prop Placer 20 (one use) |

- Guns drop at your feet. Equipment goes into your slot.
- Placeables come as a grav lift. Until you throw it, the HUD says "Throw your grav lift to build it". Up to 4 of each per team.
- **One at a time:** while you carry equipment, a grav lift or a ready Prop Placer, the other equipment and placeable cards are grey and can't be bought (Ammo refill still can).
- Plasma Cannon and Missile Pod show "not on this map" unless the map has one.
- Everything is FREE while `free_shop` = 1 (testing), traits included.

**Base building with map props:** any object on the map that isn't a body, vehicle, weapon or equipment counts as a prop (crates, barriers, sandbags; invisible markers too, so pick what you can see). Press **Flashlight** within 8 ft to pick up the nearest one, and again to let go of it where it is (5 ft in front of you), turned your way. Static props may keep their old facing: use a Prop Placer to set it. Props someone else carries can't be taken. You drop it if you die. **Prop Placer** (20 points, one use): the next prop you pick up (or the one you carry when you buy it) comes with a grav lift. Throw it and the prop lands where the lift stops, facing your way, and the Prop Placer is used up. Press Flashlight instead and you keep it for the next prop. Its card says "ready" while you have one. Props can't be put back: they stay where they were left until the round ends.

**Quartermaster:** a standing Marine, made once in front of the first Survivor. It shows red, as an enemy, which can't be changed. During waves the arsenal opens only within 30 ft of him. There is no free ammo: buy the arsenal's Ammo refill (20 points), at the quartermaster during a wave or anywhere in a break.

## Infected

### Forms by tier (one tier opens per wave)

| Tier | Opens at | Forms |
| --- | --- | --- |
| 1 | wave 1 | Flood Human (300% speed, 200% damage) |
| 2 | wave 2 | Flood Brute, Flood Stalker |
| 3 | wave 3 | Flood Elite (shields on); **Nest Stalker** (1 per team, slower, 150% health) |
| 4 | wave 4 | **Turret Stalker** (75% size, 300% speed, 75% health); **Tank Stalker** (125% size, 125% health; its Tank form is 120%, weaker than the Flood Tank); Flood Tank (150% size, 200% health, takes 50% less damage) |
| 5 | **last wave (5) only** | **Sword Spartan**: first-person Spartan with an Energy Sword, 150% speed, in the Infected team's green-yellow |

The picker's title says which tier opens next and in which wave. Locked cards are grey. Tiers never lock again.

### Special forms

| Form | Key | Does |
| --- | --- | --- |
| Nest Stalker | Ability 1 | Build **one** nest 5 ft ahead (shielded Carrier look, 150% size, 4× health). It stays after you die; a new one can only be built once it's destroyed (and 30 s after the last). Infected get **Spawn at Nest (health N)** while it stands |
| Turret Stalker | Ability 1 | After 1 s, turn into a turret (Pure Ranged); Ability 1 again turns back. No time limit, 3 s between changes, health share kept |
| Tank Stalker | Ability 1 | After 1 s, turn into a Tank (120% size, normal damage) and back, the same way |

### Bosses (from wave 2)

When a wave starts from wave 2 on, the Infected player with the **most kills this round** becomes that wave's boss and gets a message. Ties (zero kills included) are picked at random, so there's always a boss while anyone is Infected. Only they see the gold boss card, as a full-width row at the top of the picker. **Clicking it cycles** Juggernaut → Brute Chieftain → Master Chief; then Spawn. **One life.** An unused boss turn ends with the wave.

| Boss | What |
| --- | --- |
| Juggernaut | Flood Tank, 200% size, 4× health, takes 67% less damage (about 3× a Flood Tank's toughness) |
| Brute Chieftain | 300% size, 300% speed, 300% health, takes 67% less damage, spawns with invincibility equipment |
| Master Chief | First person, Energy Sword, invisible, can be headshot, 200% speed, normal health and shields, **no shield recharge** |

## Host options (Custom mode options)

| Option | Default | What |
| --- | --- | --- |
| break_seconds | 60 | Break length |
| quartermaster_radius | 30 | Feet from the quartermaster within which the arsenal opens during waves |
| free_shop | 1 | 1 = arsenal and traits free (testing) |
| gun_cap | 100 | Most bought guns that can exist at once |
| kill_points | 10 | Points per kill |
| min_players | 2 | Players needed for the warmup to count down |
| placeable_limit | 4 | Per placeable type, per team |
| start_infected_percent | 10 | Share of players who start Infected (rounded up) |
| start_points | 100 | Points each Survivor starts with |
| test_keys | 1 | 1 = Ability 4 skips the current timer |
| tier_step_waves | 1 | Waves per tier: 1 = a new tier every wave, 2 = every second wave |
| warmup_seconds | 45 | Warmup length |
| wave1_seconds | 120 | Wave 1 length |
| wave_bonus | 25 | Points for each wave survived |
| wave_count | 5 | Waves to survive (the Sword Spartan comes on the last one) |
| wave_increase_seconds | 15 | Added to each later wave |
