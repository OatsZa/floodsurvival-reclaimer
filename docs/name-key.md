# Name key (v0.43)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/flood-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `h` | `current_object` |
| `b` | `script_widget` |
| `d` | `all_players` |
| `l` | `no_object` |
| `k` | `script_option` |
| `o` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `an` | `phase` | `global.number[0]` |
| `cp` | `wave` | `global.number[1]` |
| `bh` | `unlock` | `global.number[2]` |
| `bl` | `players` | `global.number[3]` |
| `bj` | `survivors` | `global.number[4]` |
| `bn` | `infected` | `global.number[5]` |
| `c9` | `converted` | `global.number[6]` |
| `dz` | `seconds` | `global.number[7]` |
| `ai` | `open_wave` | `global.number[8]` |
| `ep` | `avail` | `global.number[9]` |
| `c8` | `boss_used` | `global.number[10]` |
| `al` | `quartermaster` | `global.object[0]` |
| `w` | `made` | `global.object[1]` |
| `cv` | `nest` | `global.object[2]` |
| `d4` | `holder` | `global.player[0]` |
| `a5` | `boss` | `global.player[1]` |
| `ab` | `phase_timer` | `global.timer[0]` |
| `b6` | `purge_timer` | `global.timer[2]` |
| `dd` | `nest_wait` | `global.timer[3]` |
| `eg` | `age` | `object.number[0]` |
| `eo` | `claimed` | `object.number[1]` |
| `e0` | `held` | `object.number[2]` |
| `e1` | `kept` | `object.number[3]` |
| `bv` | `leap_state` | `object.number[5]` |
| `dk` | `leap_ticks` | `object.number[6]` |
| `ej` | `leap_cos` | `object.number[7]` |
| `b3` | `leap_origin` | `object.object[0]` |
| `bu` | `leap_ahead` | `object.object[1]` |
| `dw` | `leap_px` | `object.object[2]` |
| `dx` | `leap_py` | `object.object[3]` |
| `bp` | `leap_wait` | `object.timer[0]` |
| `az` | `role` | `player.number[0]` |
| `eh` | `deaths` | `player.number[1]` |
| `es` | `kills` | `player.number[2]` |
| `bx` | `form` | `player.number[3]` |
| `bg` | `points` | `player.number[3]` |
| `a8` | `menu` | `player.number[4]` |
| `ap` | `page` | `player.number[5]` |
| `x` | `pending` | `player.number[6]` |
| `c7` | `swap` | `player.number[7]` |
| `co` | `tool` | `player.object[0]` |
| `z` | `morph_new` | `player.object[1]` |
| `ed` | `morph_old` | `player.object[2]` |
| `br` | `prop` | `player.object[2]` |
| `ez` | `body` | `player.object[3]` |
| `d2` | `buy_wait` | `player.timer[0]` |
| `c1` | `morph_wait` | `player.timer[0]` |
| `a2` | `carrying` | `player.timer[1]` |
| `dh` | `morph_delay` | `player.timer[2]` |
| `ef` | `watch` | `player.timer[2]` |
| `ag` | `perks` | `player.timer[3]` |
| `f` | `class` | `temporaries.number[0]` |
| `c` | `scratch` | `temporaries.number[1]` |
| `j` | `item` | `temporaries.number[2]` |
| `ca` | `leap_den` | `temporaries.number[2]` |
| `a7` | `leap_num` | `temporaries.number[3]` |
| `p` | `price` | `temporaries.number[3]` |
| `q` | `count` | `temporaries.number[4]` |
| `bo` | `leap_s` | `temporaries.number[4]` |
| `au` | `ok` | `temporaries.number[5]` |
| `c6` | `leap_fwd` | `temporaries.number[6]` |
| `cj` | `picks` | `temporaries.number[6]` |
| `dy` | `leap_up` | `temporaries.number[7]` |
| `et` | `total` | `temporaries.number[7]` |
| `b2` | `leap_d` | `temporaries.number[8]` |
| `g` | `need` | `temporaries.number[8]` |
| `ch` | `leap_r` | `temporaries.number[9]` |
| `n` | `limit` | `temporaries.number[9]` |
| `v` | `leap_helper` | `temporaries.object[0]` |

## Functions

| Short | Name |
| --- | --- |
| `eq()` | `build_nest()` |
| `e3()` | `buy()` |
| `dq()` | `card_rows()` |
| `dr()` | `check_map()` |
| `bt()` | `close_menu()` |
| `em()` | `draw_picker()` |
| `eu()` | `draw_shop()` |
| `en()` | `draw_traits()` |
| `ec()` | `drop_prop()` |
| `er()` | `find_price()` |
| `ev()` | `form_need()` |
| `ew()` | `hide_menu()` |
| `ex()` | `item_wave()` |
| `d1()` | `leap_cosine()` |
| `b7()` | `make_infected()` |
| `ey()` | `open_shop()` |
| `ee()` | `pick_form()` |
| `ek()` | `place_object()` |
| `e2()` | `purge()` |
| `dj()` | `reset_cards()` |
| `d7()` | `spawn_form()` |
| `d8()` | `start_wave()` |
| `d9()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `i.du` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `i` | `Item` | `ei` = smg, `cy` = plasma_rifle, `cw` = battle_rifle, `ds` = carbine, `dt` = needler, `du` = shotgun, `dg` = mauler, `db` = brute_shot, `cz` = sniper_rifle, `da` = beam_rifle, `bz` = energy_sword, `cx` = flamethrower, `cl` = gravity_hammer, `b0` = fuel_rod_gun, `cg` = rocket_launcher, `ba` = spartan_laser, `a6` = prop_placer, `dc` = wall, `cq` = turret, `ar` = plasma_cannon, `ah` = missile_pod, `cs` = ammo, `b1` = radar_jammer, `d5` = cover, `cm` = trip_mine, `c5` = regenerator, `ct` = bubble_shield, `b9` = active_camo, `ay` = invincibility, `cd` = prop |
| `a9` | `Menu` | `b4` = closed, `ce` = shop, `cr` = picker, `bd` = traits |
| `ae` | `Option` | `dl` = break_seconds, `cb` = free_shop, `eb` = gun_cap, `dv` = kill_points, `cu` = min_players, `di` = placeable_limit, `bi` = quartermaster_radius, `ck` = start_infected_percent, `dp` = start_points, `d3` = test_keys, `b5` = tier_step_waves, `cf` = warmup_seconds, `dm` = wave1_seconds, `d0` = wave_bonus, `bf` = wave_count, `cn` = wave_increase_seconds |
| `s` | `Perk` | `de` = fast, `df` = slow, `bm` = overshield, `c2` = frail, `bk` = hard_hitter, `b8` = weak_arm, `bw` = grenadier, `dn` = tough, `d6` = ready, `ci` = assault, `aq` = prop_placer, `bb` = shift_tank |
| `am` | `Phase` | `bq` = warmup, `ax` = wave, `aj` = intermission, `c3` = over |
| `a0` | `Role` | `el` = arrival, `y` = survivor, `af` = infected |
| `e` | `ZsClass` | `cc` = survivor, `aa` = human, `a4` = elite, `a3` = brute, `bc` = stalker, `ao` = monitor, `c0` = grenadier, `ea` = assault, `c4` = assault_grenadier, `u` = nest_stalker, `m` = shifter_stalker, `av` = baby_stalker, `bs` = tank, `a1` = sword_spartan, `ak` = juggernaut, `ac` = brute_chieftain, `aw` = spartan_boss, `ad` = breacher, `t` = jumper_brute, `r` = invis_stalker |
