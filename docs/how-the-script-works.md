# How the script works

The explanations for `scripts/zombie-survival.rvt` (they were comments in the script). They moved here because comments count toward the 64 KiB mode limit. Each note is filed under the line of code it explains, in the order the code runs. Rules and keys are in `rules.md`. Build numbers here (v13, v16...) are the changelog's v0.13, v0.16 and so on; files named `*.rvt.bak` are old copies kept outside this repo.

## Overview

Zombie Survival (Survivors vs Flood), after GMod's ZS. Compile with zombie-survival-template.json (tools/build.ps1). Teams 0/1 = Survivors/Infected. rules.md has the rules. Widgets: 0 phase, 1 counts, 2 points, 3 hint, 4 backdrop, 5 title, 6 message, 7-14 cards, 15/16 previous/next or spawn/nest, 17 close or ready, 18 crate distance, 19 the Assault trait card or the Sword Spartan card, 20 the boss card.

**`enum ZsClass`**

Roster classes.

- `survivor = 0`: Survivor

- `human = 1`: Flood Human

- `elite = 2`: Flood Elite

- `brute = 3`: Flood Brute

- `stalker = 4`: Flood Stalker

- `monitor = 5`: Infected Monitor

- `carrier = 6`: Flood Carrier

- `grenadier = 7`: Survivor (Grenadier)

- `assault = 8`: Survivor (Assault)

- `assault_grenadier = 9`: Survivor (Assault, Grenadier)

**`enum Option`**

Host options, A-Z. A script reads at most 16; copy one into a number with = before any other use.

**`enum Perk`**

Survivor trait bits (script_traits 2-9 in this order; assault is a loadout, no trait set); ready = spawned.

**`enum Item`**

The arsenal, 8 cards a page: item = page * 8 + card.

- `alias unlock = global.number[2]`: Flood forms open: 0 Human ... 3 all

- `alias converted = global.number[6]`: Survivors converted (not outbreak picks)

**`alias avail = global.number[9]`**

Map-dependent items this map has (found by the purge): 1 plasma cannon, 2 missile pod, 4 ... 512 Mongoose ... Scorpion.

- `alias spore = global.object[3]`: a spore carrier, popped next tick

- `alias page = player.number[5]`: arsenal page; an Infected's chosen form

- `alias pending = player.number[6]`: item the next thrown grav lift becomes

- `alias swap = player.number[7]`: script kill: 1 set, 2 kill; not counted

- `alias tool = player.object[0]`: the player's claimed thrown grav lift

**`alias carrying = player.timer[1]`**

Flags kept in timers that never count: carrying arsenal equipment (a grav lift too), and the Perk bits.

- `alias watch = player.timer[2]`: 3 s after a throw, to find the grav lift

- `alias age = object.number[0]`: grav lifts: ticks since first seen

- `alias claimed = object.number[1]`: grav lifts: someone's placing tool

- `alias seen = object.number[2]`: equipment the purge has decided to keep

**`function start_wave()`**

Wave n lasts wave 1's length plus the increase for each wave before it.

**`function make_infected()`**

Onto the Infected; a living player is killed by the script, uncounted.

**`function open_shop()`**

Anywhere in warmup and breaks; near the crate during a wave.

**`function check_map()`**

count = 1 when the map lacks what item needs (see avail).

**`function buy()`**

Guns drop at the feet, equipment goes to the body, placeables and vehicles come as a grav lift to throw.

**`function reset_cards()`**

All 8 cards white on the plain background, for current_player.

**`function draw_shop()`**

The arsenal page for current_player; missing map items are greyed.

**`if not current_player.carrying.is_zero() or current_player.pending > 0 then`**

Carrying something: equipment, placeables and vehicles are greyed.

**`function trait_cost()`**

price = current_player's traits; drawbacks count against it.

**`function draw_traits()`**

The trait picker before a Survivor's first spawn; chosen cards are gold.

**`function pick_form()`**

class = the form current_player would spawn as. ok = 1 when only the Monitor is offered: a break with more than 6 s left (a later pick spawns into the wave, so it gets a Flood form).

**`function spawn_form()`**

Spawn as the chosen form, if it's open. The caller sets the spawn spot.

**`function draw_picker()`**

The form picker: choose a card, then Spawn, or Spawn at Nest while one stands. The chosen card is lit.

**`function place_object()`**

The pending item goes where the claimed grav lift stopped, if the team has room; if not, the grav lift comes back.

**`if current_player.pending == Item.wall then`**

A Hunter with 3x a Hunter's health: blocks, and can be broken.

**`function purge()`**

Removes what the script didn't make: vehicles (noting the map-dependent ones first), weapons nobody holds or stands beside, and grenades and equipment that appeared away from every living player. Equipment that appears beside one (a throw) is kept for good.

**`function hide_menu()`**

Hide the menu's widgets for current_player.

**`if current_player.menu == Menu.traits then`**

Traits: a card turns its bit on or off; its opposite goes off.

**`if pressed_button == button.equipment then`**

Use Equipment is reported only when something is used. With an item bought, watch 3 s for its grav lift.

**`class = current_player.get_deployment_class()`**

The Carrier: Ability 1 moves the nest to 5 ft ahead; Ability 2 throws a small carrier (turned to face the Carrier's way, then pushed forward and up) that pops when it lands, releasing its infection forms.

**`scratch = script_option[Option.test_keys]`**

Testing: Ability 4 ends the current warmup, wave or break.

**`players = 0`**

New players: Survivors until wave 2 starts, Infected after.

**`if spore != no_object then`**

The thrown spore carrier pops once it lands (or after about 5 s).

**`if purge_timer.is_zero() then`**

Every 2 s (first at 3 s, while players pick traits).

**`if players >= limit and phase_timer.is_zero() then`**

Outbreak: a share of the players, rounded up, at least 1, never all.

**`for each player randomly do`**

Update the counts, or the rules below would turn another Survivor.

**`if infected == 0 and players >= 2 then`**

A Survivor becomes the Infected when the last one left.

**`if current_player.swap == 2 and current_player.is_not_respawning() then current_player.biped.kill(false) end`**

Script kills: one tick to drop protection, then the kill.

**`if class == ZsClass.human then current_player.apply_traits(script_traits[1]) end`**

The Flood's own speed and damage (script_traits 1, 10-13).

**`if current_player.body != current_player.biped then`**

The Carrier is bigger.

**`if current_player.role == Role.survivor then`**

Survivors: half shields, then their traits.

**`scratch = current_player.get_death_count()`**

A Survivor's death converts them, once the outbreak has happened.

**`total = converted`**

Unlocks follow the share of Survivors converted, a form per step; the highest share reached counts.

**`ok = 0`**

Dead Survivors: traits until ready, then their class with no menu. Dead Infected: the form picker once the countdown ends.

**`count = ZsClass.survivor`**

The loadout: Grenadier adds frags, Assault an Assault Rifle.

**`if crate == no_object then`**

The crate: a standing Marine at the first living Survivor; again if lost.

**`if pulse.is_zero() then`**

Every 5 s the crate refills the guns of the Survivors beside it.

**`for each object do`**

Placing tools: grav lifts age; only a new one can be claimed.

**`if current_player.carrying.is_zero() and current_player.watch.is_zero() and current_player.tool == no_object and current_player.pending > 0 then`**

No grav lift held, thrown or found (or the team was full): it comes back, so the purchase isn't lost. A new life gets it this way too.

**`seconds = phase_timer`**

The HUD.


## Keeping this file in step

New code gets its explanation here, not as a comment in the script: comments count toward the 64 KiB limit. A one-line comment in the script is fine where it really helps. The full commented version from before the split is `zs-v9-commented.rvt.bak`.

**`if current_player.swap == 2 and not current_player.is_not_respawning() then current_player.swap = 0 end`** (v11)

The script-kill flag is cleared as soon as the player is dead. Waiting for the death count to change wasn't enough: the outbreak kill didn't raise it, so the flag stayed set and killed the player again on their first Flood spawn. Only Survivors' deaths do anything (conversion), and a flagged player is always already Infected, so clearing early skips nothing.

**`seed = current_player.biped.place_at_me(plasma_pistol, "zs_gun", ...)`** (v12)

The Carrier's Ability 2. A body ignored set_velocity (v9-v11 popped the spore carrier where it spawned), so the push goes to a plasma pistol 'seed' instead. It's labelled zs_gun so the purge leaves it alone. It starts 12 ft ahead (the most a script can offset) and 2 ft up. When it lands (or after about 150 ticks), a 60% Carrier appears on its spot, the seed is deleted, and the Carrier is popped the next tick.

**`nest = ... place_at_me(flood_carrier, "zs_nest", never_garbage_collect, 5, 0, 0, shielded)`** (v12)

The nest uses the Carrier's 'shielded' look at 150% size, so it doesn't look like a player Carrier. No call colors objects or adds effects.

## Parked: nest and spore abilities (Carrier removed in v13)

The Flood Carrier class was removed in v13 (too slow, and its melee self-destructs). **The nest stays in the script** as `function build_nest()` (not called yet), together with the Spawn at Nest button: to give a future Flood class the nest ability, call `build_nest()` from that class's key in `on button press`, for example `if current_player.role == Role.infected and class == ZsClass.<new> and current_player.is_not_respawning() and pressed_button == button.ability_1 then build_nest() end`. **The spore throw was dropped** (no launch). Its v12 code is below for reference only. The nest is a shielded Carrier body at 150% size with 4x health. 'Spawn at Nest' uses set_primary_respawn_object(nest). The spore 'seed' is a plasma pistol pushed forward; a 60% Carrier is made where it lands and popped the next tick. Widget 16 shows the button only while the nest exists (`if nest != no_object then script_widget[16].set_visibility(current_player, true) end`). Full v12 source: `zs-v12.rvt.bak`.


### Variables

```lua
alias nest = global.object[2]
alias spore = global.object[3]
alias seed = global.object[4]
alias nest_wait = global.timer[3]
alias spore_wait = global.timer[4]
```

### Abilities (in on button press; Ability 1 nest, Ability 2 spore seed)

```lua
 if current_player.role == Role.survivor and current_player.is_not_respawning() then
  if pressed_button == button.ability_1 then open_shop() end
 end
 class = current_player.get_deployment_class()
 if current_player.role == Role.infected and class == ZsClass.carrier and current_player.is_not_respawning() then
  if pressed_button == button.ability_1 and nest_wait.is_zero() then
   nest.delete()
   nest = current_player.biped.place_at_me(flood_carrier, "zs_nest", never_garbage_collect, 5, 0, 0, shielded)
   nest.copy_rotation_from(current_player.biped, false)
   nest.set_scale(150)
   nest.set_garbage_collection_disabled(true)
   nest.max_health = 400
   nest_wait = 30
   nest_wait.set_rate(-100%)
  end
  if pressed_button == button.ability_2 and spore_wait.is_zero() and seed == no_object then
   seed = current_player.biped.place_at_me(plasma_pistol, "zs_gun", none, 12, 0, 20, none)
   seed.copy_rotation_from(current_player.biped, false)
   seed.set_velocity(6, 0, 4)
   spore_wait = 20
   spore_wait.set_rate(-100%)
  end
 end
```

### Every tick: pop the spore carrier, land the seed

```lua
if spore != no_object then
 spore.kill(false)
 spore = no_object
end
if seed != no_object then
 seed.age += 1
 scratch = seed.get_speed()
 count = seed.age
 ok = 0
 if count >= 10 and scratch == 0 then ok = 1 end
 if count >= 150 then ok = 1 end
 if ok == 1 then
  spore = seed.place_at_me(flood_carrier, none, none, 0, 0, 5, none)
  spore.set_scale(60)
  seed.delete()
  seed = no_object
 end
end
```

### Form picker: the Spawn at Nest button text (in draw_picker)

```lua
  script_widget[7].set_text_for(current_player, "Infected Monitor  |  flies, harmless  |  Flood again next wave")
 end
 if nest != no_object then
  scratch = nest.health
  script_widget[16].set_text_for(current_player, "Spawn at Nest (health %n)", scratch)
 end
```

### Form picker: the Spawn at Nest click (in on widget click; widget 16)

```lua
   spawn_form()
  end
  if clicked_widget == 16 and nest != no_object then
   current_player.set_primary_respawn_object(nest)
   spawn_form()
  end
```

### HUD hint line for the builder

```lua
  if class == ZsClass.carrier then
   scratch = nest_wait
   need = spore_wait
   script_widget[3].set_text_for(current_player, "Carrier  |  A1 nest in %n s  |  A2 spores in %n s  |  melee explodes", scratch, need)
  end
```


## Nest Stalker (v14)

- Class 9, 1 per team, unlock like the Stalker (`need = 3` in spawn_form). Picker card widget 11.
- `alias form = player.number[3]` shares the slot with `points` and `alias morph_wait = player.timer[0]` with `buy_wait`: Survivors use those slots, Infected never do. `make_infected()` sets form to 0. `morph_new` and `morph_old` are player.object[1] and [2]; `kept` (object.number[3]) carries the health share to the new body.
- Ability 2 makes the other body (`flood_ranged` for the turret, `flood_stalker` back) at the player and calls set_biped. The next tick that the player's biped is the new body, the old one is deleted, health is restored, the form flips and the 5 s cooldown starts. After 30 ticks without the swap taking, the new body is deleted. Same pattern as the turret and tank morphs in covenant-vs-flood-test.rvt.
- Death: form back to 0 and any half-made body deleted, so the next life is a Stalker.

## Vehicles page removed (v15)

The arsenal's vehicles page (8 vehicles via grav lift, label zs_vehicle, avail bits 4-512) was removed to make room; it cost about 7.8 KiB. The purge still deletes map vehicles; `avail` now only tracks the plasma cannon (1) and missile pod (2). Full v14 source with vehicles: `zs-v14.rvt.bak`.

## Flood tiers (v16)

Forms by tier, opened by the unlock steps (25/50/75 percent converted, `unlock` 0-3) through `form_need()`:

| Tier | Opens | Forms (class) | Picker card |
| --- | --- | --- | --- |
| 1 | start | Flood Human (1) | 7 |
| 2 | unlock 1 | Flood Brute (3), Flood Stalker (4) | 8, 9 |
| 3 | unlock 2 | Flood Elite (2, shields on: trait set 10 has shields 2), Nest Stalker (9, 1 per team) | 10, 11 |
| 4 | unlock 3 | Turret Stalker (10), Tank Stalker (11), Flood Tank (12) | 12, 13, 14 |
| 5 | last wave only (`phase == wave and wave >= wave_count`), regardless of unlocks | Sword Spartan (13: a first-person Spartan with an Energy Sword; the Infected team color 170,200,40 shows on its armor) | 19 |

- Cards are 60 px tall in 5 rows (y 170-450) so the 9th card (widget 19, also the Assault trait card) sits above the Spawn button.
- Health: `set_max_health` every tick for the Infected: Nest and Tank Stalker 150, Turret Stalker 75, Flood Tank 200, others 100.
- Speed and damage: trait sets 1 (Human), 10 (Elite), 11 (Brute), 12 (Stalker and Tank Stalker), 2 (the Fast Feet set, reused to make the Nest Stalker slower than a Stalker), 13 (Turret Stalker, speed 300 percent).
- Size: set when the player's body changes (`body` = player.object[3]): Turret Stalker 75, Tank Stalker 125, its Tank form 150, Flood Tank 150.
- The nest: `build_nest()` only builds when no nest stands; the nest stays after the Nest Stalker dies, until it's destroyed. Ability 1.
- Turret and Tank Stalker: Ability 2 sets form 2 (into the turret/Tank) or 3 (back) and starts the 1 s `morph_delay` (player.timer[2], a Survivor-only slot). When it ends, the other body is made and set_biped; when the swap takes, form becomes 1 or 0 and a 3 s `morph_wait` starts. The turret has no time limit. After 30 ticks without the swap, the new body is deleted and the form goes back. Death resets the form to 0.

## Space pass (v17)

- **No indentation** in the script any more (it counted toward 64 KiB). Code is unchanged apart from spaces (checked). The indented version is `zs-v17-indented.rvt.bak`.
- **Prices are in two places:** `find_price()` (what buy() charges) and each arsenal card's text in `draw_shop()` (for example `"Shotgun  |  40 pts"`). Change a price in both, or the card shows the wrong number.
- The picker no longer repeats the unlock percent on every locked card: locked cards are grey, and the title says which tier opens next and at what percent.

## Juggernaut boss (v18)

- When a wave starts from wave 2 on (the break-to-wave step), `boss` (global.player[1]) becomes the Infected player with the most kills this round (`get_kill_count`; per-wave kills would need a player slot, and those are full). `boss_used` (global.number[10]) goes back to 0. The boss gets a message on widget 6. Nobody with a kill means no boss.
- The boss alone sees picker card widget 20 (gold, at 650,450) while `boss_used` is 0. `pick_form()` turns a Juggernaut choice into Flood Human for anyone else, or once the boss is used. `spawn_form()` sets `boss_used = 1` when the Juggernaut deploys, so it's one life.
- Class 14 Juggernaut: flood_tank, max_active 1, set_max_health(400), set_scale(200).
- When the break starts, `boss` is cleared, so an unused boss turn ends with its wave.

## All three bosses (v19)

- The boss's gold card (widget 20) cycles on each click: Juggernaut (14) -> Brute Chieftain (15) -> Spartan Boss (16) -> Juggernaut. Its text names the selected boss. `pick_form()` blocks every boss class (`class >= juggernaut`) for anyone but the boss, and once `boss_used` is 1.
- Brute Chieftain: brute_chieftain body, chieftain_armor look, scale 300 (the maximum), trait set 13 (speed 300 percent, shared with the Turret Stalker), and `give_equipment(invincibility)` on its body.
- Spartan Boss: a first-person Spartan with an Energy Sword in the Infected team's green-yellow; trait set 14 (camouflage 4 = invisible, headshots 1 = immune, speed 9 = 200 percent, recharge 4 = shields never recharge, v20); normal health and shields.

## Tiers by wave (v0.21)

`unlock` is no longer the share of Survivors converted. Once the outbreak has happened, `unlock = (wave - 1) / tier_step_waves`, capped at 3 and never lowered: wave 1 tier 1 only, wave 2 opens tier 2, and so on. `tier_step_waves` (option 10, the slot `unlock_step_percent` had; minimum 1, so it can't divide by zero) sets how many waves each tier takes. The picker title says `tier N opens in wave W` with W = (unlock + 1) x step + 1. The Sword Spartan still needs `wave >= wave_count` (default 5). `converted` and `total` remain only for the Infected HUD line.
