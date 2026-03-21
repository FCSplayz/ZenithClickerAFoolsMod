INITIAL_PROFILING = true
if INITIAL_PROFILING then
    profiler = require 'Zenitha/profile'
    profiler.switch()
end

love.window.setIcon(love.image.newImageData('assets/icon.png'))

require 'Zenitha'

ZENITHA.setMainLoopSpeed(240)
ZENITHA.setRenderRate(50)
ZENITHA.setShowFPS(false)
ZENITHA.setVersionText("")
ZENITHA.setClickDist(62)

STRING.install()

SCR.setSize(1600, 1000)

local handle
local command = 'curl -s -v https://api.github.com/repos/FCSplayz/ZenithClickerAFoolsMod/contents/latestVersion --connect-timeout 1 -m 2'
handle = io.popen(command, 'r')
local content = handle:read("*a"):match([["content"%s*:%s*"(.-)\n"]])
if content ~= nil then latestVersion = tonumber(love.data.decode('string', 'base64', content)) end
handle:close()

---@return love.Texture
local function assets(path) return 'assets/' .. path end
local function q(oy, n, size)
    return GC.newQuad(
        n * size, oy,
        size, size,
        2709, 1663
    )
end
local function q2(ox, oy, w, h)
    return GC.newQuad(
        ox, oy,
        w, h,
        2709, 1663
    )
end
local function aq(x, y) return { 1, GC.newQuad((x - 1) % 16 * 256, (y - 1) % 16 * 256, 256, 256, 2048, 2304) } end
local function aq2(x, y) return { 2, GC.newQuad((x - 1) % 16 * 256, (y - 1) % 16 * 256, 256, 256, 2048, 2304) } end
TEXTURE = {
    star0 = assets 'crystal-dark.png',
    star1 = assets 'crystal.png',
    panel = {
        glass_a = assets 'panel/glass-a.png',
        glass_b = assets 'panel/glass-b.png',
        throb_a = assets 'panel/throb-a.png',
        throb_b = assets 'panel/throb-b.png',
    },
    modIcon = assets 'mod_icon.png',
    modQuad_ig = {
        VL = q(0, 0, 225),
        NH = q(0, 1, 225),
        MS = q(0, 2, 225),
        IN = q(0, 3, 225),
        GV = q(0, 4, 225),
        EX = q(0, 5, 225),
        DP = q(0, 6, 225),
        DH = q(0, 7, 225),
        AS = q(0, 8, 225),
        PN = q(0, 9, 225),
        SB = q(0, 10, 225),
        rVL = q(225, 0, 242),
        rNH = q(225, 1, 242),
        rMS = q(225, 2, 242),
        rIN = q(225, 3, 242),
        rGV = q(225, 4, 242),
        rEX = q(225, 5, 242),
        rDP = q(225, 6, 242),
        rDH = q(225, 7, 242),
        rAS = q(225, 8, 242),
        rPN = q(225, 9, 242),
        rSB = q(225, 10, 242),
    },
    modQuad_res = {
        VL = q(467, 0, 183),
        NH = q(467, 1, 183),
        MS = q(467, 2, 183),
        IN = q(467, 3, 183),
        GV = q(467, 4, 183),
        EX = q(467, 5, 183),
        DP = q(467, 6, 183),
        DH = q(467, 7, 183),
        AS = q(467, 8, 183),
        PN = q(467, 9, 183),
        SB = q(467, 10, 183),
        rVL = q(650, 0, 183),
        rNH = q(650, 1, 183),
        rMS = q(650, 2, 183),
        rIN = q(650, 3, 183),
        rGV = q(650, 4, 183),
        rEX = q(650, 5, 183),
        rDP = q(650, 6, 183),
        rDH = q(650, 7, 183),
        rAS = q(650, 8, 183),
        rPN = q(650, 9, 183),
        rSB = q(650, 10, 183),
    },
    modQuad_ultra_res = {
        VL = q(467, 0, 183),
        NH = q(467, 1, 183),
        MS = q(467, 2, 183),
        IN = q(467, 3, 183),
        GV = q(467, 4, 183),
        EX = q(467, 5, 183),
        DP = q(467, 6, 183),
        DH = q(467, 7, 183),
        AS = q(467, 8, 183),
        PN = q(467, 9, 183),
        SB = q(467, 10, 183),
        rVL = q(833, 0, 183),
        rNH = q(833, 1, 183),
        rMS = q(833, 2, 183),
        rIN = q(833, 3, 183),
        rGV = q(833, 4, 183),
        rEX = q(833, 5, 183),
        rDP = q(833, 6, 183),
        rDH = q(833, 7, 183),
        rAS = q(833, 8, 183),
        rPN = q(833, 9, 183),
        rSB = q(833, 10, 183),
    },
    modQuad_ig_ex = {
        VL = q(0, 0, 225),
        NH = q(0, 1, 225),
        MS = q(0, 2, 225),
        IN = q(0, 3, 225),
        GV = q(0, 4, 225),
        EX = q(0, 5, 225),
        DP = q(0, 6, 225),
        DH = q(0, 7, 225),
        AS = q(0, 8, 225),
        PN = q(0, 9, 225),
        SB = q(0, 10, 225),
        rVL = q(225, 0, 242),
        rNH = q(225, 1, 242),
        rMS = q(225, 2, 242),
        rIN = q(225, 3, 242),
        rGV = q(225, 4, 242),
        rEX = q(225, 5, 242),
        rDP = q(225, 6, 242),
        rDH = q(225, 7, 242),
        rAS = q(225, 8, 242),
        rPN = q(225, 9, 242),
        rSB = q(225, 10, 242),
    },
    modQuad_res_ex = {
        VL = q(467, 0, 183),
        NH = q(467, 1, 183),
        MS = q(467, 2, 183),
        IN = q(467, 3, 183),
        GV = q(467, 4, 183),
        EX = q(467, 5, 183),
        DP = q(467, 6, 183),
        DH = q(467, 7, 183),
        AS = q(467, 8, 183),
        PN = q(467, 9, 183),
        SB = q(467, 10, 183),
        rVL = q(650, 0, 183),
        rNH = q(650, 1, 183),
        rMS = q(650, 2, 183),
        rIN = q(650, 3, 183),
        rGV = q(650, 4, 183),
        rEX = q(650, 5, 183),
        rDP = q(650, 6, 183),
        rDH = q(650, 7, 183),
        rAS = q(650, 8, 183),
        rPN = q(650, 9, 183),
        rSB = q(650, 10, 183),
    },
    modQuad_ultra_res_ex = {
        VL = q(467, 0, 183),
        NH = q(467, 1, 183),
        MS = q(467, 2, 183),
        IN = q(467, 3, 183),
        GV = q(467, 4, 183),
        EX = q(467, 5, 183),
        DP = q(467, 6, 183),
        DH = q(467, 7, 183),
        AS = q(467, 8, 183),
        PN = q(467, 9, 183),
        SB = q(467, 10, 183),
        rVL = q(833, 0, 183),
        rNH = q(833, 1, 183),
        rMS = q(833, 2, 183),
        rIN = q(833, 3, 183),
        rGV = q(833, 4, 183),
        rEX = q(833, 5, 183),
        rDP = q(833, 6, 183),
        rDH = q(833, 7, 183),
        rAS = q(833, 8, 183),
        rPN = q(833, 9, 183),
        rSB = q(833, 10, 183),
    },
    modQuad_ultra = {
        rNH = q2(0, 1016, 315, 315),
        rMS = q2(315, 1016, 315, 315),
        rGV = q2(630, 1016, 315, 315),
        rVL = q2(945, 1016, 315, 315),
        rDH = q2(0, 1331, 315, 315),
        rIN = q2(315, 1331, 315, 315),
        rAS = q2(630, 1331, 315, 315),
        rEX = q2(945, 1331, 315, 332),
        rDP = q2(1260, 1016, 419, 377),
        rPN = q2(1680, 1016, 322, 315),
        rSB = q2(1680, 1331, 315, 315),
    },
    PN = { lock = assets 'card/lockover-fool-0.png', front = assets 'card/pento.png', back = assets 'card/pento-back.png', throb = assets 'card/pento-throb.png', },
    SB = { lock = assets 'card/lockover-incompatible.png', front = assets 'card/snowman.png', back = assets 'card/snowman-back.png', throb = assets 'card/snowman-throb.png', },
    EX = { lock = assets 'card/lockover-9.png', front = assets 'card/expert.png', back = assets 'card/expert-back.png', throb = assets 'card/expert-throb.png', },
    NH = { lock = assets 'card/lockfull-2.png', front = assets 'card/nohold.png', back = assets 'card/nohold-back.png', throb = assets 'card/nohold-throb.png', },
    MS = { lock = assets 'card/lockfull-3.png', front = assets 'card/messy.png', back = assets 'card/messy-back.png', throb = assets 'card/messy-throb.png', },
    GV = { lock = assets 'card/lockfull-4.png', front = assets 'card/gravity.png', back = assets 'card/gravity-back.png', throb = assets 'card/gravity-throb.png', },
    VL = { lock = assets 'card/lockfull-5.png', front = assets 'card/volatile.png', back = assets 'card/volatile-back.png', throb = assets 'card/volatile-throb.png', },
    DH = { lock = assets 'card/lockfull-6.png', front = assets 'card/doublehole.png', back = assets 'card/doublehole-back.png', throb = assets 'card/doublehole-throb.png', },
    IN = { lock = assets 'card/lockfull-7.png', front = assets 'card/invisible.png', back = assets 'card/invisible-back.png', throb = assets 'card/invisible-throb.png', },
    AS = { lock = assets 'card/lockfull-8.png', front = assets 'card/allspin.png', back = assets 'card/allspin-back.png', throb = assets 'card/allspin-throb.png', },
    DP = { lock = assets 'card/lockover-supporter.png', front = assets 'card/duo.png', back = assets 'card/duo-back.png', throb = assets 'card/duo-throb.png', },
    towerBG = { assets 'tower/f1.jpg', assets 'tower/f2.jpg', assets 'tower/f3.jpg', assets 'tower/f4.jpg', assets 'tower/f5.jpg', assets 'tower/f6.jpg', assets 'tower/f7.jpg', assets 'tower/f8.jpg', assets 'tower/f9.jpg', assets 'tower/f10.png' },
    moon = assets 'tower/moon.png',
    stars = assets 'tower/stars.png',
    ruler = assets 'ruler.png',

    revive = {
        norm = assets 'revive/norm.png',
        rev_left = assets 'revive/rev_left.png',
        rev_right = assets 'revive/rev_right.png',
    },
    spark = {
        assets 'particle/spark1.png',
        assets 'particle/spark2.png',
        assets 'particle/spark3.png',
    },

    stat = {
        avatar = assets 'stat/avatar.png',
        clicker = assets 'stat/clicker.png',
        rank = {
            [0] = assets 'rank/z.png',
            assets 'rank/d.png',
            assets 'rank/d+.png',
            assets 'rank/c-.png',
            assets 'rank/c.png',
            assets 'rank/c+.png',
            assets 'rank/b-.png',
            assets 'rank/b.png',
            assets 'rank/b+.png',
            assets 'rank/a-.png',
            assets 'rank/a.png',
            assets 'rank/a+.png',
            assets 'rank/s-.png',
            assets 'rank/s.png',
            assets 'rank/s+.png',
            assets 'rank/ss.png',
            assets 'rank/u.png',
            assets 'rank/x.png',
            assets 'rank/x+.png',
        },
    },
    achievement = {
        icons = {
            assets 'achievements/icons1.png',
            assets 'achievements/icons2.png',
        },
        iconQuad = {
            _undef = aq(8, 8),
            zenith_explorer = aq(2, 3),
            zenith_explorer_plus = aq(2, 3),
            clicker_speedrun = aq(5, 1),
            typer_speedrun = aq(5, 1),
            supercharged = aq(5, 6),
            supercharged_plus = aq(5, 6),
            multitasker = aq(7, 2),
            effective = aq(7, 2),
            zenith_speedrun = aq(2, 6),
            zenith_speedrun_plus = aq(2, 6),
            zenith_challenger = aq(8, 2),
            divine_challenger = aq2(4, 1),
            zenith_speedrunner = aq(2, 6),
            divine_speedrunner = aq2(5, 1),
            the_spike_of_all_time = aq(4, 2),
            the_spike_of_all_time_minus = aq(4, 2),
            vip_list = aq(6, 6),

            PN = aq(3, 8),
            EX = aq(3, 3),
            NH = aq(7, 3),
            MS = aq(8, 3),
            GV = aq(6, 3),
            VL = aq(5, 3),
            DH = aq(4, 3),
            IN = aq(1, 4),
            AS = aq(2, 4),
            DP = aq(3, 4),
            GVIN = aq(6, 4),
            ASNH = aq(4, 6),
            DPEX = aq(8, 5),
            GVNH = aq(4, 4),
            DHMSNH = aq(5, 4),
            DHEXNH = aq(7, 4),
            DHEXMSVL = aq(8, 4),
            ASEXVL = aq(1, 7),
            swamp_water_lite = aq(5, 7),
            swamp_water = aq(2, 5),
            swamp_water_pro = aq2(8, 1),

            rPN = aq(4, 8),
            rEX = aq(7, 9),
            rNH = aq(3, 9),
            rMS = aq(4, 9),
            rGV = aq(2, 9),
            rVL = aq(1, 9),
            rDH = aq(8, 9),
            rIN = aq(5, 9),
            rAS = aq(6, 9),
            rDP = aq(7, 7),
            DHEXrGV = aq2(5, 2),      -- Demonic Speed
            rASrGV = aq2(3, 2),       -- Whizzing Wizard
            rGVrIN = aq2(1, 2),       -- The Grandmaster+
            NHrAS = aq(1, 2),         -- Pristine
            GVrASrDH = aq2(1, 3),     -- Storage Overload
            DHNHrASrIN = aq2(7, 7),   -- Steganography
            DHrMSrNH = aq2(6, 7),     -- Deadbeat
            DHGVNHrMS = aq2(3, 7),    -- Trench Warfare
            rGVrNHrVL = aq2(8, 5),    -- Sweatshop
            rINrNH = aq2(6, 5),       -- Fleeting Memory
            EXGVNHrMS = aq2(4, 5),    -- Bnuuy
            DPGVMSrNH = aq2(2, 2),    -- Grand-Master!
            ASDPGVrMSrNH = aq2(2, 2), -- Grand-Master! Rounds
            ASEXrDHrMS = aq2(5, 7),   -- Endless Gluttony
            DHrEXrVL = aq2(4, 7),     -- Sweat and Ruin
            ASGVrDPrMS = aq2(4, 3),   -- Cupid's Gamble
            NHVLrDPrGV = aq2(3, 5),   -- Despairful Longing
            INMSrDHrDP = aq2(1, 5),   -- Uneasy Alliance
            VLrEXrIN = aq2(8, 8),     -- Authoritarian Delusion
            rDPrEX = aq2(4, 2),       -- Tyrannical Dyarchy
            INMSrDHrEX = aq2(7, 5),   -- Sisyphean Monarchy
            rDHrIN = aq2(5, 5),       -- Brain Capacity
            swamp_water_lite_plus = aq2(6, 2),
            swamp_water_plus = aq2(7, 2),
            swamp_water_pro_plus = aq2(8, 2),

            -- Special, no texture needed
            blight = aq(0, 0),
            desolation = aq(0, 0),
            havoc = aq(0, 0),
            pandemonium = aq(0, 0),
            inferno = aq(0, 0),
            purgatory = aq(0, 0),
            perdition = aq(0, 0),
            cataclysm = aq(0, 0),
            annihilation = aq(0, 0),
            armageddon = aq(0, 0),
            abyss = aq(0, 0),
            FM_spaghettification = aq(0, 0),
            FM_singularity = aq(0, 0),

            the_escape_artist = aq(1, 5),
            talentless = aq(3, 7),
            block_rationing = aq(2, 7),
            the_responsible_one = aq(1, 6),
            guardian_angel = aq(3, 6),
            lovers_promise = aq(8, 7),
            -- moon_struck = aq(),
            clutch_main = aq2(8, 3),
            the_oblivious_artist = aq2(6, 9),
            powerless = aq(7, 5),
            the_pacifist = aq(4, 1),
            divine_rejection = aq(7, 6),
            sunk_cost = aq2(6, 8),
            wax_wings = aq2(7, 8),
            carried = aq(3, 8),
            patience_is_a_virtue = aq2(2, 5),
            spotless = aq2(5, 3),
            fel_magic = aq2(1, 7),
            arrogance = aq(3, 5),
            honeymoon = aq2(3, 4),
            break_up = aq2(1, 4),
            overprotection = aq2(1, 9),
            the_unreliable_one = aq2(7, 1),
            detail_oriented = aq(8, 6),
            psychokinesis = aq(8, 6),

            love_hotel = aq(5, 6),
            financially_responsible = aq(5, 6),
            unfair_battle = aq(5, 6),
            museum_heist = aq(5, 6),
            workaholic = aq(5, 6),
            human_experiment = aq(5, 6),
            core_meltdown = aq(5, 6),
            ultra_dash = aq(5, 6),
            perfect_speedrun = aq(5, 6),
            the_perfectionist = aq(5, 6),
            teraspeed = aq(5, 6),
            cruise_control = aq(5, 6),
            the_spike_of_all_time_plus = aq(5, 6),

            skys_the_limit = aq2(2, 3),
            superluminal = aq2(6, 1),
            cut_off = aq(6, 2),
            worn_out = aq(6, 2),
            mastery = aq2(2, 6),
            terminal_velocity = aq2(2, 6),
            final_defiance = aq(3, 2),
            the_harbinger = aq(5, 8),
            speedrun_speedrunning = aq(5, 2),
            abyss_weaver = aq(5, 2),
            royal_resistance = aq2(2, 1),
            lovers_stand = aq2(2, 1),
            romantic_homicide = aq(4, 8),
            its_kinda_rare = aq2(6, 3),
            benevolent_ambition = aq2(7, 3),
            fruitless_effort = aq(6, 7),
            false_god = aq(2, 8),
            subjugation = aq2(2, 7),
            omnipotence = aq2(2, 7),
            clicking_champion = aq2(8, 6),

            identity = aq(6, 6),
            respectful = aq(2, 1),
            zenith_relocation = aq(4, 7),
            intended_glitch = aq2(3, 3),
            dark_force = aq(3, 1),
            zenith_traveler = aq(1, 8),
            smooth_dismount = aq(4, 1),
        },
        frame = {
            [0] = assets 'achievements/frames/none.png',
            assets 'achievements/frames/bronze.png',
            assets 'achievements/frames/silver.png',
            assets 'achievements/frames/gold.png',
            assets 'achievements/frames/platinum.png',
            assets 'achievements/frames/diamond.png',
            assets 'achievements/frames/issued.png',
        },
        ring = assets 'achievements/frames/ring-piece.png',
        wreath = {
            assets 'achievements/wreaths/t100.png',
            assets 'achievements/wreaths/t50.png',
            assets 'achievements/wreaths/t25.png',
            assets 'achievements/wreaths/t10.png',
            assets 'achievements/wreaths/t5.png',
            assets 'achievements/wreaths/t3.png',
        },
        glint_1 = assets 'achievements/glint-a.png',
        glint_2 = assets 'achievements/glint-b.png',
        glint_3 = assets 'achievements/glint-c.png',
        competitive = assets 'achievements/competitive.png',
        hidden = assets 'achievements/hidden.png',
        event = assets 'achievements/event.png',
        extra = assets 'achievements/extra.png',
        experimental = assets 'achievements/experimental.png',
    },

    logo = assets 'icon.png',
    logo_old = assets 'icon_old.png',
}
local transition = { w = 128, h = 1 }
for x = 0, 127 do
    table.insert(transition, { 'setCL', 1, 1, 1, 1 - x / 128 })
    table.insert(transition, { 'fRect', x, 0, 1, 1 })
end
TEXTURE.transition = GC.load(transition)
TEXTURE.pixel = GC.load { w = 1, h = 1, { 'clear', 1, 1, 1 } }
TEXTURE.darkCorner = GC.newCanvas(128, 128)
GC.setCanvas(TEXTURE.darkCorner)
GC.setColor(0, 0, 0)
GC.blurCircle(.626, 64, 64, 64)
GC.setCanvas()
TEXTURE = IMG.init(TEXTURE, true)

FONT.load {
    serif = "assets/AbhayaLibre-Regular.ttf",
    sans = "assets/DINPro-Medium.otf",
    led = "assets/UniDreamLED.ttf",
}
local fontNotLoaded = SYSTEM ~= 'Web' and MATH.roll(.62)
FONT.setDefaultFont(fontNotLoaded and 'serif' or 'sans')

BG.add('black', { draw = function() GC.clear(0, 0, 0) end })
BG.set('black')

TEXTS = { -- Font size can only be 30 and 50 here !!!
    version    = GC.newText(FONT.get(30), SYSTEM .. " " .. (require 'version'.appVer)),
    mod        = GC.newText(FONT.get(30)),
    mpPreview  = GC.newText(FONT.get(30)),
    zpPreview  = GC.newText(FONT.get(30)),
    zpChange   = GC.newText(FONT.get(30)),
    dcBest     = GC.newText(FONT.get(30)),
    dcTimer    = GC.newText(FONT.get(30)),
    title      = GC.newText(FONT.get(50), "EXPERT QUICK PICK"),
    load       = GC.newText(FONT.get(50), "JOINING ROOM..."),
    pb         = GC.newText(FONT.get(50)),
    endResult  = GC.newText(FONT.get(30)),
    endHeight  = GC.newText(FONT.get(50)),
    endFloor   = GC.newText(FONT.get(30)),
    linePB     = GC.newText(FONT.get(50), "PB"),
    lineKM     = GC.newText(FONT.get(50), "1000"),
    height     = GC.newText(FONT.get(30)),
    time       = GC.newText(FONT.get(30)),
    rank       = GC.newText(FONT.get(30)),
    chain      = GC.newText(FONT.get(50)),
    chain2     = GC.newText(FONT.get(50, 'led')),
    b2b        = GC.newText(FONT.get(30), "B2B x"),
    spike      = GC.newText(FONT.get(50)),
    gigaspeed  = GC.newText(FONT.get(50), {
        COLOR.R, "G", COLOR.O, "I", COLOR.Y, "G",
        COLOR.K, "A", COLOR.G, "S", COLOR.J, "P",
        COLOR.C, "E", COLOR.S, "E", COLOR.B, "D"
    }),
    teraspeed  = GC.newText(FONT.get(50), { -- TERAIMP
        COLOR.R, "T", COLOR.O, "E", COLOR.Y, "R",
        COLOR.K, "A", COLOR.G, "S", COLOR.J, "P",
        COLOR.C, "E", COLOR.S, "E", COLOR.B, "D",
    }),
    gigatime   = GC.newText(FONT.get(50)),
    floorTime  = GC.newText(FONT.get(30)),
    rankTime   = GC.newText(FONT.get(30)),
    slogan     = GC.newText(FONT.get(30), "CROWD THE TOWER!"),
    slogan_EX  = GC.newText(FONT.get(30), "THRONG THE TOWER!"),
    slogan_rEX = GC.newText(FONT.get(30), "OVERFLOW THE TOWER!"),
    slogan_uPN = GC.newText(FONT.get(30), "OVERWHELM THE TOWER!"),
    forfeit    = GC.newText(FONT.get(50), "KEEP HOLDING TO FORFEIT"),
    credit     = GC.newText(FONT.get(30), "All assets from TETR.IO"),
}
if fontNotLoaded then
    TASK.new(function()
        local loadTime = love.timer.getTime() + (MATH.roll(.9626) and MATH.rand(2.6, 6.26) or 26)
        while love.timer.getTime() < loadTime do
            TASK.yieldT(0.1)
            if GAME.anyRev then
                TASK.yieldT(0.26)
                SFX.play('staffsilence')
                MSG('dark', "A DARK FORCE INTERRUPTED THE FONT LOADING")
                IssueAchv('dark_force')
                return
            end
            if SCN.cur == 'about' then
                TASK.yieldT(0.26)
                SFX.play('staffspam')
                break
            end
        end
        FONT.setDefaultFont('sans')
        ReloadTexts()
    end)
end

local button_invis = WIDGET.newClass('button_invis', 'button')
button_invis.draw = NULL

Metatable = {
    best_highscore = { __index = function() return 0 end },
    best_speedrun = { __index = function() return 1e99 end },
}
BEST = {
    highScore = setmetatable({}, Metatable.best_highscore),
    speedrun = setmetatable({}, Metatable.best_speedrun),
}

STAT = {
    system = SYSTEM,
    joinDate = os.date("%b %Y"),
    hid = os.date("%d%S%m%M%y%H") .. math.random(2600000000, 6200000000),
    uid = "ANON-" .. os.date("%d_") .. math.random(2600, 6200),
    keybind = {
        "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[",
        "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "'",
        "space", "z", "x", "c", "<Unbound>"
    },
    aboutme = "Click the Zenith!",
    maxFloor = 1,
    maxHeight = 0,
    heightDate = "NO DATE",
    minTime = 2600,
    timeDate = "NO DATE",

    zp = 0,
    dzp = 0,
    dailyBest = 0,
    uDailyBest = 0,
    dailyMastered = false,
    uDailyMastered = false,
    lastDay = 0,
    vipListCount = 0,
    mvpListCount = 0,
    clicker = false,

    totalGame = 0,
    totalTime = 0,
    totalQuest = 0,
    totalPerfect = 0,
    totalHeight = 0,
    totalBonus = 0,
    totalFloor = 0,
    totalFlip = 0,
    totalAttack = 0,
    totalGiga = 0,
    totalF10 = 0,

    revControlType = 1,
    oldHitbox = false,
    fullscreen = true,
    syscursor = false,
    cardBrightness = 90,
    bgBrightness = 40,
    bg = true,
    autoMute = false,
    sfx = 60,
    bgm = 100,

    pnProgress = 0,
    mod = "A Fool's Mod",
}

ACHV = {}

AchvNotice = {}

function SaveBest(backupExt) love.filesystem.write('best.luaon' .. (backupExt or ''), 'return' .. TABLE.dumpDeflate(BEST)) end

function SaveStat(backupExt) love.filesystem.write('stat.luaon' .. (backupExt or ''), 'return' .. TABLE.dumpDeflate(STAT)) end

function SaveAchv(backupExt) love.filesystem.write('achv.luaon' .. (backupExt or ''), 'return' .. TABLE.dumpDeflate(ACHV)) end

MSG.setSafeY(75)
MSG.addCategory('dark', COLOR.D, COLOR.L)

AchvData = {
    [0] = { id = 'achv_none', bg = COLOR.D, fg = COLOR.LD, fg2 = COLOR.LD },
    { id = 'achv_bronze',   bg = COLOR.DO,          fg = COLOR.lO, fg2 = COLOR.O },
    { id = 'achv_silver',   bg = { .26, .26, .26 }, fg = COLOR.L,  fg2 = COLOR.dL },
    { id = 'achv_gold',     bg = COLOR.DY,          fg = COLOR.lY, fg2 = COLOR.Y },
    { id = 'achv_platinum', bg = COLOR.DJ,          fg = COLOR.lJ, fg2 = COLOR.J },
    { id = 'achv_diamond',  bg = COLOR.DP,          fg = COLOR.lP, fg2 = COLOR.lB },
    { id = 'achv_issued',   bg = COLOR.DM,          fg = COLOR.lM, fg2 = COLOR.lM },
}
for i = 0, 6 do MSG.addCategory(AchvData[i].id, AchvData[i].bg, COLOR.L, TEXTURE.achievement.frame[i]) end

TEST = false
NOFAIL = true

local msgTime = 0
local bufferedMsg = {}

function IssueAchv(id, silent)
    if TEST then return end
    local A = Achievements[id]
    if not A or ACHV[id] then return end

    if not silent then
        table.insert(bufferedMsg, { 'achv_issued', {
            AchvData[6].fg, A.name .. "\n",
            COLOR.dL, A.desc .. "\n",
            COLOR.LD, A.quote,
        }, 1 })
        if not GAME.playing then
            ReleaseAchvBuffer()
        end
    end

    ACHV[id] = 0
    AchvNotice[id] = true
    TWEEN.new():setOnFinish(SaveAchv):setDuration(.26):setUnique('achv_saver'):run()

    return true
end

function SubmitAchv(id, score, silent)
    if TEST then return end
    local A = Achievements[id]
    if not A then return end
    local oldScore = ACHV[id] or A.noScore or 0
    local R0, R1 = A.rank(oldScore), A.rank(score)
    -- printf("%s: %.1f(%.2f) -> %.1f(%.2f)", id, oldScore, R0, score, R1)
    if R1 == 0 or not A.comp(score, oldScore) then return end

    if not silent and R1 >= 1 then
        local rank = math.floor(R1)
        local scoreText = A.scoreSimp(score) .. (A.scoreFull and "  " .. A.scoreFull(score) or "")
        local oldScoreText = A.scoreSimp(oldScore) .. (A.scoreFull and "  " .. A.scoreFull(oldScore) or "")
        table.insert(bufferedMsg, { AchvData[rank].id, {
            AchvData[rank].fg, A.name .. "   >>   " .. scoreText,
            COLOR.LD, (ACHV[id] and "    Previous: " .. oldScoreText or "") .. "\n",
            COLOR.dL, A.desc .. "\n", COLOR.LD, A.quote,
        }, rank <= 2 and 1 or rank <= 4 and 2 or 3 })
        if not GAME.playing then
            ReleaseAchvBuffer()
        end
    end

    ACHV[id] = score
    AchvNotice[id] = true
    TWEEN.new():setOnFinish(SaveAchv):setDuration(.26):setUnique('achv_saver'):run()

    return true
end

function ReleaseAchvBuffer()
    for i = 1, #bufferedMsg do
        local msg = bufferedMsg[i]
        msgTime = TASK.lock('achv_bulk', 1) and 6.2 or msgTime + 2.6
        MSG { msg[1], msg[2], time = msgTime, last = true, alpha = .75 }
        if TASK.lock('achv_sfx_' .. msg[3], .08) then
            SFX.play('achievement_' .. msg[3], .7, 0, Tone(0))
        end
    end
    TABLE.clear(bufferedMsg)
end

MX, MY = 0, 0

---@type Map<Card>
Cards = {}

---@type nil|number
FloatOnCard = nil

GigaSpeed = {
    r = 0,
    g = 0,
    b = 0,
    alpha = 0,
    bgAlpha = 0,
    textTimer = false,
    isTera = false,
}
ImpactGlow = {}
DeckPress = 0
ThrobAlpha = {
    card = 0,
    bg1 = 0,
    bg2 = 0,
}
Wind = {}
WindBatch = GC.newSpriteBatch(GC.load { w = 1, h = 1, { 'clear', 1, 1, 1, 1 } }, 260, 'static')
for i = 1, 62 do
    Wind[i] = { math.random(), math.random(), MATH.clampInterpolate(1, 0.5, 260, 2.6, i) }
    WindBatch:add(0, 0)
end
StarPS = GC.newParticleSystem(TEXTURE.stars, 32)
StarPS:setParticleLifetime(2.6)
StarPS:setRotation(0, 6.26)
StarPS:setEmissionRate(12)
---@diagnostic disable-next-line
StarPS:setColors(COLOR.LX, COLOR.L, COLOR.L, COLOR.L, COLOR.L, COLOR.L, COLOR.L, COLOR.LX)

WoundPS = GC.newParticleSystem(GC.load { w = 16, h = 16,
    { 'clear', 1, 1, 1 },
    { 'setCL', 0, 0, 0 },
    { 'fRect', 1, 1, 14, 14 },
}, 32)
WoundPS:setEmissionArea('uniform', 42, 42, 0)
WoundPS:setParticleLifetime(2.6, 6.2)
WoundPS:setSpread(6.28)
WoundPS:setSpeed(26, 42)
---@diagnostic disable-next-line
WoundPS:setColors(COLOR.LX, COLOR.L, COLOR.L, COLOR.L, COLOR.L, COLOR.L, COLOR.L, COLOR.LX)


SparkPS = {}
for i = 1, 3 do
    local ps = GC.newParticleSystem(TEXTURE.spark[i])
    ps:setParticleLifetime(.26, .62)
    ps:setEmissionArea('ellipse', 62, 62, 0)
    ---@diagnostic disable-next-line
    ps:setColors(COLOR.L, COLOR.LX)
    SparkPS[i] = ps
end

BgScale = 1
BgmSets = {
    all = {
        'piano',
        'arp', 'bass', 'guitar', 'pad', 'staccato', 'violin',
        'expert', 'rev',
        'piano2', 'violin2',
    },
    assist = { 'arp', 'bass', 'guitar', 'pad', 'staccato', 'violin' },
}

---@enum (key) ZC.bgmName
BgmData = {
    tera = { meta = '4|4  240 BPM  C# Minor', bar = 4, bpm = 240, toneFix = 1, loop = { 76, 140 }, introLen = 2, teleport = { -1, 20 }, end1 = 140, end2 = 142, end3 = 144, end4 = 146 },
    terar = { meta = '4|4  240 BPM  C# Minor', bar = 4, bpm = 240, toneFix = 1, loop = { 84 - 15.565, 172 - 15.565 }, teleport = { 0, 18 - 15.565 } },
}

BgmPlaying = false ---@type ZC.bgmName | false
BgmLooping = false
BgmNeedSkip = false
BgmNeedStop = false

function RevMusicMode()
    return
        URM and M.EX == 2 or                   -- uEX
        GAME.anyRev and GAME.comboZP >= 2.6 or -- rev run with 2.6x ZP
        GAME.anyUltra and GAME.comboZP >= 1.2  -- ultra run with 1.2x ZP
end

---@param name ZC.bgmName
---@param force? boolean speedrun or music player
function PlayBGM(name, force)
    if GAME.teramusic and not force then return end

    local last = BgmPlaying

    if GAME.playing and RevMusicMode() then name = name .. 'r' end
    --if name == 'fomgr' then name = 'fomg' end
    --if name:sub(1, 2) == 'f0' then
    --    BgmPlaying = 'f0'
    --elseif name:sub(1, 2) == 'f1' and name:sub(1, 3) ~= 'f10' then
    --    BgmPlaying = 'f1'
    --else
        BgmPlaying = name
    --end

    if not BgmData[BgmPlaying] then return end
    BgmLooping = BgmData[BgmPlaying].loop
    BgmNeedSkip = BgmData[BgmPlaying].teleport
    BgmNeedStop = false

    --if BgmPlaying == 'f0' then
    --    BgmLooping = false
    --    BGM.play(BgmSet.f0)
    --    RefreshBGM(name)
    --elseif BgmPlaying == 'f1' then
    --    BGM.play(BgmSet.f1, force and '' or '-sdin')
    --    local start = math.random(3, 5) * BgmData.f1.introLen
    --    BgmNeedSkip[1] = start + BgmData.f1.introLen
    --    BGM.set('all', 'seek', start)
    --    RefreshBGM(name)
    --elseif 
    if name == 'tera' then --or name == 'terae' or name == 'teral' or name == 'terael'then
        BGM.play(name, '-sdin')
        --local startFrom
        --if last then
        --    ---@cast last string
         --   startFrom = tonumber(last:match("%d+"))
        --    if startFrom then startFrom = startFrom - 1 end
        --end
        --local start = (GAME.playing and GAME.floor or startFrom or math.random(0, 9)) * BgmData.tera.introLen
        --BgmNeedSkip[1] = start + BgmData.tera.introLen
        TASK.new(function()
                BGM.set('all', 'seek', math.random(0, 9) * 2) 
                RefreshBGM()
                TASK.yieldT(2)
                BGM.set('all', 'seek', 20)
                RefreshBGM()
            end
        )
    else
        if BGM.play(name, force and '' or '-sdin') then
            RefreshBGM()
        end
    end
end

UAN = os.date("!%m%d") == "0401"
require 'module.game_data'
require 'module.achv_data'

Shader_Coloring = GC.newShader [[vec4 effect(vec4 color, sampler2D tex, vec2 texCoord, vec2 scrCoord) {return vec4(color.rgb, color.a * texture2D(tex, texCoord).a);}]]

GAME = require 'module/game'
local M = GAME.mod

for i = 1, #ModData.deck do table.insert(Cards, require 'module/card'.new(ModData.deck[i])) end
GAME.refreshLayout()
for i, C in ipairs(Cards) do
    Cards[C.id], C.x, C.y = C, C.tx, C.ty + 260 + 26 * 1.6 ^ i
end

SCN.addSwapStyle('warp', {
    duration = 10,
    switchTime = 7.2,
    draw = function(t)
        if t >= .3 then
            GC.setColor(0, 0, 0, MATH.iLerp(1, .7, t))
            GC.rectangle('fill', 0, 0, SCR.w, SCR.h)
            GC.setColor(.85, .85, .85, MATH.iLerp(1, .7, t))
            GC.mRect('fill', SCR.w / 2, SCR.h / 2, SCR.w, MATH.lerp(SCR.h * .005, SCR.h * 1.26, MATH.icLerp(.64, .75, t) ^ 2))
        end
        local a1 = 1 - math.abs(t - .3) * 20
        if a1 > 0 then
            GC.setColor(.85, .85, .85, a1)
            GC.rectangle('fill', 0, 0, SCR.w, SCR.h)
        end
        local a2 = 1 - math.abs(t - .62) * 42
        if a2 > 0 then
            GC.setColor(.62, .62, .62, a2)
            GC.rectangle('fill', 0, 0, SCR.w, SCR.h)
        end
    end,
})

SCN.add('joining', require 'module/scene/joining')
SCN.add('tower', require 'module/scene/tower')
SCN.add('stat', require 'module/scene/stat')
SCN.add('achv', require 'module/scene/achv')
SCN.add('conf', require 'module/scene/conf')
SCN.add('about', require 'module/scene/about')
SCN.add('ending', require 'module/scene/ending')
ZENITHA.setFirstScene('joining')

local gc = love.graphics

local pressValue = 0

CursorProgress = 0
CursorHide = true
local function starCursor(x, y)
    if CursorHide or GAME.zenithTraveler then return end
    GC.translate(x, y)
    GC.scale(1.42)
    GC.rotate(MATH.lerp(-.626, -1.2, pressValue))
    GC.scale(.8 + .2 * pressValue, 1)
    local l = .626 + .374 * pressValue
    GC.setColor(l, l, l)
    GC.draw(TEXTURE.star0, 0, -6, 0, .14, .3, TEXTURE.star1:getWidth() * .5, 0)
    GC.scale(.12, .26)
    GC.setShader(Shader_Coloring)
    GC.setColor(1, .626, .5)
    GC.draw(TEXTURE.star0, -150, 0)
    if CursorProgress <= .384626 then
        local t = MATH.interpolate(0, 1, .384626, 0, CursorProgress)
        GC.setColor(.9, .9, .9, t)
        GC.draw(TEXTURE.star0, -150, 0)
        GC.setShader()
    else
        GC.setShader()
        GC.setColor(1, 1, 1, MATH.iLerp(.384626, 1, CursorProgress))
        GC.draw(TEXTURE.star1, -150, 0)
    end
end

function Tone(pitch)
    return pitch + M.GV - (M.PN == 2 and URM and 0.5 or 0) + (GAME.omega and 1 or 0)
end

function ApplySettings()
    love.mouse.setVisible(STAT.syscursor)
    ZENITHA.globalEvent.drawCursor = STAT.syscursor and NULL or starCursor
    SFX.setVol(STAT.sfx / 100 * .6)
    BGM.setVol(STAT.bgm / 100)
end

function ReloadTexts()
    local sep = (TEXTS.mod:getFont():getHeight() + TEXTS.title:getFont():getHeight()) / 2
    for _, text in next, TEXTS do text:setFont(FONT.get(text:getFont():getHeight() < sep and 30 or 50)) end
    for _, text in next, ShortCut do text:setFont(FONT.get(text:getFont():getHeight() < sep and 30 or 50)) end
    for _, quest in next, GAME.quests do quest.name:setFont(FONT.get(70)) end
    TEXTS.height:setFont(FONT.get(30))
    TEXTS.time:setFont(FONT.get(30))
    TEXTS.gigatime:setFont(FONT.get(50))
    TEXTS.chain2:setFont(FONT.get(50, 'led'))
    for _, W in next, SCN.scenes.tower.widgetList do W:reset() end
    for _, W in next, SCN.scenes.stat.widgetList do W:reset() end
    for _, W in next, SCN.scenes.achv.widgetList do W:reset() end
    for _, W in next, SCN.scenes.conf.widgetList do W:reset() end
    for _, W in next, SCN.scenes.about.widgetList do W:reset() end
    if SCN.cur == 'stat' then RefreshProfile() end
    AboutText:setFont(FONT.get(70))
    EndText:setFont(FONT.get(70))
    EndText2:setFont(FONT.get(70))
end

VALENTINE = false
VALENTINE_TEXT = "FLOOD THE TOWER SIDE BY SIDE WITH WHAT COULD BE"
FOOLS_DAY = false
FOOLS_DAY_TEXT = "INCREASES GAMEPLAY PER CARD BY "
function RefreshDaily()
    local dateToday = os.date("!*t", os.time())
    local dateLastDay = os.date("!*t", math.max(STAT.lastDay, 946656000)) -- at least 2000/1/1
    local time0Today = os.time({ year = dateToday.year, month = dateToday.month, day = dateToday.day })
    local time0LastDay = os.time({ year = dateLastDay.year, month = dateLastDay.month, day = dateLastDay.day })
    local dayPast = MATH.round((time0Today - time0LastDay) / 86400)

    if dayPast < 0 then
        MSG('warn', "Back to the future?", 26)
    else
        if MATH.between(dayPast, 1, 2600) then
            -- print("Old ZP & Daily HS", STAT.zp, STAT.dailyHS)
            STAT.zp = MATH.expApproach(STAT.zp, 0, dayPast * .026)
            STAT.dzp = MATH.expApproach(STAT.dzp, 0, dayPast * .0626)
            STAT.dailyBest = 0
            STAT.uDailyBest = 0
            STAT.dailyMastered = false
            STAT.uDailyMastered = false
            -- print("New ZP & Daily HS", STAT.zp, STAT.dailyHS)
            print("Daily Reset finished")
        end
        STAT.lastDay = os.time()
    end

    for x = 0, 0 do
        math.randomseed(os.date("!%Y%m%d") + x)
        for _ = 1, 26 do math.random() end

        local modCount = math.ceil(9 - math.log(math.random(11, 42), 1.62)) -- 5 444 3333 2222
        DAILY = {}

        DailyActived = false
        DailyAvailable = false

        while #DAILY < modCount do
            local m = ModData.deck[MATH.randFreq { 4, 0, 3, 3, 2, 5, 3, 5, 4, 4, 2 }].id
            if not TABLE.find(DAILY, m) then table.insert(DAILY, m) end
        end
        if MATH.roll(.26 + #DAILY * .1) then
            if #DAILY >= 3 and MATH.roll(.62) then TABLE.popRandom(DAILY) end
            local r = math.random(#DAILY)
            DAILY[r] = 'r' .. DAILY[r]
            if MATH.roll(.26) then
                local r2 = math.random(#DAILY - 1)
                if r2 >= r then r2 = r2 + 1 end
                DAILY[r2] = 'r' .. DAILY[r2]
            end
        end
        -- print(table.concat(DAILY, ' '))
    end

    local v = os.date('!%d') == '14'
    if VALENTINE ~= v then
        VALENTINE = v
        ModData.desc.DP, VALENTINE_TEXT = VALENTINE_TEXT, ModData.desc.DP
        ValentineTextColor, BaseTextColor = BaseTextColor, ValentineTextColor
        ValentineShadeColor, BaseShadeColor = BaseShadeColor, ValentineShadeColor
    end

    v = os.date('!%d') == '01'
    if FOOLS_DAY ~= v then
        FOOLS_DAY = v
        ModData.desc.PN, FOOLS_DAY_TEXT = FOOLS_DAY_TEXT .. (UAN and "ROUGHLY 100%, I THINK?..." or "100%"), ModData.desc.PN
        FoolsDayTextColor, BaseTextColor = BaseTextColor, FoolsDayTextColor
        FoolsDayShadeColor, BaseShadeColor = BaseShadeColor, FoolsDayShadeColor
    end
end

love.mouse.setVisible(false)
ZENITHA.globalEvent.drawCursor = NULL
ZENITHA.globalEvent.clickFX = NULL
function ZENITHA.globalEvent.fileDrop(file)
    local data = file:read('data')
    local suc, res = pcall(GC.newImage, data)
    if suc then
        if AVATAR then AVATAR:release() end
        AVATAR = res
        love.filesystem.write('avatar', data)
        IssueAchv('identity')
        SFX.play('supporter')
        MSG('dark', "Your avatar was updated!")
    else
        MSG('dark', "Invalid image file.")
    end
    file:close()
    file:release()
    if SCN.cur == 'stat' then RefreshProfile() end
end

function ZENITHA.globalEvent.resize()
    BgScale = math.max(SCR.w / 1024, SCR.h / 640)
    StarPS:reset()
    StarPS:moveTo(0, -GAME.bgH * 2 * BgScale)
    StarPS:setEmissionArea('uniform', SCR.w * .626, SCR.h * .626)
    StarPS:setSizes(SCR.k * 1.626)
    local dt = 1 / StarPS:getEmissionRate()
    for _ = 1, StarPS:getBufferSize() do
        StarPS:emit(1)
        StarPS:update(dt)
    end
end

function ZENITHA.globalEvent.keyDown(key, isRep)
    if isRep then return end
    if key == 'f12' then
        if TASK.lock('dev') then
            MSG('check', "Zenith Clicker is powered by Love2d & Zenitha, not Web!", 6.26)
        else
            ZENITHA.setDevMode(not ZENITHA.getDevMode() and 1 or false)
        end
    elseif key == 'f11' then
        STAT.fullscreen = not STAT.fullscreen
        love.window.setFullscreen(STAT.fullscreen)
    elseif key == 'f10' then
        if usingTouch then
            SFX.play('no')
            MSG("dark", "Star Force is not available on mobile.")
            return
        end
        STAT.syscursor = not STAT.syscursor
        SetMouseVisible(true)
        ApplySettings()
    elseif key == 'f9' then
        if not GAME.zenithTraveler then
            STAT.bg = not STAT.bg
        end
    elseif key == 'f8' then
        if STAT.bgBrightness < 80 then
            STAT.bgBrightness = MATH.clamp(STAT.bgBrightness + 10, 30, 80)
            MSG('dark', "BG " .. STAT.bgBrightness .. "%", 1)
        end
    elseif key == 'f7' then
        if STAT.bgBrightness > 30 then
            STAT.bgBrightness = MATH.clamp(STAT.bgBrightness - 10, 30, 80)
            MSG('dark', "BG " .. STAT.bgBrightness .. "%", 1)
        end
    elseif key == 'f5' then
        if STAT.cardBrightness > 80 then
            STAT.cardBrightness = MATH.clamp(STAT.cardBrightness - 5, 80, 100)
            MSG('dark', "Card " .. STAT.cardBrightness .. "%", 1)
        end
    elseif key == 'f6' then
        if STAT.cardBrightness < 100 then
            STAT.cardBrightness = MATH.clamp(STAT.cardBrightness + 5, 80, 100)
            MSG('dark', "Card " .. STAT.cardBrightness .. "%", 1)
        end
    elseif key == 'f3' then
        if STAT.sfx > 0 then
            TempSFX = STAT.sfx
            STAT.sfx = 0
        else
            STAT.sfx = TempSFX or 60
            TempSFX = false
        end
        MSG('dark', STAT.sfx > 0 and "SFX ON" or "SFX OFF", 1)
        ApplySettings()
        SFX.play('menuclick')
    elseif key == 'f4' then
        if STAT.bgm > 0 then
            TempBGM = STAT.bgm
            STAT.bgm = 0
        else
            STAT.bgm = TempBGM or 100
            TempBGM = false
        end
        MSG('dark', STAT.bgm > 0 and "BGM ON" or "BGM OFF", 1)
        ApplySettings()
    end
end

do -- Auto mute when unfocused
    local function task_autoSoundOff()
        coroutine.yield()
        while true do
            local dt = coroutine.yield()
            local v = love.audio.getVolume()
            love.audio.setVolume(math.max(v - dt * 2.6, 0))
            if v == 0 then return end
        end
    end
    local function task_autoSoundOn()
        coroutine.yield()
        while true do
            local dt = coroutine.yield()
            local v = love.audio.getVolume()
            if v < 1 then
                love.audio.setVolume(math.min(v + dt * 2.6, 1))
            else
                return
            end
        end
    end
    function ZENITHA.globalEvent.focus(f)
        if not STAT.autoMute then return end
        if f then
            TASK.removeTask_code(task_autoSoundOff)
            TASK.new(task_autoSoundOn)
        else
            TASK.removeTask_code(task_autoSoundOn)
            TASK.new(task_autoSoundOff)
        end
    end
end

WIDGET.setDefaultOption {
    checkBox = {
        w = 40,
        labelPos = 'right',
        labelDist = 8,
        lineWidth = 2,
        sound_on = 'menuclick',
        sound_off = 'menuclick',
    },
    slider = {
        lineWidth = 2,
        _approachSpeed = 1e99,
    },
}

function WIDGET._prototype.button:draw()
    gc.push('transform')
    gc.translate(self._x, (not self.pos or self.pos[1] ~= .5) and self._y or self._y + DeckPress)

    if self._pressTime > 0 then
        gc.scale(1 - self._pressTime / self._pressTimeMax * .0626)
    end
    local w, h = self.w, self.h

    local fillC = self.fillColor
    local frameC = self.frameColor

    -- Background
    gc.setColor(fillC)
    GC.mRect('fill', 0, 0, w, h)

    -- Frame
    gc.setLineWidth(3)
    gc.setColor(frameC[1] * .42, frameC[2] * .42, frameC[3] * .42)
    gc.line(-w / 2, h / 2, w / 2, h / 2, w / 2, -h / 2 - 1.5)
    gc.setColor(.2 + frameC[1] * .8, .2 + frameC[2] * .8, .2 + frameC[3] * .8)
    gc.line(-w / 2, h / 2 + 1.5, -w / 2, -h / 2, w / 2 - 1.5, -h / 2)

    -- Drawable
    gc.setColor(self.textColor)
    WIDGET._alignDraw(self, self._text, 0, 0, 0, 1.2, 1.2 - 2.4 * GAME.revTimer)

    -- Highlight
    if self._hoverTime > 0 then
        gc.setColor(1, 1, 1, self._hoverTime / self._hoverTimeMax * .0626)
        GC.mRect('fill', 0, 0, w - 3, h - 3)
    end

    gc.pop()
end

function WIDGET._prototype.checkBox:draw()
    gc.push('transform')
    gc.translate(self._x, self._y)
    local w = self.w

    gc.setLineWidth(self.lineWidth)
    if self.disp() then
        -- Active
        gc.setColor(self.frameColor)
        GC.mRect('fill', 0, 0, w, w, 2)
        gc.setColor(0, 0, 0, .42)
        gc.line(-w / 2, w / 2, w / 2, w / 2, w / 2, -w / 2)
        gc.setColor(1, 1, 1, .62)
        gc.line(-w / 2, w / 2, -w / 2, -w / 2, w / 2, -w / 2)
        gc.setLineWidth(self.lineWidth * 2)
        gc.setLineJoin('bevel')
        gc.setColor(1, 1, 1)
        gc.line(-w * .355, 0, 0, w * .355, w * .355, -w * .355)
    else
        -- Background
        gc.setColor(self.fillColor)
        GC.mRect('fill', 0, 0, w, w, 2)
        gc.setColor(0, 0, 0, .626)
        gc.line(-w / 2, w / 2, -w / 2, -w / 2, w / 2, -w / 2)
        gc.setColor(1, 1, 1, .0626)
        gc.line(-w / 2, w / 2, w / 2, w / 2, w / 2, -w / 2)
    end

    -- Drawable
    local x2, y2 = w * .5 + self.labelDist, 0
    gc.setColor(self.textColor)
    WIDGET._alignDraw(self, self._text, x2, y2, nil, self.textScale)

    -- Highlight
    gc.setColor(1, 1, 1, self._hoverTime / self._hoverTimeMax * .0626)
    GC.mRect('fill', 0, 0, w, w, 2)

    gc.pop()
end

function WIDGET._prototype.slider:draw()
    local x, y = self._x, self._y
    local x2 = x + self.w
    local rangeL, rangeR = self._rangeL, self._rangeR

    local frameC = self.frameColor

    -- Axis
    gc.setColor(frameC)
    gc.setLineWidth(self.lineWidth * 2)
    gc.line(x, y, x2, y)

    local fillC = self.fillColor

    -- Block
    local pos = MATH.clamp(self._pos, rangeL, rangeR)
    local cx = x + self.w * (pos - rangeL) / self._rangeWidth
    local bw, bh = 26, 30
    GC.ucs_move('m', cx, y)
    gc.setColor(fillC)
    GC.mRect('fill', 0, 0, bw, bh, self.cornerR)
    gc.setLineWidth(self.lineWidth)
    gc.setColor(0, 0, 0, .26)
    gc.line(-bw / 2, bh / 2, bw / 2, bh / 2, bw / 2, -bh / 2)
    gc.setColor(1, 1, 1, .1)
    gc.line(-bw / 2, bh / 2, -bw / 2, -bh / 2, bw / 2, -bh / 2)
    GC.ucs_back()
end

local uVLpool = {}
function UltraVlCheck(id, auto)
    uVLpool[id] = (uVLpool[id] or 0) + (auto and 3.55 or 1)
    if uVLpool[id] < 3.1 then
        SFX.play('clearline', .3)
        if uVLpool[id] < 1.3 then
            SFX.play('combo_1', .626, 0, Tone(0))
        elseif uVLpool[id] < 2.2 then
            SFX.play('combo_3', .626, 0, Tone(-2))
        else
            SFX.play('combo_2', .626, 0, Tone(1))
        end
        return false
    end
    if not auto then
        SFX.play('clearquad', .3)
        SFX.play('combo_4', .626, 0, Tone(0))
    end
    uVLpool[id] = 0
    return true
end

function RefreshButtonText()
    local W
    W = SCN.scenes.tower.widgetList.start
    W.text =  M.PN > 0 and M.DH > 1 and 'GOOD LUCK' or (M.PN > 0 and 'RUN' or (M.DH > 0 and 'COMMENCE' or 'START'))
    W:reset()
    W = SCN.scenes.tower.widgetList.reset
    W.text = M.AS > 0 and 'SPIN' or 'RESET'
    W:reset()
end

function RefreshBGM(mode)
    if not BGM.isPlaying() then return end
    local pitch = M.GV < 0 and 2^(-1/2) or M.GV > 0 and 2 ^ ((URM and M.GV == 2 and 3 or M.GV) / 12) or 1
    if not GAME.manualBGMPitch or GAME.height >= 1650 then
        if GAME.slowmo then pitch = pitch / 2 end
        if GAME.nightcore then pitch = pitch * 2 end
        -- Trevor Smithy
        if GAME.eslowmo then pitch = pitch * 2^(-1/2) end
        if GAME.enightcore then pitch = pitch * 2 end
        --
    else
        pitch = GAME.nightcore and GAME.manualBGMPitch or GAME.slowmo and 1/GAME.manualBGMPitch or pitch
    end
    local justBegin = BGM.tell() < 1
    BGM.set('all', 'pitch', pitch, justBegin and 0 or .26)
    BGM.set('all', 'highgain', M.IN == 0 and 1 or M.IN == 1 and .8 or not URM and .626 or .55, justBegin and 0 or .626)
    if BgmPlaying == 'f0' then
        local revMode = mode == 'f0r' or RevMusicMode()
        BGM.set('all', 'volume', revMode and 0 or 1, 2.6)
        -- Trevor Smithy > to ~=
        BGM.set('expert', 'volume', M.EX > 0 and 1 or (URM and M.EX == -1 and M.NH < 2 and M.MS < 2 and M.GV < 2 and M.VL < 2 and M.DH < 2 and M.IN < 2 and M.AS < 2 and M.DP < 2) and 0.5 or 0, .26)
        BGM.set('piano', 'volume', M.NH == 0 and 1 or M.NH == 1 and .26 or 0)
        BGM.set('piano2', 'pitch', 2 * pitch, 0)
        BGM.set('piano2', 'volume', (M.DP ~= 0 or VALENTINE and not revMode) and .626 or 0, .26)
        BGM.set('violin', 'volume', M.DP == 2 and 1 or 0, .26)
        BGM.set('violin2', 'volume', M.DP == 2 and 1 or 0, .26)
        BGM.set('rev', 'volume', revMode and (M.DP ~= 0 and .5 or .7) or 0, revMode and 1.6 or 2.6)
    elseif BgmPlaying == 'f1' then
        local revMode = mode == 'f1r' or RevMusicMode()
        BGM.set('f1', 'volume', 1)
        BGM.set('f1ex', 'volume', M.EX > 0 and 1 or 0, 0)
        BGM.set('f1rev', 'volume', revMode and 1 or 0, 0)
    end
end

function Task_MusicEnd(manual)
    BgmLooping = false
    local D = BgmData[BgmPlaying]
    local outroStart
    --[[ if BgmPlaying == 'f1' then
        outroStart = D.loop[2] + 4 * 60 / D.bpm
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f2' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f3' then
        if BGM.tell() < D.loop[1] then
            outroStart = D.end1
        else
            outroStart = D.end2
        end
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f4' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 10 * 60 / D.bpm
    elseif BgmPlaying == 'f5' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f6' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 4 * 60 / D.bpm
    elseif BgmPlaying == 'f7' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f8' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f9' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f10' then
        if BGM.tell() < 28 * 4 * 60 / D.bpm then
            BGM.stop(4.2)
            TASK.yieldT(4.2)
        elseif BGM.tell() < 59 * 4 * 60 / D.bpm then
            BGM.set('all', 'seek', 59 * 4 * 60 / D.bpm)
            BgmNeedStop = BGM.tell() + 5 * 60 / D.bpm
        elseif BGM.tell() < 77.25 * 4 * 60 / D.bpm then
            BGM.stop(4.2)
            TASK.yieldT(4.2)
        else
            outroStart = D.loop[2]
            BgmNeedStop = outroStart + 8 * 60 / D.bpm
        end
    elseif BgmPlaying == 'fomg' then
        if BGM.tell() > D.loop[1] then
            outroStart = D.loop[2]
            BgmNeedStop = outroStart + 13 * 60 / D.bpm
        else
            outroStart = D.loop[2] + 16 * 60 / D.bpm
            BgmNeedStop = outroStart + 8 * 60 / D.bpm
        end
    elseif BgmPlaying == 'f1r' then
        outroStart = D.loop[2] + 4 * 60 / D.bpm
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f2r' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'f3r' then
        outroStart = D.loop[2]
        BgmNeedStop = outroStart + 8 * 60 / D.bpm ]]
    --elseif BgmPlaying == 'f4r' then
    --    outroStart = D.loop[2]
    --    BgmNeedStop = outroStart + 10 * 60 / D.bpm
    --elseif BgmPlaying == 'f5r' then
    --    outroStart = D.loop[2]
    --    BgmNeedStop = outroStart + 8 * 60 / D.bpm
    --elseif BgmPlaying == 'f6r' then
    --    outroStart = D.loop[2]
    --    BgmNeedStop = outroStart + 4 * 60 / D.bpm
    --elseif BgmPlaying == 'f7r' then
    --    outroStart = D.loop[2]
    --    BgmNeedStop = outroStart + 8 * 60 / D.bpm
    --elseif BgmPlaying == 'f8r' then
    --    outroStart = D.loop[2]
    --    BgmNeedStop = outroStart + 8 * 60 / D.bpm
    --elseif BgmPlaying == 'f9r' then
    --    outroStart = D.loop[2]
    --    BgmNeedStop = outroStart + 8 * 60 / D.bpm
    --elseif BgmPlaying == 'f10r' then
    --    if BGM.tell() < 28 * 4 * 60 / D.bpm then
    --        BGM.stop(6.2)
    --        TASK.yieldT(6.2)
    --    elseif BGM.tell() < 59 * 4 * 60 / D.bpm then
    --        BGM.set('all', 'seek', 59 * 4 * 60 / D.bpm)
    --        BgmNeedStop = BGM.tell() + 5 * 60 / D.bpm
    --    elseif BGM.tell() < 77.25 * 4 * 60 / D.bpm then
    --        BGM.stop(6.2)
    --        TASK.yieldT(6.2)
    --    else
    --        outroStart = D.loop[2]
    --        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    --    end
    --else
    if BgmPlaying == 'tera' then
        outroStart = D.loop[2] + math.random(0, 3) * 8 * 60 / D.bpm
        BgmNeedStop = outroStart + 8 * 60 / D.bpm
    elseif BgmPlaying == 'terar' then
        outroStart = D.loop[2] + 96 * 60 / D.bpm
        BgmNeedStop = outroStart + 30 * 60 / D.bpm
    --else
    --    BgmNeedStop = BGM.tell() + 4 * 60 / D.bpm
    end
    if outroStart then BGM.set('all', 'seek', outroStart) end
    BgmLooping, BgmNeedSkip = false, false
    if BgmNeedStop then
        repeat TASK.yieldT(.0626) until not BgmNeedStop
    else
        repeat TASK.yieldT(.0626) until not BGM.isPlaying()
    end
    if not manual then
        PlayBGM('f0')
        GAME.refreshRPC()
    end
end

-- Muisc syncing daemon
-- DiscordRPC syncing daemon
DiscordState = {}
function Daemon_Slow()
    TASK.yieldT(1)
    local lib = BGM._srcLib
    local set = BgmSets.all
    local length = BGM.getDuration()
    while true do
        local t0 = lib[set[1]].source:tell()
        for i = #set, 2, -1 do
            local obj = lib[set[i]]
            local T = t0
            if set[i] == 'piano2' then T = T * 2 % length end
            if set[i] == 'violin2' then T = (T - 8 * 60 / 184) % length end
            if math.abs(obj.source:tell() - T) > 0.026 then
                -- print('Desync', set[i])
                obj.source:seek(math.max(T, 0))
            end
        end
        if DiscordState.needUpdate and not TASK.getLock('RPC_update') then
            DiscordState.needUpdate = nil
            DiscordRPC.update(DiscordState)
        end
        TASK.yieldT(1)
    end
end

-- Throb tranpaency daemon
-- Messy position daemon
-- Expert guitar randomization daemon
-- Mouse holding animation daemon
function Daemon_Fast()
    local max = math.max
    local hsv = COLOR.HSV
    local yield = coroutine.yield
    local msIsDown = love.mouse.isDown
    local expApproach = MATH.expApproach

    local bar = 2 * 60 / 184 * 4
    local t1, step1 = -.1, 2 * 60 / 184
    local t2, step2 = 0, 2 * 60 / 184 / 4
    local exLastVol = 0
    local t = 0
    while true do
        local T = BGM.tell()
        ThrobAlpha.card = max(.626 - 2 * T / bar % 1, .626 - 2 * (T / bar - .375) % 1)
        ThrobAlpha.bg1 = .626 - 2 * T / bar % 1
        ThrobAlpha.bg2 = .626 - 2 * (T / bar - 1 / 32) % 1

        if GigaSpeed.alpha > 0 then
            GigaSpeed.r, GigaSpeed.g, GigaSpeed.b = hsv(T / bar % 1, .626, 1)
            GigaSpeed.bgAlpha = 1 - 4 * T / bar % 1
        end

        if T < t1 then t1 = -.1 end
        if T > t1 + step1 then
            t1 = t1 + step1
            if M.MS == 0 then
                for i = 1, 11 do Cards[i].visY = 0 end
            elseif URM and M.MS == 2 then
                for i = 1, 11 do Cards[i].visY = math.random(-42, 42) end
            else
                for i = 1, 11 do Cards[i].visY = M.MS * math.random(-4, 4) end
            end
            GAME.refreshLayout()
        end

        if T < t2 then t2 = 0 end
        if T > t2 + step2 then
            t2 = t2 + step2
            if M.EX > 0 then
                if not SCN.swapping then
                    local r = math.random()
                    local f = GAME.floor
                    r = 1 + (r - 1) / (f * r + 1)
                    r = MATH.clamp(r, exLastVol - (26 - f) * .02, exLastVol + (26 - f) * .02)
                    BGM.set('expert', 'volume', r, r > exLastVol and .0626 or .26)
                    exLastVol = r
                end
            end
        end

        local dt = yield()

        if not STAT.syscursor then
            pressValue = msIsDown(1, 2) and 1 or expApproach(pressValue, 0, dt * 12)
        end

        for k, v in next, uVLpool do
            uVLpool[k] = max(v - dt, 0)
        end

        if GAME.revDeckSkin and SYSTEM ~= 'Web' then
            if M.NH > 0 then dt = dt * (1 - M.NH * .42) end
            if M.AS > 0 then dt = dt * (1 + M.AS) end
            t = t + dt
            local v = dt * GAME.bgXdir * (26 + 2.6 * GAME.rank)
            if M.GV > 0 then v = v * (.62 + M.GV * 2.6 * math.sin(t * 2.6 * (M.GV - .5))) end
            GAME.bgX = GAME.bgX + v
        end
    end
end

-- Load data
if FILE.exist('data.luaon') then
    if not FILE.exist('best.luaon') then
        love.filesystem.write('best.luaon', love.filesystem.read('data.luaon'))
    end
    love.filesystem.remove('data.luaon')
end
if FILE.exist('conf.luaon') then love.filesystem.remove('conf.luaon') end
TABLE.update(BEST, FILE.load('best.luaon', '-luaon') or NONE)
TABLE.update(STAT, FILE.load('stat.luaon', '-luaon') or NONE)
TABLE.update(ACHV, FILE.load('achv.luaon', '-luaon') or NONE)
if FILE.exist('avatar') then
    local suc, res = pcall(GC.newImage, 'avatar')
    if suc then AVATAR = res end
end

local function getCompletion(id)
    local f10 = Floors[9].top
    local scores = BEST.highScore
    local res = 0
    for cmb, h in pairs(scores) do
        local form = ""
        local i = 1
        while i <= #cmb do
            local c = cmb:sub(i, i)
            local unit
            if c == "r" or c == "u" then
                -- check if there are enough characters
                if i+2 > #cmb then
                    form = nil  -- invalid, not enough characters
                    break
                end
                unit = cmb:sub(i, i+2)
                -- validate the last two characters are uppercase
                if not unit:sub(2,3):match("^%u%u$") then
                    form = nil  -- invalid, not two uppercase letters
                    break
                end
                i = i + 3
            else
                -- check if there are enough characters
                if i+1 > #cmb then
                    form = nil  -- invalid, not enough characters
                    break
                end
                -- add a space if not at end
                if i <= #cmb then
                    form = form .. " "
                end
                unit = cmb:sub(i, i+1)
                -- validate both characters are uppercase
                if not unit:match("^%u%u$") then
                    form = nil  -- invalid
                    break
                end
                i = i + 2
            end
            -- append unit
            form = form .. unit
        end
        if form then
            local prefix = form:match("([ru ])" .. id)
            local tier = prefix == " " and 1 or prefix == "r" and 2 or prefix == "u" and 3 or 0
            if h >= f10 and tier > res then
                res = tier
            end
        end
    end
    return res
end

function Initialize(save, fromBackup)
    if STAT.totalF10 == 0 and STAT.totalGiga > 0 then STAT.totalF10 = math.floor(STAT.totalGiga * 0.872) end
    if STAT.totalBonus == 0 and STAT.totalGame > 2.6 then STAT.totalBonus = STAT.totalHeight * 0.5 end
    if STAT.totalPerfect == 0 and STAT.totalQuest > 0 then STAT.totalPerfect = math.floor(STAT.totalQuest * 0.872) end
    if BEST.version then STAT.version, BEST.version = BEST.version, nil end
    local oldVer = STAT.version
    if STAT.version == nil then
        for k in next, BEST.highScore do
            if k:find('rNH') or k:find('rMS') or k:find('rVL') or k:find('rAS') then
                BEST.highScore[k] = nil
            end
        end
        STAT.version = 162
    end
    if STAT.version == 162 then
        TABLE.clear(BEST.speedrun)
        STAT.version = 163
    end
    if STAT.version == 163 then
        STAT.maxFloor = BEST.maxFloor or 1
        BEST.maxFloor = nil
        STAT.version = 166
    end
    if STAT.version == 166 then
        STAT.sfx = STAT.sfx and 60 or 0
        STAT.bgm = STAT.bgm and 100 or 0
        STAT.version = 167
    end
    if STAT.version == 167 then
        STAT.dzp = STAT.dailyHS or 0
        STAT.dailyHS = nil
        STAT.version = 168
    end
    if STAT.version == 168 or STAT.version == 169 then
        if ACHV.patience_is_a_virtue and ACHV.patience_is_a_virtue > 0 and ACHV.talentless == ACHV.patience_is_a_virtue then ACHV.patience_is_a_virtue = nil end
        ACHV.mastery = nil
        ACHV.terminal_velocity = nil
        ACHV.false_god = nil
        ACHV.supremacy = nil
        ACHV.the_completionist = nil
        ACHV.sunk_cost, ACHV.sink_cost = ACHV.sink_cost, nil
        STAT.version = 170
    end
    if STAT.version == 170 then
        ACHV.block_rationing = nil
        STAT.version = 171
    end
    if STAT.version == 171 then
        ACHV.worn_out = nil
        STAT.version = 172
    end
    if STAT.version == 172 then
        ACHV.speedrun_speedrunning = ACHV.speedrun_speedruning
        STAT.version = 173
    end
    if STAT.version == 173 then
        ACHV.cruise_control, ACHV.stable_rise = ACHV.stable_rise, nil
        ACHV.subjugation, ACHV.supremacy = ACHV.supremacy, nil
        ACHV.smooth_dismount, ACHV.somersault = ACHV.somersault, nil
        ACHV.omnipotence, ACHV.the_completionist = ACHV.omnipotence, nil
        STAT.version = 174
    end
    if STAT.version == 174 then
        ACHV.overprotection, ACHV.overprotectiveness = ACHV.overprotection, nil
        STAT.version = 175
    end

    -- Some Initialization
    for i = 1, #Cards do
        local id = Cards[i].id

        GAME.completion[id] = getCompletion(id)
    end

    -- Auto fixing
    local realBestHeight = math.max(STAT.maxHeight, TABLE.maxAll(BEST.highScore), 0)
    if STAT.maxHeight > realBestHeight + .1 then
        STAT.maxHeight = realBestHeight
        STAT.heightDate = "NO DATE"
    end
    local realBestTime = math.min(STAT.minTime, TABLE.minAll(BEST.speedrun), 2600)
    if STAT.minTime < realBestTime - .1 then
        STAT.minTime = realBestTime
        STAT.timeDate = "NO DATE"
    end
    GAME.refreshLockState()
    local needsRefresh = false
    for i = 1, #Cards do
        local id = Cards[i].id

        if Cards[i].lock then
            GAME.completion[id] = 0
            needsRefresh = true
        end
    end
    if needsRefresh then GAME.refreshLockState() end
    if not fromBackup then
        local foundIllegal = false
        for cmb in next, TABLE.flatten(TABLE.copyAll(BEST), _, _, false) do
            local score, speed = BEST.highScore[cmb], BEST.speedrun[cmb]
            local illegal = cmb:gmatch("([A-Z][A-Z]).*%1")() and true or (STRING.count(cmb, 'u') > 0 and STRING.count(cmb, 'r') > 0)
            if not illegal then
                if speed and (not score or score < Floors[9].top or speed < 0) then illegal = 2 end
                if score and score < Floors[0].top then illegal = illegal == 2 or 1 end
                if illegal ~= true then
                    local i = 1
                    while i <= #cmb do
                        local offset = cmb:match("^[ru]", i) and 1 or 0
                        local baseID = cmb:sub(i + offset, i + offset + 1)
                        if offset == 1 and GAME.completion[baseID] == 0 or Cards[baseID].lock then
                            illegal = true
                            break
                        end
                        i = i + offset + 2
                    end
                end
            end
            if illegal then
                if not foundIllegal then
                    foundIllegal = true
                    SaveStat(".backup")
                    SaveBest(".backup")
                    SaveAchv(".backup")
                end
                BEST.highScore[cmb], BEST.speedrun[cmb] = illegal == 2 and score or nil, illegal == 1 and speed or nil
            end
        end
        if foundIllegal then
            SaveBest()
            SaveStat()
            SaveAchv()
        end
    end
    local achvLost = ""
    for k in next, ACHV do
        if not Achievements[k] then
            ACHV[k] = nil
            achvLost = achvLost .. "[" .. (k) .. "]\n"
        end
    end
    if #achvLost > 0 then
        MSG('dark', "Achievements lost due to update:\n" .. achvLost:sub(1, #achvLost - 1), 6.26)
    end

    if usingTouch then STAT.syscursor = true end
    
    GAME.refreshPBText()
    love.window.setFullscreen(STAT.fullscreen)
    ApplySettings()
    GAME.refreshCursor()

    if save or STAT.version ~= oldVer then
        SaveStat()
        SaveBest()
        SaveAchv()
    end
end

function UseAltName()
    TABLE.update(ModData, {
        fullName = {
            PN = "< TETR.IO >",
            EX = "< MASTER >",
            NH = "< IRREVOCABILITY >",
            MS = "< CHEESE >",
            GV = "< DECLINATION >",
            VL = "< INSTABILITY >",
            DH = "< MISCHIEVOUSNESS >",
            IN = "< HIDING >",
            AS = "< ROLLING >",
            DP = "< ROMANCE >",
        },
        adj = {
            PN = "FOOLISH",
            EX = "MASTERFUL",
            NH = "FINAL",
            MS = "CHEESY",
            GV = "DECLINING",
            VL = "UNSTABLE",
            DH = "MISCHIEVOUS",
            IN = "HIDDEN",
            AS = "ROLLING",
            DP = "ROMANTIC",
            rPN = "AVOIDANT",
            rEX = "FORCED",
            rNH = "DECAYED",
            rMS = "LYING",
            rGV = "CRUMBLING",
            rVL = "CLINGY",
            rDH = "RITUALISTIC",
            rIN = "SHUNNED",
            rAS = "LOCKED",
            rDP = "PAINFUL",
        },
        noun = {
            PN = "FOOLISHNESS",
            EX = "MASTER",
            NH = "FINALITY",
            MS = "CHEESE",
            GV = "DECLINATION",
            VL = "INSTABILITY",
            DH = "MISCHIEVOUSNESS",
            IN = "HIDING",
            AS = "ROLLING",
            DP = "ROMANCE",
            rPN = "AVOIDANCE",
            rEX = "RULER",
            rNH = "DESCENDANT",
            rMS = "LIAR",
            rGV = "RUINS",
            rVL = "CLINGINESS",
            rDH = "RITUAL",
            rIN = "OUTCAST",
            rAS = "NO SPIN",
            rDP = "PAIN",
        },
    })
end

ForceOldHitbox = STAT.oldHitbox
if ForceOldHitbox then TEXTS.version:set(SYSTEM .. (ForceOldHitbox and " T" or " V") .. (require 'version'.verStr)) end
GAME.pnProgress = STAT.pnProgress
Initialize()
if UAN then UseAltName() end
RefreshDaily()
TABLE.update(TextColor, BaseTextColor)
TABLE.update(ShadeColor, BaseShadeColor)
GAME.refreshCurrentCombo()

if SYSTEM == 'Web' then
    _G[('DiscordRPC')] = { update = NULL, setEnable = NULL }
else
    DiscordRPC = require 'module/discordRPC'
    DiscordRPC.setEnable(true)
    DiscordRPC.update {
        details = "QUICK PICK",
        state = "Enjoying Music",
    }
end

-- Debug
for i = 1, 4 do SCN.scenes._console.widgetList[i].textColor = COLOR.D end
TASK.new(function()
    for _, s in next, ([[ ]]):trim():split('%s+', true) do
        TASK.yieldT(1)
        SFX.play(s)
    end
end)
