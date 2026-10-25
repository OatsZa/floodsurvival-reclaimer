# Testing

Two players plus **Ability 4** (with `test_keys` = 1) to skip timers is the quickest way. Everything unlocks by wave, so 1v1 works: press Ability 4 at each wave to reach wave 5. If the HUD freezes, the script stopped: the reason is in `Documents\My Games\Project Reclaimer\Logs\client.log` (search for 'Custom game mode stopped').

## Still to test (v0.22)

Fill in and paste back.

```text
ZS v0.22 RESULTS
-- Fixed or changed in v0.22 --
E1. Bought equipment (cover, radar jammer...) stays in your hands; after using it you can buy another (no softlock)? ->
E2. Equipment and grenades you pick up from the map are no longer deleted? ->
L1. Picker shows one tier per row (Human / Brute, Stalker / Elite, Nest / Turret, Tank Stalker, Tank / Sword, Boss)? Texts fit? ->
L2. Arsenal and trait screens still readable with the new layout? ->
K1. Turret and Tank Stalker transform with Ability 1 now? ->
S1. Tank Stalker's Tank form visibly smaller and weaker than the Flood Tank? ->
S2. Sword Spartan: 150 percent speed? What armor does it show: yours, or a default Spartan? ->
-- Not reported yet --
T1. A new tier opens with each wave (2, 3, 4)? Title says which tier opens in which wave? ->
T6. Flood Tank: 150 percent, tough? ->
T7. Sword Spartan only on wave 5? First person, sword, green-yellow? ->
B1. No boss in wave 1; boss message at the start of wave 2 for the top-killing Infected (needs a kill before wave 2)? ->
B2. Only the boss sees the gold card? ->
B3. After dying as a boss the card is gone; the next wave picks again? ->
B4. Anyone else trying to spawn as a boss can't? ->
B5. Clicking the gold card cycles Juggernaut / Brute Chieftain / Master Chief? ->
B6. Brute Chieftain: giant, very fast, invincibility works? Fits through doorways? ->
B7. Master Chief boss: first person, sword, invisible, headshot-immune, shields never come back? ->
G1. Arsenal card prices match what you're charged (free_shop 0)? ->
X. HUD froze or vanished (script stopped)? Paste the "Custom game mode stopped" line ->
```

Confirmed in game: v0.1–v0.13 (warmup, outbreak, waves and breaks, conversion, traits including Assault + Grenadier, the arsenal and grav-lift placing, the weapon purge, Monitor breaks, the form picker and nests), and in v0.21: shielded Elites, the Nest Stalker, the Turret and Tank Stalker transforms.
