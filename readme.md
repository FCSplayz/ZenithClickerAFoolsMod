# Zenith Clicker

    Welcome to Zenith Clicker! Select required tarots to send players to scale the tower.  
    The higher the tower, the more tricky players will come!  
    There's no leaderboard, but how high can you reach?

> All Arts & Sounds from [TETR.IO](https://tetr.io) by osk, an online stacker game with Awesome Graphics and Musics!

**WARNING**: This game requires you know tetr.io QP2's systems and mods, or you won't get much fun.  
If you like QP2 but don't know much about it, check another repo of mine: [QP2 Documentation](https://github.com/MrZ626/io_qp2_rule) (Chinese, but there are some translated forks). It's a full explanation (almost) of QP2, including many technical details behind the scene, helping you play QP2 with better strats!

**Zenith Clicker** is a game inspired by mod selection screen of tetr.io QP2.  
Its interactive feel is really not good for quickly picking the mods needed,  
and there's still no convenient way to know which mods are included in a specific combo.

Powered by LÖVE & Zenitha & Lua ~~instead of slow web engine~~

Credits:  
*MrZ*: Programming, game design, general development  
*CreepercraftYT*: Detailed mod icons  
*DJ Asriel*: Background reconstruction  
*Flowerling*: Text Revision  
*flomikel & Spritzy Sheep*: Extra Texts Writing  
*Dr Ocelot*: Audio & Music  
*osk*: Founder & lead producer of tetr.io  
*Garbo*: Game & world designer of tetr.io  
*Frutigеr*: Font designer (D-Din-Pro)  
*Mooniak*: Font designer (AbhayaLibre)  
*Lorc & Delapouite & Quoting*: Some achievement icons (on https://game-icons.net, CC BY 3.0)

## How to Play

After you starting the game, you can see three mod combos, which are called "quest", shown at the top of the screen.  
Select the mods which contained by the first (largest) one, then press `Start` button to commit.

Pass quests with one click at most on each card to get "perfect pass", with extra attack and charging b2b.

Each mod creates unique experience with twisting the rules but also increases the difficulty **a bit**.

## Mod Effects (may not be exactly correct & complete)

### Expert (`EX`)

- Cards are **10px (9%)** closer together.
- Climb speed **decays 67% faster.**
- Cards are deactivated after failure.
- All actions happen on button **release** instead of button press.

### No Hold (`NH`)

- You cannot manually deselect cards.

#### Messy (`MS`)

- Cards are **lightly shuffled** at the start of **floors 1, 2, 5, and 8**. The cards will always be in or adjacent to their correct position.

### Gravity (`GV`)

- **Automatically commit** some time after the first card flip. The timer starts at **9s** at floor 1, and decreases every floor until **4s** at floor 10. The timer will also automatically start if you flip no cards for 2.6s.

### Volatile (`VL`)

- Cards are **20px (18%)** further apart.
- Cards must be pressed **twice** to activate (but deactivating still takes one press).

### Double Hole (`DH`)

- Quests are harder.
- Quests sometimes slightly shuffled.
- TODO: add specifics to difficulty change

### Invisible (`IN`)

- Cards are flipped to be **face-down**.
- Quest colours are desaturated.
- Quest hints are only shown for a moment **every two seconds**..

### All-Spin (`AS`)

- You can flip cards with your keyboard: on ANSI QWERTY layout, the inputs are 1-9, Q-O, or A-L. If cards are shuffled by `(r)MS`, they are flipped based on their *position*, not by which card they are.
- The RESET button is replaced with **SPIN**, which quickly flips all cards one-by-one.
- Flipping a card will apply **burn** to it, indicated by it flashing yellow. Burn lasts **3s** plus **0.5s per floor**, and can be removed by committing (even a wrong one), or by pressing SPIN. Flipping a burned card will **wound** you, force-flipping two cards. These cards do *not* get Burn.

### Duo (`DP`)

- There are two "players" instead of one. You can swap players by activating the Duo card, or by completing the second quest in the queue (the cards will be highlighted pink while you do this).
- If one player is incapacitated, your ascension is halved and quests becomes harder, but they can be revived by completing some tasks.
- Quests are a bit harder.
- TODO: specifics on tasks

## SPOILERS

<details>
<summary>
Make sure you've discovered most contents before reading this section!
</summary>

### The Tyrant (`rEX`)

- **ALL the effects of Expert.**
- Fatigue is much harsher.
- Passing a quest with Duo no longer gives +2 attack.
- **You fall downward** instead of passively climbing. The speed increases quadratically from **0.6m/s** on Floor 1 to **6m/s** on Floor 10.

### Asceticism (`rNH`)

- The keyboard is disabled, unless (r)AS is enabled. 
- The RESET (or SPIN) button is removed.
- The **next queue** is removed. If (r)DP is enabled, it will show only one next quest.
- Quest **colours** are faded.
- Cards are **not deselected** after committing.

### Loaded Dice (`rMS`)

- Cards are shuffled at the start of **every floor**. The shuffling gets stronger every odd-numbered floor, with cards straying further from their correct positions.
- On commit, **swap two cards**, three on Floor 9/10. The cards must be within a five-card range.

### Freefall (`rGV`)

- The auto-commit timer is reduced, now starting at **3.2s** and decreasing every floor down to **2s**.

### Last Stand (`rVL`)

- Cards are **40px (36%)** further apart.
- Cards must be pressed **four times** to activate *and* to **deactivate**!

### Damnation (`rDH`)

- Quests are harder.
- Most combos are given a **community name**!
- TODO: specifics again

### The Exile (`rIN`)

- **ALL the effects of Invisible, except...**
- Quest hints are **not shown** at all!
- Quests **fade away** after a short time (faster at higher floors), but reappear if you make a wrong commit.

| Floor | rNH Protection | Fade Time |
| :---: | :------------: | :-------: |
|   1   |     0.026s     |   2.37s   |
|   2   |     0.052s     |   1.47s   |
|   3   |     0.078s     |   1.06s   |
|   4   |     0.104s     |   0.83s   |
|   5   |     0.130s     |   0.68s   |
|   6   |     0.156s     |   0.58s   |
|   7   |     0.182s     |   0.50s   |
|   8   |     0.208s     |   0.45s   |
|   9   |     0.234s     |   0.40s   |
|  10   |     0.260s     |   0.36s   |

### The Warlock (`rAS`)

- **ALL the effects of All-Spin, except...**
- SPIN faster
- Wounds flip **four cards** instead of two.
- Burn will **not be removed** over time, nor on SPIN, nor on wrong commit!
- B2B >= 4 sends **+1 attack**, but passing imperfectly **sends none**!

### Bleeding Hearts (`rDP`)

- **ALL the effects of Duo, except...**
- Special fatigue.
- **Half of attack** goes to the inactive player.
- If one player is incapacitated, **you can't climb** and half of attack goes to the **active player**!

### Hard Mode

- **Expert and ALL reversed modifiers activate Hard Mode with the following effects.**
- Activating a correct card for the first time no longer gives +1 Climb Speed XP.
- Quest hints take longer to appear (**1.5s longer**, or on IN, **38% longer** between flashes)

## Behind The Scene

### Clicker Rating (CR)

Just like TR, the maximum value is 25000,  
but CR is calculated from:

1. Best Height (5k)
1. Best Time (5k)
1. Mod Completion (3k)
1. Mod Speedrun (2k)
1. Zenith Point (3k)
1. Daily Challenge (2k)
2. Achievement (5k)

For the exactly formula, see function `calculateRating()` in this [file](/module/scene/stat.lua)

### Zenith Point (ZP)

You gain ZP after a run, with `ZP = altitude * multiplier`, which `multiplier` is taken from:

|   Mod    |  EX   |  NH   |  MS   |    GV     |    VL     |     DH     |  IN   |  AS   |     DP     |
| :------: | :---: | :---: | :---: | :-------: | :-------: | :--------: | :---: | :---: | :--------: |
| Upright  |  1.4  |  1.1  |  1.2  |    1.1    |    1.1    |    1.2     |  1.1  | 0.85  |    0.95    |
| Reversed |  2.6  |  1.6  |  2.0  | 1.2+.02*M | 1.2+.02*M | 1.6+.4*rIN |   X   |  1.1  | 2.2-.6*rEX |

> M = (Other) Mod Count  
> X = rNH ? (DP or rDP ? 2 : 2.2) : 1.6  
> \*The `.02*M` is actually `.020026*M`, but who cares?

And `Hard Mode Decay` = 0.99, this applies `number_of_EX_or_Rev - 1` times.

Total ZP is soft-capped by your skill:

```lua
STAT.zp = max(
    STAT.zp, -- Won't drop
    STAT.zp < zpEarn * 16 and min(STAT.zp + zpEarn, zpEarn * 16) or -- Gain full before 16*zpGain
    zpEarn * 16 + (STAT.zp - zpEarn * 16) * (9 / 10) + (zpEarn * 10) * (1 / 10) -- Slower from 16*zpGain, slower and slower when getting close to the hard-cap (26*zpGain)
)
```

Total ZP decays ~2.6%/d. `ZP*= e^(-0.026)`

Also, DC Highscore decays ~6%/d. `DC*= e^(-0.0626)`
</details>

## TODO

### Daily Challenge Leaderboard

Resets every day

HTTP, only 2 APIs:

**Upload score**

```
request: POST {
    string special_unique_id, -- Generated by client side, not changable, always unique
    string username, -- display name
    string combo, -- to check is it really today's combo
    number altitude, -- altitude (meter)
    number time, -- F10 speedrun time (seconds)
}
response: 200 OK
```

**Fetch leaderboard**

```
struct score {
    string username,
    number rank,
    number altitude, -- altitude (meter)
    number? time, -- F10 speedrun time (seconds) (no value if speedrun not completed)
}

request: GET {string? special_unique_id}
response: 200 OK {
    score[?] altitudeList,
    score[?] timeList,
}

PLAN A - both list includes first 5 scores and-2 ~ self+2, 10 scores in total
PLAN B - both list includes first 5 scores, 10/25/50/75%-th score, and player, 10 scores in total
All lists are sorted by `rank`.
```

## Design draft of Cliker League (Probably won't be implemented)

**Main idea**: Sending mod effect to opponent

Two players start the run same with single player.

**Sending Buffer**: your attacks will be turned into time (1 atk = 1 sec) and stored in this buffer.  
When it's not increasing for 3 seconds or taking time-damage, all times will be send to opponent.

The last card you activated is the effect which you will send.

**Cancelling**: Before sending `effect-time` to opponent, it will try to cancel the same effect you are carrying first, with a 2x multiplier.  
So you cannot force opponent EX if you have EX already.

**Sending**: After Cancelling, if there's extra time remain, your opponent will receive it.

Game ends when one of the players lose all HP.
