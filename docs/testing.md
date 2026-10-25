# Testing

Two players plus **Ability 4** (with `test_keys` = 1) to skip timers is the quickest way. Everything unlocks by wave, so 1v1 works: press Ability 4 at each wave to reach wave 5. If the HUD freezes, the script stopped: the reason is in `Documents\My Games\Project Reclaimer\Logs\client.log` (search for 'Custom game mode stopped').

## Still to test (v0.35)

Fill in and paste back.

```text
ZS v0.35 RESULTS
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
