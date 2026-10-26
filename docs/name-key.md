# Name key (v0.79)

The mode file's script uses short names to save space: the mode stores the script's source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/flood-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).

Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.

## Built-ins (aliased on line 1)

| Short | Built-in |
| --- | --- |
| `a` | `current_player` |
| `f` | `current_object` |
| `b` | `script_widget` |
| `d` | `all_players` |
| `j` | `no_object` |
| `p` | `script_option` |
| `r` | `script_traits` |

## Variables

| Short | Name | Slot |
| --- | --- | --- |
| `ag` | `phase` | `global.number[0]` |
| `cw` | `wave` | `global.number[1]` |
| `bl` | `unlock` | `global.number[2]` |
| `bx` | `players` | `global.number[3]` |
| `a2` | `survivors` | `global.number[4]` |
| `bs` | `infected` | `global.number[5]` |
| `di` | `converted` | `global.number[6]` |
| `ee` | `seconds` | `global.number[7]` |
| `a6` | `open_wave` | `global.number[8]` |
| `fi` | `avail` | `global.number[9]` |
| `bq` | `boss_used` | `global.number[10]` |
| `em` | `last_alert` | `global.number[11]` |
| `dv` | `chief` | `global.object[0]` |
| `u` | `made` | `global.object[1]` |
| `dg` | `nest` | `global.object[2]` |
| `bf` | `holder` | `global.player[0]` |
| `af` | `boss` | `global.player[1]` |
| `d2` | `top_killer` | `global.player[2]` |
| `al` | `phase_timer` | `global.timer[0]` |
| `ci` | `purge_timer` | `global.timer[2]` |
| `dn` | `nest_wait` | `global.timer[3]` |
| `e1` | `age` | `object.number[0]` |
| `e9` | `claimed` | `object.number[1]` |
| `fk` | `held` | `object.number[2]` |
| `fh` | `kept` | `object.number[3]` |
| `ca` | `leap_state` | `object.number[5]` |
| `d3` | `wave_kills` | `object.number[5]` |
| `dx` | `leap_ticks` | `object.number[6]` |
| `e3` | `leap_cos` | `object.number[7]` |
| `cg` | `leap_origin` | `object.object[0]` |
| `b9` | `leap_ahead` | `object.object[1]` |
| `eb` | `leap_px` | `object.object[2]` |
| `ec` | `leap_py` | `object.object[3]` |
| `d1` | `prop_owner` | `object.player[0]` |
| `eu` | `box_owner` | `object.player[1]` |
| `e5` | `qm_owner` | `object.player[1]` |
| `b4` | `leap_wait` | `object.timer[0]` |
| `c5` | `prop_lock` | `object.timer[1]` |
| `b8` | `decay_wait` | `object.timer[2]` |
| `au` | `role` | `player.number[0]` |
| `ek` | `deaths` | `player.number[1]` |
| `ez` | `kills` | `player.number[2]` |
| `b2` | `form` | `player.number[3]` |
| `a4` | `points` | `player.number[3]` |
| `bb` | `menu` | `player.number[4]` |
| `aq` | `page` | `player.number[5]` |
| `aa` | `pending` | `player.number[6]` |
| `dh` | `swap` | `player.number[7]` |
| `co` | `tool` | `player.object[0]` |
| `ad` | `morph_new` | `player.object[1]` |
| `ey` | `morph_old` | `player.object[2]` |
| `a7` | `prop` | `player.object[2]` |
| `fj` | `body` | `player.object[3]` |
| `eh` | `buy_wait` | `player.timer[0]` |
| `bk` | `morph_wait` | `player.timer[0]` |
| `ba` | `carrying` | `player.timer[1]` |
| `ds` | `morph_delay` | `player.timer[2]` |
| `e0` | `watch` | `player.timer[2]` |
| `w` | `perks` | `player.timer[3]` |
| `c6` | `invinc_bought` | `team.number[0]` |
| `ej` | `banner` | `team.number[1]` |
| `g` | `class` | `temporaries.number[0]` |
| `c` | `scratch` | `temporaries.number[1]` |
| `m` | `item` | `temporaries.number[2]` |
| `cm` | `leap_den` | `temporaries.number[2]` |
| `bh` | `leap_num` | `temporaries.number[3]` |
| `s` | `price` | `temporaries.number[3]` |
| `l` | `count` | `temporaries.number[4]` |
| `b3` | `leap_s` | `temporaries.number[4]` |
| `ap` | `ok` | `temporaries.number[5]` |
| `df` | `leap_fwd` | `temporaries.number[6]` |
| `bi` | `picks` | `temporaries.number[6]` |
| `b6` | `shop_wave` | `temporaries.number[6]` |
| `ed` | `leap_up` | `temporaries.number[7]` |
| `fc` | `total` | `temporaries.number[7]` |
| `cf` | `leap_d` | `temporaries.number[8]` |
| `h` | `need` | `temporaries.number[8]` |
| `ct` | `leap_r` | `temporaries.number[9]` |
| `o` | `limit` | `temporaries.number[9]` |
| `ac` | `leap_helper` | `temporaries.object[0]` |
| `bz` | `qm_near` | `temporaries.object[1]` |

## Functions

| Short | Name |
| --- | --- |
| `fa()` | `build_nest()` |
| `fm()` | `buy()` |
| `d5()` | `card_rows()` |
| `ev()` | `check_map()` |
| `b7()` | `close_menu()` |
| `e7()` | `draw_picker()` |
| `fd()` | `draw_shop()` |
| `e8()` | `draw_traits()` |
| `ew()` | `drop_prop()` |
| `fb()` | `find_price()` |
| `es()` | `find_qm()` |
| `dw()` | `find_rally()` |
| `fe()` | `form_need()` |
| `ex()` | `hide_menu()` |
| `ff()` | `item_wave()` |
| `eg()` | `leap_cosine()` |
| `cj()` | `make_infected()` |
| `fg()` | `open_shop()` |
| `ea()` | `pick_form()` |
| `e4()` | `place_object()` |
| `fl()` | `purge()` |
| `du()` | `reset_cards()` |
| `eo()` | `spawn_form()` |
| `ep()` | `start_wave()` |
| `eq()` | `trait_cost()` |

## Enums

Used as `Enum.member`: for example `Item.shotgun` is `k.d8` in the short copy.

| Short | Enum | Members (short = name) |
| --- | --- | --- |
| `k` | `Item` | `e2` = smg, `c9` = plasma_rifle, `c7` = battle_rifle, `d6` = carbine, `d7` = needler, `d8` = shotgun, `dr` = mauler, `dl` = brute_shot, `da` = sniper_rifle, `dk` = beam_rifle, `cc` = energy_sword, `c8` = flamethrower, `cy` = gravity_hammer, `cd` = fuel_rod_gun, `cs` = rocket_launcher, `bj` = spartan_laser, `bg` = prop_placer, `dm` = wall, `c1` = turret, `ay` = plasma_cannon, `bu` = resupply, `az` = quartermaster, `dj` = ammo, `ce` = radar_jammer, `el` = cover, `cz` = trip_mine, `de` = regenerator, `c3` = bubble_shield, `cl` = active_camo, `ax` = invincibility, `cq` = prop |
| `bc` | `Menu` | `bw` = closed, `b5` = shop, `c2` = picker, `bd` = traits |
| `an` | `Option` | `dy` = break_seconds, `cn` = free_shop, `et` = gun_cap, `d9` = kill_points, `c4` = min_players, `dt` = placeable_limit, `br` = quartermaster_radius, `cx` = start_infected_percent, `d4` = start_points, `ei` = test_keys, `ch` = tier_step_waves, `cr` = warmup_seconds, `dz` = wave1_seconds, `ef` = wave_bonus, `bn` = wave_count, `c0` = wave_increase_seconds |
| `t` | `Perk` | `dp` = fast, `dq` = slow, `b0` = overshield, `dc` = frail, `bt` = hard_hitter, `ck` = weak_arm, `cb` = grenadier, `d0` = tough, `en` = ready, `cu` = assault, `a5` = prop_placer, `b1` = shift_tank, `bv` = free_gun, `ak` = matriarch, `bm` = redraw |
| `ah` | `Phase` | `bo` = warmup, `a1` = wave, `z` = intermission, `cv` = over |
| `av` | `Role` | `e6` = arrival, `v` = survivor, `ao` = infected |
| `e` | `ZsClass` | `cp` = survivor, `aj` = human, `aw` = elite, `a3` = brute, `a9` = stalker, `a8` = monitor, `db` = grenadier, `er` = assault, `dd` = assault_grenadier, `y` = nest_stalker, `i` = shifter_stalker, `ar` = baby_stalker, `bp` = tank, `a0` = sword_spartan, `q` = juggernaut, `x` = brute_chieftain, `n` = spartan_boss, `am` = breacher, `ab` = jumper_brute, `ae` = invis_stalker, `ai` = matriarch |
