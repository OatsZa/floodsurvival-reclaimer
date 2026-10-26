# How the script works

The explanations for `scripts/flood-survival.rvt` (they were comments in the script). They moved here because comments count toward the 64 KiB mode limit.

**Short names (since v0.33):** the mode stores the script's source text, so `tools/build.ps1` compiles a copy made by `tools/shrink.ps1`. Every alias, function, enum and enum member gets a 1-2 letter name (most used first), and line 1 becomes short aliases for `current_player`, `current_object`, `script_widget`, `all_players`, `no_object`, `script_option` and `script_traits`. Strings, comments and line numbers stay the same. The build stops unless the copy turns back into the source exactly and gets the same megalo-check output. So edit the readable script and these notes as before. Code shown inside a compiled mode file has the short names, and error columns (not lines) differ from the source. [name-key.md](name-key.md), rebuilt every build, says which short name is which. Each note is filed under the line of code it explains, in the order the code runs. Rules and keys are in `rules.md`. Build numbers here (v13, v16...) are the changelog's v0.13, v0.16 and so on; files named `*.rvt.bak` are old copies kept outside this repo.

## Overview

Flood Survival (Survivors vs Flood), after Garry's Mod's Zombie Survival. Compile with flood-survival-template.json (tools/build.ps1). Teams 0/1 = Survivors/Infected. rules.md has the rules. Widgets: 0 phase, 1 counts, 2 points, 3 hint, 4 backdrop, 5 title, 6 message, 7-14 cards, 15/16 previous/next or spawn/nest, 17 close or ready, 18 quartermaster distance, 19 the Assault trait card or the Sword Spartan card, 20 the boss card, 22 the health bar fill (width = health share x 3, at least 3), 23 the health number, 24-26 more picker cards, 21/27/30 and 28/29/31 the how-to cards (title and two wrapped boxes each; placed in on init; the text is set per player with the screen: building and the arsenal beside the trait screen, bosses on the left of the Infected picker).

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

- `alias held = object.number[2]`: weapons: 1 once a player has carried it

- `alias prop = player.object[2]`: the map prop a Survivor carries. It shares the slot with `morph_old`, which only Infected transforms use (they set it before every use; the transform start checks the Infected role since v0.34, because `form` shares its slot with a Survivor's `points`); `drop_prop()` clears it whenever a Survivor dies or turns Infected.

**`function drop_prop()`**

Let go of the carried prop where it is (death, turning Infected) and cancel a Prop Placer grav lift.

**`function start_wave()`**

Wave n lasts wave 1's length plus the increase for each wave before it.

**`function make_infected()`**

Onto the Infected; a living player is killed by the script, uncounted.

**`function open_shop()`**

Anywhere in warmup and breaks; near the quartermaster during a wave.

**`function item_wave()`**

need = the wave item opens in (v0.36). Items are numbered in card order, page x 8 + card (since v0.37: weapons 0-15 over two pages, placeables 16-20 with 21-23 empty, equipment 24-31, Item.prop = 32 is only a pending value). Each page is sorted by opening wave, so a page's first item sets need back to 1 and the later `>=` thresholds raise it (the two weapon pages are one list). Compared with `open_wave` (global.number[8], set every tick: 1 in warmup, the current wave during a wave, the next wave during a break). buy() refuses a locked item; draw_shop() greys it and shows "opens in wave N". The Item ranges in buy() follow the card order: guns 0-15 (`<= Item.spartan_laser`), equipment from `Item.radar_jammer` to `Item.invincibility` (ammo, 16, is not equipment), grav-lift placeables from `Item.wall` to `Item.missile_pod`. The "use what you carry first" check covers `Item.prop_placer` and up except ammo, and clicks on the empty cards 21-23 or past `Item.invincibility` do nothing.

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

**Forms since v0.38:** class 10 is the Shifter Stalker (was the Turret Stalker) and class 11 the Baby Stalker (was the Tank Stalker); classes 17-19 are the Breacher, Jumper Brute and Invis Stalker. Gravity (Jumper) and camouflage (Invis) are class traits in the template, so they cost no script trait set; speeds still come from the script's trait sets every tick. Picker cards, in tier order: 7 Human, 8 Baby Stalker, 9 Breacher, 10 Brute, 11 Stalker, 12 Jumper Brute, 13 Elite, 14 Nest Stalker, 19 Invis Stalker, 24 Shifter, 25 Tank, 26 Sword Spartan; 20 is the boss card. Rows are 54 px apart from y 165; the boss's rows are one lower. The arsenal and trait screen use the same rows.

**Flood leap (v0.42):** Crouch (`on button press`) sets `leap_state` 1 and a 0.5 s `leap_wait` on the player's **body** (object.number[5-7], object.timer[0], object.object[0-3]: player slots are full, and a new body starts clean). Then every tick: state 1 places four hidden magnums labelled `zs_leap` 20 units above the body: the origin, one 30 units ahead (offsets follow the facing), and two pushed along the map's X and Y axes (`set_velocity` goes along the map's axes). State 5, 3 ticks later: `leap_cosine()` turns r (origin to ahead), s (origin to a pushed one) and d (ahead to a pushed one) into cos x100 = (s*s + r*r - d*d) / (2*s*r), shrinking them first so the squares stay small. The body gets `set_velocity(fwd * cos / 100, fwd * sin / 100, up)`, the helpers go, and state 2 waits 2 s. All four helpers fall alike, so gravity cancels out. The purge skips `zs_leap` weapons, and the object loop deletes any older than 60 ticks (a body that died mid-leap). The `leap_*` temporaries share slots with limit, count, need, price, item, picks and total: they're only used in this block and `leap_cosine()`.

**Body-swap bosses (v0.40-v0.42, removed in v0.43):** a Flood Hunter and a Mega Carrier were added as picker values that deployed as the Juggernaut class and then swapped bodies. The Hunter body keeps its own blue colours, and a player Carrier never respawned after its blast (in this mode the blast leaves the player stuck; killing the body on melee didn't help). Both are gone; the code is in git history (v0.40-v0.42).

**Shifter Stalker:** `form` is 0 Stalker, 1 transformed, +2 while a change is pending (2 to transform, 3 back). The `shift_tank` perk bit says which transformed form: set by Ability 2, cleared by Ability 1 when the change starts. It picks flood_tank or flood_ranged, the 125 health and the 120% size.

**`function draw_picker()`**

The form picker: choose a card, then Spawn, or Spawn at Nest while one stands. The chosen card is lit.

**`function place_object()`**

The pending item goes where the claimed grav lift stopped, if the team has room; if not, the grav lift comes back. `Item.prop` (a Prop Placer throw) moves the carried prop instead: it's attached to the grav lift and let go, which leaves it on that spot facing the lift's way (static props can't be turned directly), and count = -1 skips the placeable code.

**`if current_player.pending == Item.wall then`**

A Hunter with 3x a Hunter's health: blocks, and can be broken.

**`function purge()`**

Every 2 s: removes the map's vehicles (noting the map-dependent ones first). Weapons are handled every tick in the object loop instead: an unlabelled weapon nobody has ever carried (a map weapon) is deleted at once, even with a player on it; one a player has carried (`held`, set while get_carrier finds a player, which includes holstered guns through the attachment chain) is deleted once nobody holds it or stands within 6 ft.

**`function hide_menu()`**

Hide the menu's widgets for current_player.

**`if current_player.menu == Menu.traits then`**

Traits: a card turns its bit on or off; its opposite goes off.

**`if pressed_button == button.equipment then`**

Use Equipment is reported only when something is used. With an item bought, watch 3 s for its grav lift.

**`if pressed_button == button.flashlight then`**

Survivors' base building. Carrying a prop: let go of it where it rides and turn it the player's way (static props may not turn). v0.32 used a stand-in grav lift for the facing, but a placed grav lift launched the player forward. A Prop Placer grav lift still in the slot is taken back, and the Prop Placer bit stays for the next prop (only a throw uses it up, in place_object). Not carrying: the nearest prop within 8 ft is attached 5 ft in front. A prop is any object that isn't a body, vehicle, weapon or equipment (is_of_type can't tell scenery apart) and that nobody carries (get_carrier). With the Prop Placer bit and a free slot, the player also gets a grav lift with pending = Item.prop.

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

**`if quartermaster == no_object then`**

The quartermaster: a standing Marine at the first living Survivor; again if lost.

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
- Brute Chieftain: brute_chieftain body, chieftain_armor look, scale 300 (the maximum), `set_max_health(300)`, class trait resistance 8 (takes a third), trait set 13 (speed 300 percent, shared with the Turret Stalker), and `give_equipment(invincibility)` on its body.
- Picker layout: `card_rows()` sets the normal card, button and backdrop positions for all players (called in init, when a break starts and when the boss spawns). When a boss is picked, the boss alone gets a shifted layout: widget 20 full width (860) at the top row, the other cards one row (70) lower, the buttons at 590 and a taller backdrop (560).
- Spartan Boss: a first-person Spartan with an Energy Sword in the Infected team's green-yellow; trait set 14 (camouflage 4 = invisible, headshots 1 = immune, speed 9 = 200 percent, recharge 4 = shields never recharge, v20); normal health and shields.

## Tiers by wave (v0.21)

`unlock` is no longer the share of Survivors converted. Once the outbreak has happened, `unlock = (wave - 1) / tier_step_waves`, capped at 3 and never lowered: wave 1 tier 1 only, wave 2 opens tier 2, and so on. `tier_step_waves` (option 10, the slot `unlock_step_percent` had; minimum 1, so it can't divide by zero) sets how many waves each tier takes. The picker title says `tier N opens in wave W` with W = (unlock + 1) x step + 1. The Sword Spartan still needs `wave >= wave_count` (default 5). `converted` and `total` remain only for the Infected HUD line.

## v0.22 changes

- **The purge only removes weapons and vehicles now.** Its equipment rule (keep equipment first seen near a living player, delete the rest) deleted equipment the moment a player bought or picked it up, which left `carrying` set and the arsenal stuck. The `seen` object number is gone.
- **Card layout** (set once in `on init`, shared by the arsenal, trait and form screens): row 1 widget 7; row 2 widgets 8, 9; row 3 widgets 10, 11; row 4 widgets 12, 13, 14 (narrower, 285 px); row 5 widgets 19, 20. In the form picker that's one tier per row.
- Turret/Tank Stalker: the transform request is on `button.ability_1`. The Tank Stalker gets the Stalker trait set (12) only in Stalker form, health 125, Tank form scale 120 (Flood Tank: 150, health 200, class resistance 7).
- Sword Spartan: trait set 11 (speed 150 percent). Spartan Boss roster entry: `master_chief` body, `default` look.

## v0.23 changes

- Boss pick: `limit` starts at -1 and the loop is `for each player randomly`, so the boss is a random Infected among those with the most kills, zero included.
- Card layout back to two columns of 420 px (widgets 7-14 in four rows, 19 and 20 in the fifth), as before v0.22. The v0.22 tier-row layout notes above no longer apply.

## v0.47: Last Survivor

- `last_alert` (global.number[11]) makes the alert run once: when `survivors` is 1 in a wave or break, it sets team[0]'s colour and widget 1's colour to gold (232, 184, 82) and puts a message on widget 6 for every player (the Survivor's own text differs).
- In the Survivor traits block, while `survivors` is 1 and the phase is a wave or later: trait set 15 (ammo 3 bottomless, recharge 9 = 200%) and `set_max_health(200)`. Survivors never set max health otherwise; a Survivor who turns Infected gets 100 or their form's health from the Infected block.
- Widget 1 reads LAST SURVIVOR STANDING instead of the Survivor count while it lasts.

## v0.48: how-to cards by screen

- The side cards (widgets 21/27/30 left, 28/29/31 right) are filled per screen at the end of the tick: traits = LAST SURVIVOR on the left only; arsenal (Menu.shop) = BUILD A BASE left and THE ARSENAL right; picker = BOSSES left. hide_menu() hides all six every tick first.

## v0.50: trim

- Removed as unreachable or repeated: the second Prop Placer bit read in buy(), the Monitor-to-Human line at the end of pick_form() and the Monitor tier line in spawn_form() (both already handled), and the item > 31 guard in the arsenal click (Survivor pages are 0-3; only the Infected picker writes other page values). The boss card background test is now `class >= juggernaut and class <= spartan_boss`.
- Grenadier: the roster class gives the 2 frags; trait set 8 (`grenade_regeneration` 2) is applied every tick while the perk is set. How fast grenades come back is the engine's, not the script's.

## v0.51: prop safety

- `prop_owner` (object.player[0]) and `prop_lock` (object.timer[1]) live on the map prop itself, so no player slot is used. Both placing paths (Flashlight drop in `on button press`, Prop Placer throw in `place_object()`) set the owner and a 5 s lock.
- Pickup: a locked prop that isn't yours gets distance 100 (never picked); if it was within 8 ft, `need` = 1 and the message says to wait.
- 4 ft rule: a `for each object` over bodies (`is_of_type(biped)`). The Flashlight drop skips your own body (the prop rides 5 ft ahead of you) and sets `ok` = 2 to refuse. The Prop Placer throw counts every body near the grav lift; when refused, `count` = -1 keeps the placeable code out, `pending` stays `Item.prop`, and the grav lift is given back by the same tick code that returns it after the placeable limit.

## v0.52: wave awards

- `wave_kills` (object.number[5]) and `wave_props` (object.number[6]) on the Survivor's body. These are `leap_state` and `leap_ticks` on Flood bodies: every leap writer checks a Flood class or the Infected role, and a body is never both. Kills are added in the kill-points code; props in both placing paths, once per prop per period (`counted_wave`, object.number[4], compared with `open_wave`, which is the award period: warmup and wave 1 = 1, break 1 and wave 2 = 2, ...).
- Wave end (not the last wave): `for each player randomly` picks `top_killer` / `top_builder` (global.player[2] / [3], strict `>` so a random one of the tied wins, 0 never wins) and resets both counters. Winners get `Perk.free_gun` / `Perk.free_gear` (`Perk.awards` = both). The Infected respawn's `perks &= 1023` clears them.
- `buy()`: `picks` holds the award bit that applies (weapons: item <= spartan_laser; gear: item >= prop_placer except ammo); price becomes 0, and the bit is cleared only when the purchase goes through.

## v0.53: quartermasters, breaks, boss leaps

- `find_qm()` loops the `zs_qm` objects for the nearest to the current player: `scratch` = its distance (10000 if none), `limit` = the radius option, `qm_near` (temporaries.object[1]) = it if within the radius, else no_object. It clobbers `scratch` and `limit`.
- `open_shop()` / `buy()`: waves need `qm_near`; breaks without one multiply the price by 3/2 before free_shop and awards; commission `price / 10` goes to `qm_near.qm_owner` (object.player[1]) through `holder` when the owner is another Survivor.
- Quartermaster = Item 21 on Placeables card 6 (widget 12, now shown on page 2), placed by `place_object()` like the Hunter barrier. The old spawn at the first Survivor is gone, and so is `global.object[0]`.
- Invincibility limit: `team[0].invinc_bought` (team.number[0]) counts buys for the round.
- Trait set 15 has `waypoint` 3. The Halo 3 adapter rejects `set_waypoint_*` calls, so the trait is the only route.
- Boss leap: the Crouch check and the leap strength include classes juggernaut..spartan_boss.

## v0.62-v0.63

- The mode stores a packed copy of the short-name script (tools/pack.ps1). Runtime errors can't be traced by line any more; use the readable script and the message text.
- Object health is a share of its maximum, 1-100. Writing anything outside that stops the script ('Health must be 1% through 100%'): the barrier decay kills at 1% instead of writing 0, and the Shifter's kept health is capped at 100.

## v0.66: max health and shields once per body

- set_max_health / set_max_shields are called only in the new-body block (`body != biped`), not every tick. Calling them every tick seemed to refill health, so Flood only died to one-tick bursts (headshots). The Shifter's `kept` health share is applied again after the new max health; the Last Survivor's 200 health is set once in the alert loop.
