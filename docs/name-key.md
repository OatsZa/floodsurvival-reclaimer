# Name key (v0.50)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/flood-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `h` | `current_object` |
| `b` | `script_widget` |
| `c` | `all_players` |
| `l` | `no_object` |
| `k` | `script_option` |
| `n` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `ag` | `phase` | `global.number[0]` |
| `cp` | `wave` | `global.number[1]` |
| `bi` | `unlock` | `global.number[2]` |
| `bm` | `players` | `global.number[3]` |
| `az` | `survivors` | `global.number[4]` |
| `bk` | `infected` | `global.number[5]` |
| `c9` | `converted` | `global.number[6]` |
| `dz` | `seconds` | `global.number[7]` |
| `ai` | `open_wave` | `global.number[8]` |
| `eq` | `avail` | `global.number[9]` |
| `c8` | `boss_used` | `global.number[10]` |
| `d6` | `last_alert` | `global.number[11]` |
| `am` | `quartermaster` | `global.object[0]` |
| `u` | `made` | `global.object[1]` |
| `cv` | `nest` | `global.object[2]` |
| `d4` | `holder` | `global.player[0]` |
| `a5` | `boss` | `global.player[1]` |
| `aa` | `phase_timer` | `global.timer[0]` |
| `b7` | `purge_timer` | `global.timer[2]` |
| `dd` | `nest_wait` | `global.timer[3]` |
| `eh` | `age` | `object.number[0]` |
| `ep` | `claimed` | `object.number[1]` |
| `e1` | `held` | `object.number[2]` |
| `e2` | `kept` | `object.number[3]` |
| `bw` | `leap_state` | `object.number[5]` |
| `dk` | `leap_ticks` | `object.number[6]` |
| `ek` | `leap_cos` | `object.number[7]` |
| `b4` | `leap_origin` | `object.object[0]` |
| `bv` | `leap_ahead` | `object.object[1]` |
| `dw` | `leap_px` | `object.object[2]` |
| `dx` | `leap_py` | `object.object[3]` |
| `bp` | `leap_wait` | `object.timer[0]` |
| `ax` | `role` | `player.number[0]` |
| `ei` | `deaths` | `player.number[1]` |
| `et` | `kills` | `player.number[2]` |
| `bz` | `form` | `player.number[3]` |
| `bh` | `points` | `player.number[3]` |
| `a7` | `menu` | `player.number[4]` |
| `ap` | `page` | `player.number[5]` |
| `v` | `pending` | `player.number[6]` |
| `c7` | `swap` | `player.number[7]` |
| `co` | `tool` | `player.object[0]` |
| `x` | `morph_new` | `player.object[1]` |
| `ee` | `morph_old` | `player.object[2]` |
| `bs` | `prop` | `player.object[2]` |
| `e0` | `body` | `player.object[3]` |
| `d2` | `buy_wait` | `player.timer[0]` |
| `c1` | `morph_wait` | `player.timer[0]` |
| `a2` | `carrying` | `player.timer[1]` |
| `dh` | `morph_delay` | `player.timer[2]` |
| `eg` | `watch` | `player.timer[2]` |
| `an` | `perks` | `player.timer[3]` |
| `f` | `class` | `temporaries.number[0]` |
| `d` | `scratch` | `temporaries.number[1]` |
| `j` | `item` | `temporaries.number[2]` |
| `cb` | `leap_den` | `temporaries.number[2]` |
| `ba` | `leap_num` | `temporaries.number[3]` |
| `p` | `price` | `temporaries.number[3]` |
| `q` | `count` | `temporaries.number[4]` |
| `bo` | `leap_s` | `temporaries.number[4]` |
| `au` | `ok` | `temporaries.number[5]` |
| `c6` | `leap_fwd` | `temporaries.number[6]` |
| `cj` | `picks` | `temporaries.number[6]` |
| `dy` | `leap_up` | `temporaries.number[7]` |
| `eu` | `total` | `temporaries.number[7]` |
| `b3` | `leap_d` | `temporaries.number[8]` |
| `g` | `need` | `temporaries.number[8]` |
| `ch` | `leap_r` | `temporaries.number[9]` |
| `o` | `limit` | `temporaries.number[9]` |
| `t` | `leap_helper` | `temporaries.object[0]` |

## Functions

| Short | Name |
| --- | --- |
| `er()` | `build_nest()` |
| `e4()` | `buy()` |
| `dq()` | `card_rows()` |
| `dr()` | `check_map()` |
| `bu()` | `close_menu()` |
| `en()` | `draw_picker()` |
| `ev()` | `draw_shop()` |
| `eo()` | `draw_traits()` |
| `ed()` | `drop_prop()` |
| `es()` | `find_price()` |
| `ew()` | `form_need()` |
| `ex()` | `hide_menu()` |
| `ey()` | `item_wave()` |
| `d1()` | `leap_cosine()` |
| `b8()` | `make_infected()` |
| `ez()` | `open_shop()` |
| `ef()` | `pick_form()` |
| `el()` | `place_object()` |
| `e3()` | `purge()` |
| `dj()` | `reset_cards()` |
| `d8()` | `spawn_form()` |
| `d9()` | `start_wave()` |
| `ea()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `i.du` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `i` | `Item` | `ej` = smg, `cy` = plasma_rifle, `cw` = battle_rifle, `ds` = carbine, `dt` = needler, `du` = shotgun, `dg` = mauler, `db` = brute_shot, `cz` = sniper_rifle, `da` = beam_rifle, `b0` = energy_sword, `cx` = flamethrower, `cl` = gravity_hammer, `b1` = fuel_rod_gun, `cg` = rocket_launcher, `bc` = spartan_laser, `a9` = prop_placer, `dc` = wall, `cq` = turret, `ar` = plasma_cannon, `ah` = missile_pod, `cs` = ammo, `b2` = radar_jammer, `d5` = cover, `cm` = trip_mine, `c5` = regenerator, `ct` = bubble_shield, `ca` = active_camo, `bb` = invincibility, `ce` = prop |
| `a6` | `Menu` | `b5` = closed, `bq` = shop, `cr` = picker, `a8` = traits |
| `ac` | `Option` | `dl` = break_seconds, `cc` = free_shop, `ec` = gun_cap, `dv` = kill_points, `cu` = min_players, `di` = placeable_limit, `bj` = quartermaster_radius, `ck` = start_infected_percent, `dp` = start_points, `d3` = test_keys, `b6` = tier_step_waves, `cf` = warmup_seconds, `dm` = wave1_seconds, `d0` = wave_bonus, `bg` = wave_count, `cn` = wave_increase_seconds |
| `w` | `Perk` | `de` = fast, `df` = slow, `bn` = overshield, `c2` = frail, `bl` = hard_hitter, `b9` = weak_arm, `bx` = grenadier, `dn` = tough, `d7` = ready, `ci` = assault, `aw` = prop_placer, `bd` = shift_tank |
| `af` | `Phase` | `br` = warmup, `aq` = wave, `aj` = intermission, `c3` = over |
| `ay` | `Role` | `em` = arrival, `r` = survivor, `ad` = infected |
| `e` | `ZsClass` | `cd` = survivor, `ae` = human, `a4` = elite, `a3` = brute, `bf` = stalker, `a0` = monitor, `c0` = grenadier, `eb` = assault, `c4` = assault_grenadier, `s` = nest_stalker, `m` = shifter_stalker, `av` = baby_stalker, `bt` = tank, `a1` = sword_spartan, `al` = juggernaut, `ab` = brute_chieftain, `ao` = spartan_boss, `ak` = breacher, `z` = jumper_brute, `y` = invis_stalker |
