# Name key (v0.37)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/flood-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `g` | `current_object` |
| `b` | `script_widget` |
| `d` | `all_players` |
| `l` | `no_object` |
| `k` | `script_option` |
| `o` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `ai` | `phase` | `global.number[0]` |
| `cb` | `wave` | `global.number[1]` |
| `bq` | `unlock` | `global.number[2]` |
| `bb` | `players` | `global.number[3]` |
| `a9` | `survivors` | `global.number[4]` |
| `bd` | `infected` | `global.number[5]` |
| `cu` | `converted` | `global.number[6]` |
| `df` | `seconds` | `global.number[7]` |
| `ab` | `open_wave` | `global.number[8]` |
| `d3` | `avail` | `global.number[9]` |
| `ct` | `boss_used` | `global.number[10]` |
| `ae` | `quartermaster` | `global.object[0]` |
| `ag` | `made` | `global.object[1]` |
| `ch` | `nest` | `global.object[2]` |
| `dj` | `holder` | `global.player[0]` |
| `a4` | `boss` | `global.player[1]` |
| `x` | `phase_timer` | `global.timer[0]` |
| `bp` | `purge_timer` | `global.timer[2]` |
| `cy` | `nest_wait` | `global.timer[3]` |
| `d8` | `age` | `object.number[0]` |
| `d2` | `claimed` | `object.number[1]` |
| `ef` | `held` | `object.number[2]` |
| `eg` | `kept` | `object.number[3]` |
| `ax` | `role` | `player.number[0]` |
| `dw` | `deaths` | `player.number[1]` |
| `d6` | `kills` | `player.number[2]` |
| `bj` | `form` | `player.number[3]` |
| `a7` | `points` | `player.number[3]` |
| `a0` | `menu` | `player.number[4]` |
| `ao` | `page` | `player.number[5]` |
| `t` | `pending` | `player.number[6]` |
| `cs` | `swap` | `player.number[7]` |
| `ca` | `tool` | `player.object[0]` |
| `v` | `morph_new` | `player.object[1]` |
| `dt` | `morph_old` | `player.object[2]` |
| `bg` | `prop` | `player.object[2]` |
| `ee` | `body` | `player.object[3]` |
| `dh` | `buy_wait` | `player.timer[0]` |
| `cn` | `morph_wait` | `player.timer[0]` |
| `av` | `carrying` | `player.timer[1]` |
| `c2` | `morph_delay` | `player.timer[2]` |
| `dv` | `watch` | `player.timer[2]` |
| `ap` | `perks` | `player.timer[3]` |
| `h` | `class` | `temporaries.number[0]` |
| `c` | `scratch` | `temporaries.number[1]` |
| `j` | `item` | `temporaries.number[2]` |
| `n` | `price` | `temporaries.number[3]` |
| `q` | `count` | `temporaries.number[4]` |
| `au` | `ok` | `temporaries.number[5]` |
| `b4` | `picks` | `temporaries.number[6]` |
| `d7` | `total` | `temporaries.number[7]` |
| `f` | `need` | `temporaries.number[8]` |
| `m` | `limit` | `temporaries.number[9]` |

## Functions

| Short | Name |
| --- | --- |
| `d4()` | `build_nest()` |
| `ei()` | `buy()` |
| `c9()` | `card_rows()` |
| `da()` | `check_map()` |
| `bh()` | `close_menu()` |
| `d0()` | `draw_picker()` |
| `d9()` | `draw_shop()` |
| `d1()` | `draw_traits()` |
| `ds()` | `drop_prop()` |
| `d5()` | `find_price()` |
| `ea()` | `form_need()` |
| `eb()` | `hide_menu()` |
| `ec()` | `item_wave()` |
| `br()` | `make_infected()` |
| `ed()` | `open_shop()` |
| `du()` | `pick_form()` |
| `dy()` | `place_object()` |
| `eh()` | `purge()` |
| `c4()` | `reset_cards()` |
| `dm()` | `spawn_form()` |
| `dn()` | `start_wave()` |
| `dp()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `i.dd` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `i` | `Item` | `dx` = smg, `ck` = plasma_rifle, `ci` = battle_rifle, `db` = carbine, `dc` = needler, `dd` = shotgun, `c1` = mauler, `cw` = brute_shot, `cl` = sniper_rifle, `cv` = beam_rifle, `bk` = energy_sword, `cj` = flamethrower, `b7` = gravity_hammer, `bl` = fuel_rod_gun, `b2` = rocket_launcher, `a2` = spartan_laser, `az` = prop_placer, `cx` = wall, `cc` = turret, `am` = plasma_cannon, `aa` = missile_pod, `ce` = ammo, `bm` = radar_jammer, `dk` = cover, `b8` = trip_mine, `cr` = regenerator, `cf` = bubble_shield, `bv` = active_camo, `ar` = invincibility, `bz` = prop |
| `a1` | `Menu` | `bn` = closed, `b0` = shop, `cd` = picker, `a5` = traits |
| `z` | `Option` | `c5` = break_seconds, `bw` = free_shop, `dr` = gun_cap, `de` = kill_points, `cg` = min_players, `c3` = placeable_limit, `a8` = quartermaster_radius, `b6` = start_infected_percent, `c8` = start_points, `di` = test_keys, `bo` = tier_step_waves, `b1` = warmup_seconds, `c6` = wave1_seconds, `dg` = wave_bonus, `a6` = wave_count, `b9` = wave_increase_seconds |
| `w` | `Perk` | `cz` = fast, `c0` = slow, `bc` = overshield, `co` = frail, `ba` = hard_hitter, `bs` = weak_arm, `bi` = grenadier, `c7` = tough, `dl` = ready, `b3` = assault, `al` = prop_placer |
| `ah` | `Phase` | `bf` = warmup, `aq` = wave, `ac` = intermission, `cp` = over |
| `aw` | `Role` | `dz` = arrival, `u` = survivor, `af` = infected |
| `e` | `ZsClass` | `bx` = survivor, `ak` = human, `bu` = elite, `bt` = brute, `a3` = stalker, `aj` = monitor, `cm` = grenadier, `dq` = assault, `cq` = assault_grenadier, `r` = nest_stalker, `p` = turret_stalker, `s` = tank_stalker, `b5` = tank, `an` = sword_spartan, `ad` = juggernaut, `y` = brute_chieftain, `ay` = spartan_boss |
