---------------------------------------------------------------------
--                      SPOILER WARNING                            --
-- This file contains secrets that may spoil your game experience. --
--  Be sure your finished the game, including Ultra Reversed Mods  --
--                   Read at your own risk.                        --
---------------------------------------------------------------------

GigaSpeedReq = { [0] = 7, 8, 8, 9, 9, 10, 1e99, 1e99, 1e99, 1e99, 1e99 }

GravityTimer = {
    { 9.0, 8.0, 7.5, 7.0, 6.5, 6.0, 5.5, 5.0, 4.5, 4.0 },
    { 3.2, 3.0, 2.8, 2.6, 2.5, 2.4, 2.3, 2.2, 2.1, 2.0 },
}

ModData = {
    deck = {
        { id = 'PN', initOrder = 0, lockfull = false },
        { id = 'SB', initOrder = 1, lockfull = false },
        { id = 'EX', initOrder = 2, lockfull = false },
        { id = 'NH', initOrder = 3, lockfull = true },
        { id = 'MS', initOrder = 4, lockfull = true },
        { id = 'GV', initOrder = 5, lockfull = true },
        { id = 'VL', initOrder = 6, lockfull = true },
        { id = 'DH', initOrder = 7, lockfull = true },
        { id = 'IN', initOrder = 8, lockfull = true },
        { id = 'AS', initOrder = 9, lockfull = true },
        { id = 'DP', initOrder = 10, lockfull = false },
    },
    name = {
        PN = 'pento',
        SB = 'snowman',
        EX = 'expert',
        NH = 'nohold',
        MS = 'messy',
        GV = 'gravity',
        VL = 'volatile',
        DH = 'doublehole',
        IN = 'invisible',
        AS = 'allspin',
        DP = 'duo',
    },
    fullName = {
        PN = "< PENTR.IO >",
        SB = "< SNOWBALL DECK >",
        EX = "< EXPERT MODE >",
        NH = "< NO HOLD >",
        MS = "< MESSINESS  >",
        GV = "< GRAVITY >",
        VL = "< VOLATILITY >",
        DH = "< DOUBLE HOLE >",
        IN = "< INVISIBLE >",
        AS = "< ALL-SPIN >",
        DP = "< DUO >",
        lock = "< LOCKED >",
        lockDP = "< LOCKED? >",
        lockPN = "< LOCKED >",
        lockSB = "< PERMALOCKED >",
    },
    desc = {
        PN = "ENABLE REVERSE SELECTION AND COMBOS",
        SB = "CARDS FREEZE OVER TIME, FROZEN CARDS DEAL DAMAGE ON FLIP",
        EX = "A LESS LENIENT CHALLENGE, FOR THOSE WHO DARE",
        NH = "CANCELING IS DISABLED",
        MS = "TAROTS WILL BE SHUFFLED BY FLOOR",
        GV = "AUTO COMMITTING, TIMED BY FLOOR",
        VL = "LARGER GAPS BETWEEN TAROTS, MUST CLICK TWICE",
        DH = "COMBOS WILL SPAWN HARDER",
        IN = "TAROTS FACE DOWN AND FLASH ONCE EVERY TWO SECONDS",
        AS = "ENABLE KEYBOARD, BUT DOUBLE CLICKING IS PENALIZED",
        DP = "FLOOD THE TOWER WITH SOMEONE WHO DOESN'T EXIST",
        lock = "REACH HIGHER FLOOR TO UNLOCK",
        lockDP = "PLAY THIS MOD ONCE TO UNLOCK",
        lockPN = "MASTER ALL OTHER NON-REV MODS TO UNLOCK",
        lockSB = "THIS MOD IS NOT AVAILABLE AT THIS TIME",
    },
    revName = {
        PN = "> A FOOL'S ERRAND <",
        SB = "> SUBLIMATION <",
        EX = "> THE TYRANT <",
        NH = "> ASCETICISM <",
        MS = "> LOADED DICE <",
        GV = "> FREEFALL <",
        VL = "> LAST STAND <",
        DH = "> DAMNATION <",
        IN = "> THE EXILE <",
        AS = "> THE WARLOCK <",
        DP = "> BLEEDING HEARTS <",
    },
    revDesc = {
        PN = "YOU'LL NEVER ESCAPE WHO YOU ARE.",
        SB = "THY FORM DOTH TURN'ST TO A MIST;  A REMINDER:  NAUGHT LASTS FORE'ER...",
        EX = "FEAR, OPPRESSION, AND LIMITLESS AMBITION.",
        NH = "A DETACHMENT FROM EVEN THAT WHICH IS MODERATE.",
        MS = "IN A RIGGED GAME, YOUR MIND IS THE ONLY FAIR ADVANTAGE.",
        GV = "THE GROUND YOU STOOD ON NEVER EXISTED IN THE FIRST PLACE.",
        VL = "STRENGTH ISN'T NECESSARY FOR THOSE WITH NOTHING TO LOSE.",
        DH = "NEITHER THE FREEDOM OF LIFE OR PEACE OF DEATH.",
        IN = "NEVER UNDERESTIMATE BLIND FAITH.",
        AS = "INTO REALMS BEYOND HEAVEN AND EARTH.",
        DP = "EVEN AS WE BLEED, WE KEEP HOLDING ON...",
    },
    ultraName = {
        PN = "- A LOST CAUSE -",
        SB = "- ABSOLUTE ZERO -",
        EX = "- PSYCHOTIC SOVEREIGN -",
        NH = "- ASCENDED VIRTUE -",
        MS = "- ENTROPY -",
        GV = "- COLLAPSING GALAXY -",
        VL = "- DIMINISHING VOLITION -",
        DH = "- BLASPHEMY -",
        IN = "- PARADOXICAL NIHILITY -",
        AS = "- DEPRAVED GRIMOIRE -",
        DP = "- SEVERED EDEN -",
    },
    ultraDesc = {
        PN = "UNHEEDED PLEAS FOR NORMALCY & THEIR ECHOED LAUGHS HAUNT THY MIND.",
        SB = "THY BREATH STILLS, ENTOMBED IN WINTER’S MERCILESS EMBRACE.",
        EX = "ROTTEN AUTHORITY AND UNJUST LAW, USURPED THY MORAL AND PEASANTRY.",
        NH = "FOR THY SACRIFICES, TRANSCENDENCE AWAITS, MORTAL...",
        MS = "A DISTORTED FATE RESULTED FROM UNGOVERNED ENIGMATA.",
        GV = "THE UNIVERSE CRUMBLES, WITH ESCAPE MERELY TEMPORARY.",
        VL = "CRUSHED BENEATH DESPAIR, RESISTANCE FADES TO NOTHING.",
        DH = "HARK! THE HOPELESS, DAMNED WEEPING OF THY WILL...",
        IN = "ETERNALLY DROWNING IN ENIGMATIC DOUBTS, UNCERTAINTY AND HYSTERIA.",
        AS = "ILL-NATURED, TENEBRIOUS, LIFE-DRAINING MAGIC CLASPS THY SOUL...",
        DP = "WHAT ONCE WAS INTERTWINED NOW NEVER TO COEXIST.",
    },
    ultraImpactTone = {
        PN = { -12, 12, 0 },
        SB = { 2, 7, 10 },
        EX = { 0, nil, 0 }, -- 6 6
        NH = { 0, 5 },      -- 5 2
        MS = { 3, 5, 7 },   -- 1 2 3
        GV = { -4, 8 },     -- 4 4
        VL = { -5, 0 },     -- 3 6
        DH = { 1, 6, 9 },   -- #6 #2 #4
        IN = {},
        AS = { 0, 3 },      -- 6 1
        DP = { -2, 5 },     -- 5 2
    },
    weight = {
        PN = 9,
        SB = 8,
        EX = 13, --  8 + 5
        NH = 12, --  8 + 4
        MS = 14, -- 10 + 4
        GV = 12, -- 10 + 2
        VL = 17, -- 15 + 2
        DH = 12, --  8 + 4
        IN = 7,  --  6 + 1
        AS = 13, -- 10 + 3
        DP = 4,  --  3 + 1
    },
    color = {
        PN = { COLOR.HEX "626262" },
        SB = { COLOR.HEX "5461A9" },
        EX = { COLOR.HEX "89590B" },
        NH = { COLOR.HEX "FF00D4" },
        MS = { COLOR.HEX "FFB400" },
        GV = { COLOR.HEX "FFFF00" },
        VL = { COLOR.HEX "FF1500" },
        DH = { COLOR.HEX "47ACFF" },
        IN = { COLOR.HEX "BD24FF" },
        AS = { COLOR.HEX "00FED4" },
        DP = { COLOR.HEX "FF8C9D" },
    },
    textColor = {
        PN = { COLOR.HEX "999999" },
        SB = { COLOR.HEX "5566EA" },
        EX = { COLOR.HEX "C29F68" },
        NH = { COLOR.HEX "FF8BEC" },
        MS = { COLOR.HEX "FFD572" },
        GV = { COLOR.HEX "F7FF8A" },
        VL = { COLOR.HEX "FF978D" },
        DH = { COLOR.HEX "A6D5FF" },
        IN = { COLOR.HEX "E8B3FF" },
        AS = { COLOR.HEX "93FFE0" },
        DP = { COLOR.HEX "FFC0C9" },
    },
    prio_name = { PN = 1, IN = 2, MS = 3, VL = 4, NH = 5, DH = 6, AS = 7, GV = 8, EX = 9, SB = 10, DP = 12, rSB = 0, rIN = 1, rMS = 2, rVL = 3, rNH = 4, rDH = 5, rAS = 6, rGV = 7, rEX = 8, rPN = 11, rDP = 12 },
    prio_icon = { PN = 0, EX = 1, DP = 2, DH = 3, VL = 4, GV = 5, NH = 6, MS = 7, IN = 8, AS = 9, SB = 10, rPN = 0, rEX = 1, rDP = 2, rDH = 3, rVL = 4, rGV = 5, rNH = 6, rMS = 7, rIN = 8, rAS = 9, rSB = 10 },
    prio_card = { PN = 0, SB = 1, EX = 2, NH = 3, MS = 4, GV = 5, VL = 6, DH = 7, IN = 8, AS = 9, DP = 10, rPN = 0, rSB = 1, rEX = 2, rNH = 3, rMS = 4, rGV = 5, rVL = 6, rDH = 7, rIN = 8, rAS = 9, rDP = 10 },
    adj = {
        PN = "PENTA",
        SB = "SNOWBALL",
        EX = "EXPERT",
        NH = "HOLDLESS",
        MS = "MESSY",
        GV = "GRAVITY",
        VL = "VOLATILE",
        DH = "DOUBLE HOLE",
        IN = "INVISIBLE",
        AS = "ALL-SPIN",
        DP = "DUAL",
        rPN = "ESCAPIST",
        rSB = "FROSTBITTEN",
        rEX = "TYRANNICAL",
        rNH = "ASCENDANT",
        rMS = "DECEPTIVE",
        rGV = "COLLAPSED",
        rVL = "DESPERATE",
        rDH = "DAMNED",
        rIN = "BELIEVED",
        rAS = "OMNI-SPIN",
        rDP = "PIERCING",
    },
    noun = {
        PN = "PENTR.IO",
        SB = "SNOWBALL",
        EX = "EXPERT",
        NH = "NO HOLD",
        MS = "MESSINESS",
        GV = "GRAVITY",
        VL = "VOLATILITY",
        DH = "DOUBLE HOLE",
        IN = "INVISIBLITY",
        AS = "ALL-SPIN",
        DP = "DUO",
        rPN = "ESCAPISM",
        rSB = "FROSTBITE",
        rEX = "TYRANNY",
        rNH = "ASCENSION",
        rMS = "DECEPTION",
        rGV = "COLLAPSE",
        rVL = "DESPERATION",
        rDH = "DAMNATION",
        rIN = "BELIEF",
        rAS = "OMNI-SPIN",
        rDP = "HEARTACHE",
    },
}

ComboData = {
    menu = {
        { set = 'NH GV',            name = "A Modern Classic" },
        { set = 'NH MS DH',         name = "Deadlock" },
        { set = 'MS DH AS',         name = "The Escape Artist" },
        { set = 'GV IN',            name = "The Grandmaster" },
        { set = 'EX NH DH',         name = "Emperor's Decadence" },
        { set = 'EX MS VL DH',      name = "Divine Mastery" },
        { set = 'NH AS',            name = "The Starving Artist" },
        { set = 'EX VL AS',         name = "The Con Artist" },
        { set = 'EX DP',            name = "Trained Professionals" },
        { set = 'EX MS',            name = "Block Rationing" },

        { set = "EX rGV DH",        name = "Demonic Speed" },
        { set = "rGV rAS",          name = "Whizzing Wizard" },
        { set = "rGV rIN",          name = "The Grandmaster+" },
        { set = "NH rAS",           name = "Pristine" },
        { set = "GV rDH rAS",       name = "Storage Overload" },
        { set = "NH DH rIN rAS",    name = "Steganography" },
        { set = "NH rMS GV DH",     name = "Trench Warfare" },
        { set = "rNH rMS DH",       name = "Deadbeat" },
        { set = "rNH rGV rVL",      name = "Sweatshop" },
        { set = "rNH rIN",          name = "Fleeting Memory" },
        { set = "EX NH rMS GV",     name = "Bnuuy" },
        { set = "rNH MS GV DP",     name = "Grand-Master!" },
        { set = "rNH rMS GV AS DP", name = "Grand-Master! Rounds" },
        { set = "EX rMS rDH AS",    name = "Endless Gluttony" },
        { set = "rEX rVL DH",       name = "Sweat and Ruin" },
        { set = "rMS GV AS rDP",    name = "Cupid's Gamble" },
        { set = "NH rGV VL rDP",    name = "Despairful Longing" },
        { set = "MS rDH IN rDP",    name = "Uneasy Alliance" },
        { set = "rEX VL rIN",       name = "Authoritarian Delusion" },
        { set = "rEX rDP",          name = "Tyrannical Dyarchy" },
        { set = "rEX MS rDH IN",    name = "Sisyphean Monarchy" },
        { set = "rDH rIN",          name = "Brain Capacity" },

        { set = "NH rGV",           name = "Clutch Main" },
        { set = "EX VL",            name = "Wax Wings" },
        { set = "DH rIN AS",        name = "The Oblivious Artist" },

        { set = "EX VL rIN rDP",    name = "Love Hotel" },
        { set = "EX MS AS",         name = "Financially Responsible" },
        { set = "EX rVL rDP",       name = "Unfair Battle" },
        { set = "DH DP",            name = "Museum Heist" },
        { set = "EX rGV VL",        name = "Workaholic" },
        { set = "MS VL AS",         name = "Human Experiment" },
        { set = "EX GV DH",         name = "Core Meltdown" },
    },

    game = {
        { set = 'NH GV',       name = "A Modern Classic" },
        { set = 'NH MS DH',    name = "Deadlock" },
        { set = 'MS DH AS',    name = "The Escape Artist" },
        { set = 'GV IN',       name = "The Grandmaster" },
        { set = 'EX NH DH',    name = "Emperor's Decadence" },
        { set = 'EX MS VL DH', name = "Divine Mastery" },
        { set = 'NH AS',       name = "The Starving Artist" },
        { set = 'EX VL AS',    name = "The Con Artist" },
        { set = 'EX DP',       name = "Trained Professionals" },
        { set = 'EX MS',       name = "Block Rationing" },
    },

    -- rDH database, from tetr.io's community:
    -- https://docs.google.com/spreadsheets/d/1syh3q2oiduCZb1cJ5QI95Y2XhhedAfhv4YnEH9z2tbc
    gameEX = {
        { set = "",               name = "Emptyhanded" },
        { set = "PN",             name = "The Fool" },
        { set = "rPN",             name = "A Fool's Errand" },
        { set = "SB",             name = "The Snowman" },
        { set = "rSB",             name = "Sublimation" },
        { set = "EX",             name = "The Emperor" },
        { set = "rEX",             name = "The Tyrant" },
        { set = "NH",             name = "Temperance" },
        { set = "rNH",             name = "Asceticism" },
        { set = "MS",             name = "Wheel of Fortune" },
        { set = "rMS",             name = "Loaded Dice" },
        { set = "GV",             name = "The Tower" },
        { set = "rGV",             name = "Freefall" },
        { set = "VL",             name = "Strength" },
        { set = "rVL",             name = "Last Stand" },
        { set = "DH",             name = "The Devil" },
        { set = "rDH",             name = "Damnation" },
        { set = "IN",             name = "The Hermit" },
        { set = "rIN",             name = "The Exile" },
        { set = "AS",             name = "The Magician" },
        { set = "rAS",             name = "The Warlock" },
        { set = "DP",             name = "The Lovers" },
        { set = "rDP",             name = "Bleeding Hearts" },
        { set = "PN EX",          name = "Oblivious King" },
        { set = "PN rEX",          name = "Criminal Negligence" },
        { set = "PN NH",          name = "The Newbie" },
        { set = "PN rNH",          name = "Innocence" },
        { set = "PN MS",          name = "Cluttered" },
        { set = "PN rMS",          name = "The Mime" },
        { set = "PN GV",          name = "Bungee Jumper" },
        { set = "PN rGV",          name = "Cascade" },
        { set = "PN VL",          name = "Intrusive Thoughts" },
        { set = "PN rVL",          name = "Drowning in Light" },
        { set = "PN DH",          name = "Foolish Temptations" },
        { set = "PN rDH",          name = "How Is This Remotely Playable..." },
        { set = "PN IN",          name = "Blind Follower" },
        { set = "PN rIN",          name = "The Wayward Wanderer" },
        { set = "PN AS",          name = "The Jester" },
        { set = "PN rAS",          name = "Twisted Words" },
        { set = "PN DP",          name = "The Flawed Lovers" },
        { set = "PN rDP",          name = "Brittle Love" },
        { set = "rPN EX",          name = "Clean Getaway" },
        { set = "rPN rEX",         name = "Surrender" },
        { set = "rPN NH",          name = "The Nitwit" },
        { set = "rPN rNH",         name = "Drifting into Dreamland" },
        { set = "rPN MS",          name = "Delayed Consequence" },
        { set = "rPN rMS",         name = "It's Inevitable..." },
        { set = "rPN GV",          name = "Too Close To Home" },
        { set = "rPN rGV",         name = "There Is No Escape..." },
        { set = "rPN VL",          name = "Nobody's Coming..." },
        { set = "rPN rVL",         name = "This Is The End..." },
        { set = "rPN DH",          name = "Manmade Garbage" },
        { set = "rPN rDH",         name = "Sirius Stall Strat" },
        { set = "rPN IN",          name = "Naivety" },
        { set = "rPN rIN",         name = "A Soul Beyond Saving" },
        { set = "rPN AS",          name = "The Buffoon" },
        { set = "rPN rAS",         name = "The Scapegoat" },
        { set = "rPN DP",          name = "Red Flags" },
        { set = "rPN rDP",         name = "Unhealthy Relationships" },
        { set = "SB EX",          name = "Headshot" },
        { set = "SB rNH",          name = "Snow Angels" },
        { set = "SB GV",          name = "Fastball" },
        { set = "SB rGV",          name = "Four Wide Main" },
        { set = "SB VL",          name = "Enraged" },
        { set = "SB rVL",          name = "The Beggar" },
        { set = "SB rDH",          name = "Three Sixty No Scope" },
        { set = "SB IN",          name = "Inner Turmoil" },
        { set = "SB AS",          name = "Curveball" },
        { set = "SB rAS",          name = "Snowy Wizard" }, -- @Echazarel
        { set = "SB DP",          name = "Snowball Fight" },
        { set = "SB rDP",          name = "Icy Projectiles" },
        { set = "rSB GV",          name = "Slippery Slopes" },
        { set = "rSB rGV",         name = "Avalanche" },
        { set = "rSB VL",          name = "Snowstorm" }, -- @The_111thBlitzer
        { set = "rSB rVL",         name = "Niflhel" }, -- @lavender
        { set = "rSB rDH",         name = "Baby It's Cold Outside" },
        { set = "EX NH",          name = "A Fair Leader" },
        { set = "EX rNH",          name = "Top Player" },
        { set = "EX MS",          name = "Block Rationing" },
        { set = "EX rMS",          name = "The Swindler" },
        { set = "EX GV",          name = "Invictus" },
        { set = "EX rGV",         name = "The Fallen" },
        { set = "EX VL",          name = "Icarus" },
        { set = "EX rVL",          name = "Struggling Professional" },
        { set = "EX DH",          name = "The Devil's Temptation" },
        { set = "EX rDH",          name = "Fatal Finesse" },
        { set = "EX IN",          name = "Emperor's Dilemma" },
        { set = "EX rIN",          name = "The Impostor" },
        { set = "EX AS",          name = "Dancing Queen" },
        { set = "EX rAS",          name = "Surging King" },
        { set = "EX DP",          name = "Trained Professionals" },
        { set = "EX rDP",          name = "Arranged Marriage" }, -- @FMichael
        { set = "rEX NH",          name = "The Benevolent Dictator" },
        { set = "rEX rNH",         name = "Record Runner" },
        { set = "rEX MS",          name = "Haphazard Regime" },
        { set = "rEX rMS",         name = "Nonsensical Regulations" },
        { set = "rEX GV",          name = "Iron Fist" },
        { set = "rEX rGV",         name = "Overthrown" },
        { set = "rEX VL",          name = "The Mercurial Ruler" },
        { set = "rEX rVL",         name = "Dying Despotism" },
        { set = "rEX DH",          name = "Satan's Orders" },
        { set = "rEX rDH",         name = "Hellish Reign" },
        { set = "rEX IN",          name = "Inside Job" },
        { set = "rEX rIN",         name = "Ulterior Motive" },
        { set = "rEX AS",          name = "Dancing Tyrantess" },
        { set = "rEX rAS",         name = "Surging Scourge" },
        { set = "rEX DP",          name = "Duadic Dominion" },
        { set = "rEX rDP",         name = "Tyrannical Dyarchy" },
        { set = "NH MS",          name = "All In" },
        { set = "NH rMS",          name = "High Stakes" },
        { set = "NH GV",          name = "A Modern Classic" },
        { set = "NH rGV",          name = "Clutch Main" },
        { set = "NH VL",          name = "Resistance" },
        { set = "NH rVL",          name = "Machina" },
        { set = "NH DH",          name = "Purgatory Lite" },
        { set = "NH rDH",          name = "I Needed That Piece..." },
        { set = "NH IN",          name = "Helen Keller" },
        { set = "NH rIN",          name = "Renunciation" },
        { set = "NH AS",          name = "The Starving Artist" },
        { set = "NH rAS",          name = "Pristine" },
        { set = "NH DP",          name = "Hand in Hand" },
        { set = "NH rDP",          name = "Moving On" },
        { set = "rNH MS",          name = "Turbulent Rise" },
        { set = "rNH rMS",         name = "Faked Achievements" },
        { set = "rNH GV",          name = "Levitation" },
        { set = "rNH rGV",         name = "Heaven's Ruination" },
        { set = "rNH VL",          name = "Enlightened" },
        { set = "rNH rVL",         name = "The Insincere Samaritan" },
        { set = "rNH DH",          name = "A Wretch's Redemption" },
        { set = "rNH rDH",         name = "The Fallen Angel" },
        { set = "rNH IN",          name = "Imperceptible" },
        { set = "rNH rIN",         name = "Fleeting Memory" },
        { set = "rNH AS",          name = "The Dying Artist" },
        { set = "rNH rAS",         name = "O Omnipotent One" },
        { set = "rNH DP",          name = "Guardian Angel" },
        { set = "rNH rDP",         name = "Undevoted" },
        { set = "MS GV",          name = "Cheese Race" },
        { set = "MS rGV",          name = "Topout Race" },
        { set = "MS VL",          name = "Swiss Cheese" },
        { set = "MS rVL",          name = "Frantic Pleas" },
        { set = "MS DH",          name = "Dig In" },
        { set = "MS rDH",          name = "Cleanup" },
        { set = "MS IN",          name = "Blind Bet" },
        { set = "MS rIN",          name = "The Uncertain Spirit" },
        { set = "MS AS",          name = "Roulette Wheel" },
        { set = "MS rAS",          name = "Russian Roulette" },
        { set = "MS DP",          name = "It's Complicated..." },
        { set = "MS rDP",          name = "Devastated" },
        { set = "rMS GV",          name = "Illusory Perpetuity" },
        { set = "rMS rGV",         name = "Fake Out" },
        { set = "rMS VL",          name = "Emotional Manipulation" },
        { set = "rMS rVL",         name = "The Parasite" },
        { set = "rMS DH",          name = "Duplicitous Devilry" },
        { set = "rMS rDH",         name = "Damning Evidence" },
        { set = "rMS IN",          name = "The House Always Wins..." },
        { set = "rMS rIN",         name = "The Cult" },
        { set = "rMS AS",          name = "LaundrySpin" },
        { set = "rMS rAS",         name = "The Rigger's Revolver" },
        { set = "rMS DP",          name = "Troublemakers" },
        { set = "rMS rDP",         name = "Gaslighting" },
        { set = "GV VL",          name = "Comfort Food" },
        { set = "GV rVL",          name = "Serious Situation" },
        { set = "GV DH",          name = "The Speed Demon" },
        { set = "GV rDH",          name = "This Isn't That Fast..." },
        { set = "GV IN",          name = "The Grandmaster" },
        { set = "GV rIN",          name = "Blindfolded" },
        { set = "GV AS",          name = "The Juggler" },
        { set = "GV rAS",          name = "The Sleight of Hand Artist" },
        { set = "GV DP",          name = "Heavy Hearts" },
        { set = "GV rDP",          name = "Echoed Anguish" },
        { set = "rGV VL",          name = "The Tamed Tiger" },
        { set = "rGV rVL",         name = "Acceptance" },
        { set = "rGV DH",          name = "Gotta Go Fast" },
        { set = "rGV rDH",         name = "Master Speed Level Thirty" },
        { set = "rGV IN",          name = "Broken Will" },
        { set = "rGV rIN",         name = "The Grandermaster" }, -- @GameTilDead
        { set = "rGV AS",          name = "Opener Main" },
        { set = "rGV rAS",         name = "Whizzing Wizard" },
        { set = "rGV DP",          name = "Strained Relationships" },
        { set = "rGV rDP",         name = "It's For The Best..." },
        { set = "VL DH",          name = "Lucifer" },
        { set = "VL rDH",          name = "Emotional Poison" },
        { set = "VL IN",          name = "Memorization" },
        { set = "VL rIN",          name = "Forgetfulness" },
        { set = "VL AS",          name = "Water From Stone" },
        { set = "VL rAS",          name = "Contrition" },
        { set = "VL DP",          name = "Power Couple" },
        { set = "VL rDP",          name = "Harrowing Heartbreak" },
        { set = "rVL DH",          name = "Down Bad" },
        { set = "rVL rDH",         name = "Bottled Up Agony" },
        { set = "rVL IN",          name = "Mental Block" },
        { set = "rVL rIN",         name = "Buried Thoughts" },
        { set = "rVL AS",          name = "Greeding" },
        { set = "rVL rAS",         name = "Malice" }, -- @The_111thBlitzer
        { set = "rVL DP",          name = "Chained by Love" },
        { set = "rVL rDP",         name = "I Can Fix Them..." },
        { set = "DH IN",          name = "The Ghost" },
        { set = "DH rIN",          name = "Must've Been The Wind..." },
        { set = "DH AS",          name = "The Deal with the Devil" },
        { set = "DH rAS",          name = "The Devil's Fine Print" },
        { set = "DH DP",          name = "Forbidden Lovers" },
        { set = "DH rDP",          name = "'Twas Never Meant To Be..." },
        { set = "rDH IN",          name = "The Curse" },
        { set = "rDH rIN",         name = "Apostasy" },
        { set = "rDH AS",          name = "Mech Heart" },
        { set = "rDH rAS",         name = "Cancelling Sickness" },
        { set = "rDH DP",          name = "The Circle of Lust" },
        { set = "rDH rDP",         name = "Hated Hurt" },
        { set = "IN AS",          name = "The Abstract Artist" },
        { set = "IN rAS",          name = "Stygian Spins" },
        { set = "IN DP",          name = "Love is Blind" },
        { set = "IN rDP",          name = "Silent Sorrow" },
        { set = "rIN AS",          name = "That's Not A Kick..." },
        { set = "rIN rAS",         name = "That's An Actual Kick" },
        { set = "rIN DP",          name = "Friends with Benefits" },
        { set = "rIN rDP",         name = "The Ditched Partner" },
        { set = "AS DP",          name = "Collaboration" },
        { set = "AS rDP",          name = "Disagreements" },
        { set = "rAS DP",          name = "Polyamorous" },
        { set = "rAS rDP",         name = "Secret Affairs" },
        { set = "PN EX NH",       name = "An Unfair Leader" },
        { set = "PN EX rNH",       name = "Players' Rights" },
        { set = "PN EX MS",       name = "Overconsumption" },
        { set = "PN EX GV",       name = "Overranked" },
        { set = "PN EX VL",       name = "Daedulus" },
        { set = "PN EX DH",       name = "Lucifer's Promises" },
        { set = "PN EX IN",       name = "Foolish Errors" },
        { set = "PN EX AS",       name = "Masquerade Party" },
        { set = "PN EX DP",       name = "Licensed Idiots" },
        { set = "PN EX rDP",       name = "Property Damage" },
        { set = "PN rEX NH",       name = "The Malevolent Dictator" },
        { set = "PN rEX rNH",      name = "Geneva Convention" },
        { set = "PN NH MS",       name = "Double or Nothing" },
        { set = "PN NH GV",       name = "A New Generation" },
        { set = "PN NH rGV",       name = "An Eradicated Era" },
        { set = "PN NH VL",       name = "Uncalculated Attacks" },
        { set = "PN NH rVL",       name = "Nothing to Lose" },
        { set = "PN NH AS",       name = "The Ravenous Artist" },
        { set = "PN NH rAS",       name = "The Addicted Artist" },
        { set = "PN NH DP",       name = "Handcuffed" },
        { set = "PN NH rDP",       name = "Too Tight" },
        { set = "PN rNH GV",       name = "Generational Turnover" },
        { set = "PN rNH rGV",      name = "Mass Extinction Event" },
        { set = "PN MS DH",       name = "The Archaeologist" },
        { set = "PN MS rDH",       name = "Organized" },
        { set = "PN MS AS",       name = "The Absurd Artist" },
        { set = "PN MS rAS",       name = "The Perfectionist" },
        { set = "PN MS DP",       name = "I'm Sorry..." },
        { set = "PN MS rDP",       name = "Sorry Won't Cut It" },
        { set = "PN rMS rIN",      name = "The Misinformed" },
        { set = "PN rMS AS",       name = "Washing Machine" },
        { set = "PN GV VL",       name = "The Cliff Diver" },
        { set = "PN GV DP",       name = "Falling in Love" }, -- @FMichael
        { set = "PN GV rDP",       name = "Cutting the Cord" },
        { set = "PN rGV DP",       name = "MagicMinoes" },
        { set = "PN rGV rDP",      name = "Derelict Setups" },
        { set = "PN VL AS",       name = "Dense As A Rock" },
        { set = "PN VL rAS",       name = "Belated Reactions" },
        { set = "PN VL DP",       name = "Hopeless Romantics" }, -- @FMichael
        { set = "PN VL rDP",       name = "Finally Giving Up..." },
        { set = "PN rVL IN",       name = "Drowning in Darkness" },
        { set = "PN rVL rIN",      name = "False Hope" },
        { set = "PN rVL AS",       name = "Overencumbered" },
        { set = "PN rVL rAS",      name = "Backfiring Bite" },
        { set = "PN rVL DP",       name = "Love at First Sight" },
        { set = "PN rVL rDP",      name = "Parasocial" },
        { set = "PN DH DP",       name = "Romeo and Juliet" },
        { set = "PN DH rDP",       name = "In Death Doth I Joineth Thee..." },
        { set = "PN rDH rAS",      name = "Not A Penta" },
        { set = "PN IN DP",       name = "Fooled by Falsehoods" },
        { set = "PN rIN rDP",      name = "Built On Lies" }, -- @lavender
        { set = "PN AS DP",       name = "Yaoi" },
        { set = "PN AS rDP",       name = "Wishes" },
        { set = "rPN EX NH",       name = "The Demagogue" },
        { set = "rPN EX rNH",      name = "The Union" },
        { set = "rPN EX DP",       name = "Getaway Driver" },
        { set = "rPN EX rDP",      name = "Out of Gas" },
        { set = "rPN rEX NH",      name = "The Totalitarian" },
        { set = "rPN rEX rNH",     name = "Geneva Suggestion" },
        { set = "rPN NH MS",       name = "Triple or Nothing" },
        { set = "rPN NH DP",       name = "I Lost The Key..." },
        { set = "rPN MS GV",       name = "Funneling" }, -- @THe_111thBlitzer
        { set = "rPN MS AS",       name = "Twisted Prank" },
        { set = "rPN MS DP",       name = "I'll Make Things Right..." },
        { set = "rPN MS rDP",      name = "The Damage is Done..." },
        { set = "rPN rMS rIN",     name = "Fake News" },
        { set = "rPN rMS AS",      name = "It's Just A Prank Bro..." },
        { set = "rPN GV VL",       name = "The Cave Diver" },
        { set = "rPN GV DP",       name = "Head Over Heels" },
        { set = "rPN GV rDP",      name = "Abnegatory Couple" },
        { set = "rPN rGV DP",      name = "Weak in the Knees" },
        { set = "rPN rGV rDP",     name = "Swooning" },
        { set = "rPN VL DP",       name = "Solipsistic Soulmates" },
        { set = "rPN VL rDP",      name = "Neglect" },
        { set = "rPN rVL DP",      name = "Too Good To Be True" },
        { set = "rPN rVL rDP",     name = "Fractured Fantasies" },
        { set = "rPN rDH rAS",     name = "Spin Quad" },
        { set = "rPN rIN DP",      name = "Blissful Ignorance" },
        { set = "rPN rIN rDP",     name = "Denial" },
        { set = "rPN AS DP",       name = "The Shipper" },
        { set = "rPN AS rDP",      name = "Doomed to Fail" },
        { set = "SB EX DP",       name = "Yukigassen" },
        { set = "SB GV DH",       name = "Alpine Skiing" },
        { set = "SB rGV DH",       name = "Freestyle Terrain" },
        { set = "SB rGV rDH",      name = "The Olympic Skier" },
        { set = "EX NH MS",       name = "Online Gambling" },
        { set = "EX NH GV",       name = "Beyond Death" },
        { set = "EX NH VL",       name = "Archangel" },
        { set = "EX NH rVL",       name = "Ace of Swords" }, -- @The_111thBlitzer
        { set = "EX NH DH",       name = "Emperor's Decadence" },
        { set = "EX NH IN",       name = "The Friar" },
        { set = "EX NH rIN",       name = "The Monk" },
        { set = "EX NH AS",       name = "Indecision" },
        { set = "EX NH DP",       name = "The Prudent Parliament" },
        { set = "EX rNH AS",       name = "Absolute Cinema" }, -- @lavender
        { set = "EX rNH rAS",      name = "Roll the Credits" },
        { set = "EX rNH DP",       name = "Esports Team" },
        { set = "EX rNH rDP",      name = "Tournament Losses" },
        { set = "EX MS GV",       name = "Mining Operation" },
        { set = "EX MS rGV",       name = "Cave In" },
        { set = "EX MS VL",       name = "The Wolf of Wall Street" },
        { set = "EX MS rVL",       name = "Maven in Mayhem" },
        { set = "EX MS DH",       name = "No Warning" },
        { set = "EX MS rDH",       name = "Startled" },
        { set = "EX MS IN",       name = "Irrational" },
        { set = "EX MS rIN",       name = "Abstruse Dilemma" }, -- @lavender
        { set = "EX MS AS",       name = "The Rich Gambler" },
        { set = "EX MS rAS",       name = "The Penniless Plutocrat" },
        { set = "EX MS DP",       name = "Grand Feast" },
        { set = "EX MS rDP",       name = "Burnt Turkey" },
        { set = "EX rMS rIN",      name = "The Fraud" },
        { set = "EX rMS DP",       name = "Partners in Crime" },
        { set = "EX GV VL",       name = "Relaxation" },
        { set = "EX GV rVL",       name = "Paid Vacation" },
        { set = "EX GV DH",       name = "The Daredevil" },
        { set = "EX GV rDH",       name = "A Really Good Lawyer" },
        { set = "EX GV IN",       name = "The Super GM" },
        { set = "EX GV AS",       name = "Master of the T" },
        { set = "EX GV DP",       name = "Sinking" },
        { set = "EX GV rDP",       name = "Dying Inside" },
        { set = "EX rGV VL",       name = "Workaholic" },
        { set = "EX rGV rVL",      name = "Working Overtime" },
        { set = "EX rGV DH",       name = "Demonic Speed" },
        { set = "EX rGV rDH",      name = "I Can't Keep Up..." },
        { set = "EX rGV rAS",      name = "Ace of Wands" }, -- @The_111thBlitzer
        { set = "EX VL DH",       name = "The Mad Lord" },
        { set = "EX VL rDH",       name = "The Rotten Baron" },
        { set = "EX VL IN",       name = "Bounty Hunter" },
        { set = "EX VL rIN",       name = "The Assassin" },
        { set = "EX VL AS",       name = "The Con Artist" },
        { set = "EX VL DP",       name = "Measures" },
        { set = "EX VL rDP",       name = "Broken Promises" },
        { set = "EX rVL DH",       name = "Experienced Inamorati" },
        { set = "EX rVL rDH",      name = "Like A Champ" },
        { set = "EX rVL IN",       name = "Overlooked Ingenuity" },
        { set = "EX rVL rIN",      name = "Dismissed Wisdom" },
        { set = "EX rVL AS",       name = "Thor" },
        { set = "EX rVL rDP",      name = "Unfair Battle" },
        { set = "EX DH IN",       name = "The Architect" },
        { set = "EX DH AS",       name = "Loki" },
        { set = "EX DH DP",       name = "Whispers of Sin" },
        { set = "EX IN AS",       name = "Expertise" },
        { set = "EX rIN AS",       name = "Hidden Talent" },
        { set = "EX rIN DP",       name = "Polite Parting" },
        { set = "EX rIN rDP",      name = "Now Jilted at the Altar" },
        { set = "EX AS DP",       name = "Ballet Partners" },
        { set = "EX AS rDP",       name = "Uncoordinated Pas de Deux" },
        { set = "rEX NH MS",       name = "The Casino Kingpin" },
        { set = "rEX NH GV",       name = "The Virtual Viceroy" },
        { set = "rEX NH DH",       name = "Despot's Decadence" },
        { set = "rEX NH rIN",      name = "The Abbot" },
        { set = "rEX NH rAS",      name = "Resource Exploitation" }, -- @FMichael
        { set = "rEX MS AS",       name = "The Centibillionaire" },
        { set = "rEX MS rAS",      name = "Utopia" }, -- @Echazarel
        { set = "rEX rMS rAS",     name = "Dystopia" },
        { set = "rEX GV IN",       name = "The Ultimate GM" },
        { set = "rEX GV AS",       name = "Tyrant of the T" }, -- @Echazarel
        { set = "rEX rGV VL",      name = "The Zookeeper" },
        { set = "rEX rGV rVL",     name = "Complete Submission" },
        { set = "rEX VL DH",       name = "The Berserk Potentate" },
        { set = "rEX VL rDH",      name = "Too Rough" },
        { set = "rEX VL rIN",      name = "Authoritarian Delusion" },
        { set = "rEX VL DP",       name = "Romantic Rivalry" },
        { set = "rEX VL rDP",      name = "The Exes" },
        { set = "rEX rVL DH",      name = "Sweat and Ruin" },
        { set = "rEX rVL rDH",     name = "Total Domination" },
        { set = "rEX rVL AS",      name = "The King of Greed" }, -- @FMichael
        { set = "rEX rVL rAS",     name = "Shork" }, -- @Nebu
        { set = "NH MS GV",       name = "Atlas' Burden" },
        { set = "NH MS VL",       name = "The Glass Cannon" },
        { set = "NH MS DH",       name = "Deadlock" },
        { set = "NH MS IN",       name = "The False Prophet" },
        { set = "NH MS AS",       name = "Unpredictable Outcome" },
        { set = "NH MS DP",       name = "Blackjack" },
        { set = "NH MS rDP",       name = "Busted" },
        { set = "NH rMS AS",       name = "Rigged Results" },
        { set = "NH GV VL",       name = "Traditional" },
        { set = "NH GV DH",       name = "Unstable Footing" },
        { set = "NH GV IN",       name = "Evanescence" },
        { set = "NH GV AS",       name = "A Modern Twist" },
        { set = "NH GV rAS",       name = "A Modern Challenge" },
        { set = "NH GV DP",       name = "Nostalgia" },
        { set = "NH GV rDP",       name = "Trauma" },
        { set = "NH rGV DH",       name = "Imbalance" },
        { set = "NH VL DH",       name = "Judgment" },
        { set = "NH VL IN",       name = "Justice" },
        { set = "NH VL rIN",       name = "The Twilight Tribunal" },
        { set = "NH VL AS",       name = "Bob Ross" },
        { set = "NH VL DP",       name = "Insecure Neediness" },
        { set = "NH VL rDP",       name = "Burdening Reliance" },
        { set = "NH rVL DH",       name = "Artificial Intelligence" },
        { set = "NH rVL rDH",      name = "Skynet" },
        { set = "NH rVL DP",       name = "Intense Dependence" },
        { set = "NH rVL rDP",      name = "Alienation" },
        { set = "NH DH IN",       name = "Blindside" },
        { set = "NH DH rIN",       name = "Ciphertext" }, -- @lavender
        { set = "NH DH AS",       name = "Shapeshifter" },
        { set = "NH DH rAS",       name = "Plaintext" }, -- @lavender
        { set = "NH DH DP",       name = "Good and Evil" },
        { set = "NH DH rDP",       name = "Warmth and Woe" },
        { set = "NH IN AS",       name = "The Blind Artist" },
        { set = "NH IN DP",       name = "Left On Read" },
        { set = "NH IN rDP",       name = "Straight to Voicemail" },
        { set = "NH AS DP",       name = "Ecstatic Dance" },
        { set = "NH AS rDP",       name = "Dancers' Collisions" },
        { set = "NH rAS DP",       name = "The Soloist" },
        { set = "NH rAS rDP",      name = "Grooving All Alone" },
        { set = "rNH MS VL",       name = "Whiplash" },
        { set = "rNH MS rVL",      name = "Phrenospasm" },
        { set = "rNH rMS DH",      name = "Deadbeat" },
        { set = "rNH rMS rDH",     name = "Gridlock" },
        { set = "rNH rMS DP",      name = "Pretender Pair" },
        { set = "rNH rMS rDP",     name = "Caught Redhanded" },
        { set = "rNH rGV rVL",     name = "Sweatshop" },
        { set = "rNH VL AS",       name = "Happy Accidents" },
        { set = "rNH rVL DH",      name = "Machine Learning" },
        { set = "rNH rVL rDH",     name = "Hyperintelligence" },
        { set = "rNH DH rDP",      name = "Slothful Stagnation" },
        { set = "rNH rDH DP",      name = "Anchored in Solace" },
        { set = "rNH rDH rDP",     name = "Blighted by I" },
        { set = "rNH AS DP",       name = "Next Level Moves" },
        { set = "rNH AS rDP",      name = "Overconfidence" },
        { set = "rNH rAS DP",      name = "The Principal Dancer" },
        { set = "rNH rAS rDP",     name = "Spotlight Snafu" },
        { set = "MS GV VL",       name = "Survival" },
        { set = "MS GV rVL",       name = "Bloody Persistence" },
        { set = "MS GV DH",       name = "Double Down" },
        { set = "MS GV IN",       name = "Burrata" },
        { set = "MS GV AS",       name = "Rough Sketch" },
        { set = "MS GV DP",       name = "Torn Apart" },
        { set = "MS GV rDP",       name = "Symphony of Misery" },
        { set = "MS rGV VL",       name = "Last Breath" },
        { set = "MS rGV rVL",      name = "Frail Demise" },
        { set = "MS rGV DH",       name = "Double Up" },
        { set = "MS rGV DP",       name = "Overattachment" },
        { set = "MS rGV rDP",      name = "Rushed Relationship" }, -- @GameTilDead
        { set = "MS VL DH",       name = "Utter Trash" },
        { set = "MS VL rDH",       name = "Dog Water" },
        { set = "MS VL IN",       name = "Starstruck" },
        { set = "MS VL AS",       name = "Cream Cheese" },
        { set = "MS VL DP",       name = "Couples Therapy" },
        { set = "MS DH IN",       name = "The Stealth Ninja" },
        { set = "MS DH rIN",       name = "Under the Radar" },
        { set = "MS DH AS",       name = "The Escape Artist" },
        { set = "MS DH DP",       name = "Drillers' Squad" },
        { set = "MS DH rDP",       name = "In Too Deep" },
        { set = "MS rDH DP",       name = "Cleaning Crew" },
        { set = "MS rDH rDP",      name = "Out Damned Spot" },
        { set = "MS IN AS",       name = "Abstraction" },
        { set = "MS IN DP",       name = "Miscommunications" },
        { set = "MS IN rDP",       name = "Mixed Signals" },
        { set = "MS AS DP",       name = "Paintball Fight" },
        { set = "MS AS rDP",       name = "Airsoft Match" },
        { set = "rMS rVL AS",      name = "A Losing Game" }, -- @The_111thBlitzer
        { set = "rMS DH rIN",      name = "Coin in the Cup" }, -- @The_111thBlitzer
        { set = "rMS rIN rAS",     name = "Nihilism" }, -- @The_111thBlitzer
        { set = "GV VL DH",       name = "Temptation" },
        { set = "GV VL rDH",       name = "Urges" },
        { set = "GV VL IN",       name = "Paranoia" },
        { set = "GV VL AS",       name = "The Gladiator" },
        { set = "GV VL DP",       name = "Diner Date" },
        { set = "GV VL rDP",       name = "Table for One" },
        { set = "GV rVL DH",       name = "Irresistible" },
        { set = "GV rVL rDH",      name = "Acting On Impulses" },
        { set = "GV DH IN",       name = "The Drunk Driver" },
        { set = "GV DH AS",       name = "The Texting Driver" },
        { set = "GV DH DP",       name = "Race You There" },
        { set = "GV rDH IN",       name = "The High Driver" },
        { set = "GV IN AS",       name = "The Spinmaster" },
        { set = "GV IN rAS",       name = "A Spinning Frenzy" },
        { set = "GV IN DP",       name = "Bronze Anniversary" },
        { set = "GV AS DP",       name = "The Trapeze Artists" },
        { set = "GV AS rDP",       name = "Tripped" },
        { set = "rGV rVL DH",      name = "The Lowest Low" },
        { set = "rGV rVL rDH",     name = "Cognitive Destruction" },
        { set = "rGV rVL IN",      name = "Covert Approbation" },
        { set = "rGV rVL rIN",     name = "Rejection" },
        { set = "rGV rVL DP",      name = "True Love" },
        { set = "rGV rVL rDP",     name = "No Means No" },
        { set = "rGV DH IN",       name = "The Blackout Driver" },
        { set = "rGV DH AS",       name = "The Microsleeping Driver" },
        { set = "rGV rDH IN",      name = "The Whiteout Driver" },
        { set = "VL DH IN",       name = "The Flickering Spirit" },
        { set = "VL DH AS",       name = "Forbidden Sorcery" },
        { set = "VL DH DP",       name = "Yuri" },
        { set = "VL DH rDP",       name = "Love Engine" },
        { set = "VL rDH AS",       name = "Infernal Hexes" },
        { set = "VL rDH DP",       name = "Shouting Match" }, -- @The_111thBlitzer
        { set = "VL rDH rDP",      name = "A Final Quarrel" }, -- @The_111thBlitzer
        { set = "VL IN AS",       name = "Eccentric Recluse" },
        { set = "VL IN DP",       name = "Online Dating" },
        { set = "VL IN rDP",       name = "Catfished" },
        { set = "VL rIN AS",       name = "The Amnesic Artist" },
        { set = "VL rIN DP",       name = "Long Distance Relationships" },
        { set = "VL rIN rDP",      name = "Painful Relapse" }, -- @lavender
        { set = "VL AS DP",       name = "The Cheaters" },
        { set = "VL AS rDP",       name = "Cheater's Guilt" },
        { set = "VL rAS DP",       name = "Fierce Love Circle" },
        { set = "VL rAS rDP",      name = "Weak Bonds" },
        { set = "rVL DH DP",       name = "The Succubus" },
        { set = "rVL DH rDP",      name = "The Incubus" },
        { set = "rVL rDH rIN",     name = "Futile Ambition" }, -- @The_111thBlitzer
        { set = "rVL rDH rAS",     name = "Cryptic Heresy" }, -- @The_111thBlitzer
        { set = "rVL rDH DP",      name = "Second Chances" },
        { set = "rVL rDH rDP",     name = "No Mercy" }, -- @The_111thBlitzer
        { set = "rVL rIN rAS",     name = "Betwixit and Between" }, -- @SpritzySheep
        { set = "rVL IN DP",       name = "High Hopes" },
        { set = "rVL IN rDP",      name = "Digital Dissonance" },
        { set = "rVL rIN DP",      name = "Deep Confessions" },
        { set = "rVL rIN rDP",     name = "Hushed Everything" },
        { set = "rVL AS DP",       name = "Avarice Entwined" },
        { set = "rVL AS rDP",      name = "Melted Wings" },
        { set = "rVL rAS DP",      name = "The Friction of Many" },
        { set = "rVL rAS rDP",     name = "Behind Every Back" },
        { set = "DH IN AS",       name = "The Libertine" },
        { set = "DH IN rAS",       name = "Incantation" }, -- @The_111thBlitzer
        { set = "DH IN DP",       name = "Separation Anxiety" },
        { set = "DH rIN AS",       name = "The Oblivious Artist" },
        { set = "DH rIN rAS",      name = "Nonverbal Spells" },
        { set = "DH rIN DP",       name = "Ghostbusters" },
        { set = "DH rIN rDP",      name = "Slimer" },
        { set = "DH AS DP",       name = "A Mutual Agreement" },
        { set = "DH AS rDP",       name = "Signing Under Duress" },
        { set = "rDH AS DP",       name = "Menaces to Society" },
        { set = "rDH AS rDP",      name = "Karma" },
        { set = "rDH rAS DP",      name = "Reviving Sickness" }, -- @lavender
        { set = "IN AS rDP",       name = "Overassertiveness" }, -- @Something Serious
        { set = "PN EX NH MS",    name = "One More Pull..." }, -- @FMichael
        { set = "PN EX NH DP",    name = "The Crooked Council" },
        { set = "PN EX rMS rDH",   name = "Spidr" },
        { set = "PN EX GV DH",    name = "A Bravado's Blunder" },
        { set = "PN EX GV AS",    name = "Master of the X" },
        { set = "PN EX rGV DH",    name = "High Hypersonic Jets" },
        { set = "PN rEX GV AS",    name = "Tyrant of the X" },
        { set = "PN NH MS GV",    name = "Atlas' Mistake" },
        { set = "PN NH MS DP",    name = "Bakadere" },
        { set = "PN NH GV VL",    name = "Unorthodox" },
        { set = "PN NH GV DH",    name = "Tightrope Walking" },
        { set = "PN NH rGV DH",   name = "'Tis A Long Ways Down..." },
        { set = "PN NH DH rIN",    name = "Obfuscation" }, -- @Stephen
        { set = "PN NH IN DP",    name = "Ghosted" },
        { set = "PN NH IN rDP",    name = "Blocked" },
        { set = "PN NH AS DP",    name = "Graceless Yet Content" },
        { set = "PN NH AS rDP",    name = "Discouraged Dancers" },
        { set = "PN NH rAS DP",    name = "First Love" }, -- @lavender
        { set = "PN rNH rGV rVL",  name = "Untrained Laborers" }, -- @lavender
        { set = "PN rNH AS rDP",   name = "Unreliable Notes" }, -- @lavender
        { set = "PN GV VL IN",    name = "Schizophrenia" },
        { set = "PN GV IN DP",    name = "Trust Fall" },
        { set = "PN rGV IN DP",    name = "Palms Withdrawn" },
        { set = "PN VL DH DP",    name = "The Messenger" },
        { set = "PN VL DH rDP",    name = "Hopelessness" },
        { set = "PN VL IN AS",    name = "Wrong Channel" }, -- @The_111thBlitzer
        { set = "PN VL rIN DP",    name = "Lavender Marriage" }, -- @lavender
        { set = "PN IN AS DP",    name = "Blind Date" },
        { set = "rPN EX NH MS",    name = "Impoverished" },
        { set = "rPN EX GV DH",    name = "The Last Leap" },
        { set = "rPN EX GV AS",    name = "Master of Atria" }, -- @lavender
        { set = "rPN EX rGV DH",   name = "The Speed of Light" },
        { set = "rPN EX AS DP",    name = "Wine Drinkers" }, -- @THe_111thBlitzer
        { set = "rPN rEX NH DH",   name = "Overbearing" },
        { set = "rPN rEX GV AS",   name = "Tyrant of Atria" },
        { set = "rPN NH rMS rIN",  name = "Protean Narrative" },
        { set = "rPN NH GV DH",    name = "The Olympic Funambulist" },
        { set = "rPN NH rGV DH",   name = "Hanging by A Thread" },
        { set = "rPN NH AS DP",    name = "Rhythmically Challenged" },
        { set = "rPN NH AS rDP",   name = "Ruinin' the Vibe" },
        { set = "rPN rNH rGV rVL", name = "Child Labor" },
        { set = "rPN MS VL AS",    name = "Tomfoolery" }, -- @The_111thBlitzer
        { set = "rPN VL DH AS",    name = "Clicker Circle" },
        { set = "rPN VL DH DP",    name = "The Matchmakers" },
        { set = "rPN VL DH rDP",   name = "The Matchbreakers" },
        { set = "SB EX rGV DH",    name = "Double Black Diamond" },
        { set = "SB NH DH DP",    name = "Naughty or Nice" },
        { set = "SB NH DH rDP",    name = "Lump of Coal" },
        { set = "EX NH MS GV",    name = "Atlas' Lament" },
        { set = "EX NH MS VL",    name = "The Fugitive" },
        { set = "EX NH MS DH",    name = "Impasse" },
        { set = "EX NH MS IN",    name = "Classic Prophet" },
        { set = "EX NH MS AS",    name = "Fair Chance" },
        { set = "EX NH MS rAS",    name = "Random Risk" },
        { set = "EX NH rMS GV",    name = "Bnuuy" },
        { set = "EX NH rMS IN",    name = "Blind Gambler" },
        { set = "EX NH GV VL",    name = "Cutting Edge" },
        { set = "EX NH GV DH",    name = "Purgatory Pro" },
        { set = "EX NH GV IN",    name = "Still Water" },
        { set = "EX NH GV AS",    name = "Beyond the Afterdeath" },
        { set = "EX NH rGV rAS",   name = "Queen of Wands" }, -- @The_111thBlitzer
        { set = "EX NH VL DH",    name = "Azathoth" },
        { set = "EX NH VL IN",    name = "Unreasonable" },
        { set = "EX NH VL AS",    name = "The Scam Leader" },
        { set = "EX NH rVL AS",    name = "Queen of Swords" }, -- @The_111thBlitzer
        { set = "EX NH DH IN",    name = "Invisible Decadence" },
        { set = "EX NH DH AS",    name = "Amorphous" },
        { set = "EX NH IN AS",    name = "Black Magic" },
        { set = "EX NH AS DP",    name = "Royal Waltz" },
        { set = "EX NH AS rDP",    name = "Monarch's Missteps" },
        { set = "EX rNH MS GV",    name = "Rainshower" }, -- @lavender
        { set = "EX rNH MS rGV",   name = "Torrential Downpour" },
        { set = "EX rNH rMS rIN",  name = "Misclick Haven" }, -- @The_111thBlitzer
        { set = "EX rNH IN AS",    name = "Inner Peace" }, -- @lavender
        { set = "EX rNH AS DP",    name = "Movie Night" },
        { set = "EX rNH AS rDP",   name = "Box Office Bomb" },
        { set = "EX MS GV VL",    name = "Juggernaut" },
        { set = "EX MS GV DH",    name = "Mining for Netherite" },
        { set = "EX MS GV AS",    name = "Irregular Sketch" },
        { set = "EX MS VL DH",    name = "Divine Mastery" },
        { set = "EX MS VL IN",    name = "Interstellar" },
        { set = "EX MS VL rIN",    name = "The Vacuum of Space" },
        { set = "EX MS VL AS",    name = "The Hacker" },
        { set = "EX MS DH IN",    name = "The Theocrat" },
        { set = "EX MS DH AS",    name = "Imprisonment" },
        { set = "EX MS rDH AS",    name = "Solitary Confinement" },
        { set = "EX MS IN AS",    name = "The Mathematician" },
        { set = "EX rMS rDH AS",   name = "Endless Gluttony" },
        { set = "EX rMS rIN AS",   name = "The Faux Artist" },
        { set = "EX rMS rIN DP",   name = "Snake Oil Salesmen" },
        { set = "EX GV VL DH",    name = "The Autocrat" },
        { set = "EX GV VL IN",    name = "Lateness" },
        { set = "EX GV VL AS",    name = "Inertia" },
        { set = "EX GV rVL AS",    name = "Page of Swords" }, -- @The_111thBlitzer
        { set = "EX GV DH IN",    name = "Lament Rain" },
        { set = "EX GV DH AS",    name = "Spin Overlord" },
        { set = "EX GV DH rAS",    name = "The Stunt Artist" }, -- @The_111thBlitzer
        { set = "EX GV DH DP",    name = "Shortcuts" },
        { set = "EX GV IN AS",    name = "Mastermind" },
        { set = "EX rGV rVL AS",   name = "The Overworked Animators" }, -- @FMichael
        { set = "EX rGV rVL rAS",  name = "Page of Wands" }, -- @The_111thBlitzer
        { set = "EX VL DH IN",    name = "Corruption" },
        { set = "EX VL DH AS",    name = "Devilish Falsifier" },
        { set = "EX VL IN AS",    name = "Insanity" },
        { set = "EX rVL rDH rIN",  name = "Strained Endurance" }, -- @The_111thBlitzer
        { set = "EX DH IN AS",    name = "Reverse Quadruple Threat" },
        { set = "EX DH IN rAS",    name = "Spellbound" }, -- @The_111thBlitzer
        { set = "rEX NH MS AS",    name = "Blacklisted" },
        { set = "rEX NH GV DH",    name = "Purgatory Master" },
        { set = "rEX NH AS DP",    name = "Lead and Follow" },
        { set = "rEX NH AS rDP",   name = "Hijacking" },
        { set = "rEX MS rDH IN",   name = "Sisyphean Monarchy" },
        { set = "rEX rMS rVL rDH", name = "Sacrilege" }, -- @The_111thBlitzer
        { set = "rEX rMS DH IN",   name = "The Demolitionist" },
        { set = "rEX rGV rVL rDH", name = "Switch Ups" },
        { set = "rEX rVL rDH rIN", name = "Exhausted" },
        { set = "NH MS GV VL",    name = "Quadruple Threat" },
        { set = "NH MS GV DH",    name = "Futility" },
        { set = "NH MS GV IN",    name = "Spelunking" },
        { set = "NH MS GV AS",    name = "The Modern Artist" },
        { set = "NH MS VL DH",    name = "Deadbolt" },
        { set = "NH MS VL IN",    name = "Blind Swinging" },
        { set = "NH MS VL AS",    name = "Bluff" },
        { set = "NH MS DH IN",    name = "Unfinished Business" },
        { set = "NH MS DH AS",    name = "Locksmith" },
        { set = "NH MS IN AS",    name = "Writer's Block" },
        { set = "NH MS IN DP",    name = "Hajidere" },
        { set = "NH GV VL DH",    name = "Nephalem" },
        { set = "NH GV VL IN",    name = "The Black Hole" },
        { set = "NH GV VL AS",    name = "Recreation" },
        { set = "NH GV DH IN",    name = "Live Fast Die Young" },
        { set = "NH GV DH AS",    name = "Dance Dance Revolution" },
        { set = "NH GV IN AS",    name = "Divine Failure" },
        { set = "NH GV IN DP",    name = "Silver Anniversary" },
        { set = "NH rGV VL rDP",   name = "Despairful Longing" },
        { set = "NH VL DH IN",    name = "Spilled Milk" },
        { set = "NH VL DH AS",    name = "The Restrained Artist" },
        { set = "NH VL rDH AS",    name = "The Tortured Artist" },
        { set = "NH VL IN AS",    name = "Vigilante" },
        { set = "NH VL rIN AS",    name = "The Dark Knight" },
        { set = "NH rVL DH AS",    name = "The Degenerate Artist" },
        { set = "NH rVL rDH AS",   name = "The Masochistic Artist" },
        { set = "NH DH IN AS",    name = "Impressionism" },
        { set = "NH DH rIN rAS",   name = "Steganography" },
        { set = "rNH rMS GV DH",   name = "Deadfall" },
        { set = "rNH rMS DH DP",   name = "The Foundling" },
        { set = "rNH rMS DH rDP",  name = "The Waif" },
        { set = "rNH rMS rIN AS",  name = "Mistype Haven" }, -- @The_111thBlitzer
        { set = "rNH DH IN DP",    name = "Together As One" }, -- @lavender
        { set = "rNH DH IN rDP",   name = "Together As None" }, -- @lavender
        { set = "MS GV VL DH",    name = "Quadruple Down" },
        { set = "MS GV VL IN",    name = "Eleventh Hour" },
        { set = "MS GV VL AS",    name = "Gambled Faith" },
        { set = "MS GV DH IN",    name = "Intoxication" },
        { set = "MS GV DH AS",    name = "The Spacial Artist" },
        { set = "MS GV IN AS",    name = "Parmigiano Reggiano" },
        { set = "MS rGV VL DH",    name = "Quadruple Up" },
        { set = "MS VL DH IN",    name = "The Night Watchman" },
        { set = "MS VL DH AS",    name = "Blue Cheese" },
        { set = "MS VL DH DP",    name = "Quadruples Therapy" },
        { set = "MS VL IN AS",    name = "Creative Explosion" },
        { set = "MS VL IN DP",    name = "Lovestruck" },
        { set = "MS VL IN rDP",    name = "Forsaken Infatuation" },
        { set = "MS rVL AS DP",    name = "Vanilla Cream Pie" }, -- @FMichael
        { set = "MS DH IN AS",    name = "Nascent" },
        { set = "MS rDH IN rDP",   name = "Uneasy Alliance" },
        { set = "rMS GV AS rDP",   name = "Cupid's Gamble" },
        { set = "GV VL DH IN",    name = "Nightmare" },
        { set = "GV VL DH AS",    name = "Sword Box" },
        { set = "GV VL IN AS",    name = "Immense Pressure" },
        { set = "GV VL AS DP",    name = "The Colosseum" },
        { set = "GV VL AS rDP",    name = "A Fight to the Death" },
        { set = "GV rVL rDH rIN",  name = "Ephialtes" }, -- @The_111thBlitzer
        { set = "GV DH IN AS",    name = "Horror Thriller" },
        { set = "GV DH IN DP",    name = "Timid Adoration" },
        { set = "GV DH IN rDP",    name = "Yearners' Stalemate" },
        { set = "GV rDH rIN rAS",  name = "Out of Storage" }, -- @The_111thBlitzer
        { set = "rGV VL DH IN",    name = "Spirit Drop" },
        { set = "rGV rVL DH rAS",  name = "Knight of Wands" }, -- @The_111thBlitzer
        { set = "VL DH IN AS",    name = "The Prodigy" },
        { set = "rVL DH IN AS",    name = "Knight of Swords" }, -- @The_111thBlitzer
        { set = "rVL DH IN rAS",   name = "Grimoire" }, -- @The_111thBlitzer
        { set = "rVL rDH rIN rAS", name = "The Necromancer" }, -- @The_111thBlitzer
        { set = "DH IN AS DP",    name = "Alter Ego" },
        { set = "DH IN AS rDP",    name = "Living A Lie" },
        { set = "PN EX NH MS GV", name = "Atlas' Remorse" },
        { set = "PN EX NH MS AS", name = "Unfair Odds" },
        { set = "PN EX NH MS rAS", name = "Predetermined Fate" },
        { set = "PN EX NH rMS rAS", name = "Distorted Fate" }, -- @lavender
        { set = "PN EX MS GV DH", name = "Mining the Bedrock" },
        { set = "PN EX MS VL DH", name = "Divine Comedy" }, -- @FMichael
        { set = "PN EX GV VL AS", name = "Enirsia" },
        { set = "PN EX GV AS DP", name = "Connected" },
        { set = "PN EX GV AS rDP", name = "Connected VS." },
        { set = "PN EX VL IN AS", name = "Programmer's Pain" },
        { set = "PN rEX NH MS AS", name = "Whitelisted" },
        { set = "PN rEX GV AS DP", name = "Maniac Mod" },
        { set = "PN NH GV VL IN", name = "The White Hole" },
        { set = "PN NH GV IN DP", name = "Platinum Anniversary" },
        { set = "PN NH VL IN DP", name = "Kuudere" },
        { set = "PN NH DH IN AS", name = "Doppelganger" },
        { set = "PN NH IN AS DP", name = "Dandere" },
        { set = "PN rNH VL rIN DP", name = "In Holy Matrimony" },
        { set = "PN MS GV VL IN", name = "One o'Clock" },
        { set = "PN MS GV VL rIN", name = "Standard Time" },
        { set = "PN GV VL DH DP", name = "Teasedere" },
        { set = "PN GV DH IN DP", name = "Tsundere" },
        { set = "PN VL DH AS DP", name = "Double Date" }, -- @GameTilDead
        { set = "rPN EX rVL rIN AS", name = "Developer's Letdown" },
        { set = "rPN rEX NH VL rDH", name = "Unjust Judgement" }, -- @lavender
        { set = "rPN MS GV VL IN", name = "Darkest Hour" }, -- @FMichael
        { set = "rPN MS GV VL rIN", name = "Daylight Savings Time" },
        { set = "rPN NH VL rDH rIN", name = "A Butterfly's Funeral" }, -- @FMichael
        { set = "rPN NH DH IN AS", name = "Copycat" },
        { set = "rPN rNH rDH rIN rAS", name = "Kryptos" }, -- @lavender
        { set = "rPN MS VL AS DP", name = "Prepare For Trouble" },
        { set = "rPN MS VL AS rDP", name = "Make It Double" },
        { set = "rPN VL DH AS DP", name = "Fifth Wheel" }, -- @FMichael
        { set = "EX NH MS GV VL", name = "Oppression" },
        { set = "EX NH MS GV AS", name = "Existencial Crisis" },
        { set = "EX NH MS GV rAS", name = "Gemstone Excavation" }, -- @FMichael
        { set = "EX NH MS VL DH", name = "No Holds Barred" },
        { set = "EX NH MS DH IN", name = "Breach of Faith" },
        { set = "EX NH MS DH AS", name = "Sinfully Scarred" },
        { set = "EX NH MS IN AS", name = "Monarch's Hallucinations" },
        { set = "EX NH GV VL DH", name = "The Veteran" },
        { set = "EX NH GV VL IN", name = "Foresight" },
        { set = "EX NH GV DH IN", name = "Readlock" },
        { set = "EX NH GV DH AS", name = "The Kill Screen" },
        { set = "EX NH GV IN AS", name = "Paragon" },
        { set = "EX NH GV IN DP", name = "Golden Anniversary" },
        { set = "EX NH VL DH IN", name = "Spoiled Milk" },
        { set = "EX NH VL DH AS", name = "Loss of Control" },
        { set = "EX NH VL IN AS", name = "Loading Screen" },
        { set = "EX NH VL IN rAS", name = "Forever Spinning" },
        { set = "EX NH VL AS DP", name = "The Black Market" },
        { set = "EX NH DH IN AS", name = "Futile Spectacle" },
        { set = "EX rNH MS VL DH", name = "Immeasurable Skill" },
        { set = "EX rNH rMS rDH AS", name = "Kirbo" },
        { set = "EX rNH GV VL DH", name = "Medal of Honor" },
        { set = "EX rNH rGV DH AS", name = "Super Kill Screen" }, -- @The_111thBlitzer
        { set = "EX MS GV VL DH", name = "Hell's Gate" },
        { set = "EX MS GV VL IN", name = "Hunted" },
        { set = "EX MS GV VL AS", name = "Deadline" },
        { set = "EX MS GV DH AS", name = "The Temporal Artist" },
        { set = "EX MS VL DH AS", name = "False Security" },
        { set = "EX MS VL IN AS", name = "Reload" },
        { set = "EX MS VL IN rAS", name = "Switching To Your Secondary" },
        { set = "EX MS VL IN DP", name = "Space Station" },
        { set = "EX MS VL rIN DP", name = "Airlock" },
        { set = "EX MS rVL IN AS", name = "One in the Chamber" },
        { set = "EX MS rVL IN rAS", name = "Weapons Akimbo" },
        { set = "EX MS DH IN AS", name = "Deadluck" },
        { set = "EX rMS rDH AS DP", name = "Devourers Alike" },
        { set = "EX rMS rDH AS rDP", name = "Don't Starve Together" },
        { set = "EX GV VL DH IN", name = "Unexpectancy" },
        { set = "EX GV VL DH AS", name = "Trembling Power" },
        { set = "EX GV VL IN AS", name = "Speed the Collapse" },
        { set = "EX rGV rVL DH rAS", name = "King of Wands" }, -- @The_111thBlitzer
        { set = "EX VL DH IN AS", name = "Reverse Quintuple Threat" },
        { set = "EX rVL DH IN AS", name = "King of Swords" }, -- @The_111thBlitzer
        { set = "EX rVL DH IN rAS", name = "The Chosen One" }, -- @The_111thBlitzer
        { set = "rEX rNH DH IN AS", name = "Spoiled Zen" }, -- @lavender
        { set = "NH MS GV VL DH", name = "Quintuple Threat" },
        { set = "NH MS GV VL AS", name = "Dreadlock" },
        { set = "NH MS GV DH IN", name = "Misdrop Haven" },
        { set = "NH MS GV DH AS", name = "A Classic Escape" },
        { set = "NH MS GV IN AS", name = "Lost and Dizzy" },
        { set = "NH MS VL DH IN", name = "Blind Faith" },
        { set = "NH MS VL DH AS", name = "Boltsmith" },
        { set = "NH MS VL IN AS", name = "Ballet Dancing" },
        { set = "NH MS DH IN AS", name = "Disappearance" },
        { set = "NH GV VL DH IN", name = "Entropy" },
        { set = "NH GV VL DH AS", name = "Demonic Possession" },
        { set = "NH GV VL IN AS", name = "Ergosphere" },
        { set = "NH GV DH IN AS", name = "Cheat Code" },
        { set = "NH VL DH IN AS", name = "Magic" },
        { set = "NH DH rIN rAS DP", name = "Cryptanalysis Department" }, -- @lavender
        { set = "MS GV VL DH IN", name = "Slaughterhouse" },
        { set = "MS GV VL DH AS", name = "Killer Clown" },
        { set = "MS GV VL rDH DP", name = "Veil of Allegiance" },
        { set = "MS GV VL rDH rDP", name = "Treachery" }, -- @The_111thBlitzer
        { set = "MS GV VL IN AS", name = "Mortal Chaos" },
        { set = "MS GV rVL rDH rIN", name = "Grotesque Imagery" }, -- @The_111thBlitzer
        { set = "MS GV DH IN AS", name = "Doubled Symbolism" },
        { set = "MS GV DH IN DP", name = "Tipsy Twosome" },
        { set = "MS GV DH IN rDP", name = "Sloshed Slipups" },
        { set = "MS VL DH IN AS", name = "Beethoven" },
        { set = "GV VL DH IN AS", name = "Lost Genius" },
        { set = "PN EX NH MS GV VL", name = "Dictatorship" },
        { set = "PN EX NH rMS GV rDH", name = "Spinuuy" },
        { set = "PN EX NH GV VL IN", name = "Hindsight" },
        { set = "PN EX NH GV IN DP", name = "Diamond Anniversary" },
        { set = "PN EX NH VL IN AS", name = "Softlocked" },
        { set = "PN EX MS GV VL DH", name = "Satan's Throne" },
        { set = "PN EX MS GV VL AS", name = "Procrastination" },
        { set = "PN EX MS GV VL DP", name = "Deredere" },
        { set = "PN EX MS GV rVL DP", name = "Megadere" },
        { set = "PN EX MS GV DH AS", name = "Altering the Past" },
        { set = "PN EX MS VL IN AS", name = "Spaghetti Code" }, -- @FMichael
        { set = "PN EX GV VL DH AS", name = "The Empress" },
        { set = "PN rEX GV VL DH AS", name = "The Dictatrix" },
        { set = "PN EX VL rDH rIN rDP", name = "Squid Game" }, -- @lavender
        { set = "PN rEX VL rDH rIN rDP", name = "I've Played These Games Before" }, -- @lavender
        { set = "PN rEX rVL rDH rIN rDP", name = "I GOT THE MONA LISA" }, -- @lavender
        { set = "PN NH MS GV DH IN", name = "Double Hard Drop" },
        { set = "PN NH MS GV IN AS", name = "Hangover" },
        { set = "PN NH MS DH IN DP", name = "Flowers of Transformation" }, -- @lavender
        { set = "PN NH GV VL IN AS", name = "Event Horizon" },
        { set = "PN NH GV DH IN AS", name = "Konami Code" },
        { set = "PN MS VL DH IN AS", name = "Mozart" },
        { set = "PN GV VL DH IN AS", name = "Shattered Savant" },
        { set = "PN GV VL DH IN DP", name = "Yandere" },
        { set = "PN GV VL DH rIN DP", name = "Dorodere" },
        { set = "rPN EX NH VL IN AS", name = "Hardlocked" },
        { set = "rPN EX MS GV VL DP", name = "Utsudere" },
        { set = "rPN rEX NH VL IN DP", name = "Momentary Reprieve" }, -- @lavender
        { set = "rPN rEX NH VL IN rDP", name = "Transient Tranquility" },
        { set = "rPN rEX rVL rDH rIN rDP", name = "Damaged Dalgona" },
        { set = "SB NH GV rIN AS DP", name = "Weather Station" }, -- @lavender
        { set = "rSB NH GV rIN AS DP", name = "Blizzard Warning" },
        { set = "EX NH MS GV VL DH", name = "Swamp Water Zero" },
        { set = "EX NH MS GV VL IN", name = "Depression" },
        { set = "EX NH MS GV VL rIN", name = "Facadal Smiles" },
        { set = "EX NH MS GV VL DP", name = "Tag Team" },
        { set = "EX NH MS GV VL rDP", name = "The Perfect Betrayal" },
        { set = "EX NH MS GV DH IN", name = "Blandness" },
        { set = "EX NH MS GV DH AS", name = "Pachinko" },
        { set = "EX NH MS GV IN AS", name = "The Matrix" },
        { set = "EX NH MS VL DH AS", name = "The Artist Trinity" },
        { set = "EX NH MS VL IN AS", name = "End Game" },
        { set = "EX NH MS VL DH IN", name = "Epitome" },
        { set = "EX NH MS DH IN AS", name = "Encryption" },
        { set = "EX NH MS rDH IN AS", name = "Unprotected Data" },
        { set = "EX NH GV VL DH IN", name = "Methodical" },
        { set = "EX NH GV VL DH AS", name = "Spinning Top" },
        { set = "EX NH GV VL IN AS", name = "Distilled Water" },
        { set = "EX NH GV DH IN AS", name = "Immortal" },
        { set = "EX NH GV DH IN DP", name = "Solemn Lamentation" }, -- @FMichael
        { set = "EX NH rGV VL rDH AS", name = "Hadal Abyss Zone" }, -- @lavender
        { set = "EX NH rGV VL IN AS", name = "Sparkling Water" },
        { set = "EX NH rGV VL rIN AS", name = "Carbon Dioxide" },
        { set = "EX NH VL IN AS DP", name = "The Deep Web" },
        { set = "EX NH VL rIN AS DP", name = "The Dark Web" },
        { set = "EX rNH rMS VL rDH rIN", name = "Extant Anima" }, -- @lavender
        { set = "EX MS GV VL DH IN", name = "Disorder" },
        { set = "EX MS GV VL DH AS", name = "Hymns of Discord" },
        { set = "EX MS GV VL IN AS", name = "The Researcher" },
        { set = "EX MS GV DH IN AS", name = "The Time Traveller" },
        { set = "EX MS VL DH IN DP", name = "Sword Sharpened with Tears" }, -- @FMichael
        { set = "EX GV VL DH IN AS", name = "All Out" },
        { set = "NH MS GV VL DH IN", name = "Sextuple Threat" },
        { set = "NH GV VL DH IN AS", name = "The Nether" },
        { set = "NH rGV VL DH IN AS", name = "We Need to Go Deeper" },
        { set = "NH MS VL DH IN AS", name = "Deadhook" },
        { set = "MS GV VL DH IN AS", name = "Hidden Circus" },
        { set = "MS VL DH IN AS DP", name = "The Silent Orchestra" }, -- @FMichael
        { set = "MS VL DH IN AS rDP", name = "An Unheard Sonata" },
    },
}

for _, sets in next, ComboData do
    for i = 1, #sets do
        local cmb = sets[i]
        cmb.name = '"' .. cmb.name:upper() .. '"'
        local cmbStr = table.concat(TABLE.sort(cmb.set:trim():split('%s+', true)), ' ')
        sets[cmbStr] = sets[cmbStr] or cmb
    end
end

RevSwampName = {
    "Z", "S", "J", "L", "T", "O", "I",
    [["BLIGHT"]],
    [["DESOLATION"]],
    [["HAVOC"]],
    [["PANDEMONIUM"]],
    [["INFERNO"]],
    [["PURGATORY"]],
    [["PERDITION"]],
    [["CATACLYSM"]],
    [["ANNIHILATION"]],
    [["ARMAGEDDON"]],
    [["ABYSS"]],
    [["SPAGHETTIFICATION"]],
    [["SINGULARITY"]],
    [["BIG BANG"]],
    [["REBIRTH"]],
    [["APOCALYPSE"]], -- not used
}

Floors = {
    [0] = { top = 0, name = "The Basement" },
    { top = 50,   event = {},                                                  name = "Hall of Beginnings" },
    { top = 150,  event = { 'dmgDelay', -2, 'dmgWrong', 1 },                   name = "The Hotel",           MSshuffle = 1 },
    { top = 300,  event = { 'dmgDelay', -2, 'dmgCycle', -.5 },                 name = "The Casino" },
    { top = 450,  event = { 'dmgDelay', -1, 'dmgCycle', -.5 },                 name = "The Arena" },
    { top = 650,  event = { 'dmgDelay', -1, 'dmgCycle', -.5, 'dmgWrong', 1 },  name = "The Museum",          MSshuffle = 2 },
    { top = 850,  event = { 'dmgDelay', -1, 'dmgTime', 1, 'maxQuestSize', 1 }, name = "Abandoned Offices" },
    { top = 1100, event = { 'dmgDelay', -1, 'dmgCycle', -.5 },                 name = "The Laboratory",      MSshuffle = 3 },
    { top = 1350, event = { 'dmgDelay', -1, 'dmgCycle', -.5 },                 name = "The Core" },
    { top = 1650, event = { 'dmgDelay', -.5, 'dmgWrong', 1 },                  name = "Corruption",          MSshuffle = 4 },
    { top = 1e99, event = { 'dmgDelay', -.5, 'dmgCycle', -.5, 'dmgTime', 1 },  name = "Platform of the Gods" },
    { top = 1e99, name = "Stellar Nebula Frontier" }, -- Only name is used
    -- Initial: Delay=15. Cycle=5, Wrong=1
    -- Total: Delay-10, Cycle-3, Wrong+4
}

NegFloors = {
    [0] = { bottom = -1e99, name = "Endless Void" },
    { bottom = -50,   name = "The Basement" },
    { bottom = -150,  name = "Zenith Restaurant" },
    { bottom = -300,  name = "Underground Parking" },
    { bottom = -450,  name = "The Bunker" },
    { bottom = -650,  name = "The Infirmary" },
    { bottom = -850,  name = "Decayed Catacombs" },
    { bottom = -1100, name = "Sacreligious Ruins" },
    { bottom = -1350, name = "Singularity Reactor" },
    { bottom = -1650, name = "Distorted Gateways" },
    { bottom = -1e99, name = "Endless Void" },
}
local NegTexts = {
    b1 = { -- The Basement
        desc = [[A basic storage room for the floors above... and below.]],
        begin = [[You find yourself in an unfamiliar place.]],
        noAS = [[You passed the security check without any prohibited items.]],
        ASoff = [[To prevent mech heart users, AS mod is not allowed here.]],
        -- egg = [[Garbo checks the imprisoned mech heart users here from time to time, except rtxtile, who kept escaping somehow?]],
    },
    b2 = { -- Zenith Restaurant
        desc = [[A lively restaurant with a lovely atmosphere! Though the prices here are slightly outrageous...]],
        begin = [[The smell of food calms your senses...]],
        effStart = [[Illusions dance before your eyes...]],
        noVL = [[You feel yourself becoming weaker...]],
        VLoff = [[You feel your strength fading...]],
        noIN = [[Illusion before your eyes hasn't entirely faded...]],
        INoff = [[Your mind is becoming clearer...]],
    },
    b3 = { -- Underground Parking
        desc = [[A boundless parking lot for all of these visitors.]],
        begin = [[The vast lot's tranquility reassures you.]],
        effStart = [[But you feel like you're lost...]],
        mid1 = [["Where am I?"]],
        noGV = [[You feel you are not going fast enough...]],
        GVoff = [[You unconsciously quickened your pace...]],
        mid2 = [["Where am I going?"]],
    },
    b4 = { -- The Bunker
        desc = [[A regular bunker... after witnessing the Corruption, you definitely know why it was built.]],
        begin = [[You feel safe away from the above.]],
        effStart = [[The barren bunker begins to feel ghostly.]],
        noMS = [[You feel you are not favored by luck...]],
        MSoff = [[You organized your thoughts...]],
    },
    b5 = { -- The Infirmary
        desc = [[The medical sector of the tower, filled with incomprehensible technology. they look similar to the ones in the Laboratory...]],
        begin = [[Endless beeping fills the rooms which you roam.]],
        effStart = [[One horrifying scene after another floods your vision.]],
        noDH = [[A evil thought crossed your mind...]],
        DHoff = [[You shuddered while walking in this terrifying place.]],
    },
    b6 = { -- Decayed Catacombs
        desc = [[A complex of the dead, now decaying into an even more unsettling shell of itself.]],
        begin = [[You begin to no longer feel so safe.]],
        effStart = [[Your attention strayed...]],
        mid = [[You begin to hear something calling your name...]],
        noNH = [[You cannot ignore the voice...]],
        NHoff = [[You overcome your fear.]],
    },
    b7 = { -- Sacreligious Ruins
        desc = [[The remains of a previously sacred chapel, the spirits of those, who worshipped the gods above linger on...]],
        desc2 = [[Whispers of a missing artifact echo throughout the area...]],
        begin = [[You pray that nothing dire becomes of you.]],
        effStart = [[Spacetime ahead is heavily warped...]],
        mid = [[You feel you have go as fast as possible.]],
    },
    b8 = { -- Singularity Reactor
        desc = [[Fueled by the power of the cosmos and the stolen artifact, powering something...]],
        begin = [[The reactor's magnitude overwhelms you.]],
        mid1 = [[Dizzy spells.]],
        mid2 = [[Blurred vision.]],
        mid3 = [[Head throbbing.]],
        -- mid = [[The mysterious voice is growing ever nearer...]],
    },
    b9 = { -- Distorted Gateways
        desc = [[A hall of millions of gateways to different realities, towers and wastelands... the mere thought of something like this is sickening...]],
        desc2 = [[The entrance to a false promise of paradise.]],
        desc3 = [[You reached the bottom... or it seemed to be at first glance... one last gateway was left...]],
        begin = [[The endless void beckons you...]],
        mid = [[RUN.]],
        -- begin = [[You feel nostalgia at the sight of a familiar tower.]],
    },
    b10 = { -- Endless Void
        desc = [[A realm of absolutely nothing, none have ever returned.]],
        desc2 = [[You look back above... yet you've already gone too far in this insane abyss for you to see anything.]],
        -- begin = [[...and you pass the point of no return.]],
        -- mid1 = [[Everything begins to go quiet.]],
        end1 = [[...this is it?]],
        end2 = [[This is what's at the down below of all of this?]],
        end3 = [[It's so empty... and vast...]],
        end4 = [[Yet it feels nostalgic somehow...]],
        end5 = [[And peaceful.]],
    },
}
NegEvents = {
    -- B1: The Basement
    { h = -10 }, { text = 'b1.begin' },
    { h = -26 },
    { text = 'b1.noAS', color = 'lB', cond = function() return GAME.mod.AS == 0 end },
    {
        text = 'b1.ASoff',
        color = 'lO',
        cond = function() return GAME.mod.AS > 0 end,
        event = function()
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.AS = 0
            
            RefreshButtonText()
            TWEEN.new(GAME.anim_resizeResetAS_rev):setDuration(GAME.slowmo and 2.6 or .26):setUnique('resizeResetAS'):run()
            GAME.refreshModIcon()
            GAME.refreshRPC()
        end,
    },

    -- B2: Zenith Restaurant
    { h = -50 }, { event = { 'dmgDelay', -2 } },
    { event = { 'attackMul', -.1, 'timerMul', -.25 } },
    { h = -55 }, { text = 'b2.begin' },
    { h = -60 },
    { text = 'b2.effStart', event = { 'nightcore', true } },
    { h = -90 },
    { text = 'b2.noVL',     color = 'lB',                 cond = function() return GAME.mod.VL == 0 end },
    {
        text = 'b2.VLoff',
        color = 'lO',
        cond = function() return GAME.mod.VL > 0 end,
        event = function()
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.VL = 0
            GAME.refreshModIcon()
            GAME.refreshRPC()
        end,
    },
    { h = -120 },
    { text = 'b2.noIN', color = 'lB', cond = function() return GAME.mod.IN == 0 end },
    {
        text = 'b2.INoff',
        color = 'lO',
        cond = function() return GAME.mod.IN > 0 end,
        event = function()
            GAME.dmgCycle = GAME.dmgCycle + GAME.mod.IN * 1
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.IN = 0
            BGM.set('all', 'highgain', 1)
            for _, C in ipairs(Cards) do C:flip() end
            GAME.refreshModIcon()
            GAME.refreshRPC()
        end,
    },
    { h = -150 }, { event = { 'nightcore', false } },

    -- B3: Underground Parking
    { h = -150 }, { event = { 'dmgDelay', -2, 'dmgCycle', -.5 } },
    { event = { 'attackMul', -.1, 'timerMul', -.15 } },
    { h = -155 }, { text = 'b3.begin' },
    { h = -160 }, { text = 'b3.effStart' },
    { h = -165 }, { event = { 'invisDashboard', true } },
    { h = -170 }, { event = { 'invisDashboard', false } },
    { h = -175 }, { event = { 'invisDashboard', true } },
    { h = -180 }, { text = 'b3.mid1' },
    { h = -185 }, { event = { 'invisDashboard', false } },
    { h = -195 }, { event = { 'invisDashboard', true } },
    { h = -200 },
    { text = 'b3.noGV', color = 'lB', cond = function() return GAME.mod.GV == 0 end },
    {
        text = 'b3.GVoff',
        color = 'lO',
        cond = function() return GAME.mod.GV > 0 end,
        event = function()
            GAME.dmgDelay = GAME.dmgDelay + GAME.mod.GV * 4
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.GV = 0
            GAME.refreshModIcon()
            GAME.refreshRPC()
            local v = GAME.mod.GV > 0 and 2 ^ (GAME.mod.GV / 12) or 1
            BGM.set('all', 'pitch', v, .26)
            BGM.set('piano2', 'pitch', 2 * v, .26)
        end,
    },
    { h = -200 }, { event = { 'invisDashboard', false } },
    { h = -210 }, { event = { 'invisDashboard', true } },
    { h = -220 }, { text = 'b3.mid2' },
    { h = -250 }, { event = { 'invisDashboard', false } },
    { h = -260 }, { event = { 'invisDashboard', true } },
    { h = -280 }, { event = { 'invisDashboard', false } },

    -- B4: The Bunker
    { h = -300 }, { event = { 'dmgDelay', -1, 'dmgCycle', -.5 } },
    { event = { 'attackMul', -.1, 'timerMul', -.1 } },
    { h = -310 },
    { text = 'b4.begin' },
    { event = function() GAME.dmgWrong = math.min(GAME.dmgWrong, 2) end },
    { h = -320 }, { text = 'b4.effStart', event = { 'glassCard', true } },
    { h = -380 },
    { text = 'b4.noMS', color = 'lB', cond = function() return GAME.mod.MS == 0 end },
    {
        text = 'b4.MSoff',
        color = 'lO',
        cond = function() return GAME.mod.MS > 0 end,
        event = function()
            GAME.extraQuestBase = GAME.extraQuestBase - GAME.mod.MS * .2
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.MS = 0
            GAME.sortCards()
            GAME.refreshModIcon()
            GAME.refreshRPC()
        end,
    },
    { h = -450 }, { event = { 'glassCard', false } },

    -- B5: The Infirmary
    { h = -450 }, { event = { 'dmgDelay', -1, 'dmgCycle', -.5 } },
    { event = { 'attackMul', -.1 } },
    { event = function() GAME.dmgWrong = math.min(GAME.dmgWrong, 2) end },
    { h = -460 }, { text = 'b5.begin' },
    { h = -470 }, { text = 'b5.effStart', event = { 'slowmo', true } },
    { h = -550 },
    { text = 'b5.noDH', color = 'lB', cond = function() return GAME.mod.DH == 0 end },
    {
        text = 'b5.DHoff',
        color = 'lO',
        cond = function() return GAME.mod.DH > 0 end,
        event = function()
            GAME.extraQuestVar = GAME.extraQuestVar - GAME.mod.DH * .2
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.DH = 0
            RefreshButtonText()
            GAME.refreshModIcon()
            GAME.refreshRPC()
        end,
    },
    { h = -650 }, { event = { 'slowmo', false } },

    -- B6: Decayed Catacombs
    { h = -650 }, { event = { 'dmgDelay', -1, 'dmgTime', 1, 'maxQuestSize', 1 } },
    { event = { 'attackMul', -.1 } },
    { event = function() GAME.dmgWrong = math.min(GAME.dmgWrong, 2) end },
    { h = -660 }, { text = 'b6.begin' },
    { h = -670 }, { text = 'b6.effStart', event = { 'invisCard', true } },
    { h = -720 },
    { text = 'b6.noNH', color = 'lB', cond = function() return GAME.mod.NH == 0 end },
    {
        text = 'b6.NHoff',
        color = 'lO',
        cond = function() return GAME.mod.NH > 0 end,
        event = function()
            GAME.dmgHeal = GAME.dmgHeal + GAME.mod.NH * 3
            GAME.attackMul = GAME.attackMul - .1
            GAME.dmgTimerMul = GAME.dmgTimerMul + .01
            GAME.mod.NH = 0
            GAME.maxQuestCount = 3
            while #GAME.quests < 3 do GAME.genQuest() end
            GAME.refreshModIcon()
            GAME.refreshRPC()
        end,
    },
    { h = -850 }, { event = { 'invisCard', false } },

    -- B7: Sacreligious Ruins
    { h = -850 }, { event = { 'dmgDelay', -1, 'dmgCycle', -.5 } },
    { event = { 'attackMul', -.1 } },
    { event = function() GAME.dmgWrong = math.min(GAME.dmgWrong, 2) end },
    { h = -860 }, { text = 'b7.begin' },
    { h = -900 }, { text = 'b7.effStart' },
    { h = -950 }, { text = 'b7.mid' },

    -- B8: Singularity Reactor
    { h = -1100 }, { event = { 'dmgDelay', -1, 'dmgCycle', -.5 } },
    { event = function() GAME.dmgWrong = math.min(GAME.dmgWrong, 2) end },
    { h = -1115 }, { text = 'b8.begin' },
    { h = -1145 }, { text = 'b8.mid1', color = 'R', size = 1.26, sfx = 'b2bcharge_distance_3', duration = 1.26 },
    { h = -1160 }, { text = 'b8.mid2', color = 'R', size = 1.26, sfx = 'b2bcharge_distance_3', duration = 1.26 },
    { h = -1175 }, { text = 'b8.mid3', color = 'R', size = 1.26, sfx = 'b2bcharge_distance_3', duration = 1.26 },
    { h = -1182 }, { sfx = 'b2bcharge_distance_2' },
    { h = -1185 }, { sfx = 'b2bcharge_distance_2' },
    { h = -1188 }, { sfx = 'b2bcharge_distance_2' },
    { h = -1191 }, { sfx = 'b2bcharge_distance_1' },
    { h = -1194 }, { sfx = 'b2bcharge_distance_1' },
    { h = -1197 }, { sfx = 'b2bcharge_distance_1' },
    { h = -1200 }, { event = { 'nightcore', true } },
    { h = -1350 }, { event = { 'nightcore', false } },

    -- B9: Distorted Gateways
    { h = -1350 }, { event = { 'dmgDelay', -.5 } },
    { h = -1360 }, { text = 'b9.begin' },
    { event = function() GAME.rankLimit = math.min(GAME.rankLimit, 10) end },
    {
        text = 'b9.mid',
        color = 'lR',
        size = 2.6,
        duration = 16,
        event = function()
            BGM.set('all', 'volume', 1, 2.6)
            GAME.time = math.max(GAME.time, 419)
        end
    },

    -- B10: Endless Void
    { h = -1650 },
    {
        event = function()
            GAME.negFloor = 0
            GAME.timerMul = 0
            GAME.dmgWrong = 1
            GAME.invisCard = true
            GAME.dmgTimerMul = 1e99
            GAME.height = -1650
            GAME.heightBonus = 0
            GAME.attackMul = -1
            GAME.chain = 0
            GAME.maxQuestCount = 1
            if GAME.rank > 8 then
                GAME.rank = 8
                GAME.xp = 32
            end
            GAME.xpLockLevelMax = 2600
            GAME.xpLockTimer = 2600
            GAME.xpLockLevel = 2600
            GAME.rankLimit = 8
            TEXTS.rank:set("R-" .. GAME.rank)

            GAME.mod.EX = 0
            GAME.refreshModIcon()
            GAME.refreshRPC()
            GAME.mod.EX = 2
        end,
    },
    { h = -1660 }, { text = 'b10.end1', color = 'lC', duration = 6.26, sfx = 'piece_change', event = function() BGM.setVol(STAT.bgm / 100 * .85) end },
    { h = -1690 }, { text = 'b10.end2', color = 'lC', duration = 6.26, sfx = 'piece_change', event = function() BGM.setVol(STAT.bgm / 100 * .7) end },
    { h = -1720 }, { text = 'b10.end3', color = 'lC', duration = 6.26, sfx = 'piece_change', event = function() BGM.setVol(STAT.bgm / 100 * .5) end },
    { h = -1750 }, { text = 'b10.end4', color = 'lC', duration = 6.26, sfx = 'piece_change', event = function() BGM.setVol(STAT.bgm / 100 * .3) end },
    { h = -1780 }, { text = 'b10.end5', color = 'lC', duration = 6.26, sfx = 'piece_change', event = function() BGM.setVol(STAT.bgm / 100 * 0) end },
    { h = -1800 },
    {
        event = function()
            GAME.heightBonus = 0
            GAME.height = -1800
            FloatOnCard = false
            STAT.clicker = true
            SFX.play('warp')
            SCN.go('ending', "warp")
        end
    },
    { h = -1e99 },
}
local lastH = -0
for _, e in next, NegEvents do
    e.cond = e.cond or TRUE
    e.text = e.text and TABLE.pathIndex(NegTexts, e.text) or e.text
    e.text2 = e.text2 and TABLE.pathIndex(NegTexts, e.text2) or e.text2
    if e.h then
        assert(e.h <= lastH)
        lastH = e.h
    else
        e.h = lastH
    end
end

Fatigue = {
    normal = {
        { time = 90,  event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 180, event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 240, event = { 'extraQuestBase', .2, 'animDuration', 1 } },
        { time = 300, event = { 'dmgTimerMul', -.1, 'animDuration', 1 },                   text = "FATIGUE SETS IN_",          desc = "TimerSpeed++" },
        { time = 330, event = { 'dmgCycle', -.5, 'dmgWrong', 1 },                          text = "YOUR BODY GROWS WEAK_",     desc = "DmgCycle--   Damage++" },
        { time = 360, event = { 'dmgTimerMul', -.1, 'dmgHeal', -1, 'animDuration', 1 },    text = "ALL SENSES BLUR TOGETHER_", desc = "TimerSpeed++   Heal--" },
        { time = 390, event = { 'dmgTimerMul', -.1, 'dmgWrong', 1 },                       text = "YOUR CONSCIOUSNESS FADES_", desc = "TimerSpeed++   Damage++" },
        { time = 420, event = { 'dmgTimerMul', -.05, 'dmgCycle', -.5, 'animDuration', 1 }, text = "THIS IS THE END.",          desc = "TimerSpeed++   DmgCycle--" },
        { time = 422, event = { 'dmgTimerMul', -.05 } },
        { time = 425, event = { 'dmgTimerMul', -.05 } },
        { time = 430, event = { 'dmgTimerMul', -.05 } },
        { time = 480, event = { 'atkBufferCap', 6, 'animDuration', 1, 'maxQuestSize', 1 }, text = "FAREWELL.",                 desc = "QuestDifficulty++++++",    duration = 26, color = 'lB', },
        { time = 485, event = { 'atkBufferCap', 6, 'animDuration', 1, 'extraQuestVar', 1 } },
        { time = 490, event = { 'atkBufferCap', 6, 'animDuration', 1 } },
        { time = 1e99 }, -- Total: dmgTimerMul-50%, Cycle-1, Wrong+2
    },
    PN = {
        { time = 90,  event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 180, event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 210, event = { 'animDuration', 1, 'revFaultXP', -.25 }, text = "YOU BEAT YOURSELF UP OVER TINY MISTAKES_",                 desc = "ReverseFaultXP--",    duration = 26, color = 'lG', },
        { time = 240, event = { 'extraQuestBase', .2, 'animDuration', 1 } },
        { time = 300, event = { 'dmgTimerMul', -.1, 'animDuration', 1 },                   text = "FATIGUE SETS IN_",          desc = "TimerSpeed++" },
        { time = 330, event = { 'dmgCycle', -.5, 'dmgWrong', 1 },                          text = "YOUR BODY GROWS WEAK_",     desc = "DmgCycle--   Damage++" },
        { time = 345, event = { 'animDuration', 1, 'revFaultXP', -.25 },                   text = "YOU COMPARE YOURSELF TO THE SUCCESS OF OTHERS_",                 desc = "ReverseFaultXP--", color = 'lG', },
        { time = 360, event = { 'dmgTimerMul', -.1, 'dmgHeal', -1, 'animDuration', 1 },    text = "ALL SENSES BLUR TOGETHER_", desc = "TimerSpeed++   Heal--" },
        { time = 390, event = { 'dmgTimerMul', -.1, 'dmgWrong', 1 },                       text = "YOUR CONSCIOUSNESS FADES_", desc = "TimerSpeed++   Damage++" },
        { time = 420, event = { 'dmgTimerMul', -.05, 'dmgCycle', -.5, 'animDuration', 1 }, text = "THIS IS THE END_",          desc = "TimerSpeed++   DmgCycle--" },
        { time = 422, event = { 'dmgTimerMul', -.05 } },
        { time = 425, event = { 'dmgTimerMul', -.05 } },
        { time = 430, event = { 'dmgTimerMul', -.05 } },
        { time = 455, event = { 'animDuration', 1, 'revFaultXP', -.5 },                    text = "WHERE PERFECTIONISM REIGNS, ERROR IS EXILE_",                 desc = "ReverseFaultXP----",    duration = 15, color = 'lG', },
        { time = 480, event = { 'atkBufferCap', 6, 'animDuration', 1, 'maxQuestSize', 1 }, text = "FAREWELL.",                 desc = "QuestDifficulty++++++",    duration = 26, color = 'lB', },
        { time = 485, event = { 'atkBufferCap', 6, 'animDuration', 1, 'extraQuestVar', 1 } },
        { time = 490, event = { 'atkBufferCap', 6, 'animDuration', 1 } },
        { time = 1e99 }, -- Total: dmgTimerMul-50%, Cycle-1, Wrong+2
    },
    rEX = {
        { time = 90,  event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 180, event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 240, event = { 'extraQuestBase', .2, 'animDuration', 1 } },
        { time = 240, event = { 'dmgTimerMul', -.2 },                                   text = "YOUR POWER SLIPS_",               desc = "TimerSpeed++" },
        { time = 270, event = { 'dmgWrong', 2 },                                        text = "WHISPERS OF DISCONTENT SPREAD_",  desc = "Damage++" },
        { time = 300, event = { 'dmgCycle', -1, 'animDuration', 1 },                    text = "PROTESTERS LINE THE STREETS_",    desc = "DmgCycle--" },
        { time = 330, event = { 'dmgTimerMul', -.2, 'dmgWrong', 2 },                    text = "YOUR CLOSEST ALLIES DEFECT_",     desc = "TimerSpeed++   Damage++" },
        { time = 360, event = { 'dmgTimerMul', -.1, 'dmgHeal', -1, 'animDuration', 1 }, text = "PARANOIA CLOUDS YOUR JUDGEMENT_", desc = "TimerSpeed++   Heal--" },
        { time = 362, event = { 'dmgTimerMul', -.05 } },
        { time = 365, event = { 'dmgTimerMul', -.05 } },
        { time = 390, event = { 'dmgCycle', -.5, 'dmgWrong', 1 },                       text = "THE REVOLUTION HAS BEGUN_",       desc = "DmgCycle--   Damage++" },
        { time = 420, event = { 'dmgTimerMul', -.1, 'animDuration', 1 },                text = "THE END OF AN ERA.",              desc = "TimerSpeed++++",         duration = 10 },
        { time = 423, event = { 'dmgTimerMul', -.05 } },
        { time = 426, event = { 'dmgTimerMul', -.05 } },
        { time = 430, event = { 'dmgTimerMul', -.05 } },
        { time = 435, event = { 'dmgTimerMul', -.03 } },
        { time = 440, event = { 'dmgTimerMul', -.02 } },
        { time = 1e99 }, -- Total: dmgTimerMul-90%, Cycle-1.5, Wrong+5
    },
    rDH = {
        { time = 90,  event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 180, event = { 'extraQuestBase', .2, 'animDuration', .5 } },
        { time = 240, event = { 'extraQuestBase', .2, 'animDuration', 1 } },
        { time = 300, event = { 'dmgTimerMul', -.1, 'animDuration', 1 },                   text = "FATIGUE SETS IN_",          desc = "TimerSpeed++" },
        { time = 330, event = { 'dmgCycle', -.5, 'dmgWrong', 1 },                          text = "YOUR BODY GROWS WEAK_",     desc = "DmgCycle--   Damage++" },
        { time = 360, event = { 'dmgTimerMul', -.1, 'dmgHeal', -1, 'animDuration', 1 },    text = "ALL SENSES BLUR TOGETHER_", desc = "TimerSpeed++   Heal--" },
        { time = 390, event = { 'dmgTimerMul', -.1, 'dmgWrong', 1 },                       text = "YOUR CONSCIOUSNESS FADES_", desc = "TimerSpeed++   Damage++" },
        { time = 420, event = { 'dmgTimerMul', -.05, 'dmgCycle', -.5, 'animDuration', 1 }, text = "THIS IS THE END.",          desc = "TimerSpeed++   DmgCycle--" },
        { time = 422, event = { 'dmgTimerMul', -.05 } },
        { time = 425, event = { 'dmgTimerMul', -.05 } },
        { time = 430, event = { 'dmgTimerMul', -.05 } },
        { time = 480, event = { 'atkBufferCap', 6, 'animDuration', 1, 'maxQuestSize', 1 }, text = "FAREWELL_",                 desc = "QuestDifficulty++++++",    duration = 26, color = 'lB', },
        { time = 485, event = { 'atkBufferCap', 6, 'animDuration', 1, 'extraQuestVar', 1 } },
        { time = 490, event = { 'atkBufferCap', 6, 'animDuration', 1 } },
        { time = 510, event = { 'animDuration', 1, 'maxQuestSize', 1 }, text = "FOR THEY THOUGHT YOU WEREN'T GOOD ENOUGH.",                 desc = "QuestDifficulty+++++++",    duration = 26, color = 'lB', },
        { time = 1e99 }, -- Total: dmgTimerMul-50%, Cycle-1, Wrong+2
    },
    rDP = {
        { time = 20,  event = { 'dmgHeal', -1 }, --[[ 2 ]]                       text = "YOUR PASSION FADES_",                        desc = "Heal-",          duration = 10 },
        { time = 40,  event = { 'dmgHeal', -.5 }, --[[ 1.5 ]]                    text = "THEIR REPLIES BECOME LESS ENGAGED_",         desc = "Heal--",         duration = 10 },
        { time = 60,  event = { 'dmgHeal', -.5, 'animDuration', .5 }, --[[ 1 ]]  text = "YOU FEEL NEGLECTED_",                        desc = "Heal---",        duration = 10 },
        { time = 80,  event = { 'dmgHeal', 1 }, --[[ 2 ]]                        text = "THEY SUCCESSFULLY APOLOGIZE_?",              desc = "Heal+",          duration = 10, color = 'lO' },
        { time = 90,  event = { 'extraQuestBase', .2 } },
        { time = 100, event = { 'dmgHeal', 1 }, --[[ 3 ]]                        text = "THINGS ARE BACK TO HOW THEY USED TO BE_!",   desc = "Heal+++",        duration = 10, color = 'lO' },
        { time = 120, event = { 'dmgHeal', -1, 'animDuration', .5 }, --[[ 2 ]]   text = "MINOR ISSUES BECOME LARGE CONFLICTS_",       desc = "Heal--",         duration = 10 },
        { time = 140, event = { 'dmgHeal', -1 }, --[[ 1 ]]                       text = "YOU BLAME THEM FOR YOUR OWN PROBLEMS_",      desc = "Heal---",        duration = 10 },
        { time = 160, event = { 'reviveDifficulty', 3 },                         text = "THEY WOULD RATHER SPEND TIME ALONE_",        desc = "Revive++",       duration = 10 },
        { time = 180, event = { 'extraQuestBase', .2 } },
        { time = 180, event = { 'dmgHeal', 1.5, 'animDuration', 1 }, --[[ 2.5 ]] text = "YOU PROMISE TO CHANGE_",                     desc = "Heal++",         duration = 10, color = 'lO' },
        { time = 200, event = { 'dmgTimerMul', -.2 },                            text = "PROMISES ARE BROKEN_",                       desc = "TimerSpeed++",   duration = 10 },
        { time = 220, event = { 'dmgHeal', -.5 }, --[[ 2 ]]                      text = "CONVERSATIONS DEVOLVE TO SHOUTING MATCHES_", desc = "Heal---",        duration = 10 },
        { time = 240, event = { 'extraQuestBase', .2, 'animDuration', 1 } },
        { time = 240, event = { 'dmgHeal', -.5 }, --[[ 1.5 ]]                    text = "ALL TRUST HAS WITHERED AWAY_",               desc = "Heal--",         duration = 10 },
        { time = 260, event = { 'dmgHeal', -.5 }, --[[ 1 ]]                      text = "THEY SET AN ULTIMATUM_",                     desc = "Heal--",         duration = 10 },
        { time = 280, event = { 'dmgHeal', -.5 }, --[[ .5 ]]                     text = "YOU CAN'T BE BOTHERED ANYMORE_",             desc = "Heal--",         duration = 10 },
        { time = 300, event = { 'dmgWrong', 2, 'animDuration', 1 },              text = "ONE LAST PAINFUL ARGUMENT_",                 desc = "Dmg+",           duration = 10 },
        { time = 320, event = { 'reviveDifficulty', 9999 },                      text = "GOODBYE.",                                   desc = "NO REVIVE",      duration = 10, color = 'R' },
        { time = 360, event = { 'dmgHeal', 1, 'animDuration', 1 }, --[[ 1.5 ]]   text = "\"I MISS YOU\"",                             desc = "Heal+++",        duration = 10, color = 'lO' },
        { time = 380, event = { 'dmgHeal', 1 }, --[[ 2.5 ]]                      text = "MAYBE IT CAN STILL WORK_?",                  desc = "Heal+",          duration = 10, color = 'lO' },
        { time = 400, event = { 'dmgTimerMul', -.1, 'animDuration', 4 },         text = "GOODBYE.",                                   desc = "TimerSpeed++++", duration = 10 },
        { time = 402, event = { 'dmgTimerMul', -.1 } },
        { time = 405, event = { 'dmgTimerMul', -.1 } },
        { time = 408, event = { 'dmgTimerMul', -.05 } },
        { time = 412, event = { 'dmgTimerMul', -.05 } },
        { time = 416, event = { 'dmgTimerMul', -.05 } },
        { time = 420, event = { 'dmgTimerMul', -.03 } },
        { time = 425, event = { 'dmgTimerMul', -.02 } },
        { time = 1e99 }, -- Total: dmgTimerMul-70%
    },
}
-- My formatter doesn't work if there's "…" inside
for _, f in next, Fatigue do for _, v in next, f do if v.text then v.text = v.text:gsub("_", "…") end end end

local commitEmptyText = UAN and "Commit NULL" or "Commit NOTHING"
local function rndMod(t)
    local d = ModData.deck[math.random(10)].id
    local absAlt = math.abs(GAME.height)
    local rMod = GAME.mod.PN > 0 and MATH.roll((2 * math.max(GAME.floor, GAME.negFloor == 0 and 10 or GAME.negFloor) + (absAlt >= 1650.0
                        and absAlt < 6200.0 and (6 + 18 * (absAlt - 1650.0) / 6200.0)
                        or (absAlt >= 6200.0 and 24 or 6))) * (0.01 + 0.0025 * (GAME.mod.PN == 2 and 1 + (GAME.URM and 1 or 0) or 0))) or false
    t.prompt = t.prompt:repD((rMod and "r" or "") .. d)
    t.text = t.text:repD(ModData.adj[(rMod and "r" or "") .. d])
    t.short = t.short:repD((rMod and "r" or "") .. d)
end
local function f5() return GAME.floor <= 5 end
local function F6() return GAME.floor >= 6 end
local function F9() return GAME.floor >= 9 end
local function isPN() return GAME.mod.PN > 0 end
local function isSB() return GAME.mod.SB > 0 end

---@class Prompt
---@field rank number[]
---@field prompt string
---@field target number
---@field short string
---@field text string
---@field cond? fun():boolean
---@field init? fun(t:Prompt)

---@type Prompt[]
RevivePrompts = {
    { rank = { 1, 2 }, prompt = 'activate',             target = 30,  short = "Activate 30",             text = "Activate 30 cards" },
    { rank = { 3, 4 }, prompt = 'activate',             target = 80,  short = "Activate 80",             text = "Activate 80 cards" },
    { rank = { 2, 2 }, prompt = 'cancel',               target = 40,  short = "Cancel 40",               text = "Cancel 40 cards" },
    { rank = { 3, 4 }, prompt = 'cancel',               target = 100, short = "Cancel 100",              text = "Cancel 100 cards" },
    { rank = { 1, 2 }, prompt = 'flip',                 target = 50,  short = "Flip 50",                 text = "Flip 50 cards" },
    { rank = { 3, 4 }, prompt = 'flip',                 target = 120, short = "Flip 120",                text = "Flip 120 cards" },
    { rank = { 5, 6 }, prompt = 'flip',                 target = 300, short = "Flip 300",                text = "Flip 300 cards" },
    { rank = { 1, 2 }, prompt = 'flip_single',          target = 10,  short = "Flip single 10",          text = "Flip a single card\n10 times in a row" },
    { rank = { 2, 4 }, prompt = 'flip_single',          target = 20,  short = "Flip single 20",          text = "Flip a single card\n20 times in a row" },
    { rank = { 1, 2 }, prompt = 'commit',               target = 6,   short = "Commit 6x",               text = "Commit 6 times" },
    { rank = { 2, 3 }, prompt = 'commit',               target = 15,  short = "Commit 15x",              text = "Commit 15 times" },
    { rank = { 3, 5 }, prompt = 'commit',               target = 30,  short = "Commit 30x",              text = "Commit 30 times" },
    { rank = { 1, 2 }, prompt = 'commit_$1',            target = 2,   short = "Commit $1 2x",            text = "Commit 2 times\nwith $1",                     init = rndMod },
    { rank = { 3, 4 }, prompt = 'commit_$1',            target = 4,   short = "Commit $1 4x",            text = "Commit 4 times\nwith $1",                     init = rndMod },
    { rank = { 2, 4 }, prompt = 'commit_$1_row',        target = 2,   short = "2 Chain with $1",         text = "Commit 2 times\nwith $1 in a row",            init = rndMod },
    { rank = { 3, 6 }, prompt = 'commit_$1_row',        target = 3,   short = "3 Chain with $1",         text = "Commit 3 times\nwith $1 in a row",            init = rndMod },
    { rank = { 1, 3 }, prompt = 'commit_no_$1_row',     target = 2,   short = "2 chain without $1",      text = "Commit 2 times\nwithout $1 in a row",         init = rndMod },
    { rank = { 3, 5 }, prompt = 'commit_no_$1_row',     target = 3,   short = "3 chain without $1",      text = "Commit 3 times\nwithout $1 in a row",         init = rndMod },
    { rank = { 1, 2 }, prompt = 'commit_0',             target = 2,   short = commitEmptyText .. " 2x",  text = commitEmptyText .. "\n2 times" },
    { rank = { 2, 4 }, prompt = 'commit_0',             target = 5,   short = commitEmptyText .. " 5x",  text = commitEmptyText .. "\n5 times" },
    { rank = { 4, 6 }, prompt = 'commit_0',             target = 8,   short = commitEmptyText .. " 8x",  text = commitEmptyText .. "\n8 times" },
    { rank = { 1, 3 }, prompt = 'commit_0_row',         target = 3,   short = "3x Spam commit",          text = commitEmptyText .. "\n3 times in a row" },
    { rank = { 3, 5 }, prompt = 'commit_no_conn',       target = 1,   short = "Commit no consec",        text = "Commit without consecutive cards",            cond = F6 },
    { rank = { 1, 4 }, prompt = 'commit_conn_2',        target = 1,   short = "Commit 2 consec",         text = "Commit with 2 consecutive cards",             cond = f5 },
    { rank = { 2, 4 }, prompt = 'commit_conn_3',        target = 1,   short = "Commit 3 consec",         text = "Commit with 3 consecutive cards",             cond = f5 },
    { rank = { 3, 5 }, prompt = 'commit_conn_4',        target = 1,   short = "Commit 4 consec",         text = "Commit with 4 consecutive cards" },
    { rank = { 3, 5 }, prompt = 'commit_swamp_l',       target = 1,   short = "SWAMP WATER LITE",        text = "Commit SWAMP WATER LITE" },
    { rank = { 4, 6 }, prompt = 'commit_swamp',         target = 1,   short = "SWAMP WATER",             text = "Commit SWAMP WATER" },
    { rank = { 5, 7 }, prompt = 'commit_why_l',         target = 1,   short = "WHY LITE",                text = "Commit WHY LITE" },
    { rank = { 6, 8 }, prompt = 'commit_why',           target = 1,   short = "WHY",                     text = "Commit WHY" },
    { rank = { 7, 9 }, prompt = 'commit_singularity',   target = 1,   short = "SINGULARITY",             text = "Commit SINGULARITY",                          cond = isPN },
    { rank = { 3, 6 }, prompt = 'commit_reversed',      target = 1,   short = "Commit inversed",         text = "Commit all cards\nwhich are not requested" },
    { rank = { 1, 4 }, prompt = 'commit_1card',         target = 3,   short = "Commit 1 cards 3x",       text = "Commit 3 times with\n1 card on first commit" },
    { rank = { 2, 5 }, prompt = 'commit_2card',         target = 4,   short = "Commit 2 cards 4x",       text = "Commit 4 times with\n2 cards on first commit" },
    { rank = { 3, 6 }, prompt = 'commit_3card',         target = 5,   short = "Commit 3 cards 5x",       text = "Commit 5 times with\n3 cards on first commit" },
    { rank = { 4, 6 }, prompt = 'commit_4card',         target = 4,   short = "Commit 4 cards 4x",       text = "Commit 4 times with\n4 cards on first commit" },
    { rank = { 5, 6 }, prompt = 'commit_5card',         target = 3,   short = "Commit 5 cards 3x",       text = "Commit 3 times with\n5 cards on first commit" },
    { rank = { 1, 4 }, prompt = 'pass',                 target = 10,  short = "Pass 10",                 text = "Pass 10 times" },
    { rank = { 5, 6 }, prompt = 'pass',                 target = 20,  short = "Pass 20",                 text = "Pass 20 times" },
    { rank = { 2, 5 }, prompt = 'pass_$1',              target = 2,   short = "Pass 2 with $1",          text = "Pass 2 times\nwith $1",                       init = rndMod },
    { rank = { 3, 5 }, prompt = 'pass_$1',              target = 3,   short = "Pass 3 with $1",          text = "Pass 3 times\nwith $1",                       init = rndMod },
    { rank = { 4, 6 }, prompt = 'pass_$1',              target = 4,   short = "Pass 4 with $1",          text = "Pass 4 times\nwith $1",                       init = rndMod },
    { rank = { 2, 4 }, prompt = 'pass_perfect',         target = 6,   short = "6x perf",                 text = "Pass 6 times perfectly" },
    { rank = { 5, 6 }, prompt = 'pass_perfect',         target = 12,  short = "12x perf",                text = "Pass 12 times perfectly" },
    { rank = { 2, 4 }, prompt = 'pass_imperfect',       target = 6,   short = "6x im-perf",              text = "Pass 6 times imperfectly" },
    { rank = { 5, 6 }, prompt = 'pass_imperfect',       target = 12,  short = "12x im-perf",             text = "Pass 12 times imperfectly" },
    { rank = { 4, 5 }, prompt = 'pass_imperfect_row',   target = 3,   short = "3x chain im-perf",        text = "Pass 3 times\nimperfectly in a row" },
    { rank = { 5, 6 }, prompt = 'pass_imperfect_row',   target = 8,   short = "8x chain im-perf",        text = "Pass 8 times\nimperfectly in a row" },
    { rank = { 2, 4 }, prompt = 'pass_perfect_row',     target = 4,   short = "4x chain perf",           text = "Pass 4 times\nperfectly in a row" },
    { rank = { 3, 5 }, prompt = 'pass_perfect_row',     target = 6,   short = "6x chain perf",           text = "Pass 6 times\nperfectly in a row" },
    { rank = { 4, 5 }, prompt = 'pass_perfect_row',     target = 8,   short = "8x chain perf",           text = "Pass 8 times\nperfectly in a row" },
    { rank = { 4, 6 }, prompt = 'pass_perfect_row',     target = 10,  short = "10x chain perf",          text = "Pass 10 times\nperfectly in a row" },
    { rank = { 2, 3 }, prompt = 'pass_second',          target = 4,   short = "2nd quest 4x",            text = "Pass the second\nquest 4 times" },
    { rank = { 3, 4 }, prompt = 'pass_second',          target = 8,   short = "2nd quest 8x",            text = "Pass the second\nquest 8 times" },
    { rank = { 4, 5 }, prompt = 'pass_second',          target = 12,  short = "2nd quest 12x",           text = "Pass the second\nquest 12 times" },
    { rank = { 2, 4 }, prompt = 'b2b_break_4',          target = 1,   short = "Break B2B 4x",            text = "Break B2B x 4" },
    { rank = { 3, 4 }, prompt = 'b2b_break_6',          target = 1,   short = "Break B2B 6x",            text = "Break B2B x 6" },
    { rank = { 4, 5 }, prompt = 'b2b_break_8',          target = 1,   short = "Break B2B 8x",            text = "Break B2B x 8" },
    { rank = { 4, 6 }, prompt = 'b2b_break_10',         target = 1,   short = "Break B2B 10x",           text = "Break B2B x 10" },
    { rank = { 4, 6 }, prompt = 'b2b_break_windup',     target = 1,   short = "Break B2B at a windup",   text = "Break B2B at a windup",                       cond = F9 },
    { rank = { 5, 6 }, prompt = 'b2b_break_windup3',    target = 1,   short = "Break B2B at a windup3+", text = "Break B2B at\na lv.3+ windup",                cond = F9 },
    { rank = { 1, 3 }, prompt = 'heal',                 target = 8,   short = "Heal 8 HP",               text = "Heal 8 HP" },
    { rank = { 2, 4 }, prompt = 'heal',                 target = 20,  short = "Heal 20 HP",              text = "Heal 20 HP" },
    { rank = { 1, 2 }, prompt = 'send',                 target = 6,   short = "Send 6",                  text = "Send 6 attacks" },
    { rank = { 3, 4 }, prompt = 'send',                 target = 20,  short = "Send 20",                 text = "Send 20 attacks" },
    { rank = { 5, 6 }, prompt = 'send',                 target = 40,  short = "Send 40",                 text = "Send 40 attacks" },
    { rank = { 3, 4 }, prompt = 'pass_windup',          target = 1,   short = "Windup",                  text = "Pass a windup",                               cond = F9 },
    { rank = { 3, 5 }, prompt = 'pass_windup3',         target = 1,   short = "Windup3+",                text = "Pass a lv.3+ windup",                         cond = F9 },
    { rank = { 5, 5 }, prompt = 'pass_windup_inb2b',    target = 1,   short = "Windup with B2B",         text = "Pass a windup\nduring one B2B charge",        cond = F9 },
    { rank = { 4, 5 }, prompt = 'pass_windup',          target = 4,   short = "Windup x 4",              text = "Pass 4 windups",                              cond = F9 },
    { rank = { 4, 4 }, prompt = 'pass_windup_perfect',  target = 1,   short = "Windup perf",             text = "Pass a windup\nperfectly",                    cond = F9 },
    { rank = { 6, 6 }, prompt = 'pass_windup_inb2b',    target = 3,   short = "Windup x 3 with B2B",     text = "Pass 4 windups\nduring a B2B charge",         cond = F9 },
    { rank = { 5, 5 }, prompt = 'pass_windup_perfect',  target = 4,   short = "Windup perf x 4",         text = "Pass 4 windups\nperfectly",                   cond = F9 },
    { rank = { 5, 5 }, prompt = 'pass_windup3_perfect', target = 1,   short = "Windup3+ perf",           text = "Pass a lv.3+\nwindup perfectly",              cond = F9 },
    { rank = { 6, 6 }, prompt = 'pass_windup3_perfect', target = 4,   short = "Windup3+ perf x 4",       text = "Pass 4 lv.3+\nwindups perfectly",             cond = F9 },
    { rank = { 2, 2 }, prompt = 'dmg_time',             target = 4,   short = "Take Dmg 4x",             text = "Take damage 4 times" },
    { rank = { 3, 3 }, prompt = 'dmg_time',             target = 8,   short = "Take Dmg 8x",             text = "Take damage 8 times" },
    { rank = { 2, 4 }, prompt = 'dmg_amount',           target = 10,  short = "Lose 10 HP",              text = "Take 10 damage total" },
    { rank = { 4, 6 }, prompt = 'dmg_amount',           target = 20,  short = "Lose 20 HP",              text = "Take 20 damage total" },
    { rank = { 3, 4 }, prompt = 'timedmg_time',         target = 2,   short = "Take Time Dmg 2x",        text = "Take time damage 2 times",                    cond = F6 },
    { rank = { 5, 6 }, prompt = 'timedmg_time',         target = 4,   short = "Take Time Dmg 4x",        text = "Take time damage 4 times",                    cond = F6 },
    { rank = { 1, 4 }, prompt = 'freezedmg_amount',     target = 15,  short = "Lose 15 HP to Freeze",    text = "Take 15 freeze damage total",                 cond = isSB },
    { rank = { 2, 5 }, prompt = 'freezedmg_amount',     target = 30,  short = "Lose 30 HP to Freeze",    text = "Take 30 freeze damage total",                 cond = isSB },
    { rank = { 1, 4 }, prompt = 'freezedmg_time',       target = 4,   short = "Take Freeze Dmg 4x",      text = "Take freeze damage 4 times",                  cond = function() return isSB() and f5() end },
    { rank = { 2, 5 }, prompt = 'freezedmg_time',       target = 8,   short = "Take Freeze Dmg 8x",      text = "Take freeze damage 8 times",                  cond = function() return isSB() and f5() end },
    { rank = { 2, 5 }, prompt = 'freezedmg_time',       target = 12,  short = "Take Freeze Dmg 12x",     text = "Take freeze damage 12 times",                 cond = function() return isSB() and F6() end },
    { rank = { 3, 6 }, prompt = 'freezedmg_time',       target = 16,  short = "Take Freeze Dmg 16x",     text = "Take freeze damage 16 times",                 cond = function() return isSB() and F6() end },
    { rank = { 3, 6 }, prompt = 'freezedmg_time',       target = 20,  short = "Take Freeze Dmg 20x",     text = "Take freeze damage 20 times",                 cond = function() return isSB() and F9() end },
    { rank = { 4, 7 }, prompt = 'freezedmg_time',       target = 24,  short = "Take Freeze Dmg 24x",     text = "Take freeze damage 24 times",                 cond = function() return isSB() and F9() end },
    { rank = { 4, 6 }, prompt = 'keep_health_safe',     target = 8,   short = "Safe HP 8s",              text = "Keep HP safe for\n8 seconds",                 cond = F6 },
    { rank = { 4, 5 }, prompt = 'keep_health_danger',   target = 3,   short = "Danger HP 3s",            text = "Keep HP in danger\nfor 3 seconds",            cond = F6 },
    { rank = { 1, 5 }, prompt = 'keep_no_flip',         target = 8,   short = "No flip 8s",              text = "Don't flip\nfor 8 seconds",                   cond = function() return isSB() and f5() end },
    { rank = { 2, 6 }, prompt = 'keep_no_flip',         target = 5,   short = "No flip 5s",              text = "Don't flip\nfor 5 seconds",                   cond = function() return isSB() and F6() end },
    { rank = { 3, 7 }, prompt = 'keep_no_flip',         target = 2,   short = "No flip 2s",              text = "Don't flip\nfor 2 seconds",                   cond = function() return isSB() and F9() end },
    { rank = { 2, 5 }, prompt = 'keep_no_mouse',        target = 4,   short = "No mouse 4s",             text = "Don't touch mouse\nfor 4 seconds",            cond = f5 },
    { rank = { 2, 4 }, prompt = 'keep_no_commit',       target = 6,   short = "No commit 6s",            text = "Don't commit\nfor 6 seconds",                 cond = f5 },
    { rank = { 3, 6 }, prompt = 'keep_no_cancel',       target = 8,   short = "No cancel 8s",            text = "Don't cancel\nfor 8 seconds" },
    { rank = { 2, 5 }, prompt = 'keep_no_keyboard',     target = 10,  short = "No keyboard 10s",         text = "Don't touch keyboard\nfor 10 seconds",        cond = F6 },
    { rank = { 3, 5 }, prompt = 'keep_no_perfect',      target = 12,  short = "No perfect 12s",          text = "Don't perfect\nfor 12 seconds" },
    { rank = { 4, 6 }, prompt = 'keep_no_imperfect',    target = 14,  short = "No imperfect 14s",        text = "Don't imperfect\nfor 14 seconds",             cond = F6 },
    { rank = { 3, 5 }, prompt = 'keep_no_reset',        target = 16,  short = "No reset 16s",            text = "Don't reset\nfor 16 seconds" },
}
