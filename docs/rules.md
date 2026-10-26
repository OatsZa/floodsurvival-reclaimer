# Flood Survival v0.52: rules

Everything a player or host needs, as built in v0.52. Launch: **Host Game → Game Type → Refresh → Slayer → Flood Survival v0.52**. At least 2 players (split-screen works); lobby teams don't matter, the script puts everyone on Survivors when the game starts. Mouse and keyboard only.

## How the round runs

1. **Traits first.** Each Survivor picks traits before their first spawn. The **purge** clears the map's vehicles, and the moment a map weapon appears it's deleted, even with someone standing on it. A weapon a player has held (your Magnum, a boss's sword) stays while someone is within 6 ft of it (grenades and equipment on the map stay).
2. **Warmup** (45 s, needs 2 players). Survivors are first-person Spartans with a **Magnum and fists**, no grenades, at **half shields**. The arsenal is open anywhere.
3. **Outbreak.** 10% of players, rounded up, become Infected (at least 1, never everyone). Their Survivor body is killed without the death counting.
4. **Waves** (120 s, +15 s each, 5 waves). Each wave opens the next tier of Flood forms. A dead Survivor turns Infected. Dead Infected pick a form, then press **Spawn** (or **Spawn at Nest**).
5. **Breaks** (60 s). Living Flood fight on. Infected who die get only the **Monitor** (flies, harmless). It dies by itself when the wave starts. In the last 6 s of a break the picker offers Flood forms instead.
6. **End.** Survivors win when the last wave ends with any Survivor left. Infected win when none is left.

**Last Survivor.** When only one Survivor is left (in a wave or a break), they get **2x health** (200), a **bottomless magazine** (no reloads) and shields that recharge **twice as fast** (same amount). Everyone gets a message, the Survivors' colour turns gold and the top line says LAST SURVIVOR STANDING. In a 2-player game that's from the outbreak on.

New players are Survivors until wave 2 starts, then Infected. Survivors earn 10 points per kill and 25 per wave survived (start 100).

**Wave awards.** When a wave ends (not the last one), the living Survivor with the most kills and the one who placed the most props each get an award; ties are picked at random, and you need at least 1. Kills and props count from the end of the last wave, so the break before a wave counts too, and each prop counts once per wave however often it's moved. **Most kills:** your next weapon from the arsenal is free, any open one. **Most props placed:** your next placeable or equipment is free (not Ammo refill). Everyone sees 'Wave N awards: most kills N, most props placed N'; winners get their own message, and the points line shows the award until it's used. Winning the same award again before using it doesn't stack. Turning Infected loses it.

## Survivors

### Traits (before the first spawn)

While you pick, a **WAVE AWARDS** card stands on the right: "Most kills in a wave: your next weapon from the arsenal is free, any you like." / "Most props placed (the break before counts): next placeable or equipment free." A **LAST SURVIVOR** card stands on the left: "With one Survivor left, they get 2x health and shields that recharge twice as fast." / "They also never reload (bottomless mag), and everyone sees LAST SURVIVOR STANDING."

The arsenal shows two how-to cards beside it:
- **BUILD A BASE** (left): "Flashlight picks up the closest prop (8 ft). Press again to drop it: quick but rough." / "Prop Placer (20 points) is more accurate: buy one, pick up a prop, then throw the grav lift."
- **THE ARSENAL** (right): "Ability 1 opens it: near the quartermaster in waves, anywhere in warmup and breaks." / "Placeables come as a grav lift: throw it and it's built where it lands. All gear opens by wave."

The Infected picker has one on the left: **BOSSES**: "The Infected with the most kills picks a boss at the start of each wave." / "Bosses start in wave 2. Click the gold card to cycle through them."

Gold cards are chosen; opposite pairs switch each other off. **Ready: spawn** pays and spawns you. Traits last the whole round.

| Trait | Effect | Points |
| --- | --- | --- |
| Fast Feet / Slow | 125% / 90% speed | costs 40 / gives 30 |
| Overshield / Frail | 2× shields / no shields | costs 50 / gives 40 |
| Hard Hitter / Weak Arm | 125% / 75% damage | costs 40 / gives 30 |
| Grenadier | spawn with 2 frags; grenades regenerate (the engine's grenade regeneration trait: the script doesn't set the speed or the cap) | costs 30 |
| Tough | takes less damage (150% resistance) | costs 40 |
| Assault | spawn with an Assault Rifle too | costs 50 |

### Keys

| Key | Does |
| --- | --- |
| Ability 1 | Open the arsenal: anywhere in warmup and breaks, within 30 ft of the quartermaster during waves. Close it with **Close** |
| Use Equipment | Use equipment, or throw a placeable's **grav lift** where you want it: the item is built where it lands |
| Flashlight | Pick up the nearest map prop within 8 ft (it rides 5 ft in front of you); press again to let go of it there, turned your way |
| Ability 4 | **Test only** (`test_keys` = 1): end the current warmup, wave or break at once |

### Arsenal (4 pages: weapons, weapons, placeables, equipment)

Each page is sorted by the wave its items open in. An item is open from warmup if it's a wave 1 item, otherwise from the break before its wave (so wave 2 gear can be bought in the first break). Locked cards are grey and say "opens in wave N"; buying one says "That opens in wave N". With fewer waves set (`wave_count`), later items never open.

| Page | Wave 1 (from warmup) | Wave 2 | Wave 3 | Wave 4 | Wave 5 |
| --- | --- | --- | --- | --- | --- |
| 1-2 Weapons | SMG 15, Plasma Rifle 20, Battle Rifle 25, Carbine 25, Needler 25, Shotgun 35 | Mauler 45, Brute Shot 60, Sniper Rifle 70, Beam Rifle 70 | Energy Sword 90, Flamethrower 90, Gravity Hammer 90 | Fuel Rod Gun 120, Rocket Launcher 130 | Spartan Laser 150 |
| 3 Placeables | Prop Placer 20 (one use), Barrier (Hunter, 3× health, breakable) 50 | Machine Gun 80 | Plasma Cannon 110 | Missile Pod 140 | |
| 4 Equipment | Ammo refill 20, Radar Jammer 15, Deployable Cover 25 | Trip Mine 30, Regenerator 45, Bubble Shield 45 | Active Camo 60 | Invincibility 100 | |

The weapons run in that order across both pages: page 1 is the six wave 1 weapons plus the Mauler and Brute Shot, page 2 the rest.

- Guns drop at your feet. Equipment goes into your slot.
- Placeables come as a grav lift. Until you throw it, the HUD says "Throw your grav lift to build it". Up to 4 of each per team.
- **One at a time:** while you carry equipment, a grav lift or a ready Prop Placer, the other equipment and placeable cards are grey and can't be bought (Ammo refill still can).
- Plasma Cannon and Missile Pod show "not on this map" unless the map has one.
- Everything is FREE while `free_shop` = 1 (testing), traits included.

**Base building with map props:** any object on the map that isn't a body, vehicle, weapon or equipment counts as a prop (crates, barriers, sandbags; invisible markers too, so pick what you can see). Press **Flashlight** within 8 ft to pick up the nearest one, and again to let go of it where it is (5 ft in front of you), turned your way. Static props may keep their old facing: use a Prop Placer to set it. Props someone else carries can't be taken, and a prop someone just placed is theirs for 5 s ("Someone just placed that prop: wait a few seconds"). **No prop within 4 ft of anyone:** a Flashlight drop that close to another player (or any body, the quartermaster and the nest included) is refused and you keep carrying it; a Prop Placer grav lift that lands within 4 ft of anyone, you included, is refused and comes back to you ("Too close to someone: grav lift returned"). You drop it if you die. **Prop Placer** (20 points, one use): the next prop you pick up (or the one you carry when you buy it) comes with a grav lift. Throw it and the prop lands where the lift stops, facing your way, and the Prop Placer is used up. Press Flashlight instead and you keep it for the next prop. Its card says "ready" while you have one. Props can't be put back: they stay where they were left until the round ends.

**Quartermaster:** a standing Marine, made once in front of the first Survivor. It shows red, as an enemy, which can't be changed. During waves the arsenal opens only within 30 ft of him. There is no free ammo: buy the arsenal's Ammo refill (20 points), at the quartermaster during a wave or anywhere in a break.

## Infected

### Forms by tier (one tier opens per wave)

| Tier | Opens at | Forms |
| --- | --- | --- |
| 1 | wave 1 | Flood Human (300% speed, 200% damage, 200 health); **Baby Stalker** (50% size, 300% speed, 40 health); **Breacher** (a Flood Human at 130% size with 300 health, same top speed and damage; 2 at a time) |
| 2 | wave 2 | Flood Brute (immune to headshots), Flood Stalker; **Jumper Brute** (normal size, 50% gravity for huge jumps, 200% speed, immune to headshots; 1 at a time) |
| 3 | wave 3 | Flood Elite (shields on); **Nest Stalker** (1 per team, slower, 150% health); **Invis Stalker** (85% size, 300% speed, 85 health, camouflage level 3; 2 at a time) |
| 4 | wave 4 | **Shifter Stalker** (normal Stalker; Ability 1 turret, Ability 2 Tank form at 120% size and 125 health; 2 at a time); Flood Tank (150% size, 200% health, takes 50% less damage) |
| 5 | **last wave (5) only** | **Sword Spartan**: first-person Spartan with an Energy Sword, 150% speed, in the Infected team's green-yellow |

The picker's title says which tier opens next and in which wave. The HUD's second line shows the highest open tier ("Flood tier 2 / 4"). Locked cards are grey, and so are full ones ("Breacher / Invis Stalker / Shifter Stalker | full (2 max)", "Jumper Brute | taken", "Nest Stalker | taken"). Tiers never lock again. The picker shows the forms in tier order, two to a row.

### Special forms

| Form | Key | Does |
| --- | --- | --- |
| Nest Stalker | Ability 1 | Build **one** nest 5 ft ahead (shielded Carrier look, 150% size, 4× health). It stays after you die; a new one can only be built once it's destroyed (and 30 s after the last). Infected get **Spawn at Nest (health N)** while it stands |
| Flood Human, Breacher, Flood Brute, Jumper Brute, Flood Elite | Crouch | **Leap** the way you face: 0.5 s after Crouch you're thrown forward and up. Strength: Human and Breacher a bit below Brute and Elite; Brute and Elite medium; Jumper Brute the strongest (with its low gravity it goes very far). 2 s between leaps |
| Shifter Stalker | Ability 1 / Ability 2 | After 1 s, Ability 1 turns into a turret (Pure Ranged), Ability 2 into a Tank (120% size, 125 health, normal damage). Either key turns back into the Stalker. No time limit, 3 s between changes, health share kept |

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
