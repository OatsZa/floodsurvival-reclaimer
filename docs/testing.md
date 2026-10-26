# Testing

Two players plus **Ability 4** (with `test_keys` = 1) to skip timers is the quickest way. Everything unlocks by wave, so 1v1 works: press Ability 4 at each wave to reach wave 5. If the HUD freezes, the script stopped: the reason is in `Documents\My Games\Project Reclaimer\Logs\client.log` (search for 'Custom game mode stopped').

## Still to test (v0.52)

Fill in and paste back. Items already answered are in "Confirmed in game" below.

```text
FLOOD SURVIVAL v0.52 RESULTS
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
LS1. Last Survivor: with one Survivor left (1v1: from the outbreak on), that Survivor gets a message 'You're the last Survivor...', the Infected get 'One Survivor left: hunt them down'? The top line turns gold and reads LAST SURVIVOR STANDING? The Survivor's armour turns gold? The Survivor never has to reload (bottomless mag), takes about twice the shots to kill (200 health; the health bar shows a share), and shields come back about twice as fast? After turning Infected, the bonuses are gone? ->
-- New in v0.49 (wording only) --
W1. Texts read right and fit: trait cards (Weak Arm, Grenadier, Tough), boss card (Master Chief ... weak to headshots | click to change), HUD second line 'Flood tier 1 / 4' in wave 1 rising to 4 / 4, how-to boxes on the trait screen, arsenal and picker don't overlap each other? ->
-- New in v0.50 (trim, no change meant) --
T1. Plays as v0.49: arsenal buys (all 4 pages, Prop Placer refused while one is ready with 'You already have a Prop Placer ready'), Infected picker (forms, Monitor in breaks, the gold boss card cycles and turns brighter when picked)? ->
G2. Grenadier: throw both frags, then time how long until one comes back (and whether it stops at 2)? The script only switches on the engine's grenade regeneration trait, so this is the first time the speed is measured ->
-- New in v0.51 (untested) --
PS1. Prop safety (needs 2 players): drop a prop with Flashlight, then the other player tries Flashlight on it at once: 'Someone just placed that prop: wait a few seconds', and after about 5 s they can take it? You can take your own back at once? Drop a prop with the other player standing at it: 'Too close to someone: props can't be dropped within 4 ft' and you still carry it (if every drop is refused even with nobody near, say so)? Prop Placer: throw the grav lift at your own feet or at the other player: 'Too close to someone: grav lift returned', you get the grav lift back and still carry the prop; a throw farther away places it as before? ->
-- New in v0.52 (untested; free_shop 0 to see the award make a price free) --
WA1. Trait screen: 'WAVE AWARDS' card on the right, readable, not overlapping? ->
WA2. Get a kill and place a prop (Flashlight drop) in warmup or wave 1, then end the wave (Ability 4): everyone sees 'Wave 1 awards: most kills 1, most props placed 1'? You get 'WAVE AWARDS: most kills and most props...'? The points line says 'award: next weapon and next gear free'? ->
WA3. With free_shop 0: buying any open gun costs nothing and says 'Bought with your wave award', and the next gun costs points again? Same for a placeable or equipment (Ammo refill still costs 20)? Buying a locked item doesn't use the award? ->
WA4. Moving the same prop again and again in one wave counts it once (a second wave with only that prop: 'most props placed 1')? With no kills the wave's top killer gets nothing? Awards gone after turning Infected? ->
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
- C1 how-to cards (v0.45, 2026-10-25): 'BUILD A BASE' and 'THE ARSENAL' boxes show correctly beside the trait screen.

## Results that changed the plan

- F7 Test 14, Carrier respawn (2026-10-25): after the melee blast the player respawns at once and it is NOT counted as a death (no death line in client.log). Side finding: class bodies replace the players' own Spartan armour (test modes without a roster keep it).
- B10 Flood Hunter boss (v0.40, 2026-10-25): works, but the Hunter body stays blue (team colour doesn't apply), so it was dropped in v0.41.
- B11 Mega Carrier boss (v0.41, 2026-10-25): still never respawned after its blast, even with the melee kill. Dropped in v0.43; the Carrier isn't usable as a Flood form.
