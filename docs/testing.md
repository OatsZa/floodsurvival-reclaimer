# Testing

Two players plus **Ability 4** to skip timers is the quickest way: set `test_keys` = 1 (and `free_shop` = 1 unless you are checking prices) under Custom mode options, since both are off by default from v0.61. Everything unlocks by wave, so 1v1 works: press Ability 4 at each wave to reach wave 5. If the HUD freezes, the script stopped: the reason is in `Documents\My Games\Project Reclaimer\Logs\client.log` (search for 'Custom game mode stopped').

## Still to test (v0.66)

Fill in and paste back. Items already answered are in "Confirmed in game" below.

```text
FLOOD SURVIVAL v0.66 RESULTS
-- Fixed or changed in v0.22-v0.23 --
E1. Bought equipment (cover, radar jammer...) stays in your hands; after using it you can buy another (no softlock)? ->
E2. Equipment and grenades you pick up from the map are no longer deleted? ->
L1. Back to the two-column card layout on all three screens; texts fit? ->
S2. Sword Spartan: 150 percent speed? What armor does it show: yours, or a default Spartan? ->
H1. Health bar: light blue at the bottom centre, the number and bar drop when hit and refill with regen? Hidden while dead? Never stops the HUD (check at 0 health and on body swaps)? ->
M1. Shorter messages: 'Bought' after every purchase, 'Too far from the quartermaster', 'Use what you carry first', HUD 'Throw your grav lift to build it' while you hold one? Any text you miss or that reads wrong? ->
-- New in v0.27-v0.31 --
Q1. Standing by the quartermaster never refills ammo by itself? The arsenal's Ammo refill costs 20 and works at the quartermaster during a wave and anywhere in a break? The HUD and messages say 'quartermaster', and the host option is quartermaster_radius? ->
-- New in v0.32-v0.35 --
S1. Since v0.33 the mode is built from the short-name copy: a quick full round (traits, arsenal, a wave, a break, the Infected picker, a boss) plays as before and the HUD never freezes? ->
R3. Machine gun and Hunter barrier still work as before, including while you carry a prop? ->
R4. With a Prop Placer 'ready' (bought, not used yet): the equipment and placeable cards are grey, the header says 'use what you carry first', and buying one says 'Use what you carry first'? Ammo refill still works? After throwing the prop, everything is buyable again? (v0.34: nothing was greyed and other equipment could be bought) ->
-- New in v0.37 --
N1. The mode is called Flood Survival everywhere (game type list, lobby, waiting line 'FLOOD SURVIVAL')? Pages: weapons by wave (1/4, 2/4), Placeables (3/4), Equipment (4/4)? Every card buys the item it names (the item numbers changed again)? ->
-- New in v0.39 --
F8. Flood Brute and Jumper Brute survive headshots (a Sniper or Battle Rifle headshot does body damage only)? Invis Stalker and Shifter Stalker say 'full (2 max)' when 2 are out, and a 3rd can't take them? ->
F9. Test 15 (leap, separate mode): see Documents\zs\tests\RUN_SHEET.md ->
-- New in v0.40-v0.41 --
B9. Boss card cycles Juggernaut / Brute Chieftain / Master Chief only? ->
H2. Flood Human has 200 health (the health bar shows a share, so check it takes about twice the shots)? ->
-- New in v0.42-v0.43 --
J1. The Human and Breacher leap is stronger since v0.43 (9/6, was 8/5), still below Brute and Elite (10/6): noticeable? Jumper Brute farthest? 2 s before the next leap? Other forms and Survivors don't leap? HUD says 'Crouch: leap the way you face'? ->
J2. No stray magnums lying around after leaps, and nobody can pick one up; the arsenal's gun cap isn't affected? ->
H3. Breacher has 300 health (tougher than the 200 Flood Human)? ->
-- New in v0.44-v0.46 --
C3. (v0.48, quick look) Trait screen: a 'LAST SURVIVOR' card on the left, right side empty? Arsenal screen: 'BUILD A BASE' left and 'THE ARSENAL' right, its last box about placeables and the grav lift, nothing overlapping the cards? ->
C1. The arsenal card's last line reads 'Gear, Placeables, and Equipment open by wave.' (v0.46) and fits? ->
C2. Infected picker: a 'BOSSES' card on the left (title and two boxes), the right side empty? Readable next to the form cards? ->
-- New in v0.47 (untested) --
-- New in v0.49 (wording only) --
W1. Texts read right and fit: trait cards (Weak Arm, Grenadier, Tough), boss card (Master Chief ... weak to headshots | click to change), HUD second line 'Flood tier 1 / 4' in wave 1 rising to 4 / 4, how-to boxes on the trait screen, arsenal and picker don't overlap each other? ->
-- New in v0.50 (trim, no change meant) --
T1. Plays as v0.49: arsenal buys (all 4 pages, Prop Placer refused while one is ready with 'You already have a Prop Placer ready'), Infected picker (forms, Monitor in breaks, the gold boss card cycles and turns brighter when picked)? ->
G2. Grenadier: throw both frags, then time how long until one comes back (and whether it stops at 2)? The script only switches on the engine's grenade regeneration trait, so this is the first time the speed is measured ->
-- New in v0.51 (untested) --
-- New in v0.52 (untested; free_shop 0 to see the award make a price free) --
-- New in v0.57 (untested; needs 2+ Infected or a boss + a dead Infected) --
CH1. While the Brute Chieftain boss is alive, a dead Infected who selects Flood Brute or Jumper Brute sees 'Spawn on the Chief'; clicking it spawns them at the Chief? Other forms still see Spawn at Nest (when a nest stands)? The button goes away when the Chief dies? ->
-- New in v0.62-v0.63 --
PK1. Since v0.62 the mode is stored packed (no spare spaces or line breaks): a full round plays as before and the HUD never freezes? ->
HB2. Place a Hunter barrier and leave it about 5 minutes: it breaks by itself and the game keeps going (v0.61 stopped the script here: 'Health must be 1% through 100%')? ->
BS2. Bosses again after the v0.61 stop: each boss spawns as itself, not as a Spartan with an Assault Rifle? ->
-- New in v0.64 --
RN1. Over 4-5 games in a 1v1, both players end up Infected first at least once (click traits or press keys differently each game)? If it's still always player 1, the game's randomness ignores the draws and another source is needed ->
-- New in v0.65 (needs 4+ Infected to fill) --
EL1. Flood Elite card says '3 max'; with 3 Elites out it turns grey 'full (3 max)' and a 4th can't spawn as one? ->
-- New in v0.66 --
HP1. Flood Human, Flood Brute and Brute Chieftain now go down to body shots (Assault Rifle, SMG), not only headshots; their health bar drops when hit? Human takes about twice a Stalker's shots? ->
HP2. Survivors still spawn with half shields (none with Frail, double with Overshield); the Last Survivor gets 200 health once and still recharges? Shifter Stalker keeps its damage when it changes form (doesn't heal)? ->
-- Not reported yet --
T7. Sword Spartan only on wave 5? First person, sword, green-yellow? ->
B1. No boss in wave 1; at the start of wave 2 an Infected gets the boss message, even with zero kills? ->
B2. Only the boss sees the gold card, as a full-width top row with the other forms one row lower? Everyone else's picker looks normal? After the boss spawns, their picker goes back to normal? ->
B3. After dying as a boss the card is gone; the next wave picks again? ->
B4. Anyone else trying to spawn as a boss can't? ->
B5. Clicking the gold card cycles Juggernaut / Brute Chieftain / Master Chief? ->
B8. Juggernaut clearly tougher than a Flood Tank (about 3x)? ->
B6. Brute Chieftain: giant, very fast, invincibility works? Fits through doorways? Takes a lot more than a few Magnum shots now? ->
B7. Master Chief boss: first person, sword, invisible, dies to headshots now, shields never come back? ->
G1. Arsenal card prices match what you're charged (free_shop 0)? ->
X. HUD froze or vanished (script stopped)? Paste the "Custom game mode stopped" line ->
```

## Confirmed in game

- v0.1-v0.13: warmup, outbreak, waves and breaks, conversion, traits including Assault + Grenadier, the arsenal and grav-lift placing, the weapon purge, Monitor breaks, the form picker and nests.
- v0.21: shielded Elites, the Nest Stalker, the Turret and Tank Stalker transforms.
- v0.22: tiers opening by wave, Ability 1 transforms, the Tank Stalker vs Flood Tank difference, the Flood Tank.
- Purge (Test 13 v4, 2026-10-25): no map weapons, no turrets, the normal Assault Rifle loadout kept.
- R1 prop pickup (v0.34, 2026-10-25): works. Sometimes picks an invisible prop: a minor inconvenience, not game breaking (roadmap step 5 is the filter).
- R3 (v0.34): Plasma Cannon and Missile Pod show 'not on this map' on The Pit, as they should.
- X2 (v0.34, 2026-10-25): Turret, Tank and Nest Stalker all work as wanted.
- J1 leap (v0.42, 2026-10-25): works (Crouch, thrown forward and up the way you face).
- Confirmed by the user (2026-10-25): P1 weapon purge with your own and bought guns, R2 Prop Placer, A3 arsenal by wave and its prices, F1-F6 picker and the v0.38 forms (Baby Stalker, Breacher, Jumper Brute, Invis Stalker, Shifter Stalker).
- LS1 Last Survivor (v0.47, 2026-10-26): works. LS2 (v0.53): the marker over their head (waypoint trait) works.
- BL1 (v0.53, 2026-10-26): bosses leap on Crouch.
- PS1 prop safety (2026-10-26): props and the Prop Placer's grav lift are refused on top of a player.
- RS1/RS2 Resupply Box (v0.56, 2026-10-26): works, the drone shows (small: scale 200 since v0.58), ammo refill works. Not checkable during Last Survivor (bottomless mag).
- v0.53-v0.61 (2026-10-26, user): quartermasters work (bought, discounts and normal prices); Monitor break cards; friendly fire off; Spartan Laser wave 4 and Invincibility wave 5 limited correctly; Baby Stalker hits less; Brute Chieftain not invincible and playable; Juggernaut tank mode and Master Chief random equipment work; boss HUD and bounty work (only checked 1v1); wave award (kills) and trait changes work. Hunter barrier decay can't be seen in a short test but should work. Spawn on the Chief (CH1) still to test.
- Roadmap step 5 (invisible-prop filter) DROPPED 2026-10-26: Test 17 showed no usable filter route (v1 hit the execution budget; the user doubts any filter works).
- C1 how-to cards (v0.45, 2026-10-25): 'BUILD A BASE' and 'THE ARSENAL' boxes show correctly beside the trait screen.

## Results that changed the plan

- F7 Test 14, Carrier respawn (2026-10-25): after the melee blast the player respawns at once and it is NOT counted as a death (no death line in client.log). Side finding: class bodies replace the players' own Spartan armour (test modes without a roster keep it).
- B10 Flood Hunter boss (v0.40, 2026-10-25): works, but the Hunter body stays blue (team colour doesn't apply), so it was dropped in v0.41.
- B11 Mega Carrier boss (v0.41, 2026-10-25): still never respawned after its blast, even with the melee kill. Dropped in v0.43; the Carrier isn't usable as a Flood form.
