# Flood Survival v0.79: rules

Everything a player or host needs, as built in v0.79. Launch: **Host Game → Game Type → Refresh → Slayer → Flood Survival v0.79**. At least 2 players (split-screen works); lobby teams don't matter, the script puts everyone on Survivors when the game starts. Friendly fire is off. Mouse and keyboard only.

## How the round runs

1. **Traits first.** Each Survivor picks traits before their first spawn. The **purge** deletes a map weapon the moment it appears (map vehicles stay since v0.73), even with someone standing on it. A weapon a player has held (your Magnum, a boss's sword) stays while someone is within 6 ft of it (grenades and equipment on the map stay).
2. **Warmup** (45 s, needs 2 players). Survivors are first-person Spartans with a **Magnum and fists**, no grenades, at **half shields**. The arsenal is open anywhere.
3. **Outbreak.** 10% of players, rounded up, become Infected (at least 1, never everyone), drawn by lot so every Survivor has the same chance. Their Survivor body is killed without the death counting.
4. **Waves** (90 s, +15 s each, 5 waves). Each wave opens the next tier of Flood forms. A dead Survivor turns Infected. Dead Infected pick a form, then press **Spawn** (or **Spawn at Nest**).
5. **Breaks** (60 s). Living Flood fight on. Infected who die get only the **Monitor** (flies, harmless). It dies by itself when the wave starts. In the last 6 s of a break the picker offers Flood forms instead. While you're a Monitor the picker shows THE BREAK and NEXT WAVE cards. Survivors see BREAK on the HUD: the arsenal is open anywhere, but 50% dearer away from a quartermaster.
6. **End.** Survivors win when the last wave ends with any Survivor left. Infected win when none is left.

**Last Survivor.** When only one Survivor is left (in a wave or a break), they get **2x health** (200), a **bottomless magazine** (no reloads) and faster shield recharge (one step below double; same amount). Everyone gets a message, the Survivors' colour turns gold, the top line says LAST SURVIVOR STANDING, and the waypoint trait marks them for everyone (if Halo 3 draws it). In a 2-player game that's from the outbreak on.

New players are Survivors until wave 2 starts, then Infected. Survivors earn 10 points per kill and 25 per wave survived (start 100).

**Wave award.** When a wave ends (not the last one), the living Survivor with the most kills since the last award (the break before the wave counts too) wins it; ties are picked at random, and you need at least 1 kill. The award opens **every weapon tier** for you and makes your **next weapon free** (any one); after that the tiers lock again. Everyone sees 'Wave N award: most kills N'; the winner's points line shows the award until it's used. Winning again before using it doesn't stack. Turning Infected loses it.

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
| Overshield / Frail | 2× shields / no shields (since v0.67 max shields 1%: any hit breaks them) | costs 50 / gives 40 |
| Hard Hitter / Weak Arm | 125% / 75% damage | costs 40 / gives 30 |
| Grenadier | spawn with 2 frags; grenades regenerate (the engine's grenade regeneration trait: the script doesn't set the speed or the cap) | costs 30 |
| Tough | takes less damage (150% resistance) | costs 40 |
| Assault | spawn with an Assault Rifle too | costs 50 |

### Keys

| Key | Does |
| --- | --- |
| Ability 1 | Open the arsenal: anywhere in warmup (normal prices) and breaks (+50% away from a quartermaster), and only within 20 ft of a quartermaster during waves. Close it with **Close** |
| Use Equipment | Use equipment, or throw a placeable's **grav lift** where you want it: the item is built where it lands |
| Flashlight | Pick up the nearest map prop within 8 ft (it rides 5 ft in front of you); press again to let go of it there, turned your way |
| Ability 4 | **Test only** (`test_keys` = 1): end the current warmup, wave or break at once |

### Arsenal (4 pages: weapons, weapons, placeables, equipment)

Each page is sorted by the wave its items open in. An item is open from warmup if it's a wave 1 item, otherwise from the break before its wave (so wave 2 gear can be bought in the first break). Locked cards are grey and say "opens in wave N"; buying one says "That opens in wave N". With fewer waves set (`wave_count`), later items never open.

| Page | Wave 1 (from warmup) | Wave 2 | Wave 3 | Wave 4 | Wave 5 |
| --- | --- | --- | --- | --- | --- |
| 1-2 Weapons | SMG 15, Plasma Rifle 20, Battle Rifle 25, Carbine 25, Needler 25, Shotgun 35 | Mauler 45, Brute Shot 60, Sniper Rifle 70, Beam Rifle 70 | Energy Sword 90, Flamethrower 90, Gravity Hammer 90 | Fuel Rod Gun 120, Rocket Launcher 130, Spartan Laser 150 | |
| 3 Placeables | Prop Placer 20 (one use), Barrier (Hunter, 3× health, breakable, wears down by itself in about 5 minutes) 50, Quartermaster 100 (2 per team) | Machine Gun 80, Resupply Box 80 (2 per team) | Plasma Cannon 110 | | |
| 4 Equipment | Ammo refill 20, Radar Jammer 15, Deployable Cover 25 | Trip Mine 30, Regenerator 45, Bubble Shield 45 | Active Camo 60 | | Invincibility 100 (2 per round for the team) |

The weapons run in that order across both pages: page 1 is the six wave 1 weapons plus the Mauler and Brute Shot, page 2 the rest. Prices shown are quartermaster prices: in a break, away from a quartermaster, everything costs 50% more (rounded down), and the arsenal title says so ("card prices +50 percent away from a quartermaster").

- Guns drop at your feet. Equipment goes into your slot.
- Placeables come as a grav lift. Until you throw it, the HUD says "Throw your grav lift to build it". Up to 4 of each per team.
- **One at a time:** while you carry equipment, a grav lift or a ready Prop Placer, the other equipment and placeable cards are grey and can't be bought (Ammo refill still can).
- Plasma Cannon shows "not on this map" unless the map has one.
- **Resupply Box:** an invincible Sentinel Constructor (shows red, like the quartermaster). Every 20 s it refills the ammo of every Survivor within 10 ft ("Resupply Box: ammo refilled"), and its owner gets 1 point for each other Survivor it refills. The Missile Pod was removed in v0.56 to make room.
- Everything is FREE while `free_shop` = 1 (testing), traits included.

**Base building with map props:** any object on the map that isn't a body, vehicle, weapon or equipment counts as a prop (crates, barriers, sandbags; invisible markers too, so pick what you can see). Press **Flashlight** within 8 ft to pick up the nearest one, and again to let go of it where it is (5 ft in front of you), turned your way. Static props may keep their old facing: use a Prop Placer to set it. Props someone else carries can't be taken, and a prop someone just placed is theirs for 5 s ("Someone just placed that prop: wait a few seconds"). **No prop within 4 ft of anyone:** a Flashlight drop that close to another player (or any body, the quartermaster and the nest included) is refused and you keep carrying it; a Prop Placer grav lift that lands within 4 ft of anyone, you included, is refused and comes back to you ("Too close to someone: grav lift returned"). You drop it if you die. **Prop Placer** (20 points, one use): the next prop you pick up (or the one you carry when you buy it) comes with a grav lift. Throw it and the prop lands where the lift stops, facing your way, and the Prop Placer is used up. **Props are temporary barricades:** the map respawns moved props, static or movable: about 30-60 s after a prop is placed it vanishes, and it comes back at its original spot about 30 s later. That's the map's own respawn, which a script can't switch off (tried in v0.71-v0.76: locking a prop in place loses its collision or sends it flying, and re-grabbing the respawned copy was dropped as not worth it). Use props for quick cover; placeables (Hunter barriers, turrets) last. Press Flashlight instead and you keep it for the next prop. Its card says "ready" while you have one. Props can't be put back: they stay where they were left until the round ends.

**Quartermasters (ZS arsenal crates):** none at the start. Buy one on the Placeables page (100 points, at most 2 per team at once) and throw its grav lift: a standing, invincible Marine appears where it lands (it shows red, as an enemy, which can't be changed). During waves the arsenal opens only within 20 ft of a quartermaster (`quartermaster_radius`); in breaks it opens anywhere, but costs 50% more away from one. Whenever another Survivor buys within 20 ft of your quartermaster, you get 10% of what they paid ("Commission from your quartermaster: +N points"); it stops if you turn Infected, but the quartermaster stays for the team. There is no free ammo: buy the arsenal's Ammo refill (20 points).

## Infected

**Where Flood can be hurt:** in Project Reclaimer the Halo 3 combat-form bodies (Flood Human, Breacher, Flood Brute, Jumper Brute, Flood Elite, Brute Chieftain) and the Tank body (Flood Tank, Juggernaut) take damage only in the **head**: body and limb shots do nothing unless a constant spray finishes them in one go. Elites' shields still pop from body shots. Stalker pure forms take damage anywhere. Aim for heads (tested 2026-10-26, also with the script setting no Flood health at all).

### Forms by tier (one tier opens per wave)

| Tier | Opens at | Forms |
| --- | --- | --- |
| 1 | wave 1 | Flood Human (300% speed, 200% damage, 200 health); **Baby Stalker** (50% size, 300% speed, 40 health, 50% damage); **Breacher** (a Flood Human at 130% size with 300 health, same top speed and damage; 2 at a time) |
| 2 | wave 2 | Flood Brute, Flood Stalker; **Jumper Brute** (normal size, 50% gravity for huge jumps, 200% speed; 1 at a time) |
| 3 | wave 3 | Flood Elite (shields on, 300% damage; 3 at a time); **Nest Stalker** (1 per team, slower, 150% health); **Invis Stalker** (85% size, 300% speed, 85 health, camouflage level 3; 2 at a time) |
| 4 | wave 4 | **Shifter Stalker** (normal Stalker; Ability 1 turret, Ability 2 Tank form at 120% size and 125 health; 2 at a time); Flood Tank (150% size, 200% health, takes 50% less damage) |
| 5 | **last wave (5) only** | **Sword Spartan**: first-person Spartan with an Energy Sword, 150% speed, in the Infected team's green-yellow |

The picker's title says which tier opens next and in which wave. The HUD's second line shows the highest open tier ("Flood tier 2 / 4"). Locked cards are grey, and so are full ones ("Flood Elite | full (3 max)", "Breacher / Invis Stalker / Shifter Stalker | full (2 max)", "Jumper Brute | taken", "Nest Stalker | taken"). Tiers never lock again. The picker shows the forms in tier order, two to a row.

### Special forms

| Form | Key | Does |
| --- | --- | --- |
| Bosses (passive) | - | **Spawn on the boss:** while a boss lives, dead Infected who pick a matching form get "Spawn on the boss" instead of Spawn at Nest. Brute Chieftain: Flood Brute, Jumper Brute. Juggernaut: Flood Human, Breacher, Flood Brute, Jumper Brute, Flood Tank. Stalker Matriarch: Flood Stalker, Baby, Invis, Nest and Shifter Stalker |
| Juggernaut (boss) | Ability 1 | **Siege Smash** (30 s between): destroys every Hunter barrier, machine gun, plasma cannon and Resupply Box within 20 ft, and every map prop there, moved or not (anything that isn't a body, vehicle, weapon or equipment, so invisible map markers too; the map probably respawns them like moved props). Quartermasters are spared |
| Stalker Matriarch (boss) | Ability 1 / Crouch | Ability 1 turns her into a turret and back (no Tank form); Crouch leaps like the Jumper Brute |
| Bosses | Crouch | Leap too: Juggernaut like a Brute; Brute Chieftain and Master Chief like the Jumper Brute |
| Nest Stalker | Ability 1 | Build **one** nest 5 ft ahead (shielded Carrier look, 150% size, 4× health). It stays after you die; a new one can only be built once it's destroyed (and 30 s after the last). Infected get **Spawn at Nest (health N)** while it stands |
| Master Chief (boss) | Ability 1 | **Random equipment** (20 s between): one of Bubble Shield, Regenerator, Trip Mine, Radar Jammer, Deployable Cover, grav lift or Flare |
| Flood Human, Breacher, Flood Brute, Jumper Brute, Flood Elite | Crouch | **Leap** the way you face: 0.5 s after Crouch you're thrown forward and up. Strength: Human and Breacher a bit below Brute and Elite; Brute and Elite medium; Jumper Brute the strongest (with its low gravity it goes very far). 2 s between leaps |
| Shifter Stalker | Ability 1 / Ability 2 | After 1 s, Ability 1 turns into a turret (Pure Ranged), Ability 2 into a Tank (120% size, 125 health, normal damage). Either key turns back into the Stalker. No time limit, 3 s between changes, health share kept |

**Feeding:** a Flood player who scores a kill heals to full; a boss heals 25% of its health instead (up to full).

### Bosses (from wave 2)

When a wave starts from wave 2 on, the Infected player with the **most kills this round** becomes that wave's boss and gets a message. Ties (zero kills included) are picked at random, so there's always a boss while anyone is Infected. Only they see the gold boss card, as a full-width row at the top of the picker. **Clicking it cycles** Juggernaut → Brute Chieftain → Master Chief → Stalker Matriarch; then Spawn. **One life.** An unused boss turn ends with the wave. When the boss spawns, a big red banner ("THE JUGGERNAUT HAS RISEN", etc.) shrinks away over about 2 seconds; then, while the boss lives, everyone sees its name and health in red at the top of the screen. **Bounty:** when the boss dies, every Survivor gets 10 points, and whoever killed it 25 more.

| Boss | What |
| --- | --- |
| Juggernaut | Flood Tank, 200% size, 4× health, takes 67% less damage (about 3× a Flood Tank's toughness) |
| Brute Chieftain | (no invincibility equipment since v0.58) A Flood Brute body (was the Brute Chieftain armour) at 175% size (was 300%: too tall to hit Spartans on the ground), 300% damage (a Flood Brute does 200%), 300% speed, 300% health, takes 67% less damage |
| Master Chief | Ability 1 random equipment. First person, Energy Sword, invisible, can be headshot, 200% speed, normal health and shields, **no shield recharge** |
| Stalker Matriarch | A Shifter Stalker body at 250% size, top speed, 150 health; turret transformation (Ability 1), leap, Stalkers spawn on her. She takes one of the two Shifter Stalker places while alive |

## Host options (Custom mode options)

| Option | Default | What |
| --- | --- | --- |
| break_seconds | 60 | Break length |
| quartermaster_radius | 20 | Feet from the quartermaster within which the arsenal opens during waves |
| free_shop | 0 | 1 = arsenal and traits free (testing) |
| gun_cap | 100 | Most bought guns that can exist at once |
| kill_points | 10 | Points per kill |
| min_players | 2 | Players needed for the warmup to count down |
| placeable_limit | 4 | Per placeable type, per team |
| start_infected_percent | 10 | Share of players who start Infected (rounded up) |
| start_points | 100 | Points each Survivor starts with |
| test_keys | 0 | 1 = Ability 4 skips the current timer |
| tier_step_waves | 1 | Waves per tier: 1 = a new tier every wave, 2 = every second wave |
| warmup_seconds | 45 | Warmup length |
| wave1_seconds | 90 | Wave 1 length |
| wave_bonus | 25 | Points for each wave survived |
| wave_count | 5 | Waves to survive (the Sword Spartan comes on the last one) |
| wave_increase_seconds | 15 | Added to each later wave |
