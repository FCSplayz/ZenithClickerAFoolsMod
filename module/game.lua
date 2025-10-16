local max, min = math.max, math.min
local floor, ceil = math.floor, math.ceil
local abs, rnd = math.abs, math.random
local roundUnit = MATH.roundUnit
local expApproach = MATH.expApproach
local lerp, cLerp, icLerp = MATH.lerp, MATH.cLerp, MATH.icLerp
local lLerp = MATH.lLerp
local clampInterpolate = MATH.clampInterpolate

local ins, rem = table.insert, table.remove

---@class Question
---@field combo string[]
---@field name love.Text
---@field y number
---@field k number
---@field a number

---@class ReviveTask:Prompt
---@field progress number
---@field textObj love.Text
---@field shortObj love.Text
---@field progObj love.Text

---@class Game
---@field playing boolean
---@field finishTime number
---
---@field prevPB number
---@field comboStr string
---@field totalFlip number
---@field totalQuest number
---@field totalPerfect number
---@field totalAttack number
---@field heightBonus number
---@field peakRank number
---@field rankTimer integer[]
---
---@field time number
---@field gigaTime false | number
---@field questTime number
---@field floorTime number
---@field secTime number[]
---
---@field rank number
---@field xp number
---@field rankupLast boolean
---@field xpLockLevel number
---@field xpLockTimer number
---
---@field floor number
---@field height number
---@field roundHeight number for statistics and achievement
---@field heightBuffer number
---@field fatigueSet {time:number, event:table, text:string, desc:string, color?:string, duration?:number}[]
---@field fatigue number
---@field animDuration number
---
---@field maxQuestCount number
---@field maxQuestSize number
---@field extraQuestBase number
---@field extraQuestVar number
---@field questFavor number Higher questFavor will result in mods generated consecutively more often, in design
---@field dmgHeal number
---@field dmgWrong number
---@field dmgWrongExtra number
---@field dmgTime number
---@field dmgDelay number
---@field dmgCycle number
---
---@field life number
---@field fullHealth number
---@field dmgTimer number
---@field chain number
---@field gigaspeed boolean
---@field gigaspeedEntered false | number time when enter
---@field atkBuffer number
---@field atkBufferCap number
---@field shuffleMessiness number | false
---@field lastCommit string[]
---
---@field spikeTimer number
---@field spikeCounter number
---@field spikeCounterWeak number
---@field maxSpike number
---@field maxSpikeWeak number
---
---@field gravDelay false | number
---@field gravTimer false | number
---
---@field omega boolean
---@field negFloor number
---@field negEvent number
---@field timerMul number
---@field attackMul number
---@field xpLockLevelMax number
---@field invincible boolean
---
---@field onAlly boolean
---@field life2 number
---@field rankLimit number
---@field reviveCount number
---@field reviveDifficulty number
---@field killCount number
---@field quests Question[]
---@field reviveTasks ReviveTask[]
---@field currentTask ReviveTask |false
---@field DPlock boolean
---@field lastFlip number | false
local GAME = {
    forfeitTimer = 0,
    exTimer = 0,
    anyRev = false,
    revTimer = 0,
    revDeckSkin = false,
    upnTimer = 0,
    uiHide = 0,
    lightHide = 0,
    colorProg = 1,
    bgX = 0,
    bgXdir = 0,
    bgH = 0,
    bgLastH = 0,
    lifeShow = 0,
    lifeShow2 = 0,
    prevPB = -260,
    modIB = GC.newSpriteBatch(TEXTURE.modIcon),
    resIB = GC.newSpriteBatch(TEXTURE.modIcon),
    comboMP = 0,
    comboZP = 1,
    ultraRun = false,

    pnProgress = 0,
    completion = { -- 0=not mastered, 1=mastered, 2=rev mastered, 3=ultra mastered
        PN = 0,
        SB = 0,
        EX = 0,
        NH = 0,
        MS = 0,
        GV = 0,
        VL = 0,
        DH = 0,
        IN = 0,
        AS = 0,
        DP = 0,
    },

    mod = {
        PN = 0,
        SB = 0,
        EX = 0,
        NH = 0,
        MS = 0,
        GV = 0,
        VL = 0,
        DH = 0,
        IN = 0,
        AS = 0,
        DP = 0,
    },
    hardMode = false,
    numberRev = false,

    questsGenerated = 0,

    bufferCombo = nil,
    quests = {},
    reviveTasks = {},
    currentTask = false,
    lastFlip = false,

    zenithTraveler = false,
    nightcore = false,
    slowmo = false,
    glassCard = false,
    invisCard = false,
    invisDashboard = false,

    achv_perfectionistH = nil,
    achv_demoteH = nil,
    achv_carriedH = nil,
    achv_arroganceH = nil,
    achv_powerlessH = nil,
    achv_patienceH = nil,
    achv_spotlessH = nil,
    achv_talentlessH = nil,
    achv_honeymoonH = nil,
    achv_breakupH = nil,
    achv_protectH = nil,
    achv_maxChain = nil,
    achv_maxReviveH = nil,
    achv_totalDmg = nil,
    achv_clutchQuest = nil,
    achv_escapeBurnt = nil,
    achv_escapeQuest = nil,
    achv_felMagicBurnt = nil,
    achv_felMagicQuest = nil,
    achv_resetCount = nil,
    achv_obliviousQuest = nil,
}

GAME.playing = false
GAME.finishTime = -2600
GAME.fullHealth = 20
GAME.life = 0
GAME.life2 = 0
GAME.time = 0
GAME.spikeCounter = 0
GAME.spikeTimer = 0
GAME.floorTime = 2.6
GAME.floor = 1
GAME.rank = 1
GAME.xp = 0
GAME.height = 0
GAME.chain = 0

local M = GAME.mod
local MD = ModData
local CD = Cards

--- Unsorted, like {'rEX','NH',...}
function GAME.getHand(real)
    local list = {}
    if real then
        -- FOR ULTIMATE SPEED
        if M.PN > 0 then ins(list, M.PN == 1 and 'PN' or 'rPN') end
        if M.SB > 0 then ins(list, M.SB == 1 and 'SB' or 'rSB') end
        if M.EX > 0 then ins(list, M.EX == 1 and 'EX' or 'rEX') end
        if M.NH > 0 then ins(list, M.NH == 1 and 'NH' or 'rNH') end
        if M.MS > 0 then ins(list, M.MS == 1 and 'MS' or 'rMS') end
        if M.GV > 0 then ins(list, M.GV == 1 and 'GV' or 'rGV') end
        if M.VL > 0 then ins(list, M.VL == 1 and 'VL' or 'rVL') end
        if M.DH > 0 then ins(list, M.DH == 1 and 'DH' or 'rDH') end
        if M.IN > 0 then ins(list, M.IN == 1 and 'IN' or 'rIN') end
        if M.AS > 0 then ins(list, M.AS == 1 and 'AS' or 'rAS') end
        if M.DP > 0 then ins(list, M.DP == 1 and 'DP' or 'rDP') end
        -- for i = 1, 9 do
        --     local D = MD.deck[i]
        --     local level = M[D.id]
        --     if level == 1 then
        --         ins(list, D.id)
        --     elseif level == 2 then
        --         ins(list, 'r' .. D.id)
        --     end
        -- end
    else
        -- FASTER
        for i = 1, 11 do
            if CD[i].active then
                ins(list, (not real and CD[i].reversed and "r" or "") .. CD[i].id)
            end
        end
        -- for _, C in ipairs(Cards) do
        --     if C.active then
        --         ins(list, C.id)
        --     end
        -- end
    end
    return list
end

---@param list string[]
function GAME.getComboMP(list)
    return #table.concat(list) - #list
end

---@param list string[]
function GAME.getComboZP(list)
    local m = TABLE.getValueSet(list)
    local zp = 1

    if m.PN then zp = zp * 1.25 elseif m.rPN then zp = zp * (m.rDH and 2.9431 or 1.85) end
    if m.EX then zp = zp * 1.4 elseif m.rEX then zp = zp * 2.6 end
    if m.NH then zp = zp * 1.1 elseif m.rNH then zp = zp * 1.6 end
    if m.MS then zp = zp * 1.2 elseif m.rMS then zp = zp * 2.0 end
    if m.GV then zp = zp * 1.1 elseif m.rGV then zp = zp * (1.2 + .020026 * (#list - 1)) end
    if m.VL then zp = zp * 1.1 elseif m.rVL then zp = zp * (1.2 + .020026 * (#list - 1)) end
    if m.DH then zp = zp * 1.2 elseif m.rDH then zp = zp * (m.rIN and 2 or 1.6) end
    if m.IN then zp = zp * 1.1 elseif m.rIN then zp = zp * (m.rNH and ((m.DP or m.rDP) and 2 or 2.2) or 1.6) end
    if m.AS then zp = zp * .85 elseif m.rAS then zp = zp * 1.1 end
    if m.DP then zp = zp * .95 elseif m.rDP then zp = zp * (m.rEX and 1.6 or 2.2) end

    local hardCnt = STRING.count(table.concat(list), "r")
    if m.EX then hardCnt = hardCnt + 1 end
    if hardCnt >= 2 then zp = zp * 0.99 ^ (hardCnt - 1) end

    return zp
end

local function modSortFunc(a, b) return MD.prio_name[a] < MD.prio_name[b] end

---@param list string[] WILL BE SORTED!!!
---@param mode? 'ingame' | 'button' | 'rpc'
function GAME.getComboName(list, mode)
    local len = #list
    local rCount = string.count(table.concat(list), "r")
    if mode == 'ingame' then
        local fstr = {}

        -- Empty
        if len == 0 then
            list = {""}
            fstr = { { COLOR.HEX "FFFFFF" }, UAN and "NULL" or "NOTHING" }
            len = 1
        end

        -- Super Set
        local comboText
        if not GAME.anyRev and not TABLE.find(list, 'DP') then
            if rCount == 10 then
                comboText = [["SINGULARITY"]]
            elseif rCount == 0 and not TABLE.find(list, 'rPN') then
                if not TABLE.find(list, 'PN') then
                    if len == 8 then comboText = [["SWAMP WATER"]]
                    elseif len == 7 then comboText = [["SWAMP WATER LITE"]] end
                elseif len == 9 then comboText = [["WHY"]]
                elseif len == 8 then comboText = [["WHY LITE"]] end
            end
            if comboText then
                fstr = comboText:atomize()
                for i = #fstr, 1, -1 do
                    ins(fstr, i, i % #fstr <= 1 and COLOR.dL or COLOR.random(5))
                end
                return fstr
            end
        end

        -- Named Combo
        local combo = (M.DH == 2 and ComboData.gameEX or ComboData.game)[table.concat(TABLE.sort(list), ' ')]
        if combo then
            fstr = combo.name:atomize()
            if URM and M.DH == 2 then
                rem(fstr, #fstr)
                local e = rem(fstr)
                rem(fstr, 1)
                local s = rem(fstr, 1)
                TABLE.shuffle(fstr)
                ins(fstr, 1, s)
                ins(fstr, 1, "\"")
                ins(fstr, e)
                ins(fstr, "\"")
            end
            for i = #fstr, 1, -1 do
                ins(fstr, i, { MATH.rand(.872, 1), MATH.rand(.872, 1), MATH.rand(.872, 1) })
            end
            if M.IN == 0 then
                local colors = {}
                local baseColor = TABLE.copyAll(MD.color)
                baseColor.SB = { COLOR.HEX "181EC1" }
                local shuff = GAME.genShuffledColors(baseColor)
                for i = 1, #list do ins(colors, (M.PN == 2 and URM and shuff or baseColor)[string.gsub(list[i], "r", "")]) end
                local colorAdjust = {
                    PN = -.0626,
                    rPN = .626,
                    rSB = .1262,
                    rEX = .27807,
                    rMS = .326,
                    rGV = .269,
                    rVL = .177,
                    rDH = .26,
                    rIN = .126,
                    rAS = .5,
                    rDP = .262,
                }
                for i = 1, #list do
                    if string.count(list[i], "r") == 1 or list[i] == "PN" then
                        colors[i] = TABLE.copy(colors[i])
                        colors[i][1] = colors[i][1] - .47807 - (colorAdjust[list[i]] and colorAdjust[list[i]] or 0)
                        colors[i][2] = colors[i][2] - .47807 - (colorAdjust[list[i]] and colorAdjust[list[i]] or 0)
                        colors[i][3] = colors[i][3] - .47807 - (colorAdjust[list[i]] and colorAdjust[list[i]] or 0)
                    end
                end
                if #colors == 1 then
                    for i = 1, #fstr, 2 do
                        local org = fstr[i]
                        local expSpeed = (list[1] == "SB" or list[1] == "rSB") and .626 or .42
                        org[1] = expApproach(org[1], colors[1][1], expSpeed)
                        org[2] = expApproach(org[2], colors[1][2], expSpeed)
                        org[3] = expApproach(org[3], colors[1][3], expSpeed)
                    end
                else
                    colors = TABLE.transposeNew(list[1] == "" and { { COLOR.HEX "FFFFFF" } } or TABLE.shuffle(colors))
                    local snowmanIndex = TABLE.find(list, "SB") or TABLE.find(list, "rSB")
                    local gradientLength = #fstr / (2 * #list)
                    for i = 1, #fstr, 2 do
                        local org = fstr[i]
                        local expSpeed = .42
                        if snowmanIndex then
                            local snowmanStart = gradientLength * (snowmanIndex - 1)
                            local snowmanEnd = snowmanStart + gradientLength + (#list > 2 and 1 or 0)
                            local gradientProgress = icLerp(floor(snowmanStart), ceil(snowmanEnd), (i + 1) / 2)
                            if snowmanIndex == 1 or snowmanIndex == #list then
                                expSpeed = cLerp(snowmanIndex == 1 and .7807 or .42, snowmanIndex == 1 and .42 or .7807, gradientProgress)
                            else
                                expSpeed = lLerp({ .42, .7807, .42 }, gradientProgress)
                            end
                        end
                        local t = (i - 2) / (#fstr - 3)
                        org[1] = expApproach(org[1], lLerp(colors[1], t), expSpeed)
                        org[2] = expApproach(org[2], lLerp(colors[2], t), expSpeed)
                        org[3] = expApproach(org[3], lLerp(colors[3], t), expSpeed)
                    end
                end
            end
            return fstr
        end

        -- Sort & Shuffle
        if M.DH == 2 then
            TABLE.shuffle(list)
        else
            table.sort(list, modSortFunc)
            if M.DH == 1 and MATH.roll((#list - 1) / 6.26) then
                local r1, r2 = rnd(#list), rnd(#list - 1)
                if r2 >= r1 then r2 = r2 + 1 end
                list[r1], list[r2] = list[r2], list[r1]
            end
        end

        -- General
        local baseColorText = TABLE.copyAll(MD.textColor)
        local shuff2 = GAME.genShuffledColors(baseColorText)
        for i = 1, len - 1 do
            ins(fstr, (M.PN == 2 and URM and shuff2 or baseColorText)[string.gsub(list[i], "r", "")])
            ins(fstr, MD.adj[list[i]] .. " ")
        end
        ins(fstr, (M.PN == 2 and URM and shuff2 or baseColorText)[string.gsub(list[len], "r", "")])
        ins(fstr, MD.noun[list[len]])
        if M.NH == 2 then
            for i = 1, #fstr, 2 do
                fstr[i] = TABLE.copy(fstr[i])
                for j = 1, 3 do
                    fstr[i][j] = fstr[i][j] * .7 + .26
                end
            end
        end
        if M.IN > 0 then
            local r = rnd(0, 3)
            for i = 1, #fstr, 2 do
                r =
                    r == 0 and rnd(2, 3) or
                    r == 1 and 3 or
                    r == 2 and 0 or rnd(0, 1)
                fstr[i] = { 1, 1, 1, .6 + .13 * r }
            end
        end

        if URM and M.DH == 2 then
            for i = 1, #fstr do
                if type(fstr[i]) == 'string' then
                    fstr[i] = table.concat(TABLE.shuffle(fstr[i]:atomize()))
                end
            end
        end
        
        for i = 1, #fstr do
            if type(fstr[i]) == 'table' and string.count(list[(i + 1) / 2], "r") == 1 then
                fstr[i] = TABLE.copy(fstr[i])
                fstr[i][1] = fstr[i][1] - .26
                fstr[i][2] = fstr[i][2] - .26
                fstr[i][3] = fstr[i][3] - .26
            end
        end

        return fstr
    else
        -- Empty
        if len == 0 then return "" end

        -- Simple
        if len == 1 then return MD.noun[list[1]] end

        -- Super Set
        local find = TABLE.find
        if not (mode == 'button' and GAME.playing) then
            if GAME.anyRev and STRING.count(table.concat(list), "r") >= 2 then
                local mp = GAME.getComboMP(list)
                if mp >= 8 then return RevSwampName[min(mp, #RevSwampName)] end
            elseif len >= 7 + (not GAME.anyRev and (find(list, 'PN') and 1 or 0) + (find(list, 'SB') and 1 or 0) or 0) then
                return
                    GAME.anyRev and (
                        len == 7 and [["AMBROSIA SODA"]] or
                        len == 8 and [["AMBROSIA WINE"]] or
                        len == 9 and [["AMBROSIA MOONSHINE"]] or
                        len == 10 and [["AMBROSIA ICHOR"]] or
                        [["AMBROSIA NECTAR"]]
                    ) or (
                        len == 7 and not (
                            find(list, 'PN') or find(list, 'SB')
                        ) and (
                            find(list, 'DP') and [["SWAMP WATER LITE PRO"]] or [["SWAMP WATER LITE"]]
                        ) or
                        len == 8 and not (
                            find(list, 'PN') and find(list, 'SB')
                        ) and (
                            find(list, 'PN') and (
                                find(list, 'DP') and [["WHY LITE PRO"]] or [["WHY LITE"]]
                            ) or find(list, 'SB') and (
                                find(list, 'DP') and [["SWAMP WATER X LITE PRO"]] or [["SWAMP WATER X LITE"]]
                            ) or (
                                find(list, 'DP') and [["SWAMP WATER PRO LITE"]] or [["SWAMP WATER"]]
                            )
                        ) or
                        len == 9 and (
                            find(list, 'PN') and (
                                find(list, 'SB') and (
                                    find(list, 'DP') and [["SWAMP WATER Y LITE PRO"]] or [["SWAMP WATER Y LITE"]]
                                ) or (
                                    find(list, 'DP') and [["WHY PRO LITE"]] or [["WHY"]]
                                )
                            ) or find(list, 'SB') and (
                                find(list, 'DP') and [["SWAMP WATER X PRO LITE"]] or [["SWAMP WATER X"]]
                            ) or [["SWAMP WATER PRO"]]
                        ) or
                        len == 10 and (
                            find(list, 'PN') and (
                                find(list, 'SB') and (
                                    find(list, 'DP') and [["SWAMP WATER Y PRO LITE"]] or [["SWAMP WATER Y"]]
                                ) or [["WHY PRO"]]
                            ) or [["SWAMP WATER X PRO"]]
                        ) or
                        len == 11 and [["SWAMP WATER Y PRO"]] or
                        [["UNKNOWN SUPER SET"]]
                    )
            end
        elseif rCount == 0 and not find(list, 'DP') then
            if not find(list, 'SB') then
                if not find(list, 'PN') and len >= 7 then
                    return len == 7 and [["SWAMP WATER LITE"]] or [["SWAMP WATER"]]
                elseif find(list, 'PN') and len >= 8 then
                    return len == 8 and [["WHY LITE"]] or [["WHY"]]
                end
            else
                if not find(list, 'PN') and len >= 8 then
                    return len == 8 and [["SWAMP WATER X LITE"]] or [["SWAMP WATER X"]]
                elseif find(list, 'PN') and len >= 9 then
                    return len == 9 and [["SWAMP WATER Y LITE"]] or [["SWAMP WATER Y"]]
                end
            end
        elseif rCount == 9 and len == 11 then return [["SINGULARITY"]]
        elseif rCount == 10 then return len == 10 and [["SINGULARITY"]] or [["BIG BANG"]]
        elseif rCount == 11 then return [["REBIRTH"]]
        end

        -- Named Combo
        local combo = (
            (mode == 'rpc' or not GAME.playing) and ComboData.menu or
            M.DH == 2 and ComboData.gameEX or
            ComboData.game
        )[table.concat(TABLE.sort(list), ' ')]
        if combo then return combo.name end

        -- General
        table.sort(list, modSortFunc)
        local str = ""
        for i = 1, len - 1 do str = str .. MD.adj[list[i]] .. " " end
        return str .. MD.noun[list[len]]
    end
end

---@param event 'start' | 'finish' | 'revSwitched' | 'ingame' | 'init'
function GAME.updateBgm(event)
    if event == 'start' then
        BGM.set(BgmSets.assist, 'volume', 1)
        BGM.set('bass', 'volume', .26)
        if GAME.anyRev then
            BGM.set('rev', 'volume', M.DP > 0 and .5 or .7)
        end
    elseif event == 'finish' then
        BGM.set(BgmSets.assist, 'volume', 0)
        local l = TABLE.copy(BgmSets.assist)
        for _ = 1, MATH.clamp(GAME.floor - 6, 2, 4) do
            BGM.set(TABLE.popRandom(l), 'volume', 1)
        end
        if GAME.anyRev then
            BGM.set('rev', 'volume', M.DP > 0 and .5 or .7)
            if M.DP == 2 then BGM.set('violin', 'volume', 1) end
        end
    elseif event == 'revSwitched' then
        if GAME.anyRev then
            BGM.set('rev', 'volume', M.DP > 0 and .5 or .7, 4.2)
            BGM.set(BgmSets.assist, 'volume', 0, 4.2)
            if M.DP == 2 then BGM.set('violin', 'volume', 1) end
        else
            BGM.set('rev', 'volume', 0, 2.6)
            local l = TABLE.copy(BgmSets.assist)
            for _ = 1, 2 do
                BGM.set(TABLE.popRandom(l), 'volume', 1, 4.2)
            end
        end
    elseif event == 'ingame' then
        if GAME.floor < 10 then
            BGM.set('staccato', 'volume', clampInterpolate(1, 1, 6, .26, GAME.floor))
            BGM.set('bass', 'volume', clampInterpolate(1, .26, 9, 1, GAME.floor))
        else
            local f = GAME.fatigue
            BGM.set('staccato', 'volume', f == 1 and 0 or 1)
            BGM.set('bass', 'volume', min((f - 1) * .4, 1))
        end
    elseif event == 'init' then
        BGM.play(BgmSets.all)
        BGM.set('all', 'volume', 0, 0)
        BGM.set('piano', 'volume', 1)
        BGM.set('piano2', 'pitch', 2, 0)
        BGM.set('piano2', 'volume', VALENTINE and .626 or 0, 4.2)
        BGM.set(TABLE.getRandom(BgmSets.assist), 'volume', 1, 10)
    end
end

function GAME.invisDashboardEvent_triggerAnim(t)
    if GAME.invisDashboard then
        TWEEN.new(GAME.anim_setLightHide):setDuration(GAME.slowmo and 2.6 or .26):setUnique('lightHide'):run()
    else
        TWEEN.new(GAME.anim_setLightHide):setDuration(GAME.slowmo and 1.26 or .126):setUnique('lightHide'):run()
    end
end

function GAME.anim_setMenuHide(t)
    local reverse = GAME.uiHide > t
    GAME.uiHide = t
    local w = SCN.scenes.tower.widgetList
    ---@cast w -nil
    if TEST and MOBILE then
        w.skip.x = cLerp(90, -60, t * 2 - 1)
        w.skip:resetPos()
    end
    w.stat.x = cLerp(60, -90, t * 1.5 - .5)
    w.stat:resetPos()
    w.achv.x = cLerp(60, -90, t * 1.5)
    w.achv:resetPos()
    w.conf.x = cLerp(-60, 90, t * 1.5 - .5)
    w.conf:resetPos()
    w.about.x = cLerp(-60, 90, t * 1.5)
    w.about:resetPos()
    MSG.setSafeY(75 * (1 - GAME.uiHide))
end

function GAME.anim_setMenuHide_finish()
    TEXTS.floorTime:set("")
end

function GAME.anim_setMenuHide_rev(t)
    GAME.anim_setMenuHide(1 - t)
end

function GAME.anim_resizeResetAS(t)
    local w = SCN.scenes.tower.widgetList
    w.reset.y = cLerp(-120, -147.5, t * 1.5)
    w.reset.h = cLerp(100, 155, t * 1.5)
    w.reset:resetPos()
end

function GAME.anim_resizeResetAS_rev(t)
    GAME.anim_resizeResetAS(1 - t)
end


function GAME.anim_setLightHide(t)
    GAME.anim_setLightHide_rev(1 - t)
end
-- I am aware this is reversed, but it works.
function GAME.anim_setLightHide_rev(t)
    GAME.lightHide = t
end

function GAME.anim_setLightColorProg(t)
    GAME.colorProg = t
end

function GAME.anim_setLightColorProg_rev(t)
    GAME.anim_setLightColorProg(1 - t)
end

local floorHeights = {}
for i = 0, 9 do ins(floorHeights, Floors[i].top) end
function GAME.getBgFloor()
    return floor(1 + 9 * MATH.ilLerp(floorHeights, GAME.bgH))
end

function GAME.task_gigaspeed()
    TWEEN.new(function(t) GigaSpeed.textTimer = 1 - 2 * t end):setEase('Linear'):setDuration(2.6):run()
        :setOnFinish(function() GigaSpeed.textTimer = false end)
end

function GAME.task_fatigueWarn()
    for _ = 1, 3 do
        for _ = 1, M.DP == 2 and 1 or 3 do SFX.play('warning', 1, 0, Tone(0)) end
        TASK.yieldT(1)
    end
end

function GAME.cancelBurn()
    for i = 1, #CD do CD[i].burn = false end
end

function GAME.sortCards()
    table.sort(CD, function(a, b) return a.initOrder < b.initOrder end)
    for _, C in ipairs(CD) do C.tempOrder = C.initOrder end
end

local shuffleSets = {
    [0] = { { 2, 3 }, { 4, 5 }, { 5, 6 }, { 7, 8 }, pop = 3 },
    { { 1, 2 },    { 3, 4 },    { 6, 7 },    { 8, 9 },    pop = 2 },
    { { 1, 2 },    { 3, 4 },    { 6, 7 },    { 8, 9 },    pop = 1 },
    { { 1, 3 },    { 2, 4 },    { 6, 8 },    { 7, 9 },    pop = 1 },
    { { 1, 2, 3 }, { 7, 8, 9 }, { 5, 6, 7 }, { 3, 4, 5 }, pop = 0 },
}
function GAME.weakShuffleCards(phase)
    local sets = TABLE.copyAll(shuffleSets[phase] or shuffleSets[4])
    for _ = 1, sets.pop do
        TABLE.popRandom(sets)
    end

    for i = 1, #sets do
        local a, b = TABLE.popRandom(sets[i]), TABLE.popRandom(sets[i])
        CD[a].tempOrder, CD[b].tempOrder = CD[b].tempOrder, CD[a].tempOrder
    end
    table.sort(CD, function(a, b) return a.tempOrder < b.tempOrder end)
    GAME.refreshLayout()
end

function GAME.shuffleCards(messiness)
    local order = {}
    for i = 1, #CD do order[i] = i end

    repeat
        for _ = 1, 3 do
            local p = rnd(#CD - 1)
            order[p], order[p + 1] = order[p + 1], order[p]
        end

        local totalDist = 0
        for i = 1, #order do
            CD[i].tempOrder = order[i]
            totalDist = totalDist + abs(order[i] - CD[i].initOrder) ^ 1.6
        end
    until totalDist >= messiness
    table.sort(CD, function(a, b) return a.tempOrder < b.tempOrder end)

    GAME.refreshLayout()
end

function GAME.genQuest()
    local combo = {}
    local base = .872 + GAME.floor ^ .5 / 6 + GAME.extraQuestBase + icLerp(6200, 10000, GAME.height)
    local var = GAME.floor * .26 * GAME.extraQuestVar
    local r = MATH.clamp(base + var * abs(MATH.randNorm()), 1, GAME.maxQuestSize)

    GAME.atkBuffer = GAME.atkBuffer + r
    if GAME.atkBuffer > GAME.atkBufferCap then
        r = r - (GAME.atkBuffer - GAME.atkBufferCap)
        GAME.atkBuffer = GAME.atkBufferCap
    end
    GAME.atkBuffer = max(GAME.atkBuffer - (max(GAME.floor / 3, GAME.atkBufferCap / 4)), 0)
    if M.DP > 0 then
        r = r * (GAME[GAME.getLifeKey(true)] == 0 and 1.26 or 1.1)
    end
    
    if TEST then
        repeat
            GAME.questsGenerated = GAME.questsGenerated % #ComboData.gameEX + 1
        until M.PN > 0 or STRING.count(ComboData.gameEX[GAME.questsGenerated].set, "r") == 0
        combo = STRING.split(ComboData.gameEX[GAME.questsGenerated].set, " ")
    elseif not GAME.bufferCombo then
        local pool = TABLE.copyAll(MD.weight)

        local lastQ = GAME.quests[#GAME.quests]
        if lastQ and #lastQ.combo ~= 0 then pool[lastQ.combo[1]] = 0 end
        local questCount = MATH.clamp(MATH.roundRnd(r), 1, GAME.maxQuestSize)
        if questCount == 1 and (M.DH == 0 or math.abs(GAME.height) < 50) then
            pool.DP = 0
        elseif M.DH == 2 then
            pool.DP = pool.DP * .5
        end
        
        repeat
            for _ = 1, questCount do
                local mod = MATH.randFreqAll(pool)
                pool[mod] = 0
                local p = TABLE.find(CD, CD[mod])
                if p then
                    if p > 1 then
                        local left = CD[p - 1].id
                        pool[left] = max(pool[left] * (1 - GAME.questFavor * .01), 0)
                    end
                    if p < 9 then
                        local right = CD[p + 1].id
                        pool[right] = max(pool[right] * (1 - GAME.questFavor * .01), 0)
                    end
                end
        
                local absAlt = math.abs(GAME.height)
                local rMod = M.PN > 0 and MATH.roll((2 * math.max(GAME.floor, GAME.negFloor == 0 and 10 or GAME.negFloor) + (absAlt >= 1650.0
                                and absAlt < 6200.0 and (6 + 18 * (absAlt - 1650.0) / 6200.0)
                                or (absAlt >= 6200.0 and 24 or 6))) * (0.01 + 0.0025 * (M.PN == 2 and 1 + (URM and 1 or 0) or 0))) or false
                ins(combo, (rMod and "r" or "") .. mod)
            end
            table.sort(combo, modSortFunc)
            if #GAME.quests ~= 0 and TABLE.equalAll(combo, GAME.quests[#GAME.quests].combo) then
                for _, m in next, combo do
                    pool[string.gsub(m, "r", "")] = 0
                end
                combo = {}
            end
        until #GAME.quests == 0 or not TABLE.equalAll(combo, GAME.quests[#GAME.quests].combo)

        local precedingQuest = M.DP > 0 and (#GAME.quests == 0 and {} or GAME.quests[#GAME.quests].combo) or GAME.lastCommit
        local dp = TABLE.find(precedingQuest, 'DP') or TABLE.find(precedingQuest, 'rDP')
        if (#GAME.quests == 0 or not (M.DP > 0 and #GAME.quests[#GAME.quests].combo == 0)) and MATH.roll((((GAME.currentTask or M.NH == 2) and (GAME.questsGenerated == 1 and 0.0626 or 0.0262) or 0.0126) * (M.NH == 2 and URM and (TABLE.equal(precedingQuest, {}) and 0 or cLerp(.75, 2, (#precedingQuest - 1) / 5)) or 1)) / ((M.EX + (URM and M.EX == 2 and 2 or 1)) * (M.DP == 2 and (URM and 3 or 2) or 1)) + (M.NH == 2 and URM and dp and .01 or 0) + (M.NH == 2 and M.DP > 0 and URM and #GAME.quests == 2 and TABLE.equal(GAME.quests[1].combo, GAME.quests[2].combo) and .005 or 0)) then
            GAME.bufferCombo = combo
            combo = {}
        end
        -- MSG("dark", tostring((((GAME.currentTask or M.NH == 2) and (GAME.questsGenerated == 1 and 0.0626 or 0.0262) or 0.0126) * (M.NH == 2 and URM and (TABLE.equal(precedingQuest, {}) and 0 or cLerp(.75, 2, (#precedingQuest - 1) / 5)) or 1)) / ((M.EX + (URM and M.EX == 2 and 2 or 1)) * (M.DP == 2 and (URM and 3 or 2) or 1)) + (M.NH == 2 and URM and dp and .01 or 0) + (M.NH == 2 and M.DP > 0 and URM and #GAME.quests == 2 and TABLE.equal(GAME.quests[1].combo, GAME.quests[2].combo) and .005 or 0)))
        if GAME.questsGenerated == 0 then GAME.questsGenerated = 1 end
    else
        combo = GAME.bufferCombo
        GAME.bufferCombo = nil
    end

    local randRoll = math.random()
    ins(GAME.quests, {
        combo = combo,
        name = GC.newText(FONT.get(70), GAME.getComboName(TABLE.copy(combo), 'ingame')),
        y = -100,
        k = .5,
        a = 0,
        flipX = URM and M.PN == 2 and randRoll >= 0.5,
        flipY = URM and M.PN == 2 and (randRoll >= 0.2 and randRoll < 0.5 or randRoll >= 0.8),
    })
end

function GAME.genShuffledColors(dict)
    local cloneTD = {}
    local newTD	= {}
    
    for i, v in pairs(dict) do
        table.insert(cloneTD, v)
    end
    for i, v in pairs(dict) do
        local index = math.random(1, #cloneTD)
        
        newTD[i] = cloneTD[index]
        table.remove(cloneTD, index)
    end
    
    return newTD
end

function GAME.questReady()
    GAME.questTime = 0
    GAME.fault = false
    GAME.faultWrong = false
    GAME.dmgWrongExtra = 0
    GAME.gravTimer = false
    GAME.achv_resetCount = 0
    for _, C in ipairs(CD) do C.correctTouch, C.touchCount, C.required, C.requiredRev, C.required2, C.requiredRev2 = false, 0, false, false, false, false end
    for _, v in next, GAME.quests[1].combo do
        local baseV = string.gsub(v, "r", "")
        CD[baseV].required = true
        if string.count(v, "r") == 1 then CD[baseV].requiredRev = true end
    end
    if M.DP > 0 then for _, v in next, GAME.quests[2].combo do
        local baseV = string.gsub(v, "r", "")
        CD[baseV].required2 = true
        if string.count(v, "r") == 1 then CD[baseV].requiredRev2 = true end
    end end
end

function GAME.startRevive()
    TABLE.foreach(GAME.reviveTasks, function(t)
        t.textObj:release()
        t.shortObj:release()
        t.progObj:release()
    end)
    TABLE.clear(GAME.reviveTasks)
    if GAME.reviveDifficulty < 9999 then
        local power = min(GAME.floor + GAME.reviveDifficulty, 19)
        local maxOut = power == 19
        local powerList = TABLE.new(floor(power / 3), 3)
        if power % 3 == 1 then
            if power == maxOut then
                powerList[2] = powerList[2] + 1
            else
                local r = rnd(3)
                powerList[r] = powerList[r] + 1
            end
        elseif power % 3 == 2 then
            powerList[1] = powerList[1] + 1
            powerList[2] = powerList[2] + 1
            powerList[3] = powerList[3] + 1
            local r = rnd(3)
            powerList[r] = powerList[r] - 1
        end
        TABLE.delete(powerList, 0)

        for _, pow in next, powerList do
            local options = {} ---@type Prompt[]
            for _, opt in next, RevivePrompts do
                if opt.rank[1] <= pow and pow <= opt.rank[2] and (not opt.cond or opt.cond()) then
                    local repeated
                    for _, t in next, GAME.reviveTasks do
                        if t.prompt == opt.prompt then
                            repeated = true
                            break
                        end
                    end
                    if not repeated then
                        ins(options, opt)
                    end
                end
            end
            if #options > 0 then
                local task = TABLE.copyAll(TABLE.getRandom(options))
                if task.init then task.init(task) end
                ---@cast task ReviveTask
                task.progress = 0
                task.textObj = GC.newText(FONT.get(30), task.text)
                task.shortObj = GC.newText(FONT.get(30), task.short)
                task.progObj = GC.newText(FONT.get(30), "0/" .. task.target)
                ins(GAME.reviveTasks, task)
            end
        end
        SFX.play('boardlock')
    else
        SFX.play('losestock')
    end
    GAME.currentTask = GAME.reviveTasks[1] or false
    GAME.DPlock = M.DP == 2
end

function GAME.incrementPrompt(prompt, value)
    local t = GAME.currentTask
    if t and prompt == t.prompt then
        local oldProg = t.progress
        t.progress = min(t.progress + (value or 1), t.target)
        if floor(oldProg) ~= floor(t.progress) and not TASK.getLock('noIncrementSFX') then
            SFX.play('boardlock_clink')
            TASK.lock('noIncrementSFX', 0.026)
        end
        if t.progress >= t.target then
            GAME.currentTask = TABLE.next(GAME.reviveTasks, GAME.currentTask) or false
            if GAME.currentTask then
                SFX.play('boardlock_clear')
            else
                GAME.currentTask = false
                GAME.reviveCount = GAME.reviveCount + 1
                GAME.reviveDifficulty = GAME.reviveDifficulty + 1
                GAME[GAME.getLifeKey(true)] = GAME.fullHealth
                SFX.play('boardlock_revive')
                GAME.DPlock = false
                GAME.achv_maxReviveH = max(GAME.achv_maxReviveH or 0, GAME.roundHeight)
                if GAME.fatigueSet == Fatigue.rDP and GAME.fatigue > 19 then IssueAchv('benevolent_ambition') end
            end
        end
        t.progObj:set(floor(t.progress) .. "/" .. t.target)
    end
end

function GAME.nixPrompt(prompt)
    local t = GAME.currentTask
    if t and prompt == t.prompt then
        if t.progress >= 1 then
            SFX.play('boardlock_fail')
            TASK.lock('noIncrementSFX', 0.026)
        end
        t.progress = 0
        t.progObj:set(floor(t.progress) .. "/" .. t.target)
    end
end

function GAME.getLifeKey(another)
    if M.DP == 0 then return 'life' end
    return (GAME.onAlly ~= not another) and 'life' or 'life2'
end

function GAME.heal(hp)
    local k = GAME.getLifeKey()
    hp = MATH.clamp(hp, 0, GAME.fullHealth - GAME[k])
    GAME[k] = GAME[k] + hp
    GAME.incrementPrompt('heal', hp)

    GAME.refreshLifeState()
end

---@param dmg number
---@param reason 'wrong' | 'time'
---@param toAlly? boolean
---@return boolean? killed
function GAME.takeDamage(dmg, reason, toAlly)
    if GAME.currentTask then
        GAME.incrementPrompt('dmg_time')
        GAME.incrementPrompt('dmg_amount', dmg)
        if reason == 'time' then GAME.incrementPrompt('timedmg_time') end
        if reason == 'freeze' then
            GAME.incrementPrompt('freezedmg_amount', dmg)
            GAME.incrementPrompt('freezedmg_time')
        end
    end

    local k = GAME.getLifeKey(toAlly)
    GAME[k] = max(GAME[k] - dmg, 0)
    SFX.play(
        toAlly and 'inject' or
        dmg <= 1.626 and 'damage_small' or
        dmg <= 4.2 and 'damage_medium' or
        dmg <= 2600 and 'damage_large' or
        'bombdetonate', .872
    )

    GAME.achv_totalDmg = GAME.achv_totalDmg + dmg
    if not GAME.achv_perfectionistH then
        GAME.achv_perfectionistH = GAME.roundHeight
        if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
    end
    if not GAME.achv_spotlessH then
        GAME.achv_spotlessH = GAME.roundHeight
        if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
    end
    if not GAME.achv_protectH and GAME.comboStr == 'rDP' and min(GAME.life, GAME.life2) < 10 then
        GAME.achv_protectH = GAME.roundHeight
        if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
    end

    if GAME[k] <= .01 then -- Prevent float number precision error
        if GAME[GAME.getLifeKey(not toAlly)] > 0 then
            if toAlly then
                SFX.play('elim')
                GAME.killCount = GAME.killCount + 1
            else
                GAME.swapControl()
            end
            GAME.startRevive()
            GAME.dmgWrongExtra = 0 -- Being tolerant!
        else
            if GAME.invincible then
                GAME[k] = 0.26
            else
                GAME.finish(reason)
                return true
            end
        end
    else
        GAME.refreshLifeState()
    end
end

function GAME.addHeight(h)
    h = h * GAME.rank / 4
    GAME.heightBonus = GAME.heightBonus + h
    GAME.heightBuffer = GAME.heightBuffer + h
    if h >= 6 and TASK.lock('speed_tick_whirl', 2.6) then SFX.play('speed_tick_whirl') end
end

function GAME.addXP(xp)
    GAME.xp = GAME.xp + xp
    local oldRank = GAME.rank
    local oldLockTimer = GAME.xpLockTimer
    while GAME.xp >= 4 * GAME.rank do
        GAME.xp = GAME.xp - 4 * GAME.rank
        GAME.rank = GAME.rank + 1
        GAME.xpLockLevel = max(GAME.xpLockLevel - 1, 1)

        -- Rank skip
        if GAME.xp >= 4 * GAME.rank then
            GAME.rank = GAME.rank + floor(GAME.xp / (4 * GAME.rank))
            -- One more
            if GAME.xp >= 4 * GAME.rank then
                GAME.rank = GAME.rank + 1
                GAME.xp = GAME.xp - 4 * GAME.rank
            end
            GAME.xpLockLevel = GAME.xpLockLevelMax
            if GAME.xp < 2 * GAME.rank then GAME.xpLockLevel = GAME.xpLockLevel - 1 end
        end
        GAME.xpLockTimer = GAME.xpLockLevel
    end
    if GAME.rank > GAME.rankLimit then
        GAME.rank = GAME.rankLimit
        GAME.xp = 4 * GAME.rank
    end
    if GAME.rank ~= oldRank then
        GAME.rankupLast = true
        GAME.peakRank = max(GAME.peakRank, GAME.rank)
        TEXTS.rank:set("R-" .. GAME.rank)
        SFX.play('speed_up_' .. MATH.clamp(floor((GAME.rank + .5) / 1.5), 1, 4),
            .4 + .1 * GAME.xpLockLevel * min(GAME.rank / 4, 1))
        if not GAME.gigaspeedEntered and GAME.rank >= GigaSpeedReq[max(GAME.floor, GAME.negFloor == 0 and 10 or GAME.negFloor)] then
            GAME.setGigaspeedAnim(true)
            SFX.play('zenith_speedrun_start')
            GAME.refreshRPC()
        end
    else
        GAME.xpLockTimer = oldLockTimer
    end
    if GAME.rankupLast and GAME.xp >= 2 * GAME.rank then GAME.xpLockLevel = GAME.xpLockLevelMax end
end

function GAME.setGigaspeedAnim(on, finish)
    GAME.gigaspeed = on
    local s = GigaSpeed.alpha
    if on then
        GAME.gigaspeedEntered = GAME.time
        TWEEN.new(function(t) GigaSpeed.alpha = lerp(s, 1, t) end)
            :setUnique('giga'):run()
        TASK.removeTask_code(GAME.task_gigaspeed)
        TASK.new(GAME.task_gigaspeed)

        if GAME.floor == 1 then IssueAchv('speedrun_speedrunning') end
        if GAME.comboMP >= 15 then IssueAchv('abyss_weaver') end
    else
        TWEEN.new(function(t) GigaSpeed.alpha = lerp(s, 0, t) end):setDuration(finish and 6.26 or 3.55)
            :setUnique('giga'):run()
    end
end

function GAME.readyShuffle(messiness, noSnd)
    if not messiness then return end
    GAME.shuffleMessiness = messiness
    if GAME.totalQuest > 0 then
        if not noSnd then SFX.play('rsg_go', 1, 0, Tone(2)) end
        for _, C in ipairs(CD) do C:shake() end
    end
end

function GAME.showFloorText(f, name, duration)
    TEXT:add {
        text = "Floor",
        x = 160, y = 290, k = 1.6, fontSize = 30,
        color = 'LY', duration = duration,
    }
    TEXT:add {
        text = tostring(f),
        x = 240, y = 280, k = 2.6, fontSize = 30,
        color = 'LY', duration = duration, align = 'left',
    }
    TEXT:add {
        text = name,
        x = 200, y = 350, k = 1.2, fontSize = 30,
        color = 'LY', duration = duration,
    }
end

function GAME.upFloor()
    if GAME.floor == 2 then
        if GAME.comboStr == 'EXVLrDPrIN' then SubmitAchv('love_hotel', GAME.floorTime) end
    elseif GAME.floor == 3 then
        if GAME.comboStr == 'ASEXMS' then SubmitAchv('financially_responsible', GAME.floorTime) end
    elseif GAME.floor == 4 then
        if GAME.comboStr == 'EXrDPrVL' then SubmitAchv('unfair_battle', GAME.floorTime) end
    elseif GAME.floor == 5 then
        if GAME.comboStr == 'DHDP' then SubmitAchv('museum_heist', GAME.floorTime) end
    elseif GAME.floor == 6 then
        if GAME.comboStr == 'EXVLrGV' then SubmitAchv('workaholic', GAME.floorTime) end
    elseif GAME.floor == 7 then
        if GAME.comboStr == 'ASMSVL' then SubmitAchv('human_experiment', GAME.floorTime) end
    elseif GAME.floor == 8 then
        if GAME.comboStr == 'DHEXGV' then SubmitAchv('core_meltdown', GAME.floorTime) end
    elseif GAME.floor == 9 then
        SubmitAchv('ultra_dash', GAME.floorTime)
    end

    -- Update section time
    if GAME.floor > 0 then
        ins(GAME.secTime, GAME.floorTime)
        local secTimeStr = ""
        for i = 1, #GAME.secTime do
            if i > 1 then secTimeStr = secTimeStr .. "\n" end
            secTimeStr = secTimeStr .. ("F%d - %.3f″"):format(i, GAME.secTime[i])
        end
        TEXTS.floorTime:set(secTimeStr)
    end

    GAME.floor = GAME.floor + 1
    GAME.floorTime = 0
    if GAME.floor > 1 then
        if M.MS == 1 then
            GAME.readyShuffle(Floors[GAME.floor].MSshuffle)
        elseif M.MS == 2 and not URM then
            GAME.readyShuffle(GAME.floor * 2.6)
        end
    end

    GAME.questFavor =
        M.VL == 2 and 50 or (
            (M.EX > 0 and 0 or 33)
            - (M.MS > 0 and 25 or 0)
            - GAME.floor * 3
        )
    if M.GV > 0 then GAME.gravDelay = GravityTimer[M.GV][GAME.floor] end
    local F = Floors[GAME.floor]
    local e = F.event
    for i = 1, #e, 2 do
        if type(e[i + 1]) == 'number' then
            GAME[e[i]] = GAME[e[i]] + e[i + 1]
        else
            GAME[e[i]] = e[i + 1]
        end
    end
    if GAME.dmgTimer > GAME.dmgDelay then GAME.dmgTimer = GAME.dmgDelay end

    -- Text & SFX
    GAME.showFloorText(GAME.floor, Floors[GAME.floor].name, GAME.floor >= 10 and 8.72 or 4.2)
    if GAME.gigaspeed then
        SFX.play('zenith_split_cleared', 1, 0, Tone(-1))
    elseif GAME.floor > 1 then
        SFX.play('zenith_levelup_g', 1, 0, Tone(0))
    end

    -- End game
    if GAME.floor >= 10 and not TEST then
        local roundTime = roundUnit(GAME.time, .001)
        if GAME.gigaspeed then
            if GAME.time < STAT.minTime then
                STAT.minTime = roundTime
                STAT.timeDate = os.date("%y.%m.%d %H:%M%p")
                SaveStat()
            end
            GAME.gigaTime = GAME.time
            GAME.setGigaspeedAnim(false, true)
            local t = BEST.speedrun[GAME.ultraComboStr or GAME.comboStr]
            SFX.play('applause', GAME.time < t and t < 1e99 and 1 or .42)
            if GAME.time < t then
                BEST.speedrun[GAME.ultraComboStr or GAME.comboStr] = roundTime
                SaveBest()
            end

            local _t
            if not ACHV.terminal_velocity then
                _t = 0
                for id in next, MD.name do if id ~= "PN" and rawget(BEST.speedrun, id) then _t = _t + 1 end end
                if _t >= 9 then IssueAchv('terminal_velocity') end
            end
            if not ACHV.FM_speedy_student then
                _t = 0
                for id in next, MD.name do if rawget(BEST.speedrun, id) then _t = _t + 1 end end
                if _t >= 10 then IssueAchv('FM_speedy_student') end
            end
            if not ACHV.omnipotence then
                _t = 0
                for id in next, MD.name do if id ~= "PN" and rawget(BEST.speedrun, 'r' .. id) then _t = _t + 1 end end
                if _t >= 9 then IssueAchv('omnipotence') end
            end
            if not ACHV.FM_a_fools_divination then
                _t = 0
                for id in next, MD.name do if rawget(BEST.speedrun, 'r' .. id) then _t = _t + 1 end end
                if _t >= 10 then IssueAchv('FM_a_fools_divination') end
            end
            if GAME.time <= 76.2 then IssueAchv('superluminal') end
            if GAME.time - GAME.gigaspeedEntered >= 300 then IssueAchv('worn_out') end
        end

        SubmitAchv('the_pacifist', GAME.totalAttack)
        if GAME.comboStr == '' then SubmitAchv('zenith_speedrun', roundTime) end
        SubmitAchv('zenith_speedrun_plus', roundTime)
        SubmitAchv('detail_oriented', GAME.totalFlip)
    end
    GAME.updateBgm('ingame')
    GAME.refreshRPC()
end

function GAME.nextFatigue()
    local stage = GAME.fatigueSet[GAME.fatigue]
    local e = stage.event
    for i = 1, #e, 2 do
        GAME[e[i]] = GAME[e[i]] + e[i + 1]
    end
    if stage.text then
        TEXT:add {
            text = stage.text,
            x = 800, y = 265, fontSize = 30, k = 1.5,
            style = 'score', duration = stage.duration or 5,
            inPoint = .1, outPoint = .26,
            color = stage.color or 'lM',
        }
        TEXT:add {
            text = stage.desc,
            x = 800, y = 300, fontSize = 30,
            style = 'score', duration = stage.duration or 5,
            inPoint = .26, outPoint = .1,
            color = stage.color or 'lM',
        }
        TASK.new(GAME.task_fatigueWarn)
        local allTextSeen = true
        for i = GAME.fatigue + 1, #GAME.fatigueSet do
            if GAME.fatigueSet[i].text then
                allTextSeen = false
                break
            end
        end
        if allTextSeen then
            if GAME.fatigueSet == Fatigue.normal then
                IssueAchv('final_defiance')
            elseif GAME.fatigueSet == Fatigue.rEX then
                IssueAchv('royal_resistance')
            elseif GAME.fatigueSet == Fatigue.rDP then
                IssueAchv('lovers_stand')
            end
        end
    end

    if GAME.floor >= 10 then GAME.updateBgm('ingame') end
    GAME.fatigue = GAME.fatigue + 1
end

function GAME.downFloor()
    GAME.negFloor = GAME.negFloor + 1

    GAME.floorTime = 0
    if GAME.negFloor > 1 then
        if M.MS == 1 then
            GAME.readyShuffle(Floors[GAME.negFloor].MSshuffle)
        elseif M.MS == 2 and not URM then
            GAME.readyShuffle(GAME.negFloor * 2.6)
        end
    end

    GAME.questFavor =
        M.VL == 2 and 50 or (
            (M.EX > 0 and 0 or 33)
            - (M.MS > 0 and 25 or 0)
            - GAME.negFloor * 3
        )
    if M.GV > 0 then GAME.gravDelay = GravityTimer[M.GV][GAME.negFloor] end

    -- Text & SFX
    GAME.showFloorText(-GAME.negFloor, NegFloors[GAME.negFloor].name, 6.2)
    SFX.play('zenith_levelup_g', 1, 0, Tone(-5))

    GAME.refreshRPC()
end

local basementSecretEffects = { nightcore = 1, slowmo = 2, glassCard = 3, invisCard = 4, invisDashboard = 5, }
function GAME.nextNegEvent()
    local e = NegEvents[GAME.negEvent]
    if e.cond() then
        if type(e.event) == 'function' then
            e.event()
        elseif type(e.event) == 'table' then
            for i = 1, #e.event, 2 do
                if type(e.event[i + 1]) == 'number' then
                    GAME[e.event[i]] = GAME[e.event[i]] + e.event[i + 1]
                elseif not (ForceURM and PieceSFXID == basementSecretEffects[e.event[i]]) then
                    GAME[e.event[i]] = e.event[i + 1]
                    if e.event[i] == 'invisDashboard' then GAME.invisDashboardEvent_triggerAnim() end
                end
            end
        end
        local sfx
        if e.text then
            TEXT:add {
                text = e.text,
                x = 800, y = 350, fontSize = 30, k = 1.5 * (e.size or 1),
                style = 'score', duration = e.duration or 5,
                inPoint = .1, outPoint = .26,
                color = e.color or 'lR',
            }
            sfx = 'counter'
        end
        SFX.play(e.sfx or sfx)
    end
    GAME.negEvent = GAME.negEvent + 1
end

local revLetter = setmetatable({
    P = "Ь", R = "ᖉ", T = "ꓕ", Q = "Ơ", U = "Ո", A = "Ɐ", L = "Γ",
}, { __index = function(_, k) return k end })
function GAME.refreshRPC()
    local detailStr = M.EX > 0 and "EXPERT QUICK PICK" or "QUICK PICK"
    if M.DP > 0 then detailStr = detailStr:gsub("QUICK", "DUAL") end
    if GAME.anyRev then detailStr = detailStr:gsub(".", revLetter) end

    local stateStr
    if GAME.playing then
        if DailyActived then
            stateStr = GAME.gigaspeed and "Daily speedrun: " or "Daily game: "
        else
            stateStr = GAME.gigaspeed and "Speedrun: " or "In game: "
        end
        if GAME.negFloor > 1 then
            stateStr = stateStr .. "B" .. GAME.negFloor
        else
            stateStr = stateStr .. "F" .. GAME.floor
        end
        local hand = GAME.getHand(true)
        if #hand > 0 then
            local comboName = GAME.getComboName(hand, 'rpc')
            stateStr = stateStr .. " - "
            if URM and GAME.anyRev then
                ---@cast comboName string
                comboName =
                    comboName:sub(1, 1) == "\"" and
                    "\"ULTRA " .. comboName:sub(2) or
                    "ULTRA " .. comboName
            end
            stateStr = stateStr .. comboName
        end
    else
        stateStr = "Enjoying music"
        if M.NH > 0 then stateStr = stateStr .. " (Inst.)" end
        if M.GV > 0 or (M.PN == 2 and URM) then stateStr = stateStr .. (M.GV == 0 and M.PN == 2 and URM and " (" or " (+") .. M.GV + (URM and M.GV == 2 and 1 or 0) - (M.PN == 2 and URM and 0.5 or 0) .. ")" end
        if M.IN > 0 then
            stateStr = stateStr:gsub("j", "r"):gsub("s", "z"):gsub("tch", "dge")
                :gsub("p", "b"):gsub("c", "g"):gsub("t", "d")
        end
        if M.PN > 0 then
            stateStr = stateStr:reverse():gsub("cisum gniyojnE", "ɔᴉsnɯ ɓuᴉʎoſ̣uƎ"):gsub("gizum gniyornE", "ɓᴉznɯ ɓuᴉʎoɹuƎ"):gsub("%)%.tsnI%(", "(ॱʇsuI)")
                :gsub("%)%.dznI%(", "(ॱpzuI)"):gsub("%)5%.0%-%(", "(ϛॱ0-)"):gsub("%)5%.0%+%(", "(ϛॱ0+)"):gsub("%)1%+%(", "(⇂+)"):gsub("%)2%+%(", "(ζ+)"):gsub("%)5%.2%+%(", "(ϛॱζ+)"):gsub("%)3%+%(", "(Ɛ+)")
        end
    end

    DiscordState = {
        needUpdate = true,
        details = detailStr,
        state = stateStr,
    }
    TASK.lock('RPC_update', 1.6)
end

local modIconPos = {
    { -2, -1.5 }, { -2, 0.5 }, { -1, -0.5 }, { -1, 1.5 },
    { 0,  -1.5 }, { 0, 0.5 }, { 1, -0.5 }, { 1, 1.5 },
    { 2, -1.5 }, { 2, 0.5 }, { 0, 2.5 }, { -2, 2.5 },
}

function GAME.refreshModIcon()
    GAME.modIB:clear()
    local hand = GAME.getHand(true)
    table.sort(hand, function(a, b) return MD.prio_icon[a] < MD.prio_icon[b] end)
    if #hand == 1 then
        local quad = URM and TEXTURE.modQuad_ultra[hand[1]] or TEXTURE.modQuad_ig_ex[hand[1]]
        local k = quad == TEXTURE.modQuad_ultra[hand[1]] and 0.872 or #hand[1] == 3 and .7023 or .62
        local _, _, w = quad:getViewport()
        GAME.modIB:add(
            quad, 0, 0,
            0, k, nil, w * .5, w * .5
        )
    elseif #hand == 2 then
        local quad = URM and TEXTURE.modQuad_ultra[hand[2]] or TEXTURE.modQuad_ig_ex[hand[2]]
        local k = quad == TEXTURE.modQuad_ultra[hand[2]] and 0.7023 or #hand[1] == 3 and .626 or .5
        local _, _, w = quad:getViewport()
        GAME.modIB:add(
            quad, 35, 0,
            0, k, nil, w * .5, w * .5
        )
        quad = URM and TEXTURE.modQuad_ultra[hand[1]] or TEXTURE.modQuad_ig_ex[hand[1]]
        k = quad == TEXTURE.modQuad_ultra[hand[1]] and 0.7023 or #hand[1] == 3 and .626 or .5
        _, _, w = quad:getViewport()
        GAME.modIB:add(
            quad, -35, 0,
            0, k, nil, w * .5, w * .5
        )
    else
        local r = 35
        for x = 3, 2, -1 do
            for i = #hand, 1, -1 do
                if #hand[i] == x then
                    local quad = x == 3 and URM and TEXTURE.modQuad_ultra[hand[i]] or TEXTURE.modQuad_ig[hand[i]]
                    local _, _, w = quad:getViewport()
                    GAME.modIB:add(
                        quad,
                        modIconPos[i][1] * r, (modIconPos[i][2] - (#hand >= 11 and (URM and .25 or (M[hand[11]] == 1 and .5 or .75)) or 0)) * r,
                        0, x == 3 and (URM and .26 or .4) or .28, nil, w * .5, w * .5
                    )
                end
            end
        end
    end
end

function GAME.refreshResultModIcon()
    GAME.resIB:clear()
    local hand = GAME.getHand(true)
    table.sort(hand, function(a, b) return MD.prio_icon[a] < MD.prio_icon[b] end)
    local iconSet = URM and TEXTURE.modQuad_ultra_res_ex or TEXTURE.modQuad_res_ex
    if #hand == 1 then
        GAME.resIB:add(
            iconSet[hand[1]], 0, 0,
            0, #hand[1] == 3 and .626 or .5, nil, 183 * .5, 183 * .5
        )
    elseif #hand == 2 then
        GAME.resIB:add(
            iconSet[hand[2]], 35, 0,
            0, #hand[2] == 3 and .567 or .432, nil, 183 * .5, 183 * .5
        )
        GAME.resIB:add(
            iconSet[hand[1]], -35, 0,
            0, #hand[1] == 3 and .567 or .432, nil, 183 * .5, 183 * .5
        )
    else
        local r = 35
        for x = 3, 2, -1 do
            for i = #hand, 1, -1 do
                if #hand[i] == x then
                    GAME.resIB:add(
                        (URM and TEXTURE.modQuad_ultra_res or TEXTURE.modQuad_res)[hand[i]],
                        modIconPos[i][1] * r, modIconPos[i][2] * r,
                        0, x == 3 and .36 or .3, nil, 183 * .5, 183 * .5
                    )
                end
            end
        end
    end
end

--------------------------------------------------------------

function GAME.refreshCurrentCombo()
    local hand = GAME.getHand(not GAME.playing)
    local comboName = GAME.getComboName(hand, 'button')
    if not GAME.playing and URM and GAME.anyRev and #hand > 0 then
        ---@cast comboName string
        comboName =
            comboName:sub(1, 1) == "\"" and
            "\"ULTRA " .. comboName:sub(2) or
            "ULTRA " .. comboName
    end
    TEXTS.mod:set(comboName)
    if not GAME.playing then
        GAME.comboMP = GAME.getComboMP(hand)
        GAME.comboZP = GAME.getComboZP(hand)
        TEXTS.mpPreview:set(GAME.comboMP .. " MP")
        TEXTS.zpPreview:set(("%.2fx ZP"):format(GAME.comboZP))
        DailyActived =
            #GAME.getHand(true) == #DAILY and
            TABLE.equal(TABLE.sort(GAME.getHand(true)), TABLE.sort(TABLE.copy(DAILY)))
        GAME.refreshDailyChallengeText()

        local lastLine = (
            #hand == 0 and "Without any mods, " or
            #hand == 1 and "With this mod, " or
            "With this combo, "
        ) .. "ZP earn starts from 0%% at %.0fm, to 100%% at %.0fm"
        local W = SCN.scenes.tower.widgetList.help2
        W.floatText = "Each mod will multiply ZP gain with a certain rate.\n" ..
            lastLine:format(STAT.zp / 26 / GAME.comboZP, STAT.zp / 16 / GAME.comboZP)
        W:reset()
    end
end

function GAME.refreshLayout()
    local baseDist = (M.EX > 0 and (URM and M.EX == 2 and 80 or 100) or 110) + M.VL * 20
    local baseL, baseR = 800 - 5 * baseDist - 70, 800 + 5 * baseDist + 70
    local baseY = 726 + (URM and M.GV == 2 and 50 or 15 * M.GV)
    local float = M.NH < 2
    if FloatOnCard then
        local selX = 800 + (FloatOnCard - 6) * baseDist
        local dodge = M.VL == 0 and 250 or 230
        if URM and M.EX == 2 then dodge = dodge - 40 end
        for i = 1, #CD do
            local C = CD[i]
            if i < FloatOnCard then
                C.tx = MATH.interpolate(1, baseL, FloatOnCard - 1, selX - dodge, i)
                if C.tx ~= C.tx then C.tx = baseL end
            elseif i > FloatOnCard then
                C.tx = MATH.interpolate(#CD, baseR, FloatOnCard + 1, selX + dodge, i)
                if C.tx ~= C.tx then C.tx = baseR end
            else
                C.tx = selX
            end
            C.ty = baseY - (float and (C.active and 45 or 0) + (i == FloatOnCard and 55 or 0) or 0)
        end
    else
        for i, C in ipairs(CD) do
            C.tx = 800 + (i - 6) * baseDist
            C.ty = baseY - (float and (C.active and 45 or 0) + (i == FloatOnCard and 55 or 0) or 0)
        end
    end
end

function GAME.refreshCursor()
    local sum = 0
    for _, v in next, GAME.completion do
        sum = sum + v ^ 1.37851162325373
    end
    CursorProgress = sum / 23.4
end

function GAME.refreshLockState()
    local count = 0
    for k, v in pairs(GAME.completion) do
        if k ~= "PN" and k ~= "SB" and v >= 1 then
            count = count + 1
        end
    end
    if STAT.pnProgress > count then
        STAT.pnProgress = count
        if count < GAME.pnProgress then GAME.pnProgress = max(0, count - 1) end
    end
    if count == 9 and STAT.pnProgress == 0 then
        TASK.new(function()
            TASK.yieldT(.15)
            CD.PN:shake()
            TASK.yieldT(.19)
            CD.PN:shake()
            TASK.yieldT(.08)
            CD.PN:spin()
            SFX.play('supporter')
            SFX.play('shatter')
        end)
    end
    CD.PN.lock = count ~= 9
    CD.SB.lock = GAME.completion.PN < 2
    CD.EX.lock = STAT.maxFloor < 9
    CD.NH.lock = STAT.maxFloor < 2
    CD.MS.lock = STAT.maxFloor < 3
    CD.GV.lock = STAT.maxFloor < 4
    CD.VL.lock = STAT.maxFloor < 5
    CD.DH.lock = STAT.maxFloor < 6
    CD.IN.lock = STAT.maxFloor < 7
    CD.AS.lock = STAT.maxFloor < 8
    CD.DP.lock = not ACHV.intended_glitch
    if CD.PN.lock then
        if count > GAME.pnProgress then
            TEXTURE.PN.lock:release()
            TEXTURE.PN.lock = GC.newImage("assets/card/lockover-fool-" .. count .. ".png")
            if STAT.pnProgress ~= count then
                TASK.new(function()
                    TASK.yieldT(.15)
                    CD.PN:shake()
                    TASK.yieldT(.19)
                    CD.PN:shake()
                    TASK.yieldT(.08)
                    CD.PN:spin()
                    SFX.play('supporter')
                    SFX.play('shatter')
                end)
            end
            GAME.pnProgress = count
            STAT.pnProgress = count
        end
    elseif STAT.pnProgress ~= 9 then
        if GAME.pnProgress ~= 9 then
            TASK.new(function()
                TASK.yieldT(.15)
                CD.PN:shake()
                TASK.yieldT(.19)
                CD.PN:shake()
                TASK.yieldT(.08)
                CD.PN:spin()
                SFX.play('supporter')
                SFX.play('shatter')
            end)
            GAME.pnProgress = 9
        end
        STAT.pnProgress = 9
    end
end

function GAME.refreshPBText()
    local setStr = table.concat(TABLE.sort(GAME.getHand(true)))
    if URM and GAME.anyRev then setStr = setStr:gsub("r", "u") end
    local height = BEST.highScore[setStr]
    if height == 0 then
        TEXTS.pb:set("No score yet")
    else
        local time = BEST.speedrun[setStr]
        if time < 1e99 then
            TEXTS.pb:set(("BEST: %.1fm    GIGA: %.3f″"):format(height, time))
        else
            local f = 0
            for i = 1, #Floors do
                if height < Floors[i].top then
                    f = i
                    break
                end
            end
            TEXTS.pb:set(("BEST: %.1fm  <F%d>"):format(height, f))
        end
    end
end

function GAME.refreshRev()
    local hasRev = false
    for _, C in ipairs(CD) do
        if M[C.id] == 2 then
            hasRev = true
            break
        end
    end
    if hasRev ~= GAME.anyRev then
        GAME.anyRev = hasRev

        local W
        W = SCN.scenes.tower.widgetList.stat
        W.fillColor[1], W.fillColor[2] = W.fillColor[2], W.fillColor[1]
        W.textColor[1], W.textColor[2] = W.textColor[2], W.textColor[1]
        W = SCN.scenes.tower.widgetList.achv
        W.fillColor[1], W.fillColor[2] = W.fillColor[2], W.fillColor[1]
        W.textColor[1], W.textColor[2] = W.textColor[2], W.textColor[1]
        W = SCN.scenes.tower.widgetList.conf
        W.fillColor[1], W.fillColor[3] = W.fillColor[3], W.fillColor[1]
        W.textColor[1], W.textColor[3] = W.textColor[3], W.textColor[1]

        if not hasRev then
            GAME.revDeckSkin = false
        end

        local s, e = GAME.revTimer, hasRev and 1 or 0
        local x = (GAME.bgX + 1024) % 2048 - 1024
        TWEEN.new(function(t)
            GAME.bgX = lerp(x, 0, t)
            t = lerp(s, e, t)
            GAME.revTimer = t
            TextColor[1] = lerp(BaseTextColor[1], .62, t)
            TextColor[2] = lerp(BaseTextColor[2], .1, t)
            TextColor[3] = lerp(BaseTextColor[3], .1, t)
            ShadeColor[1] = lerp(BaseShadeColor[1], .1, t)
            ShadeColor[2] = lerp(BaseShadeColor[2], 0, t)
            ShadeColor[3] = lerp(BaseShadeColor[3], 0, t)
        end):setUnique('revSwitched'):setDuration(.26):run()

        GAME.updateBgm('revSwitched')
    end
end

function GAME.refreshLifeState()
    local oldState = GAME.lifeState
    local hp = GAME[GAME.getLifeKey()]
    local newState
    if hp == GAME.fullHealth then
        newState = 'full'
    else
        local dangerDmg = max(GAME.dmgWrong + GAME.dmgWrongExtra, GAME.dmgTime)
        newState = hp <= dangerDmg and 'danger' or 'safe'
    end
    if oldState ~= newState then
        GAME.lifeState = newState
        if newState == 'danger' then
            SFX.play('hyperalert')
        end
    end
end

function GAME.refreshDailyChallengeText()
    local sortedDaily = TABLE.copy(DAILY)
    DailyAvailable = true
    local id
    for _, v in next, sortedDaily do
        if v:find('r') then
            local m = v:sub(2)
            if GAME.completion[m] == 0 then
                DailyAvailable = false
                break
            end
            if not id then
                id = m
            end
        else
            if Cards[v].lock then
                DailyAvailable = false
                break
            end
        end
    end
    GAME.dailyState = (URM and id) and 2 or 0
    local W = SCN.scenes.tower.widgetList.daily
    W.text = GAME.dailyState == 2 and "Ultra Daily" or "Daily Chall."
    W.textColor = DailyActived and GAME.dailyState >= 2 and COLOR.lR or TextColor
    W.floatFrameColor = DailyActived and GAME.dailyState >= 2 and COLOR.dR or COLOR.DL
    W.floatTextColor = DailyActived and GAME.dailyState >= 2 and COLOR.R or COLOR.dL
    local dailyStatistic = GAME.dailyState == 2 and STAT.uDailyBest or STAT.dailyBest
    TEXTS.dcBest:set(
        dailyStatistic > 0 and
        ("%.0fm  %.0fZP"):format(dailyStatistic / GAME.getComboZP(DAILY), dailyStatistic)
        or ""
    )
    local str
    if DailyAvailable then
        table.sort(sortedDaily, function(a, b) return MD.prio_card[a] < MD.prio_card[b] end)
        str = table.concat(sortedDaily, " ")
        local rev = str:match("r%S+")
        str = "Today's " .. (GAME.dailyState == 2 and "Ultra Combo: " or "Combo: ") .. str
        if rev and GAME.completion then str = str .. "   (" .. rev .. " = " .. (GAME.dailyState == 2 and "ultra " or "reversed ") .. rev:sub(2) .. ")" end
        if GAME.dailyState == 2 then str = str:gsub("r(%u+)", "u%1") end
        str = str .. "\nTry to get more ZP in one run using this mod combo.\n(Click to select them)"
    else
        str = "Oops! Today's mod combo is not available for you...\nComplete more mods to unlock some content."
    end
    SCN.scenes.tower.widgetList.daily.floatText = str
    SCN.scenes.tower.widgetList.daily:reset()
end

function GAME.swapControl()
    if GAME[GAME.getLifeKey(true)] > 0 then
        GAME.onAlly = not GAME.onAlly
        GAME.refreshLifeState()
        return true
    end
end

function GAME.cancelAll(instant)
    if M.NH == 2 then return end
    if URM and M.VL == 2 and not UltraVlCheck('reset', instant) then return end

    TASK.removeTask_code(GAME.task_cancelAll)
    TASK.new(GAME.task_cancelAll, instant)
    if GAME.gravTimer and (not (URM and M.GV == 2) and GAME.achv_resetCount < 15) then GAME.gravTimer = GAME.gravDelay end
end

local slipperiness = 0
function GAME.task_cancelAll(instant)
    if GAME.playing then
        if M.SB > 0 and not instant and slipperiness < (M.AS == 2 and URM and 9 or 17) then slipperiness = slipperiness + 1 end
        GAME.achv_resetCount = GAME.achv_resetCount + 1
    end
    local spinMode = not instant and M.AS > 0
    local list = TABLE.copy(CD, 0)
    local needFlip = {}
    for i = CD.PN.lock == true and 2 or 1, #CD do
        needFlip[i] = spinMode or CD[i].active
    end
    for i = CD.PN.lock == true and 3 or 1, #list do
        if not (i == 2 and CD.SB.lock == true) and needFlip[i] then
            list[i]:setActive(true)
            if M.AS == 1 then
                list[i].burn = false
            end
            if not instant then
                TASK.yieldT((M.AS == 2 and .026 or .042) - (slipperiness - 1) / (M.AS == 2 and not URM and 1000 or 500))
            end
        end
    end
end

function GAME.commit(auto)
    if #GAME.quests == 0 then return end

    if URM and M.VL == 2 and not UltraVlCheck('start', auto) then return end

    local hand = TABLE.sort(GAME.getHand(false))

    if #hand == 0 and GAME.questTime < .1 and not #GAME.quests[1].combo == 0 then return SFX.play('no') end

    local q1 = TABLE.sort(GAME.quests[1].combo)
    local q2 = M.DP > 0 and TABLE.sort(GAME.quests[2].combo)

    local skipHMBU = false
    if #hand == 0 and (#q1 == 0 or (M.DP > 0 and #q2 == 0)) then
        skipHMBU = true
    end
    GAME.bufferLastCommit = not TABLE.equal(GAME.lastCommit, {}) and GAME.lastCommit or GAME.bufferLastCommit

    if M.DP > 0 and not (GAME.achv_honeymoonH and GAME.achv_breakupH) and GAME.totalQuest >= 1 and not skipHMBU and GAME.bufferLastCommit then
        local noRep = #TABLE.subtract(TABLE.copy(hand), GAME.bufferLastCommit or GAME.lastCommit) == #hand
        if noRep then
            if not GAME.achv_honeymoonH then
                GAME.achv_honeymoonH = GAME.roundHeight
                if GAME.totalQuest >= 10 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
        else
            if not GAME.achv_breakupH then
                GAME.achv_breakupH = GAME.roundHeight
                if GAME.totalQuest >= 10 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
        end
    end

    for _, id in next, GAME.lastCommit do CD[string.gsub(id, "r", "")].inLastCommit = false end
    GAME.lastCommit = TABLE.copy(hand)
    for _, id in next, GAME.lastCommit do CD[string.gsub(id, "r", "")].inLastCommit = true end

    if GAME.currentTask then
        GAME.incrementPrompt('commit')
        GAME.nixPrompt('keep_no_commit')
        for i = 1, 11 do
            local id = MD.deck[i].id
            if TABLE.find(hand, id) then
                GAME.incrementPrompt('commit_' .. id)
                GAME.incrementPrompt('commit_' .. id .. '_row')
                GAME.nixPrompt('commit_no_' .. id .. '_row')
            else
                GAME.incrementPrompt('commit_no_' .. id .. '_row')
                GAME.nixPrompt('commit_' .. id .. '_row')
            end
            if TABLE.find(hand, "r" .. id) then
                GAME.incrementPrompt('commit_r' .. id)
                GAME.incrementPrompt('commit_r' .. id .. '_row')
                GAME.nixPrompt('commit_no_r' .. id .. '_row')
            else
                GAME.incrementPrompt('commit_no_r' .. id .. '_row')
                GAME.nixPrompt('commit_r' .. id .. '_row')
            end
        end
        if #hand == 0 then
            GAME.incrementPrompt('commit_0')
            GAME.incrementPrompt('commit_0_row')
        else
            GAME.nixPrompt('commit_0_row')
            if not GAME.faultWrong then
                GAME.incrementPrompt('commit_' .. #hand .. 'card')
            end
        end
        local maxConn = 0
        local conn = 0
        for _, C in ipairs(CD) do
            if C.active then
                conn = conn + 1
                maxConn = max(maxConn, conn)
            else
                conn = 0
            end
        end
        if maxConn >= 2 then
            GAME.incrementPrompt('commit_conn_2')
            if maxConn >= 3 then
                GAME.incrementPrompt('commit_conn_3')
                if maxConn >= 4 then
                    GAME.incrementPrompt('commit_conn_4')
                end
            end
        else
            GAME.incrementPrompt('commit_no_conn')
        end
    end

    local correct, dblCorrect
    if TABLE.equal(hand, q1) then
        correct = 1
        dblCorrect = q2 and TABLE.equal(hand, q2)
    elseif q2 and TABLE.equal(hand, q2) then
        correct = 2
        GAME.incrementPrompt('pass_second')
    end

    if correct then
        if slipperiness > 0 then slipperiness = 0 end
        if GAME.currentTask then
            GAME.incrementPrompt('pass')
            for i = 1, #hand do GAME.incrementPrompt('pass_' .. hand[i]) end

            if #hand >= 4 then
                GAME.incrementPrompt('pass_windup')
                if #hand >= 5 then
                    GAME.incrementPrompt('pass_windup3')
                end
            end
        end

        if GAME.lifeState == 'danger' then
            GAME.achv_clutchQuest = GAME.achv_clutchQuest + 1
            SFX.play('clutch')
        end

        GAME.heal((dblCorrect and 3 or 1) * GAME.dmgHeal)
        if MATH.between(Floors[GAME.floor].top - (GAME.height + GAME.heightBuffer), 0, 2) then GAME.addHeight(3) end

        local dp = TABLE.find(hand, 'DP') or TABLE.find(hand, 'rDP')
        local attack = 3
        local surge = 0
        local xp = 0
        if dp and M.EX < 2 then attack = attack + 2 end
        local check_achv_romantic_homicide
        if GAME.fault then
            -- Non-perfect
            if GAME.currentTask then
                GAME.incrementPrompt('pass_imperfect')
                GAME.incrementPrompt('pass_imperfect_row')
                GAME.nixPrompt('pass_perfect_row')
                GAME.nixPrompt('keep_no_imperfect')
                GAME.nixPrompt('pass_windup_inb2b')
            end
            if M.AS == 2 then attack = 0 end
            xp = xp + 2
            if GAME.chain < 4 then
                SFX.play('clearline', .62)
            else
                check_achv_romantic_homicide = M.DP == 2 and GAME.chain >= 62 and GAME[GAME.getLifeKey(true)] == 0
                if GAME.currentTask then
                    if GAME.chain >= 4 and GAME.chain <= 10 and GAME.chain % 2 == 0 then
                        GAME.incrementPrompt('b2b_break_' .. GAME.chain)
                    end
                    if #hand >= 4 then
                        GAME.incrementPrompt('b2b_break_windup')
                        if #hand >= 5 then
                            GAME.incrementPrompt('b2b_break_windup3')
                        end
                    end
                end
                SFX.play('clearline')
                SFX.play(
                    GAME.chain < 8 and 'b2bcharge_blast_1' or
                    GAME.chain < 12 and 'b2bcharge_blast_2' or
                    GAME.chain < 24 and 'b2bcharge_blast_3' or
                    'b2bcharge_blast_4'
                )
                if GAME.chain >= 8 then
                    SFX.play('thunder' .. rnd(6), clampInterpolate(8, .7, 16, 1, GAME.chain))
                end
                local k = GAME.onAlly and 'life2' or 'life'
                local oldLife = GAME[k]
                while GAME.chain > 0 and GAME[k] < GAME.fullHealth do
                    GAME.chain = max(GAME.chain - 2, 0)
                    GAME[k] = min(GAME[k] + 1, GAME.fullHealth)
                end
                if GAME[k] > oldLife then GAME.incrementPrompt('heal', GAME[k] - oldLife) end
                if GAME.chain > 0 then
                    surge = GAME.chain
                end
            end
            GAME.chain = 0

            if not GAME.achv_perfectionistH then
                GAME.achv_perfectionistH = GAME.roundHeight
                if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
        else
            -- Perfect
            if GAME.currentTask then
                GAME.incrementPrompt('pass_perfect')
                GAME.incrementPrompt('pass_perfect_row')
                GAME.nixPrompt('pass_imperfect_row')
                GAME.nixPrompt('keep_no_perfect')
                if #hand >= 4 then
                    GAME.incrementPrompt('pass_windup_perfect')
                    if #hand >= 5 then
                        GAME.incrementPrompt('pass_windup3_perfect')
                    end
                    if GAME.chain >= 4 then
                        GAME.incrementPrompt('pass_windup_inb2b')
                    else
                        GAME.nixPrompt('pass_windup_inb2b')
                    end
                end
            end

            SFX.play(MATH.roll(.626) and 'clearspin' or 'clearquad', .5)
            if correct == 1 then
                if M.NH < 2 then attack = attack + 1 end
                if M.AS == 2 and GAME.chain >= 4 then attack = attack + 1 end
                xp = xp + 3
                GAME.chain = GAME.chain + 1
                if GAME.chain < 4 then
                elseif GAME.chain < 8 then
                    if GAME.chain == 4 then SFX.play('b2bcharge_start', .8) end
                    SFX.play('b2bcharge_1', .8)
                elseif GAME.chain < 12 then
                    SFX.play('b2bcharge_2', .8)
                elseif GAME.chain < 24 then
                    SFX.play('b2bcharge_3', .8)
                else
                    SFX.play('b2bcharge_4', .8)
                end
            end

            GAME.totalPerfect = GAME.totalPerfect + (dblCorrect and 2 or 1)
            if not GAME.achv_arroganceH and GAME.comboStr == 'rAS' then
                GAME.achv_arroganceH = GAME.roundHeight
                if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
            if not GAME.achv_powerlessH and GAME.chain >= 4 then
                GAME.achv_powerlessH = GAME.roundHeight
                if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
        end
        if dblCorrect then
            attack = attack * 3
            xp = xp * 3
            GAME.chain = GAME.chain + 1
        end
        if GAME.chain >= 4 then
            if GAME.chain == 4 then
                for i = 1, 3 do
                    SparkPS[i]:reset()
                    SparkPS[i]:setEmissionRate(0)
                end
            elseif GAME.chain % 8 == 0 then
                for i = 1, 3 do
                    SparkPS[i]:setEmissionRate(GAME.chain ^ .5 * .42 + rnd() * .5)
                end
            end
            if M.AS < 2 then
                TEXTS.chain:set(tostring(GAME.chain))
            else
                if GAME.chain <= 26 then
                    if GAME.chain == 4 then
                        WoundPS:reset()
                    end
                    local r = clampInterpolate(4, 26, 26, 62, GAME.chain)
                    WoundPS:setEmissionArea('uniform', r, r, 0, false)
                end
                if GAME.chain % 4 == 0 then
                    if GAME.chain <= 100 then
                        local s = 1 + GAME.chain / 200
                        ---@diagnostic disable-next-line
                        WoundPS:setSizes(0, 1 * s, .9 * s, .8 * s, .7 * s, .6 * s, .42 * s)
                    end
                end
                WoundPS:setEmissionRate(clampInterpolate(16, 1, 2600, 6.26, GAME.chain ^ 2))
                WoundPS:setLinearDamping(clampInterpolate(4, 1.2, 42, 0.626, GAME.chain))

                TEXTS.chain2:clear()
                local s = tostring(GAME.chain)
                local i = 0
                if s:sub(1, 1) == '1' then i = i - .35 end
                for c in string.gmatch(s, ".") do
                    i = i + 1
                    TEXTS.chain2:addf(
                        c, 260, 'center',
                        32 * (i - #s / 2 - .5), 0,
                        MATH.rand(-.12, .12), 1.26, 1.26, 129, 26
                    )
                end
            end

            GAME.achv_maxChain = max(GAME.achv_maxChain, GAME.chain)
            if GAME.chain >= 70 and GAME.chain - (dblCorrect and 2 or 1) < 70 then
                SubmitAchv('perfect_speedrun', GAME.time)
            end
        end

        SFX.play(dp and 'zenith_start_duo' or 'zenith_start', .626, 0, Tone(12))

        if GAME.achv_escapeBurnt then
            GAME.achv_escapeBurnt = false
            GAME.achv_escapeQuest = GAME.achv_escapeQuest + 1
        end
        if GAME.achv_felMagicBurnt then
            GAME.achv_felMagicBurnt = false
            GAME.achv_felMagicQuest = GAME.achv_felMagicQuest + 1
        end
        if GAME.achv_resetCount % 2 == 1 then
            GAME.achv_obliviousQuest = GAME.achv_obliviousQuest + 1
        end

        -- Spike
        if GAME.spikeTimer <= 0 then
            GAME.spikeTimer = 0
            GAME.spikeCounter = 0
            GAME.spikeCounterWeak = 0
        end
        GAME.spikeTimer = MATH.clamp(
            GAME.spikeTimer + (attack + surge) / (12.6 + GAME.spikeCounter / 26),
            GAME.spikeCounter < 8 and 1.26 or .8,
            6.2
        )
        GAME.spikeCounter = GAME.spikeCounter + attack + surge
        GAME.maxSpike = max(GAME.maxSpike, GAME.spikeCounter)
        GAME.spikeCounterWeak = GAME.spikeCounterWeak + attack
        GAME.maxSpikeWeak = max(GAME.maxSpikeWeak, GAME.spikeCounterWeak)
        if GAME.spikeCounter >= 8 then TEXTS.spike:set(tostring(GAME.spikeCounter)) end

        attack = attack + surge

        if M.DP > 0 then
            if M.DP == 2 then
                if GAME.takeDamage(URM and attack / 2.6 or attack / 4, 'wrong', GAME[GAME.getLifeKey(true)] > 0) then
                    return
                elseif check_achv_romantic_homicide then
                    IssueAchv('romantic_homicide')
                end
            end
            if GAME[GAME.getLifeKey(true)] == 0 then
                xp = xp / 2
                attack = attack / 2
            elseif not GAME.achv_carriedH then
                GAME.achv_carriedH = GAME.roundHeight
                if GAME.totalQuest >= 26 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
        end

        attack = MATH.roundRnd(attack)

        GAME.incrementPrompt('send', attack)
        GAME.totalAttack = GAME.totalAttack + attack
        if not GAME.DPlock then
            GAME.addHeight(attack * GAME.attackMul)
        end
        GAME.addXP(attack + xp)

        -- rMS little shuffle
        if M.MS == 2 then
            if URM then
                GAME.readyShuffle(GAME.floor * 2.6, true)
            else
                local r1 = rnd(2, #CD - 1)
                local r2 = r1 + MATH.coin(-1, 1)
                local r3
                if GAME.floor <= 8 then
                    CD[r1], CD[r2] = CD[r2], CD[r1]
                else
                    repeat r3 = rnd(r1 - 2, r1 + 2) until r3 ~= r1 and r3 ~= r2 and MATH.between(r3, 1, #CD)
                    CD[r1], CD[r2], CD[r3] = CD[r2], CD[r3], CD[r1]
                end
                GAME.refreshLayout()
            end
        end

        GAME.cancelAll(true)
        GAME.cancelBurn()
        GAME.dmgTimer = min(GAME.dmgTimer + max(2.6, GAME.dmgDelay / 2), GAME.dmgDelay)

        for i = dblCorrect and 2 or 1, 1, -1 do
            local p = dblCorrect and i or correct
            if #GAME.quests < GAME.maxQuestCount + 1 then
                GAME.genQuest()
            end
            rem(GAME.quests, p).name:release()
            local combo = GAME.quests[correct] and GAME.quests[correct].combo or NONE
            if #combo >= 4 then
                local pwr = #combo * 2 - 7
                if TABLE.find(combo, 'DH') then pwr = pwr + 1 end
                SFX.play('garbagewindup_' .. MATH.clamp(pwr, 1, 6), 1, 0, Tone(0))
                local revCount = M.PN == 0 and 0 or string.count(table.concat(combo), "r")
                if revCount > 0 then
                    SFX.play('garbagewindup_' .. revCount .. '_reverse', .3875, 0, Tone(0))
                end
            end
            GAME.questReady()
            GAME.totalQuest = GAME.totalQuest + 1
            if GAME.totalQuest == 40 then
                local noTSR
                if GAME.comboStr == '' then noTSR = SubmitAchv('clicker_speedrun', GAME.time) end
                SubmitAchv('typer_speedrun', GAME.time, noTSR)
            elseif GAME.totalQuest == 41 then
                if GAME.comboStr == 'EXMS' then SubmitAchv('block_rationing', GAME.roundHeight) end
            end
        end

        if M.DP > 0 and (correct == 2 or dblCorrect) then
            if GAME.swapControl() then
                SFX.play('party_ready', 1, 0, Tone(0))
            end
        end

        if GAME.shuffleMessiness then
            GAME.sortCards()
            if M.MS == 1 then
                GAME.weakShuffleCards(GAME.shuffleMessiness)
            elseif M.MS == 2 then
                GAME.shuffleCards(GAME.shuffleMessiness)
            end
            GAME.shuffleMessiness = false
        end

        if M.MS == 1 and GAME.floor >= 10 and GAME.totalQuest % 40 == 0 then GAME.readyShuffle(4) end
    else
        if GAME.currentTask then
            if M.PN == 0 or string.count(table.concat(hand), "r") == 0 then
                if #hand >= 7 and not TABLE.find(hand, 'DP') and not TABLE.find(hand, 'PN') then
                    GAME.incrementPrompt(#hand == 8 and 'commit_swamp' or 'commit_swamp_l')
                elseif #hand >= 8 and not TABLE.find(hand, 'DP') and TABLE.find(hand, 'PN') then
                    GAME.incrementPrompt(#hand == 9 and 'commit_why' or 'commit_why_l')
                end
            elseif string.count(table.concat(hand), "r") == 10 or (string.count(table.concat(hand), "r") == 9 and #hand == 11) then
                GAME.incrementPrompt('commit_singularity')
            end
            if
                #hand + #q1 == 11 and
                #hand == #TABLE.subtract(TABLE.copy(hand), q1) or
                q2 and #hand + #q2 == 11 and
                #hand == #TABLE.subtract(TABLE.copy(hand), q2)
            then
                GAME.incrementPrompt('commit_reversed')
            end
        end

        GAME.fault = true
        GAME.faultWrong = true

        if GAME.takeDamage(max(GAME.dmgWrong + GAME.dmgWrongExtra, 1), 'wrong') then return end
        GAME.dmgWrongExtra = GAME.dmgWrongExtra + .5

        if M.GV > 0 then GAME.gravTimer = GAME.gravDelay end
        if M.EX > 0 then
            GAME.cancelAll(true)
        elseif M.AS == 1 then
            GAME.cancelBurn()
        end
    end
end

local function task_startSpin()
    for _, C in ipairs(CD) do
        C.tempOrder = C.initOrder
        if C.active then C:setActive(true) end
    end
    for _, C in ipairs(CD) do
        C.lock = false
        if M.MS == 0 then
            if C.lock then
                C:flick()
            else
                C:spin()
            end
            TASK.yieldT(.01)
        end
    end
    if M.MS == 1 then
        GAME.weakShuffleCards(0)
    elseif M.MS == 2 then
        GAME.shuffleCards(2.6)
    end
end
function GAME.start()
    if TASK.getLock('cannotStart') then
        SFX.play('garbagerise')
        return
    end
    if URM and M.VL == 2 and not UltraVlCheck('start') then return end
    if slipperiness > 0 then slipperiness = 0 end
    
    FloatOnCard = nil
    GAME.refreshLayout()
    GAME.omega = false
    GAME.negFloor = 1
    GAME.negEvent = 1
    GAME.timerMul = 1
    GAME.ultraRun = GAME.anyRev and URM
    GAME.attackMul = GAME.ultraRun and .6 or 1
    GAME.xpLockLevelMax = URM and M.NH == 2 and 1 or 5
    GAME.invincible = TEST and NOFAIL
    GAME.questsGenerated = 0
    GAME.bufferCombo = nil

    TASK.unlock('sure_quit')
    SCN.scenes.tower.widgetList.help:setVisible(false)
    SCN.scenes.tower.widgetList.help2:setVisible(false)
    SCN.scenes.tower.widgetList.daily:setVisible(false)
    MSG.clear()

    SFX.play('menuconfirm', .8)
    SFX.play((M.DP > 0 or VALENTINE and not GAME.anyRev) and 'zenith_start_duo' or 'zenith_start', 1, 0, Tone(0))

    GAME.playing = true

    -- Statistics
    GAME.comboStr = table.concat(TABLE.sort(GAME.getHand(true)))
    GAME.ultraComboStr = URM and GAME.anyRev and GAME.comboStr:gsub("r", "u") or nil
    GAME.prevPB = BEST.highScore[GAME.ultraComboStr or GAME.comboStr]
    if GAME.prevPB == 0 then GAME.prevPB = -2600 end
    GAME.totalFlip = 0
    GAME.totalQuest = 0
    GAME.totalPerfect = 0
    GAME.totalAttack = 0
    GAME.heightBonus = 0
    GAME.peakRank = 1
    GAME.rankTimer = TABLE.new(0, 26)

    -- Time
    GAME.time = 0
    GAME.gigaTime = false
    GAME.questTime = 0
    GAME.floorTime = 0
    GAME.secTime = {}

    -- Rank
    GAME.rank = 1
    TEXTS.rank:set("R-1")
    GAME.xp = 0
    GAME.rankupLast = false
    GAME.xpLockLevel = GAME.xpLockLevelMax
    GAME.xpLockTimer = 0

    -- Floor
    GAME.floor = 0
    GAME.height = 0
    GAME.heightBuffer = 0
    GAME.fatigueSet = Fatigue[M.EX == 2 and 'rEX' or M.DH == 2 and 'rDH' or M.DP == 2 and 'rDP' or M.PN >= 1 and 'PN' or 'normal']
    GAME.fatigue = 1
    GAME.animDuration = GAME.slowmo and 26 or 1
    GAME.lastCommit = {}
    GAME.bufferLastCommit = nil

    -- Params
    GAME.revFaultXP = 1
    GAME.maxQuestCount = M.NH == 2 and (M.DP == 0 and 1 or 2) or 3
    GAME.maxQuestSize = M.DH == 2 and 3 or 4
    GAME.extraQuestBase = (M.DH > 0 and .626 or 0) + (M.NH == 2 and M.DH < 2 and -.42 or 0) - .15
    GAME.extraQuestVar = (M.DH > 0 and .626 or 1)
    GAME.questFavor = 0 -- Initialized in GAME.upFloor()
    GAME.dmgHeal = 2
    GAME.dmgWrong = 1
    GAME.dmgTime = 2
    GAME.dmgTimerMul = 1
    GAME.dmgDelay = 15
    GAME.dmgCycle = 5

    -- Player
    GAME.life = 20
    GAME.fullHealth = 20
    GAME.dmgTimer = GAME.dmgDelay
    GAME.chain = 0
    GAME.gigaspeed = false
    GAME.gigaspeedEntered = false
    GAME.atkBuffer = 0
    GAME.atkBufferCap = 8 + (M.DH == 1 and M.NH < 2 and 2 or 0)
    GAME.shuffleMessiness = false

    -- Spike
    GAME.spikeTimer = 0
    GAME.spikeCounter = 0
    GAME.spikeCounterWeak = 0
    GAME.maxSpike = 0
    GAME.maxSpikeWeak = 0

    -- rDP
    GAME.onAlly = false
    GAME.life2 = 20
    GAME.rankLimit = 26000
    GAME.reviveCount = 0
    GAME.reviveDifficulty = 0
    GAME.killCount = 0
    GAME.currentTask = false
    GAME.DPlock = false
    GAME.lastFlip = false
    if M.DP == 2 then
        GAME.rankLimit = 8 + 4 * M.EX
        GAME.dmgHeal = 3
    end

    if M.DP > 0 then
        GAME.life = 15
        GAME.life2 = 15
        GAME.fullHealth = 15
    end

    GAME.refreshLifeState()

    GAME.refreshModIcon()
    TABLE.clear(ComboColor)
    for k, v in next, M do
        if v > 0 then
            local c = TABLE.copy(MD.color[k])
            c[4] = nil
            ins(ComboColor, c)
        end
    end
    if #ComboColor > 0 then
        TABLE.shuffle(ComboColor)
        ins(ComboColor, TABLE.copy(ComboColor[1]))
        TABLE.transpose(ComboColor)
    end

    GAME.upFloor()

    TABLE.clear(GAME.quests)
    for _ = 1, GAME.maxQuestCount do GAME.genQuest() end
    GAME.questReady()

    TASK.removeTask_code(task_startSpin)
    TASK.new(task_startSpin)

    if not GAME.invisDashboard and M.PN == 0 then TWEEN.new(GAME.anim_setLightHide_rev):setDuration(GAME.slowmo and 2.6 or .26):setUnique('lightHide'):run() end
    if not GAME.anyRev and URM then TWEEN.new(GAME.anim_setLightColorProg):setDuration(GAME.slowmo and 2.6 or .26):setUnique('colorProg'):run() end
    if M.AS > 0 then TWEEN.new(GAME.anim_resizeResetAS):setDuration(GAME.slowmo and 2.6 or .26):setUnique('resizeResetAS'):run() end
    TWEEN.new(GAME.anim_setMenuHide):setOnFinish(GAME.anim_setMenuHide_finish):setDuration(GAME.slowmo and 2.6 or .26):setUnique('uiHide'):run()
    GAME.updateBgm('start')

    GAME.achv_perfectionistH = nil
    GAME.achv_demoteH = nil
    GAME.achv_carriedH = nil
    GAME.achv_arroganceH = nil
    GAME.achv_powerlessH = nil
    GAME.achv_patienceH = nil
    GAME.achv_spotlessH = nil
    GAME.achv_talentlessH = nil
    GAME.achv_honeymoonH = nil
    GAME.achv_breakupH = nil
    GAME.achv_protectH = nil
    GAME.achv_psychokinesisH = nil
    GAME.achv_maxChain = 0
    GAME.achv_maxReviveH = nil
    GAME.achv_totalDmg = 0
    GAME.achv_clutchQuest = 0
    GAME.achv_escapeBurnt = false
    GAME.achv_escapeQuest = 0
    GAME.achv_felMagicBurnt = false
    GAME.achv_felMagicQuest = 0
    GAME.achv_resetCount = 0
    GAME.achv_obliviousQuest = 0
    if M.DP == 1 then IssueAchv('intended_glitch') end
end

---@param reason 'forfeit' | 'wrong' | 'time'
function GAME.finish(reason)
    SCN.scenes.tower.widgetList.help:setVisible(not GAME.zenithTraveler)
    SCN.scenes.tower.widgetList.help2:setVisible(not GAME.zenithTraveler)
    SCN.scenes.tower.widgetList.daily:setVisible(not GAME.zenithTraveler)
    TABLE.clear(HoldingButtons)
    MSG.clear()

    SFX.play(
        reason == 'forfeit' and 'detonated' or
        reason == 'wrong' and 'topout' or
        reason == 'time' and 'losestock' or
        'shatter', .8
    )

    GAME.sortCards()
    if slipperiness > 0 then slipperiness = 0 end
    for _, C in ipairs(CD) do
        if (M[C.id] > 0) ~= C.active then
            C:setActive(true)
        end
        if not C.active and not C.upright then C.upright = true end
        C.reversed = false
        C.correctTouch = false
        C.touchCount = 0
        -- C.required = false
        C.required2 = false
        C.requiredRev2 = false
        C.inLastCommit = false
        C.freezeGrace = 10
        C.freeze = false
        C.burn = false
        C.charge = 0
    end
    FloatOnCard = false
    GAME.refreshLayout()

    GAME.playing = false
    if M.DH == 2 then GAME.finishTime = love.timer.getTime() end
    GAME.life, GAME.life2 = 0, 0
    GAME.currentTask = false
    
    local unlockFool
    local unlockDuo
    if GAME.totalQuest > 2.6 and not TEST then
        if GAME.floor >= 10 then
            local unlockRev
            local reverseCountNum = 0
            for k, v in next, M do
                if v == 2 and URM then v = v + 1 end
                if v > GAME.completion[k] then
                    if GAME.completion[k] == 0 then
                        if k == 'DP' then
                            unlockDuo = true
                        else
                            unlockRev = true
                        end
                        RevUnlocked = true
                    end
                    GAME.completion[k] = v
                end
                if CD.PN.lock == true and GAME.completion[k] >= 2 then
                    reverseCountNum = reverseCountNum + 1
                end
            end
            if reverseCountNum == 9 then
                unlockFool = true
            end
            if unlockRev then
                MSG('dark', MOBILE and
                    STRING.trimIndent [[
                        You've unlocked a new REVERSED MOD!
                        Activate it by press & hold the blue area at the left side,
                        then click on a card that has a star on it.
                    ]] or
                    STRING.trimIndent [[
                        You've unlocked a new REVERSED MOD!
                        Activate it by right-clicking on a card that has a star on it.
                    ]]
                    , 6.26)
                SFX.play('notify')
            end
        end

        -- Statistics
        STAT.maxFloor = max(STAT.maxFloor, GAME.floor)
        if GAME.height > STAT.maxHeight then
            STAT.maxHeight = GAME.roundHeight
            STAT.heightDate = os.date("%y.%m.%d %H:%M%p")
        end
        STAT.totalGame = STAT.totalGame + 1
        STAT.totalTime = roundUnit(STAT.totalTime + GAME.time, .001)
        STAT.totalFlip = STAT.totalFlip + GAME.totalFlip
        STAT.totalQuest = STAT.totalQuest + GAME.totalQuest
        STAT.totalPerfect = STAT.totalPerfect + GAME.totalPerfect
        STAT.totalAttack = STAT.totalAttack + GAME.totalAttack
        STAT.totalHeight = roundUnit(STAT.totalHeight + abs(GAME.height), .01)
        STAT.totalBonus = roundUnit(STAT.totalBonus + abs(GAME.heightBonus), .01)
        STAT.totalFloor = STAT.totalFloor + (GAME.floor - 1) + (GAME.negFloor - 1)
        if GAME.gigaspeedEntered then STAT.totalGiga = STAT.totalGiga + 1 end
        if GAME.floor >= 10 then STAT.totalF10 = STAT.totalF10 + 1 end

        local oldZP, zpGain = STAT.zp, GAME.roundHeight * GAME.comboZP
        if DailyActived then
            STAT.dzp = max(STAT.dzp, zpGain)
            
            if GAME.dailyState == 0 then
                STAT.dailyBest = max(STAT.dailyBest, zpGain)
            elseif GAME.dailyState == 2 then
                STAT.uDailyBest = max(STAT.uDailyBest, zpGain)
            end
            if GAME.floor >= 10 then
                if GAME.dailyState == 0 and GAME.comboStr:find('r') and not STAT.dailyMastered then
                    STAT.dailyMastered = true
                    STAT.vipListCount = STAT.vipListCount + 1
                    SubmitAchv('vip_list', STAT.vipListCount)
                elseif GAME.dailyState == 2 and GAME.comboStr:find('r') and not STAT.uDailyMastered then
                    STAT.uDailyMastered = true
                    STAT.mvpListCount = STAT.mvpListCount + 1
                    SubmitAchv('mvp_list', STAT.mvpListCount)
                end
                if GAME.comboStr:count('r') >= 2 then
                    IssueAchv('its_kinda_rare')
                end
            end
            -- TODO: send to online leaderboard
        end
        STAT.zp = max(
            STAT.zp,
            STAT.zp < zpGain * 16 and min(STAT.zp + zpGain, zpGain * 16) or
            zpGain * 16 + (STAT.zp - zpGain * 16) * (9 / 10) + (zpGain * 10) * (1 / 10)
        )
        if DailyActived then STAT.zp = MATH.clamp(STAT.zp + (STAT.zp - oldZP) * 1.6, STAT.zp, 50 * zpGain) end
        TEXTS.zpChange:set(("%.0f ZP  (+%.0f%s)"):format(zpGain, 0, DailyActived and ", 260%" or ""))
        local zpEarn = STAT.zp - oldZP
        if zpEarn > 0 then
            TASK.new(function()
                TASK.yieldT(0.626)
                TWEEN.new(function(t)
                    TEXTS.zpChange:set(("%.0f ZP  (+%.0f%s)"):format(zpGain, zpEarn * t, DailyActived and ", 260%" or ""))
                end):setEase('InOutCubic'):setDuration(2):run()
                SFX.play('ratingraise', zpEarn ^ .5 / 60)
            end)
        end
        SaveStat()

        -- Best
        local hand = GAME.getHand(true)
        local oldPB = BEST.highScore[GAME.ultraComboStr or GAME.comboStr]
        if GAME.height > oldPB then
            BEST.highScore[GAME.ultraComboStr or GAME.comboStr] = GAME.roundHeight
            if #hand > 0 and oldPB < Floors[9].top and GAME.floor >= 10 then
                local t = #hand == 1 and "MOD MASTERED" or "COMBO MASTERED"
                if GAME.anyRev then t = t:gsub(" ", URM and "++ " or "+ ", 1) end
                TEXT:add {
                    text = t,
                    x = 800, y = 226, k = 2.26, fontSize = 70,
                    style = 'beat', inPoint = .26, outPoint = .62,
                    color = 'lC', duration = 6.2,
                }
                SFX.play('worldrecord', 1, 0, Tone(#hand == 1 and -1 or 0))
            elseif GAME.floor >= 2 then
                TEXT:add {
                    text = "PERSONAL BEST",
                    x = 800, y = 226, k = 2.6, fontSize = 70,
                    style = 'beat', inPoint = .26, outPoint = .62,
                    color = 'lY', duration = 6.2,
                }
                SFX.play('personalbest', 1, 0, Tone(-.1))
            end
            SFX.play('applause', GAME.floor / 10)
            SaveBest()
        end

        TEXTS.endHeight:set(("%.1fm"):format(GAME.height))
        local endFloorStr
        if GAME.height >= 0 then
            endFloorStr = ("F$1: $2"):repD(GAME.floor, Floors[GAME.floor].name)
        else
            endFloorStr = ("B$1: $2"):repD(GAME.negFloor, NegFloors[GAME.negFloor].name)
        end
        if GAME.gigaspeedEntered then
            if GAME.gigaTime then endFloorStr = endFloorStr .. "   in " .. STRING.time_simp(GAME.gigaTime) end
            local l = endFloorStr:atomize()
            local len = #l
            for i = len, 1, -1 do ins(l, i, { COLOR.HSV(lerp(.026, .626, i / len), GAME.gigaTime and .6 or .2, 1) }) end
            TEXTS.endFloor:set(l)
        else
            TEXTS.endFloor:set(endFloorStr)
        end

        local g = GAME
        TEXTS.endResult:set({
            COLOR.L, ("Time  %s"):format(STRING.time_simp(g.time)),
            COLOR.LD, g.gigaTime and ("  (F10 at %s)\n"):format(STRING.time_simp(g.gigaTime)) or "\n",
            COLOR.L, ("Flip  %d"):format(g.totalFlip),
            COLOR.LD, ("  (%.2f/s)\n"):format(g.totalFlip / g.time),
            COLOR.L, ("Quest  %d"):format(g.totalQuest),
            COLOR.LD, ("  (%.2f/s  %.1f%% Perf)\n"):format(g.totalQuest / g.time, g.totalPerfect / g.totalQuest * 100),
            COLOR.L, ("Speed  %.1fm/s"):format(roundUnit(g.height / g.time, .1)),
            COLOR.LD, ("  (max rank %d)\n"):format(g.peakRank),
            COLOR.L, ("Attack  %d"):format(g.totalAttack),
            COLOR.LD, ("  (%.1fapm  %.2feff)\n"):format(g.totalAttack / g.time * 60, g.totalAttack / g.totalQuest),
            COLOR.L, ("Bonus  %.1fm"):format(g.heightBonus),
            COLOR.LD, ("  (%.1f%%  %.1fm/quest)"):format(g.heightBonus / g.height * 100, g.heightBonus / g.totalQuest),
        })

        local maxCSP = {}
        for i = 1, #GAME.rankTimer do ins(maxCSP, { i, GAME.rankTimer[i] }) end
        do
            table.sort(maxCSP, function(a, b) return a[2] > b[2] end)
            local mainRank = maxCSP[1]

            table.sort(maxCSP, function(a, b) return a[1] < b[1] end)
            local bestPos, bestSum = 0, 0
            for i = min(mainRank[1], 26 - 8), max(mainRank[1] - 8, 1), -1 do
                local sum = 0
                for j = i, i + 8 do
                    sum = sum + maxCSP[j][2]
                end
                if sum > bestSum then
                    bestSum = sum
                    bestPos = i
                end
            end

            local rankTimeText = {}
            for i = bestPos + 8, bestPos, -1 do
                ins(rankTimeText, { 1, 1, 1, max(maxCSP[i][2] / mainRank[2], .42) })
                ins(rankTimeText, ("Rank%d - %.1f″\n"):format(maxCSP[i][1], maxCSP[i][2]))
            end
            TEXTS.rankTime:set(rankTimeText)
        end

        GAME.refreshResultModIcon()

        -- Achievements
        local _t
        if not ACHV.mastery then
            _t = 0
            for id in next, MD.name do if id ~= "PN" and BEST.highScore[id] >= Floors[9].top then _t = _t + 1 end end
            if _t >= 9 then IssueAchv('mastery') end
        end
        if not ACHV.FM_ascension then
            _t = 0
            for id in next, MD.name do if BEST.highScore[id] >= Floors[9].top then _t = _t + 1 end end
            if _t >= 10 then IssueAchv('FM_ascension') end
        end
        if not ACHV.subjugation then
            _t = 0
            for id in next, MD.name do if id ~= "PN" and BEST.highScore['r' .. id] >= Floors[9].top then _t = _t + 1 end end
            if _t >= 9 then IssueAchv('subjugation') end
        end
        if not ACHV.FM_transcension then
            _t = 0
            for id in next, MD.name do if BEST.highScore['r' .. id] >= Floors[9].top then _t = _t + 1 end end
            if _t >= 10 then IssueAchv('FM_transcension') end
        end

        local godhood = TABLE.replaceAll(TABLE.copyAll(GAME.completion), 3, 2)
        if not ACHV.false_god and MATH.sumAll(godhood) - godhood.PN >= 18 then IssueAchv('false_god', ACHV.subjugation) end
        if not ACHV.FM_true_god and MATH.sumAll(godhood) >= 20 then IssueAchv('FM_true_god', ACHV.FM_transcension) end

        if not ACHV.the_harbinger then
            local allRevF5 = true
            for id in next, MD.name do
                if id ~= "PN" and BEST.highScore['r' .. id] < Floors[4].top then
                    allRevF5 = false
                    break
                end
            end
            if allRevF5 then
                IssueAchv('the_harbinger')
            end
        end
        if not ACHV.FM_the_foretold then
            local allRevF5 = true
            for id in next, MD.name do
                if BEST.highScore['r' .. id] < Floors[4].top then
                    allRevF5 = false
                    break
                end
            end
            if allRevF5 then
                IssueAchv('FM_the_foretold')
            end
        end

        _t = 0
        for id in next, MD.name do _t = _t + min(BEST.speedrun[id], 2600) end
        SubmitAchv('zenith_speedrunner', _t, true)
        _t = 0
        for id in next, MD.name do _t = _t + min(BEST.speedrun['r' .. id], 2600) end
        SubmitAchv('divine_speedrunner', _t, true)
        _t = 0
        for id in next, MD.name do _t = _t + BEST.highScore[id] end
        SubmitAchv('zenith_challenger', _t, true)
        _t = 0
        for id in next, MD.name do _t = _t + BEST.highScore['r' .. id] end
        SubmitAchv('divine_challenger', _t, true)

        SubmitAchv('multitasker', roundUnit(GAME.height * GAME.comboMP, .01))
        SubmitAchv('effective', zpGain)
        SubmitAchv('teraspeed', GAME.peakRank)
        table.sort(maxCSP, function(a, b) return a[1] > b[1] end)
        for i = 1, #maxCSP do
            if maxCSP[i][2] >= 60 then
                SubmitAchv('cruise_control', maxCSP[i][1])
                break
            end
        end
        SubmitAchv('the_perfectionist', GAME.achv_perfectionistH or GAME.roundHeight)
        SubmitAchv('sunk_cost', GAME.achv_demoteH or GAME.roundHeight)
        SubmitAchv('patience_is_a_virtue', GAME.achv_patienceH or GAME.roundHeight)
        SubmitAchv(GAME.comboStr, GAME.roundHeight)
        SubmitAchv('powerless', GAME.achv_powerlessH or GAME.roundHeight)
        SubmitAchv('the_spike_of_all_time', GAME.maxSpikeWeak)
        SubmitAchv('the_spike_of_all_time_plus', GAME.maxSpike)
        -- if abs(GAME.height - 2202.8) <= 10 then SubmitAchv('moon_struck', roundedH) end
        if GAME.height >= 6200 then IssueAchv('skys_the_limit') end
        SubmitAchv('psychokinesis', GAME.achv_psychokinesisH or GAME.roundHeight)
        if Floors[9].top - 24 <= GAME.height and GAME.height < Floors[9].top then
            SubmitAchv('divine_rejection', GAME.roundHeight)
        end
        if GAME.heightBonus / GAME.height * 100 >= 260 then IssueAchv('fruitless_effort') end
        if GAME.comboStr == 'PN' then
            if FOOLS_DAY then SubmitAchv('FM_jokes_on_you', GAME.roundHeight) end
        elseif GAME.comboStr == 'rPN' then
            if FOOLS_DAY then SubmitAchv('FM_fools_gold', GAME.roundHeight) end
        elseif GAME.comboStr == 'DP' then
            if VALENTINE then SubmitAchv('lovers_promise', GAME.roundHeight) end
        elseif GAME.comboStr == 'AS' then
            SubmitAchv('talentless', GAME.achv_talentlessH or GAME.roundHeight)
        elseif GAME.comboStr == 'EXMS' then
            if GAME.totalQuest <= 40 then SubmitAchv('block_rationing', GAME.roundHeight) end
        elseif GAME.comboStr == 'EXVL' then
            SubmitAchv('wax_wings', GAME.achv_demoteH or GAME.roundHeight)
        elseif GAME.comboStr == 'NHrGV' then
            SubmitAchv('clutch_main', GAME.achv_clutchQuest)
        elseif GAME.comboStr == 'ASDHMS' then
            SubmitAchv('the_escape_artist', GAME.achv_escapeQuest)
        elseif GAME.comboStr == 'ASDHrIN' then
            SubmitAchv('the_oblivious_artist', GAME.achv_obliviousQuest)
        elseif GAME.comboStr == 'rGV' then
            SubmitAchv('spotless', GAME.achv_spotlessH or GAME.roundHeight)
        elseif GAME.comboStr == 'rAS' then
            SubmitAchv('arrogance', GAME.achv_arroganceH or GAME.roundHeight)
            SubmitAchv('fel_magic', GAME.achv_felMagicQuest)
        elseif GAME.comboStr == 'rDP' then
            SubmitAchv('overprotection', GAME.achv_protectH or GAME.roundHeight)
        end
        if M.DP > 0 then
            SubmitAchv('the_responsible_one', GAME.reviveCount)
            SubmitAchv('guardian_angel', GAME.achv_maxReviveH or 0)
            SubmitAchv('carried', GAME.achv_carriedH or GAME.roundHeight)
            SubmitAchv('honeymoon', GAME.achv_honeymoonH or GAME.roundHeight)
            SubmitAchv('break_up', GAME.achv_breakupH or GAME.roundHeight)
            if M.DP == 2 then
                SubmitAchv('the_unreliable_one', GAME.killCount)
            end
        end
        if GAME.comboStr == '' then
            SubmitAchv('zenith_explorer', GAME.roundHeight)
            SubmitAchv('supercharged', GAME.achv_maxChain)
            SubmitAchv('the_spike_of_all_time_minus', GAME.maxSpikeWeak)
        elseif GAME.comboMP >= 8 and STRING.count(GAME.comboStr, 'r') >= 2 then
            for mp = GAME.comboMP, 8, -1 do
                local name = (mp > 18 and "FM_" or "") .. RevSwampName[min(mp, #RevSwampName)]:sub(2, -2):lower()
                SubmitAchv(name, GAME.roundHeight, mp < GAME.comboMP)
            end
        elseif not TABLE.find(hand, 'PN') and (#hand == 9 or #hand >= 7 and not TABLE.find(hand, 'DP')) then
            local sw = {
                'swamp_water_lite',
                'swamp_water',
                'swamp_water_pro',
                'swamp_water_x',
            }
            for i = #hand, 7, -1 do
                SubmitAchv(sw[i - 6], GAME.roundHeight)
                if GAME.anyRev then SubmitAchv(sw[i - 6] .. '_plus', GAME.roundHeight) end
            end
        elseif #hand == 10 or #hand >= 8 and not TABLE.find(hand, 'DP') then
            local sw = {
                'why_lite',
                'why',
                'why_pro',
            }
            for i = #hand, 8, -1 do
                SubmitAchv(sw[i - 7], GAME.roundHeight)
                if GAME.anyRev then SubmitAchv(sw[i - 7] .. '_plus', GAME.roundHeight) end
            end
        end
        SubmitAchv('zenith_explorer_plus', GAME.roundHeight)
        SubmitAchv('supercharged_plus', GAME.achv_maxChain)
    else
        TEXTS.endHeight:set("")
        TEXTS.endFloor:set("")
        TEXTS.endResult:set("")
        TEXTS.zpChange:set("")
        TEXTS.zpChange:set("")
        TEXTS.floorTime:set("")
        TEXTS.rankTime:set("")
        GAME.resIB:clear()
    end
    ReleaseAchvBuffer()

    GAME.setGigaspeedAnim(false)
    TASK.removeTask_code(task_startSpin)
    GAME.refreshLockState()
    GAME.refreshCurrentCombo()
    GAME.refreshPBText()
    TASK.unlock('dcTimer')
    GAME.refreshDailyChallengeText()
    GAME.prevPB = max(GAME.prevPB, GAME.height)
    
    if unlockFool then
        CD.PN.lock = true
        STAT.pnProgress = 9
        TASK.new(function()
            TASK.yieldT(0.42)
            CD.PN.lock = false
            CD.PN:spin()
            CD.PN:bounce(1200, .62)
            SFX.play('supporter')
            SFX.play('shatter')
        end)
    end
    if unlockDuo then
        CD.DP.lock = true
        TASK.new(function()
            TASK.yieldT(0.42)
            CD.DP.lock = false
            CD.DP:spin()
            CD.DP:bounce(1200, .62)
            SFX.play('supporter')
        end)
    end

    local wasInvisDashboardURM = GAME.invisDashboard
    if URM then
        GAME.nightcore = ForceURM and PieceSFXID == 1
        GAME.slowmo = ForceURM and PieceSFXID == 2
        GAME.glassCard = ForceURM and PieceSFXID == 3
        GAME.invisCard = ForceURM and PieceSFXID == 4
        GAME.invisDashboard = ForceURM and PieceSFXID == 5
    end
    
    if not GAME.invisDashboard and (M.PN == 0 or (M.PN > 0 and wasInvisDashboardURM)) then TWEEN.new(GAME.anim_setLightHide):setDuration(GAME.slowmo and 1.26 or .126):setUnique('lightHide'):run() end
    if not GAME.anyRev and URM then TWEEN.new(GAME.anim_setLightColorProg_rev):setDuration(GAME.slowmo and 2.6 or .26):setUnique('colorProg'):run() end
    if M.AS > 0 then TWEEN.new(GAME.anim_resizeResetAS_rev):setDuration(GAME.slowmo and 2.6 or .26):setUnique('resizeResetAS'):run() end
    TWEEN.new(GAME.anim_setMenuHide_rev):setDuration(GAME.slowmo and 2.6 or .26):setUnique('uiHide'):run()
    GAME.refreshRPC()
    GAME.updateBgm('finish')
    if reason ~= 'forfeit' then
        TASK.lock('cannotStart', 1)
        TASK.lock('cannotFlip', .626)
    end
    collectgarbage()
end

local questStyle = {
    { k = 1.4, y = 175, a = 1 },
    { k = 1.1, y = 95,  a = .8 },
    { k = 0.9, y = 30,  a = .6 },
}
local questStyleDP = {
    { k = 1.4, y = 175, a = 1 },
    { k = 1.4, y = 90,  a = 1 },
    { k = 0.7, y = 25,  a = .7 },
}

function GAME.update(dt)
    GAME.spikeTimer = GAME.spikeTimer - dt
    if GAME.playing then
        -- if love.keyboard.isDown('[') then
        --     GAME.addHeight(dt * 260)
        -- elseif love.keyboard.isDown(']') then
        --     GAME.addXP(dt * 42)
        -- elseif love.keyboard.isDown('\\') then
        --     GAME.addHeight(-dt * 260)
        -- end

        -- Quest animattion
        local style = M.DP == 0 and questStyle or questStyleDP
        for i = 1, GAME.maxQuestCount do
            local Q = GAME.quests[i]
            local k = dt / GAME.animDuration
            Q.y = expApproach(Q.y, style[i].y, k * 35)
            Q.k = expApproach(Q.k, style[i].k, k * 26)
            Q.a = expApproach(Q.a, style[i].a, k * 26)
        end

        -- Timers
        GAME.time = GAME.time + dt * GAME.timerMul
        local r = min(GAME.rank, 26)
        GAME.rankTimer[r] = GAME.rankTimer[r] + dt
        GAME.questTime = GAME.questTime + dt
        GAME.floorTime = GAME.floorTime + dt
        if M.GV > 0 and not GAME.gravTimer and (URM and M.GV == 2 or GAME.questTime >= 2.6) and GAME.questTime - dt < 2.6 then
            GAME.gravTimer = GAME.gravDelay
        end
        if M.EX == 2 and GAME.floorTime > 30 then
            GAME.dmgWrong = GAME.dmgWrong + 0.05 * dt
        end
        if GAME.time >= GAME.fatigueSet[GAME.fatigue].time then
            GAME.nextFatigue()
        end

        -- Gigaspeed timer text
        if GAME.gigaspeed then
            TEXTS.gigatime:set(("%02d:%02d.%03d"):format(
                floor(GAME.time / 60),
                floor(GAME.time % 60),
                GAME.time % 1 * 1000)
            )
        end

        -- Time-based revive prompt
        local t = GAME.currentTask
        if t and t.prompt:sub(1, 5) == 'keep_' then
            if t.prompt:sub(6, 12) == 'health_' then
                if t.prompt:sub(13) == GAME.lifeState then
                    GAME.incrementPrompt(t.prompt, dt)
                else
                    GAME.nixPrompt(t.prompt)
                end
            else
                GAME.incrementPrompt(t.prompt, dt)
            end
        end

        -- Height
        if not GAME.DPlock then
            local releaseHeight = GAME.heightBuffer
            GAME.heightBuffer = max(MATH.expApproach(GAME.heightBuffer, 0, dt * 6.3216), GAME.heightBuffer - 600 * dt)
            releaseHeight = releaseHeight - GAME.heightBuffer

            local oldHeight = GAME.height

            GAME.height = GAME.height + releaseHeight
            if M.EX == 2 then
                if not URM then
                    GAME.height = GAME.height - dt * (GAME.floor * (GAME.floor + 1) + 10) / 20
                    GAME.height = max(GAME.height, Floors[GAME.floor - 1].top)
                else
                    if GAME.negFloor > 0 then
                        if GAME.negFloor >= 2 then
                            GAME.height = min(GAME.height, NegFloors[GAME.negFloor - 1].bottom)
                        end
                        local f = max(GAME.floor, GAME.negFloor)
                        local fallSpeed = (f * (f + 1) + 10) / 20
                        GAME.height = GAME.height - dt * fallSpeed
                    end
                    if GAME.height < NegFloors[GAME.negFloor].bottom then GAME.downFloor() end
                    if GAME.height < NegEvents[GAME.negEvent].h then GAME.nextNegEvent() end
                end
            else
                GAME.height = GAME.height + GAME.rank / 4 * dt * icLerp(1, 6, Floors[GAME.floor].top - GAME.height)
            end
            GAME.roundHeight = ceil(GAME.height * 100) / 100

            if GAME.height >= Floors[GAME.floor].top then GAME.upFloor() end

            if floor(GAME.height * 2) > floor(oldHeight * 2) and TASK.lock('speed_tick', .026) then
                SFX.play('speed_tick_' .. rnd(4), clampInterpolate(4, 1, 12, .8, GAME.rank))
            end
        end

        -- XP Leak & Demote
        if GAME.xpLockTimer > 0 then
            GAME.xpLockTimer = GAME.xpLockTimer - dt
        else
            GAME.xp = GAME.xp - dt * (M.EX > 0 and 5 or 3) * GAME.rank * (GAME.rank + 1) / 60
            if GAME.xp <= 0 then
                GAME.xp = 0
                if GAME.rank > 1 then
                    GAME.rank = GAME.rank - 1
                    GAME.xp = 4 * GAME.rank
                    GAME.rankupLast = false
                    if GAME.gigaspeed and GAME.rank < GigaSpeedReq[0] then
                        GAME.setGigaspeedAnim(false)
                        SFX.play('zenith_speedrun_end')
                        SFX.play('zenith_speedrun_end')
                        if MATH.between(GAME.height, Floors[9].top - 50, Floors[9].top) then IssueAchv('cut_off') end
                    end
                    TEXTS.rank:set("R-" .. GAME.rank)
                    SFX.play('speed_down', .4 + GAME.xpLockLevel / 10)
                    if not GAME.achv_demoteH then
                        GAME.achv_demoteH = GAME.roundHeight
                        if GAME.comboStr == 'EXVL' or GAME.floor >= 8 then SFX.play('btb_break', 1, 0, Tone(0)) end
                    end
                end
            end
        end

        -- Gravity
        if M.GV > 0 and GAME.gravTimer then
            GAME.gravTimer = GAME.gravTimer - dt
            if GAME.gravTimer <= 0 then
                GAME.faultWrong = false
                GAME.commit(true)
            end
        end

        -- Damage
        GAME.dmgTimer = GAME.dmgTimer - dt / GAME.dmgTimerMul
        if GAME.dmgTimer <= 0 then
            GAME.dmgTimer = GAME.dmgCycle
            if GAME.takeDamage(GAME.dmgTime, 'time') then return end
        end

        if GAME.floor >= 10 then
            -- Omega floor
            if not GAME.omega and GAME.height >= 6200 then
                GAME.omega = true
                GAME.showFloorText("Ω", Floors[11].name, 6.2)
                SFX.play('zenith_levelup_g', 1, 0, Tone(3))
                ins(GAME.secTime, GAME.floorTime)
                local secTimeStr = ""
                for i = 1, #GAME.secTime do
                    if i > 1 then secTimeStr = secTimeStr .. "\n" end
                    secTimeStr = secTimeStr .. ("F%d - %.3f″"):format(i, GAME.secTime[i])
                end
                TEXTS.floorTime:set(secTimeStr)
                GAME.floorTime = 0
            end

            -- KM line text
            if TASK.lock('kmTimer', 1) then
                TEXTS.lineKM:set(tostring(MATH.roundUnit(GAME.bgH, 1000)))
            end
        end
    end
end

return GAME
