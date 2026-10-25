# Testing

Built but not yet played in game. Two players plus **Ability 4** (with `test_keys` = 1) to skip timers is the quickest way; Everything unlocks by wave now, so 1v1 works: press Ability 4 at each wave to reach wave 5 fast. If the HUD freezes, the script stopped: the reason is in `Documents\My Games\Project Reclaimer\Logs\client.log` (search for 'Custom game mode stopped').

## Still to test (v0.16–v0.21)

Two players plus **Ability 4** to skip timers is the quickest way. Fill in and paste back.

```text
ZS v0.21 RESULTS
-- Flood tiers (v0.16-v0.21) --
T1. A new tier opens with each wave (2, 3, 4)? Locked cards grey; title says which tier opens in which wave? ->
T2. Flood Elite has shields? ->
T3. Nest Stalker: one nest only, stays after it dies, can rebuild once destroyed? Slower and tougher? ->
T4. Turret Stalker: smaller and fast; turret after 1 s, stays until Ability 2 again? ->
T5. Tank Stalker: bigger; Tank form (150 percent) after 1 s and back? ->
T6. Flood Tank: 150 percent, tough? ->
T7. Sword Spartan only on wave 5? First person, sword, green-yellow? ->
T8. Cards readable at the new height, nothing covering the Spawn button? ->
-- Bosses (v0.18-v0.20) --
B1. No boss in wave 1; boss message at the start of wave 2 for the top-killing Infected? ->
B2. Only the boss sees the gold card? ->
B3. After dying as a boss the card is gone; the next wave picks again? ->
B4. Anyone else trying to spawn as a boss can't? ->
B5. Clicking the gold card cycles Juggernaut / Brute Chieftain / Spartan? ->
B6. Brute Chieftain: giant, very fast, invincibility works? Fits through doorways? ->
B7. Spartan boss: first person, sword, invisible, green-yellow, headshot-immune, shields never come back? ->
-- General --
G1. Arsenal card prices still match what you're charged (free_shop 0)? ->
X. HUD froze or vanished (script stopped)? Paste the "Custom game mode stopped" line from Logs\client.log ->
```

Confirmed in game already (v0.1–v0.13): warmup, outbreak, waves and breaks, conversion, traits (including Assault + Grenadier), the arsenal and grav-lift placing, the map purge, the Monitor breaks, the form picker and nests.
