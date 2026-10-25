# Name key (v0.35)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/zombie-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `g` | `current_object` |
| `b` | `script_widget` |
| `d` | `all_players` |
| `k` | `no_object` |
| `i` | `script_option` |
| `o` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `aj` | `phase` | `global.number[0]` |
| `cb` | `wave` | `global.number[1]` |
| `bl` | `unlock` | `global.number[2]` |
| `a8` | `players` | `global.number[3]` |
| `a5` | `survivors` | `global.number[4]` |
| `ba` | `infected` | `global.number[5]` |
| `cs` | `converted` | `global.number[6]` |
| `dd` | `seconds` | `global.number[7]` |
| `d2` | `avail` | `global.number[9]` |
| `cr` | `boss_used` | `global.number[10]` |
| `ab` | `quartermaster` | `global.object[0]` |
| `ad` | `made` | `global.object[1]` |
| `ca` | `nest` | `global.object[2]` |
| `di` | `holder` | `global.player[0]` |
| `a0` | `boss` | `global.player[1]` |
| `x` | `phase_timer` | `global.timer[0]` |
| `bk` | `purge_timer` | `global.timer[2]` |
| `cv` | `nest_wait` | `global.timer[3]` |
| `d7` | `age` | `object.number[0]` |
| `d1` | `claimed` | `object.number[1]` |
| `ed` | `held` | `object.number[2]` |
| `ee` | `kept` | `object.number[3]` |
| `av` | `role` | `player.number[0]` |
| `dv` | `deaths` | `player.number[1]` |
| `d5` | `kills` | `player.number[2]` |
| `bg` | `form` | `player.number[3]` |
| `a3` | `points` | `player.number[3]` |
| `ay` | `menu` | `player.number[4]` |
| `al` | `page` | `player.number[5]` |
| `t` | `pending` | `player.number[6]` |
| `cq` | `swap` | `player.number[7]` |
| `b4` | `tool` | `player.object[0]` |
| `v` | `morph_new` | `player.object[1]` |
| `ds` | `morph_old` | `player.object[2]` |
| `bc` | `prop` | `player.object[2]` |
| `ec` | `body` | `player.object[3]` |
| `dg` | `buy_wait` | `player.timer[0]` |
| `ck` | `morph_wait` | `player.timer[0]` |
| `aq` | `carrying` | `player.timer[1]` |
| `cy` | `morph_delay` | `player.timer[2]` |
| `du` | `watch` | `player.timer[2]` |
| `an` | `perks` | `player.timer[3]` |
| `h` | `class` | `temporaries.number[0]` |
| `c` | `scratch` | `temporaries.number[1]` |
| `l` | `item` | `temporaries.number[2]` |
| `n` | `price` | `temporaries.number[3]` |
| `q` | `count` | `temporaries.number[4]` |
| `ar` | `ok` | `temporaries.number[5]` |
| `bz` | `picks` | `temporaries.number[6]` |
| `d6` | `total` | `temporaries.number[7]` |
| `f` | `need` | `temporaries.number[8]` |
| `m` | `limit` | `temporaries.number[9]` |

## Functions

| Short | Name |
| --- | --- |
| `d3()` | `build_nest()` |
| `eg()` | `buy()` |
| `c6()` | `card_rows()` |
| `c7()` | `check_map()` |
| `bd()` | `close_menu()` |
| `dz()` | `draw_picker()` |
| `d8()` | `draw_shop()` |
| `d0()` | `draw_traits()` |
| `dq()` | `drop_prop()` |
| `d4()` | `find_price()` |
| `d9()` | `form_need()` |
| `ea()` | `hide_menu()` |
| `bm()` | `make_infected()` |
| `eb()` | `open_shop()` |
| `dt()` | `pick_form()` |
| `dx()` | `place_object()` |
| `ef()` | `purge()` |
| `c0()` | `reset_cards()` |
| `dk()` | `spawn_form()` |
| `dl()` | `start_wave()` |
| `dm()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `j.da` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `j` | `Item` | `da` = shotgun, `cc` = battle_rifle, `dw` = smg, `ch` = sniper_rifle, `bv` = rocket_launcher, `c8` = carbine, `df` = mauler, `cd` = energy_sword, `ce` = flamethrower, `b8` = spartan_laser, `cu` = brute_shot, `b2` = gravity_hammer, `c9` = needler, `cf` = plasma_rifle, `ct` = beam_rifle, `bh` = fuel_rod_gun, `dr` = ammo, `cj` = cover, `b7` = bubble_shield, `cp` = regenerator, `c1` = trip_mine, `cg` = radar_jammer, `co` = active_camo, `bb` = invincibility, `b5` = turret, `db` = wall, `ap` = plasma_cannon, `am` = missile_pod, `a6` = prop_placer, `bs` = prop |
| `ax` | `Menu` | `bi` = closed, `bt` = shop, `b6` = picker, `a1` = traits |
| `z` | `Option` | `c2` = break_seconds, `bq` = free_shop, `dp` = gun_cap, `dc` = kill_points, `b9` = min_players, `cz` = placeable_limit, `a4` = quartermaster_radius, `b1` = start_infected_percent, `c5` = start_points, `dh` = test_keys, `bj` = tier_step_waves, `bu` = warmup_seconds, `c3` = wave1_seconds, `de` = wave_bonus, `a2` = wave_count, `b3` = wave_increase_seconds |
| `w` | `Perk` | `cw` = fast, `cx` = slow, `a9` = overshield, `cl` = frail, `a7` = hard_hitter, `bn` = weak_arm, `bf` = grenadier, `c4` = tough, `dj` = ready, `bw` = assault, `ag` = prop_placer |
| `ak` | `Phase` | `bx` = warmup, `ao` = wave, `ah` = intermission, `cm` = over |
| `au` | `Role` | `dy` = arrival, `u` = survivor, `ac` = infected |
| `e` | `ZsClass` | `br` = survivor, `af` = human, `bp` = elite, `bo` = brute, `az` = stalker, `ae` = monitor, `ci` = grenadier, `dn` = assault, `cn` = assault_grenadier, `r` = nest_stalker, `p` = turret_stalker, `s` = tank_stalker, `b0` = tank, `ai` = sword_spartan, `aa` = juggernaut, `y` = brute_chieftain, `aw` = spartan_boss |
