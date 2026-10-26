# Name key (v0.52)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/flood-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `f` | `current_object` |
| `b` | `script_widget` |
| `d` | `all_players` |
| `k` | `no_object` |
| `l` | `script_option` |
| `o` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `ai` | `phase` | `global.number[0]` |
| `cp` | `wave` | `global.number[1]` |
| `bk` | `unlock` | `global.number[2]` |
| `bo` | `players` | `global.number[3]` |
| `a2` | `survivors` | `global.number[4]` |
| `bm` | `infected` | `global.number[5]` |
| `dg` | `converted` | `global.number[6]` |
| `d8` | `seconds` | `global.number[7]` |
| `z` | `open_wave` | `global.number[8]` |
| `e0` | `avail` | `global.number[9]` |
| `df` | `boss_used` | `global.number[10]` |
| `eg` | `last_alert` | `global.number[11]` |
| `an` | `quartermaster` | `global.object[0]` |
| `t` | `made` | `global.object[1]` |
| `c0` | `nest` | `global.object[2]` |
| `ee` | `holder` | `global.player[0]` |
| `a9` | `boss` | `global.player[1]` |
| `c9` | `top_killer` | `global.player[2]` |
| `cw` | `top_builder` | `global.player[3]` |
| `ac` | `phase_timer` | `global.timer[0]` |
| `b9` | `purge_timer` | `global.timer[2]` |
| `dk` | `nest_wait` | `global.timer[3]` |
| `er` | `age` | `object.number[0]` |
| `ez` | `claimed` | `object.number[1]` |
| `fb` | `held` | `object.number[2]` |
| `fc` | `kept` | `object.number[3]` |
| `ck` | `counted_wave` | `object.number[4]` |
| `bx` | `leap_state` | `object.number[5]` |
| `dx` | `wave_kills` | `object.number[5]` |
| `ds` | `leap_ticks` | `object.number[6]` |
| `da` | `wave_props` | `object.number[6]` |
| `eu` | `leap_cos` | `object.number[7]` |
| `b6` | `leap_origin` | `object.object[0]` |
| `bw` | `leap_ahead` | `object.object[1]` |
| `d5` | `leap_px` | `object.object[2]` |
| `d6` | `leap_py` | `object.object[3]` |
| `dw` | `prop_owner` | `object.player[0]` |
| `br` | `leap_wait` | `object.timer[0]` |
| `cz` | `prop_lock` | `object.timer[1]` |
| `ax` | `role` | `player.number[0]` |
| `es` | `deaths` | `player.number[1]` |
| `e3` | `kills` | `player.number[2]` |
| `b1` | `form` | `player.number[3]` |
| `a8` | `points` | `player.number[3]` |
| `bb` | `menu` | `player.number[4]` |
| `ap` | `page` | `player.number[5]` |
| `w` | `pending` | `player.number[6]` |
| `de` | `swap` | `player.number[7]` |
| `co` | `tool` | `player.object[0]` |
| `x` | `morph_new` | `player.object[1]` |
| `eo` | `morph_old` | `player.object[2]` |
| `aw` | `prop` | `player.object[2]` |
| `fa` | `body` | `player.object[3]` |
| `ec` | `buy_wait` | `player.timer[0]` |
| `c6` | `morph_wait` | `player.timer[0]` |
| `a5` | `carrying` | `player.timer[1]` |
| `dp` | `morph_delay` | `player.timer[2]` |
| `eq` | `watch` | `player.timer[2]` |
| `ab` | `perks` | `player.timer[3]` |
| `h` | `class` | `temporaries.number[0]` |
| `c` | `scratch` | `temporaries.number[1]` |
| `j` | `item` | `temporaries.number[2]` |
| `ce` | `leap_den` | `temporaries.number[2]` |
| `bd` | `leap_num` | `temporaries.number[3]` |
| `q` | `price` | `temporaries.number[3]` |
| `n` | `count` | `temporaries.number[4]` |
| `bq` | `leap_s` | `temporaries.number[4]` |
| `au` | `ok` | `temporaries.number[5]` |
| `dd` | `leap_fwd` | `temporaries.number[6]` |
| `bh` | `picks` | `temporaries.number[6]` |
| `d7` | `leap_up` | `temporaries.number[7]` |
| `e4` | `total` | `temporaries.number[7]` |
| `b5` | `leap_d` | `temporaries.number[8]` |
| `g` | `need` | `temporaries.number[8]` |
| `cm` | `leap_r` | `temporaries.number[9]` |
| `p` | `limit` | `temporaries.number[9]` |
| `v` | `leap_helper` | `temporaries.object[0]` |

## Functions

| Short | Name |
| --- | --- |
| `e1()` | `build_nest()` |
| `fe()` | `buy()` |
| `dz()` | `card_rows()` |
| `d0()` | `check_map()` |
| `bv()` | `close_menu()` |
| `ex()` | `draw_picker()` |
| `e5()` | `draw_shop()` |
| `ey()` | `draw_traits()` |
| `en()` | `drop_prop()` |
| `e2()` | `find_price()` |
| `e6()` | `form_need()` |
| `e7()` | `hide_menu()` |
| `e8()` | `item_wave()` |
| `ea()` | `leap_cosine()` |
| `ca()` | `make_infected()` |
| `e9()` | `open_shop()` |
| `ep()` | `pick_form()` |
| `ev()` | `place_object()` |
| `fd()` | `purge()` |
| `dr()` | `reset_cards()` |
| `ei()` | `spawn_form()` |
| `ej()` | `start_wave()` |
| `ek()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `i.d3` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `i` | `Item` | `et` = smg, `c3` = plasma_rifle, `c1` = battle_rifle, `d1` = carbine, `d2` = needler, `d3` = shotgun, `dn` = mauler, `di` = brute_shot, `c4` = sniper_rifle, `dh` = beam_rifle, `b2` = energy_sword, `c2` = flamethrower, `cr` = gravity_hammer, `b3` = fuel_rod_gun, `cl` = rocket_launcher, `a1` = spartan_laser, `az` = prop_placer, `dj` = wall, `cu` = turret, `ar` = plasma_cannon, `aj` = missile_pod, `ch` = ammo, `b4` = radar_jammer, `ef` = cover, `cs` = trip_mine, `dc` = regenerator, `cx` = bubble_shield, `cd` = active_camo, `bf` = invincibility, `ci` = prop |
| `ba` | `Menu` | `b7` = closed, `bs` = shop, `cv` = picker, `bc` = traits |
| `ae` | `Option` | `dt` = break_seconds, `cf` = free_shop, `em` = gun_cap, `d4` = kill_points, `cy` = min_players, `dq` = placeable_limit, `bl` = quartermaster_radius, `cq` = start_infected_percent, `dy` = start_points, `ed` = test_keys, `b8` = tier_step_waves, `cj` = warmup_seconds, `du` = wave1_seconds, `d9` = wave_bonus, `bj` = wave_count, `ct` = wave_increase_seconds |
| `r` | `Perk` | `dl` = fast, `dm` = slow, `bp` = overshield, `c7` = frail, `bn` = hard_hitter, `cc` = weak_arm, `b0` = grenadier, `dv` = tough, `eh` = ready, `cn` = assault, `a0` = prop_placer, `bg` = shift_tank, `cb` = free_gun, `bz` = free_gear, `eb` = awards |
| `ah` | `Phase` | `bt` = warmup, `aq` = wave, `ak` = intermission, `c8` = over |
| `ay` | `Role` | `ew` = arrival, `s` = survivor, `af` = infected |
| `e` | `ZsClass` | `cg` = survivor, `ag` = human, `a7` = elite, `a6` = brute, `bi` = stalker, `a3` = monitor, `c5` = grenadier, `el` = assault, `db` = assault_grenadier, `u` = nest_stalker, `m` = shifter_stalker, `av` = baby_stalker, `bu` = tank, `a4` = sword_spartan, `am` = juggernaut, `ad` = brute_chieftain, `ao` = spartan_boss, `al` = breacher, `aa` = jumper_brute, `y` = invis_stalker |
