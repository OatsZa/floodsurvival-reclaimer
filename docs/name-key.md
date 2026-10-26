# Name key (v0.66)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/flood-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `f` | `current_object` |
| `b` | `script_widget` |
| `d` | `all_players` |
| `i` | `no_object` |
| `m` | `script_option` |
| `r` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `af` | `phase` | `global.number[0]` |
| `cs` | `wave` | `global.number[1]` |
| `bi` | `unlock` | `global.number[2]` |
| `bs` | `players` | `global.number[3]` |
| `az` | `survivors` | `global.number[4]` |
| `bn` | `infected` | `global.number[5]` |
| `df` | `converted` | `global.number[6]` |
| `ec` | `seconds` | `global.number[7]` |
| `a3` | `open_wave` | `global.number[8]` |
| `fe` | `avail` | `global.number[9]` |
| `cl` | `boss_used` | `global.number[10]` |
| `ej` | `last_alert` | `global.number[11]` |
| `d7` | `chief` | `global.object[0]` |
| `u` | `made` | `global.object[1]` |
| `dd` | `nest` | `global.object[2]` |
| `bb` | `holder` | `global.player[0]` |
| `ap` | `boss` | `global.player[1]` |
| `dx` | `top_killer` | `global.player[2]` |
| `ah` | `phase_timer` | `global.timer[0]` |
| `cd` | `purge_timer` | `global.timer[2]` |
| `dk` | `nest_wait` | `global.timer[3]` |
| `ew` | `age` | `object.number[0]` |
| `e4` | `claimed` | `object.number[1]` |
| `fg` | `held` | `object.number[2]` |
| `fd` | `kept` | `object.number[3]` |
| `b4` | `leap_state` | `object.number[5]` |
| `dy` | `wave_kills` | `object.number[5]` |
| `ds` | `leap_ticks` | `object.number[6]` |
| `ey` | `leap_cos` | `object.number[7]` |
| `cb` | `leap_origin` | `object.object[0]` |
| `b3` | `leap_ahead` | `object.object[1]` |
| `d9` | `leap_px` | `object.object[2]` |
| `ea` | `leap_py` | `object.object[3]` |
| `dw` | `prop_owner` | `object.player[0]` |
| `eq` | `box_owner` | `object.player[1]` |
| `e0` | `qm_owner` | `object.player[1]` |
| `bw` | `leap_wait` | `object.timer[0]` |
| `c2` | `prop_lock` | `object.timer[1]` |
| `b2` | `decay_wait` | `object.timer[2]` |
| `ar` | `role` | `player.number[0]` |
| `eh` | `deaths` | `player.number[1]` |
| `eu` | `kills` | `player.number[2]` |
| `b6` | `form` | `player.number[3]` |
| `a1` | `points` | `player.number[3]` |
| `a8` | `menu` | `player.number[4]` |
| `ao` | `page` | `player.number[5]` |
| `z` | `pending` | `player.number[6]` |
| `de` | `swap` | `player.number[7]` |
| `cj` | `tool` | `player.object[0]` |
| `ad` | `morph_new` | `player.object[1]` |
| `et` | `morph_old` | `player.object[2]` |
| `a9` | `prop` | `player.object[2]` |
| `ff` | `body` | `player.object[3]` |
| `ef` | `buy_wait` | `player.timer[0]` |
| `bh` | `morph_wait` | `player.timer[0]` |
| `a6` | `carrying` | `player.timer[1]` |
| `dp` | `morph_delay` | `player.timer[2]` |
| `ev` | `watch` | `player.timer[2]` |
| `ac` | `perks` | `player.timer[3]` |
| `c3` | `invinc_bought` | `team.number[0]` |
| `g` | `class` | `temporaries.number[0]` |
| `c` | `scratch` | `temporaries.number[1]` |
| `k` | `item` | `temporaries.number[2]` |
| `ch` | `leap_den` | `temporaries.number[2]` |
| `bd` | `leap_num` | `temporaries.number[3]` |
| `o` | `price` | `temporaries.number[3]` |
| `l` | `count` | `temporaries.number[4]` |
| `bv` | `leap_s` | `temporaries.number[4]` |
| `an` | `ok` | `temporaries.number[5]` |
| `dc` | `leap_fwd` | `temporaries.number[6]` |
| `bf` | `picks` | `temporaries.number[6]` |
| `bz` | `shop_wave` | `temporaries.number[6]` |
| `eb` | `leap_up` | `temporaries.number[7]` |
| `e7` | `total` | `temporaries.number[7]` |
| `ca` | `leap_d` | `temporaries.number[8]` |
| `h` | `need` | `temporaries.number[8]` |
| `cp` | `leap_r` | `temporaries.number[9]` |
| `n` | `limit` | `temporaries.number[9]` |
| `ab` | `leap_helper` | `temporaries.object[0]` |
| `bm` | `qm_near` | `temporaries.object[1]` |

## Functions

| Short | Name |
| --- | --- |
| `e5()` | `build_nest()` |
| `fi()` | `buy()` |
| `d0()` | `card_rows()` |
| `er()` | `check_map()` |
| `b1()` | `close_menu()` |
| `e2()` | `draw_picker()` |
| `e8()` | `draw_shop()` |
| `e3()` | `draw_traits()` |
| `es()` | `drop_prop()` |
| `e6()` | `find_price()` |
| `d8()` | `find_qm()` |
| `e9()` | `form_need()` |
| `fa()` | `hide_menu()` |
| `fb()` | `item_wave()` |
| `ee()` | `leap_cosine()` |
| `ce()` | `make_infected()` |
| `fc()` | `open_shop()` |
| `d6()` | `pick_form()` |
| `ez()` | `place_object()` |
| `fh()` | `purge()` |
| `dr()` | `reset_cards()` |
| `el()` | `spawn_form()` |
| `em()` | `start_wave()` |
| `en()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `j.d3` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `j` | `Item` | `ex` = smg, `c6` = plasma_rifle, `c4` = battle_rifle, `d1` = carbine, `d2` = needler, `d3` = shotgun, `dn` = mauler, `di` = brute_shot, `c7` = sniper_rifle, `dh` = beam_rifle, `b7` = energy_sword, `c5` = flamethrower, `cu` = gravity_hammer, `b8` = fuel_rod_gun, `co` = rocket_launcher, `bg` = spartan_laser, `bc` = prop_placer, `dj` = wall, `cx` = turret, `aw` = plasma_cannon, `bp` = resupply, `ax` = quartermaster, `dg` = ammo, `b9` = radar_jammer, `ei` = cover, `cv` = trip_mine, `db` = regenerator, `cz` = bubble_shield, `cg` = active_camo, `av` = invincibility, `cm` = prop |
| `a7` | `Menu` | `br` = closed, `bx` = shop, `cy` = picker, `ba` = traits |
| `aj` | `Option` | `dt` = break_seconds, `ci` = free_shop, `ep` = gun_cap, `d4` = kill_points, `c0` = min_players, `dq` = placeable_limit, `c1` = quartermaster_radius, `ct` = start_infected_percent, `dz` = start_points, `eg` = test_keys, `cc` = tier_step_waves, `cn` = warmup_seconds, `du` = wave1_seconds, `ed` = wave_bonus, `bk` = wave_count, `cw` = wave_increase_seconds |
| `x` | `Perk` | `dl` = fast, `dm` = slow, `bt` = overshield, `c9` = frail, `bo` = hard_hitter, `cf` = weak_arm, `b5` = grenadier, `dv` = tough, `ek` = ready, `cq` = assault, `a2` = prop_placer, `bu` = shift_tank, `bq` = free_gun, `d5` = tank |
| `ag` | `Phase` | `bl` = warmup, `aq` = wave, `y` = intermission, `cr` = over |
| `au` | `Role` | `e1` = arrival, `q` = survivor, `al` = infected |
| `e` | `ZsClass` | `ck` = survivor, `ai` = human, `a0` = elite, `am` = brute, `bj` = stalker, `a4` = monitor, `c8` = grenadier, `eo` = assault, `da` = assault_grenadier, `aa` = nest_stalker, `p` = shifter_stalker, `ay` = baby_stalker, `b0` = tank, `a5` = sword_spartan, `s` = juggernaut, `w` = brute_chieftain, `t` = spartan_boss, `ak` = breacher, `v` = jumper_brute, `ae` = invis_stalker |
