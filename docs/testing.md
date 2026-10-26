# Testing

Two players plus **Ability 4** (with `test_keys` = 1) to skip timers is the quickest way. Everything unlocks by wave, so 1v1 works: press Ability 4 at each wave to reach wave 5. If the HUD freezes, the script stopped: the reason is in `Documents\My Games\Project Reclaimer\Logs\client.log` (search for 'Custom game mode stopped').

## Still to test (v0.43)

Fill in and paste back.

```text
FLOOD SURVIVAL v0.43 RESULTS
-- Fixed or changed in v0.22-v0.23 --
E1. Bought equipment (cover, radar jammer...) stays in your hands; after using it you can buy another (no softlock)? ->
E2. Equipment and grenades you pick up from the map are no longer deleted? ->
L1. Back to the two-column card layout on all three screens; texts fit? ->
S2. Sword Spartan: 150 percent speed? What armor does it show: yours, or a default Spartan? ->
H1. Health bar: light blue at the bottom centre, the number and bar drop when hit and refill with regen? Hidden while dead? Never stops the HUD (check at 0 health and on body swaps)? ->
M1. Shorter messages: 'Bought' after every purchase, 'Too far from the quartermaster', 'Use what you carry first', HUD 'Throw your grav lift to build it' while you hold one? Any text you miss or that reads wrong? ->
-- New in v0.27-v0.31 --
P1. Map weapons vanish at once, even when you stand on their spawn point and wait for them to respawn (try 2 maps, one custom)? Your own Magnum survives switching weapons, and the Assault trait's holstered Magnum survives its first minute? Bought guns stay? -> (The same purge passed in Test 13 v4 on 2026-10-25: no map weapons, no turrets, normal Assault Rifle loadout kept. Still to see in this mode: the Magnum, the Assault trait and bought guns.)
Q1. Standing by the quartermaster never refills ammo by itself? The arsenal's Ammo refill costs 20 and works at the quartermaster during a wave and anywhere in a break? The HUD and messages say 'quartermaster', and the host option is quartermaster_radius? ->
-- New in v0.32-v0.35 --
R1. Flashlight within 8 ft picks up a prop and the message shows its ft; Flashlight again lets go of it there, without launching you? The HUD says 'Carrying a prop' only while you really carry one (v0.32-v0.33 said it all the time: the bug fixed in v0.34)? If it shows but you see nothing, it grabbed an invisible map marker: what was near you? 'No prop within 8 ft' when nothing is near? Dying while carrying drops it? -> v0.34 (2026-10-25): WORKS. Sometimes picks an invisible prop, as expected: a minor inconvenience, not game breaking.
R2. Prop Placer (20, Placeables card 5): card shows 'ready' after buying; the next prop comes with a grav lift (or the one you carry, at once); throwing it puts the prop where it lands, facing your way, and the card goes back to 20 pts; Flashlight instead takes the grav lift back and keeps it 'ready'? ->
S1. Since v0.33 the mode is built from the short-name copy: a quick full round (traits, arsenal, a wave, a break, the Infected picker, a boss) plays as before and the HUD never freezes? ->
R3. Placeables still work as before (machine gun, Hunter barrier, plasma cannon, missile pod), including while you carry a prop? -> v0.34: Plasma Cannon and Missile Pod show 'not on this map' on The Pit, as they should.
R4. With a Prop Placer 'ready' (bought, not used yet): the equipment and placeable cards are grey, the header says 'use what you carry first', and buying one says 'Use what you carry first'? Ammo refill still works? After throwing the prop, everything is buyable again? (v0.34: nothing was greyed and other equipment could be bought) ->
X2. Turret, Tank and Nest Stalker after the v0.34 fix -> v0.34 (2026-10-25): all work as wanted.
-- New in v0.36 --
A3. Arsenal: each page sorted by opening wave, prices as in rules.md (free_shop 0 to check charges)? In warmup only wave 1 gear is open; the rest is grey with 'opens in wave N', and buying it says 'That opens in wave N'? Wave 2 gear opens in the first break, wave 3 gear in the second, and so on? Plasma Cannon / Missile Pod still say 'not on this map' on The Pit? Bought guns, equipment and placeables still land as before (the item numbers changed)? ->
-- New in v0.37 --
N1. The mode is called Flood Survival everywhere (game type list, lobby, waiting line 'FLOOD SURVIVAL')? Pages: weapons by wave (1/4, 2/4), Placeables (3/4), Equipment (4/4)? Every card buys the item it names (the item numbers changed again)? ->
-- New in v0.38 --
F1. Picker: 12 forms in tier order, two to a row, nothing overlapping the title or the Spawn buttons? The boss sees the gold card as the top row with everything one row lower? ->
F2. Baby Stalker (tier 1): half size, very fast, dies quickly (40 health)? ->
F3. Breacher (tier 1): bigger Flood Human, tougher (150 health); a 3rd player can't take it ('full (2 max)')? ->
F4. Jumper Brute (tier 2): huge jumps (the roster's gravity setting works?), faster than the Brute; only 1 at a time ('taken')? ->
F5. Invis Stalker (tier 3): smaller, fast, hard to see (the roster's camouflage setting works?), 85 health? ->
F6. Shifter Stalker (tier 4): Ability 1 turret, Ability 2 Tank (bigger, 125 health), either key back; HUD hint right? ->
F7. Test 14 (Carrier respawn, separate mode) -> 2026-10-25: after the melee blast the player respawns at once and it is NOT counted as a death (no death line in client.log). A Carrier bomber would need the script to treat the vanished Carrier body as the death. Side finding: class bodies replace the players' own Spartan armour (test modes without a roster keep it).
-- New in v0.39 --
F8. Flood Brute and Jumper Brute survive headshots (a Sniper or Battle Rifle headshot does body damage only)? Invis Stalker and Shifter Stalker say 'full (2 max)' when 2 are out, and a 3rd can't take them? ->
F9. Test 15 (leap, separate mode): see Documents\zs\tests\RUN_SHEET.md ->
-- New in v0.40 --
B9. Boss card cycles Juggernaut / Brute Chieftain / Master Chief only? ->
B10. Flood Hunter -> v0.40 (2026-10-25): works, but the Hunter body stays blue (team colour doesn't apply), so it was dropped in v0.41.
B11. Mega Carrier -> v0.41 (2026-10-25): still never respawned after its blast, even with the melee kill. Dropped in v0.43, and the Carrier isn't usable as a Flood form.
H2. Flood Human has 200 health (the health bar shows a share, so check it takes about twice the shots)? ->
-- New in v0.42 --
J1. Leap -> v0.42 (2026-10-25): WORKS. v0.43: the Human and Breacher leap is stronger (9/6, was 8/5), still below Brute and Elite (10/6): noticeable? Original check: Crouch as Flood Human, Breacher, Flood Brute, Jumper Brute and Flood Elite: about half a second later you're thrown forward and up the way you face (try 4 facings)? Human shortest, Brute and Elite medium, Jumper Brute farthest? 2 s before the next leap? Other forms and Survivors don't leap? HUD says 'Crouch: leap the way you face'? ->
J2. No stray magnums lying around after leaps, and nobody can pick one up; the arsenal's gun cap isn't affected? ->
H3. Breacher has 300 health (tougher than the 200 Flood Human)? ->
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

Confirmed in game: v0.1–v0.13 (warmup, outbreak, waves and breaks, conversion, traits including Assault + Grenadier, the arsenal and grav-lift placing, the weapon purge, Monitor breaks, the form picker and nests), in v0.21: shielded Elites, the Nest Stalker, the Turret and Tank Stalker transforms; in v0.22: tiers opening by wave, Ability 1 transforms, the Tank Stalker vs Flood Tank difference, the Flood Tank.
