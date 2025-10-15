local max, min = math.max, math.min
local abs, rnd = math.abs, math.random
local sin, cos = math.sin, math.cos
local sign, lerp = MATH.sign, MATH.lerp
local expApproach, clampInterpolate = MATH.expApproach, MATH.clampInterpolate
local getTime = love.timer.getTime

local GAME = GAME
local M = GAME.mod
local CD = Cards

---@class Card
---@field burn false | number
local Card = {}
Card.__index = Card
function Card.new(d)
    ---@class Card
    local obj = setmetatable({
        initOrder = d.initOrder,
        tempOrder = d.initOrder,
        id = d.id,
        lockfull = d.lockfull,

        lock = true,
        active = false,
        front = true,
        upright = true,
        reversed = false,

        x = 0,
        y = 0,
        kx = 1,
        ky = 1,
        size = .62,
        r = 0,
        tx = 0,
        ty = 0,
        visY = 0,
        visY1 = 0,

        float = 0,

        correctTouch = false,
        touchCount = 0,
        freezeGrace = 10,
        freeze = false,
        burn = false,
        required = false,
        requiredRev = false,
        required2 = false,
        requiredRev2 = false,
        inLastCommit = false,
        charge = 0,
    }, Card)
    return obj
end

function Card:mouseOn(x, y)
    return
        abs(x - self.tx) <= self.size * 240 and
        abs(y - self.ty) <= self.size * 330
end

local completion = GAME.completion
local KBIsDown = love.keyboard.isDown
local function tween_deckPress(t) DeckPress = 26 * (1 - t) end
local function tween_deckPress_PN(t) DeckPress = -26 * (1 - t) end
function Card:setActive(auto, key)
    if GAME.playing and M.SB > 0 and not auto then
        GAME.nixPrompt('keep_no_flip')
        self.freezeGrace = (11 - max(GAME.floor, GAME.negFloor == 0 and 10 or GAME.negFloor)) / (GAME.omega and 2 or 1)
        if self.freeze then
            SFX.play('shatter', 1, 0, 12)
            SFX.play('shatter', 1, 0, 18)
            SFX.play('shatter', 1, 0, 24)
            GAME.takeDamage(self.freeze, 'freeze')
            self.freeze = false
        end
    end
    if next(revHold) then key = 2 end
    local reverseKeyed = key == 2 or KBIsDown('lctrl', 'lalt', 'rctrl', 'ralt') or (STAT.keybind[27] ~= "<Unbound>" and KBIsDown(STAT.keybind[27]))
    if TASK.getLock('cannotFlip') or GAME.playing and M.NH == 1 and not auto and self.active then
        self:flick()
        SFX.play('no')
        return
    end
    if M.VL == 1 then
        if not self.active and not auto then
            self.charge = self.charge + 1
            SFX.play('clearline', .42)
            if self.charge < 1.2 then
                self:shake()
                SFX.play('combo_' .. rnd(2, 3), .626, 0, Tone(-2))
                return
            end
            SFX.play('combo_4', .626, 0, Tone(0))
            self.charge = 0
        end
    elseif M.VL == 2 then
        self.charge = self.charge + (auto and 3.55 or 1)
        if self.charge < 3.1 then
            SFX.play('clearline', .3)
            self:shake()
            if self.charge < 1.3 then
                SFX.play('combo_1', .626, 0, Tone(0))
            elseif self.charge < 2.2 then
                SFX.play('combo_3', .626, 0, Tone(-2))
            else
                SFX.play('combo_2', .626, 0, Tone(1))
            end
            return
        end
        if not auto then
            SFX.play('clearquad', .3)
            SFX.play('combo_4', .626, 0, Tone(0))
        end
        self.charge = 0
    end

    if GAME.currentTask then
        if self.active then
            GAME.incrementPrompt('cancel')
            if not auto then GAME.nixPrompt('keep_no_cancel') end
        else
            GAME.incrementPrompt('activate')
        end
        if not auto then
            if self.id ~= GAME.lastFlip then
                GAME.nixPrompt('flip_single')
                GAME.lastFlip = self.id
            end
            GAME.incrementPrompt('flip_single')
        end
        GAME.incrementPrompt('flip')
    end

    self.active = not self.active
    local noSpin, revOn, flipKill
    if GAME.playing then
        if (self.reversed or (auto and M.PN > 0 and reverseKeyed and self.active)) or (M.PN > 0 and M.NH == 2 and (not self.reversed or auto) and reverseKeyed and self.active) then
            local s, e = self.kx, self.front and 1 or -1
            TWEEN.new(function(t)
                self.kx = lerp(s, e, t)
                self.r = (t - 1) * 3.1416
            end):setUnique('spin_' .. self.id):setEase('OutQuart'):setDuration(.52):run()
        end
        self.reversed = M.PN > 0 and self.active and reverseKeyed
        if not auto then
            self.touchCount = self.touchCount + 1
            GAME.totalFlip = GAME.totalFlip + 1
            if not GAME.achv_psychokinesisH then
                GAME.achv_psychokinesisH = GAME.roundHeight
                if GAME.totalQuest >= 3 then SFX.play('btb_break', 1, 0, Tone(0)) end
            end
            if self.touchCount > (M.PN > 0 and M.NH == 2 and self.inLastCommit and 2 or 1) and not self.correctTouch and self.active and GAME.revFaultXP ~= 0 then
                if (self.required and (self.reversed == self.requiredRev) or self.required2 and (self.reversed == self.requiredRev2)) and not GAME.hardMode then
                    GAME.addXP((M.VL == 1 and 1 or .5) * GAME.revFaultXP)
                    self.correctTouch = true
                end
            end
            if self.touchCount <= (M.PN > 0 and M.NH == 2 and self.inLastCommit and 2 or 1) then
                if (self.required and (self.reversed == self.requiredRev) or self.required2 and (self.reversed == self.requiredRev2)) and not GAME.hardMode then
                    GAME.addXP(M.VL == 1 and 2 or 1)
                    self.correctTouch = true
                end
            elseif not GAME.fault and not self.burn then
                GAME.fault = true
            end
        end
        if M.DP > 0 and not auto and self.id == 'DP' and self.active and not (URM and M.DP == 2) then
            if GAME.swapControl() then
                SFX.play('party_ready', .8, 0, Tone(0))
            end
        end
        if not auto then
            if M.GV > 0 and not GAME.gravTimer then
                GAME.gravTimer = GAME.gravDelay
            end
            if M.AS > 0 then
                if self.burn then
                    self.burn = false
                    TASK.removeTask_code(GAME.task_cancelAll)
                    local p = TABLE.find(CD, self) or 0
                    local l = { -3, -2, -1, 1, 2, 3 }
                    CD[(p + table.remove(l, rnd(4, 6)) - 1) % #CD + 1]:setActive(true)
                    CD[(p + table.remove(l, rnd(1, 3)) - 1) % #CD + 1]:setActive(true)
                    GAME.achv_escapeBurnt = true
                    if M.AS == 2 then
                        CD[(p + table.remove(l, rnd(3, 4)) - 1) % #CD + 1]:setActive(true)
                        CD[(p + table.remove(l, rnd(1, 2)) - 1) % #CD + 1]:setActive(true)
                        if GAME.floor < 10 and GAME.gigaspeed then GAME.achv_felMagicBurnt = true end
                        if URM then
                            flipKill = self.active and (reverseKeyed and 2 or 1) or 0
                            GAME.takeDamage(1e99, 'wrong')
                        end
                    end
                    SFX.play('wound')
                elseif self.touchCount >= (M.PN > 0 and M.NH == 2 and self.inLastCommit and 2 or 1) then
                    self.burn = M.AS == 1 and 3 + GAME.floor / 2 or 1e99
                end
            end
        end
    else
        TASK.unlock('cannotStart')
        revOn = self.active and reverseKeyed
        if revOn and completion[self.id] == 0 then
            revOn = false
            noSpin = true
            self.active = false
            self:shake()
            SFX.play('no')
            MSG('dark', "Reach F10 with this mod first!")
            return
        end
        local wasRev = M[self.id] == 2
        M[self.id] = self.active and (revOn and 2 or 1) or 0
        -- if revOn then -- Limit only one Rev mod can be selected
        --     for _, C in ipairs(Cards) do
        --         if C.active and C ~= self then
        --             C:setActive(true)
        --         end
        --     end
        -- end
        self.upright = not (self.active and revOn)
        if wasRev and not revOn then self:spin() end
        local v = 2 ^ ((M.GV + (M.GV == 2 and URM and 1 or 0) - (M.PN == 2 and URM and 0.5 or 0)) / 12)
        if self.id == 'PN' then
            BGM.set('all', 'pitch', v, .26)
            BGM.set('piano2', 'pitch', 2 * v, .26)
            if URM and (self.active and key == 2 or wasRev) then
                if not self.upright then
                    TWEEN.new(function(t)
                        GAME.upnTimer = t
                    end):setUnique('upnSwitched'):setDuration(.26):run()
                else
                    TWEEN.new(function(t)
                        GAME.upnTimer = 1 - t
                    end):setUnique('upnSwitched'):setDuration(.26):run()
                end
            end
            RefreshButtonText()
        elseif self.id == 'EX' then
            if M.EX == 0 then BGM.set('expert', 'volume', 0, .1) end
            TWEEN.new(function(t) GAME.exTimer = M.EX > 0 and t or (1 - t) end):setDuration(M.EX > 0 and .26 or .1):run()
            TABLE.clear(HoldingButtons)
            if self.active then
                CancelNextClick = true
                CancelNextKeyClick = true
            end
        elseif self.id == 'NH' then
            BGM.set('piano', 'volume', M.NH == 0 and 1 or M.NH == 1 and .26 or 0)
        elseif self.id == 'GV' then
            BGM.set('all', 'pitch', v, .26)
            BGM.set('piano2', 'pitch', 2 * v, .26)
        elseif self.id == 'DH' then
            RefreshButtonText()
        elseif self.id == 'IN' then
            BGM.set('all', 'highgain', M.IN == 0 and 1 or M.IN == 1 and .8 or not URM and .626 or .55)
            for _, C in ipairs(CD) do C:flip() end
            noSpin = M.IN == 1
        elseif self.id == 'AS' then
            RefreshButtonText()
        elseif self.id == 'DP' then
            BGM.set('violin2', 'volume', M.DP == 2 and 1 or 0, .26)
            BGM.set('piano2', 'volume', M.DP > 0 and .626 or 0, .26)
        end
        SCN.scenes.tower.widgetList.reset:setVisible(not GAME.zenithTraveler and M.NH < 2)
        if revOn or wasRev then GAME.refreshRev() end
        if VALENTINE then BGM.set('piano2', 'volume', (M.DP > 0 or VALENTINE and not GAME.anyRev) and .626 or 0, .26) end
        GAME.hardMode = M.EX > 0 or GAME.anyRev and not URM
        GAME.refreshPBText()
        GAME.refreshRPC()
    end
    GAME.refreshCurrentCombo()
    GAME.refreshLayout()
    if auto then
        if self.active and revOn then self:revJump() end
        return
    end

    -- Sound and animation
    if self.active or (flipKill and flipKill ~= 0) then
        local postfix = (revOn or self.reversed or flipKill == 2) and '_reverse' or ''
        SFX.play(
            GAME.glassCard and 'harddrop' or 'card_select' .. postfix, 1, 0,
            key and clampInterpolate(-200, -4.2, 200, 4.2, self.y - MY) or MATH.rand(-2.6, 2.6)
        )
        local toneName = 'card_tone_' .. ModData.name[self.id]
        local toneVol = (GAME.playing and .8 + GAME.floor * .02 - (GAME.gigaTime and .26 or 0) or 1) * (self.id == "SB" and 1.1 or 1)
        if revOn or self.reversed or flipKill == 2 then
            local cond = URM and (not GAME.playing or GAME.anyRev)
            SFX.play(toneName .. postfix, toneVol, 0, Tone(cond and self.id == "SB" and (M.PN == 2 and -1.5 or -1) or 0))
            if cond then
                TASK.new(function()
                    TASK.yieldT(.2)
                    SFX.play(toneName, toneVol * .8, 0, Tone(7))
                    TASK.yieldT(.2)
                    SFX.play(toneName, toneVol * .6, 0, Tone(self.id == "SB" and 10 or 7))
                end)
            end
        else
            SFX.play(toneName, toneVol, 0, Tone(0))
        end
        if revOn then
            self:revJump()
        elseif M.NH < 2 and not noSpin then
            self:spin()
        end
    else
        SFX.play('card_slide_' .. rnd(4))
        SFX.play('floor')
        SFX.play('hold')
    end
end

function Card:flip()
    TWEEN.tag_kill('shake_' .. self.id)
    self.front = not self.front
    local s, e = self.kx, self.front and 1 or -1
    local rs = self.r % 6.2832
    TWEEN.new(function(t)
        self.kx = lerp(s, e, t)
        self.r = lerp(rs, 0, t)
    end):setUnique('spin_' .. self.id):setEase('OutQuad'):setDuration(0.26):run()
end

function Card:spin()
    TWEEN.tag_kill('shake_' .. self.id)
    local animFunc, ease
    local re = (GAME.playing or self.upright) and 0 or 3.1416
    if M.IN ~= 1 then
        -- Normal
        ease = 'OutQuart'
        function animFunc(t)
            self.ky = .9 + .1 * cos(t * 6.2832)
            self.r = t * 6.2832
            self.kx = cos((M.AS + 1) * t * 6.2832)
            if not self.front then
                self.kx = -self.kx
            end
        end
    else
        -- Flip only
        ease = 'OutInQuart'
        local s = self.r % 6.2832
        function animFunc(t)
            self.kx = cos(t * 6.2832)
            if self.reversed then self.ky = cos(min(t, .5) * 6.2832) end
            self.r = lerp(s, re, t)
            if not self.front then
                self.kx = -self.kx
                if self.reversed then self.ky = -self.ky end
            end
        end
    end
    TWEEN.new(animFunc):setUnique('spin_' .. self.id):setEase(ease):setDuration(.42):run()
        :setOnKill(function()
            self.ky = 1
            self.r = re
            -- self.kx = self.front and 1 or -1
        end)
end

local bounceEase = { 'linear', 'inQuad' }
function Card:bounce(height, duration)
    TWEEN.tag_kill('shake_' .. self.id)
    TWEEN.new(function(t)
        self.y = self.ty + t * (t - 1) * height
    end):setUnique('bounce_' .. self.id):setEase(bounceEase):setDuration(duration):run()
end

function Card:revJump()
    local h = 355
    if URM then
        if self.id == 'EX' then h = h * 1.626
        elseif self.id == 'PN' then h = h * -0.7807 end
    end
    TWEEN.tag_kill('shake_' .. self.id)
    TWEEN.new(function(t)
        t = t * (t - 1) * 4
        self.y = self.ty + t * h
        self.size = .62 - .355 * t
    end):setUnique('revJump_' .. self.id):setEase(bounceEase):setDuration(.62 * (abs(h) / 355) ^ .5):run()
        :setOnFinish(function()
            local currentState = M[self.id]
            if currentState == 2 then
                if self.id == 'PN' then
                    TWEEN.new(tween_deckPress_PN):setUnique('DeckPress'):setEase('OutQuad'):setDuration(.42):run()
                else
                    TWEEN.new(tween_deckPress):setUnique('DeckPress'):setEase('OutQuad'):setDuration(.42):run()
                end
                if self.id ~= 'NH' then
                    for _, C in ipairs(CD) do
                        if C ~= self then
                            local r = rnd()
                            if self.id == 'EX' then r = r * (URM and 12.6 or 2.6) end
                            if self.id == 'MS' then r = max(sign((r - .5)) * abs(r - .5) ^ .3333 / 1.5874 + .5, 0) end
                            if self.id == 'GV' then r = (URM and .0626 or .26) end
                            if self.id == "PN" then C:bounce(lerp(-26, -260, r) * (URM and 2 or 1), lerp(.42, .62, r) * (URM and 1.25 or 1))
                            else C:bounce(lerp(62, 420, r), lerp(.42, .62, r)) end
                        end
                    end
                end
                local color = ModData.color[self.id]
                table.insert(ImpactGlow, {
                    r = (color[1] - .26) * .8,
                    g = (color[2] - .26) * .8,
                    b = (color[3] - .26) * .8,
                    x = self.x,
                    y = self.y,
                    t = 2.6,
                })
                GAME.revDeckSkin = true
                GAME.bgXdir = MATH.coin(-1, 1)
                if not URM then
                    if self.id ~= "PN" then SFX.play('card_reverse_impact', 1, 0, Tone(0))
                    else SFX.play('card_reverse_impact_janktacular', 1, 0, Tone(0)) end
                else
                    local addonString = ""
                    if self.id == "PN" then addonString = "_janktacular" end
                    local tone = ModData.ultraImpactTone[self.id]
                    if tone[1] then SFX.play('card_reverse_impact' .. addonString, .626, 0, Tone(tone[1])) end
                    if tone[2] then SFX.play('card_reverse_impact' .. addonString, .8, 0, Tone(tone[2])) end
                    if tone[3] then SFX.play('card_reverse_impact' .. addonString, 1, 0, Tone(tone[3])) end
                    SFX.play('card_tone_' .. ModData.name[self.id] .. '_reverse', .42, 0, Tone(-5))
                end
            else
                SFX.play('spin')
                if currentState == 0 then
                    self:bounce(100, .26)
                else
                    for _, C in ipairs(CD) do
                        if C ~= self then
                            local r = 1 - abs(C.initOrder - self.initOrder) / 8
                            if self.id == 'EX' then r = r * (URM and 12.6 or 2.6) end
                            if self.id == 'MS' then r = r * MATH.rand(.26, 1.26) end
                            if self.id == 'GV' then r = r * (URM and .0626 or .26) end
                            if self.id == "PN" then C:bounce(lerp(-84, -260, r) * (URM and 2 or 1), lerp(.42, .62, r) * (URM and 1.25 or 1))
                            else C:bounce(lerp(120, 420, r), lerp(.42, .62, r)) end
                        end
                    end
                    IssueAchv('smooth_dismount')
                end
            end
        end)
    local s, e = self.kx, self.front and 1 or -1
    TWEEN.new(function(t)
        self.kx = lerp(s, e, t)
        self.r = (t - 1) * 3.1416
    end):setUnique('spin_' .. self.id):setEase('OutQuart'):setDuration(.52):run()
end

function Card:shake()
    local tag = 'shake_' .. self.id
    TWEEN.tag_kill(tag)
    self.r = MATH.coin(-.26, .26)
    local s, e = self.r, 0
    TWEEN.new(function(t)
        self.r = lerp(s, e, t)
    end):setTag(tag):setEase('OutBack'):setDuration(0.26):run()
end

function Card:flick()
    TWEEN.new(function(t)
        self.size = lerp(.56, .62, t)
    end):setUnique('flick_' .. self.id):setEase('OutBack'):setDuration(0.26):run()
end

local activeFrame = GC.newImage('assets/card/outline1.png')
local activeFrame2 = GC.newImage('assets/card/outline2.png')
local activeFrameFool = GC.newImage('assets/card/outline-fool1.png')
local activeFrameFool2 = GC.newImage('assets/card/outline-fool2.png')
local activeFrameFoolBack = GC.newImage('assets/card/outline-fool1-back.png')
local activeFrameFoolBack2 = GC.newImage('assets/card/outline-fool2-back.png')

function Card:update(dt)
    self.x = expApproach(self.x, self.tx, dt * 16)
    self.y = expApproach(self.y, self.ty, dt * 16)
    self.visY1 = expApproach(self.visY1, self.visY, dt * 26)
    self.float = expApproach(self.float, CD[FloatOnCard] == self and 1 or 0, dt * 12)
    if GAME.playing and M.SB > 0 then
        if not self.freeze then
            self.freezeGrace = self.freezeGrace - dt
            if self.freezeGrace <= 0 then
                self.freeze = 0
            end
        elseif self.freeze < 2.5 then
            self.freeze = self.freeze + dt / 2
            if self.freeze > 2.5 then
                self.freeze = 2.5
            end
        end
    end
    if self.burn then
        self.burn = self.burn - dt
        if self.burn <= 0 then
            self.burn = false
            SFX.play('wound_repel')
        end
    end
    if self.charge > 0 then
        self.charge = max(self.charge - dt, 0)
    end
end

local GAME = GAME
local gc = love.graphics
local gc_push, gc_pop = gc.push, gc.pop
local gc_translate, gc_scale = gc.translate, gc.scale
local gc_rotate, gc_shear = gc.rotate, gc.shear
local gc_draw, gc_circle, gc_rectangle = gc.draw, gc.circle, gc.rectangle
local gc_setColor, gc_setAlpha, gc_setLineWidth = gc.setColor, GC.setAlpha, gc.setLineWidth
local gc_mDraw, gc_mRect = GC.mDraw, GC.mRect
local gc_blurCircle = GC.blurCircle

function Card:draw()
    local texture = TEXTURE[self.id]
    local playing = GAME.playing
    local img, img2
    local faceUp
    if self.lock and self.lockfull then
        img = texture.lock
    else
        if M.IN == 2 then
            img = texture.back
        else
            faceUp = self.kx * self.ky > 0
            img = faceUp and texture.front or texture.back
        end
        if self.lock then
            img2 = texture.lock
        end
    end

    gc_push('transform')
    gc_translate(self.x, self.y + self.visY1)
    gc_rotate(self.r)
    if (not playing and not self.upright) or (playing and self.reversed) then gc_rotate(3.1416) end
    gc_scale(abs(self.size * self.kx), self.size * self.ky)

    if self == CD[FloatOnCard] then
        local isOnCard = false
        if usingTouch then
            for i = 1, #touchesActive do
                local id = touchesActive[i]
                if not revHold[id] then
                    isOnCard = self:mouseOn(SCR.xOy:inverseTransformPoint(love.touch.getPosition(id)))
                    if isOnCard then break end
                end
            end
        else
            isOnCard = self:mouseOn(SCR.xOy:inverseTransformPoint(love.mouse.getPosition()))
        end

        -- EX scale
        if M.EX > 0 and love.mouse.isDown(1, 2) and isOnCard then gc_scale(.9) end
        -- Fake 3D
        local dx, dy = (MX - self.x) / (240 * self.size), (MY - self.y) / (330 * self.size)
        local d = (abs(dx) - abs(dy)) * .026
        gc_scale(min(1, 1 - d), min(1, 1 + d))
        local D = -sign(dx * dy) * abs(dx * dy) ^ .626 * .026
        gc_shear(D, D)
        gc_scale(1 - abs(D))
    end

    -- Outline (prepare)
    local r1, g1, b1, a1
    local r2, g2, b2, a2
    if playing then
        if M.IN < 2 then
            if self.active then
                if self.required or self.required2 then
                    if self.required then
                        if self.reversed == self.requiredRev then
                            if self.reversed and M.PN > 0 then
                                r1, g1, b1 = 0, .5, .7
                            else
                                r1, g1, b1 = 1, .26, 0
                            end
                        else
                            r1, g1, b1 = .4 + .1 * sin(GAME.time * 42 - self.x * .0026), .2 + .05 * sin(GAME.time * 42 - self.x * .0026), .4 + .1 * sin(GAME.time * 42 - self.x * .0026)
                        end
                        a1 = .6 + .4 * self.float
                    end
                    if self.required2 then
                        if self.reversed == self.requiredRev2 then
                            if self.reversed and M.PN > 0 then
                                r2, g2, b2 = .45, .7807, .626
                            else
                                r2, g2, b2 = .942, .626, .872
                            end
                        else
                            r2, g2, b2 = .5 + .2 * sin(GAME.time * 42 - self.x * .0026), .3 + .1 * sin(GAME.time * 42 - self.x * .0026), .5 + .2 * sin(GAME.time * 42 - self.x * .0026)
                        end
                        a2 = .6 + .4 * self.float
                    end
                else
                    if self.reversed and M.PN > 0 then
                        r1, g1, b1 = 0, .2 + .05 * sin(GAME.time * 42 - self.x * .0026), .4 + .1 * sin(GAME.time * 42 - self.x * .0026)
                    else
                        r1, g1, b1 = .4 + .1 * sin(GAME.time * 42 - self.x * .0026), 0, 0
                    end
                    a1 = 1
                end
            else
                if self.required or self.required2 then
                    if self.required then
                        if self.requiredRev then
                            r1, g1, b1 = .626, .7807, 1
                        else
                            r1, g1, b1 = 1, 1, 1
                        end
                        local qt = GAME.questTime
                        if M.IN == 0 then
                            if GAME.hardMode then qt = qt - 1.5 end
                            a1 = clampInterpolate(1, 0, 2, .4, qt) +
                                clampInterpolate(1.2, 0, 2.6, .2, qt) * sin(qt * 26 - self.x * .0026)
                        elseif M.IN == 1 then
                            if GAME.hardMode then qt = qt * .626 end
                            a1 = -.1 + .4 * sin(3.1416 + qt * 3)
                        end
                    end
                    if self.required2 then
                        if self.requiredRev2 then
                            r2, g2, b2 = .26, .872, .7807
                        else
                            r2, g2, b2 = 1, 1, 1
                        end
                        local qt = GAME.questTime
                        if M.IN == 0 then
                            if GAME.hardMode then qt = qt - 1.5 end
                            a2 = clampInterpolate(1, 0, 2, .2, qt)
                        elseif M.IN == 1 then
                            if GAME.hardMode then qt = qt * .626 end
                            a2 = -.1 + .2 * sin(3.1416 + qt * 3)
                        end
                    end
                end
            end
        else
            if self.active then
                if not (M.PN > 0 and URM) then
                    if self.reversed and M.PN > 0 then
                        r1, g1, b1 = 0, .5, .7
                    else
                        r1, g1, b1 = 1, .26, 0
                    end
                else
                    r1, g1, b1 = .7807, .26, .7807
                end
                a1 = .6 + .4 * self.float
            end
        end
    else
        if self.active then
            if not self.upright then
                r1, g1, b1 = 0, .5, .7        -- Reversed
            elseif self.id ~= 'DP' then
                r1, g1, b1 = 1, .26, 0        -- Orange
            else
                r1, g1, b1 = .942, .626, .872 -- Pink
            end
            a1 = .6 + .4 * self.float
        end
        if self.required then
            if self.requiredRev and M.PN > 0 then
                r2, g2, b2 = 0, .26, .7807
            else
                r2, g2, b2 = 1, 0, .26
            end
            a2 = getTime() % .1 < .0626 and 1 - (getTime() - GAME.finishTime) / 4.2
            if a2 and a2 <= 0 then self.required = false end
        end
    end

    if GAME.glassCard then
        local w, h = 240, 330
        gc_setColor((faceUp and ModData.textColor or ModData.color)[self.id])
        gc_setAlpha((STAT.cardBrightness / 100) ^ 2 * .872)
        gc_mRect('fill', 0, 0, w * 2, h * 2, 26)

        if self.burn then
            if URM and M.AS == 2 then
                gc_setColor(1, .42, .26)
            else
                gc_setColor(GAME.time % .16 < .08 and COLOR.lF or COLOR.Y)
            end
        else
            gc_setColor(1, 1, 1)
        end

        FONT.set(50)
        if faceUp then
            GC.scale(2.6)
            GC.mStr(self.id, 0, -42)
            GC.scale(1 / 2.6)
        else
            GC.scale(2)
            GC.mStr((M.PN == 0 and "TETR.IO") or (M.PN == 1 and "PENTR.IO") or (M.PN == 2 and (URM and "HEPTR.IO" or "HEXTR.IO")), 0, -42)
            GC.scale(1 / 2)
        end

        gc_setColor(1, 1, 1, .62)
        gc_setLineWidth(4)
        gc_mRect('line', 0, 0, w * 2 - 3, h * 2 - 3, 26)

        -- Outline (draw)
        if a1 then
            gc_setLineWidth(52)
            gc_setColor(r1, g1, b1, a1)
            gc_mRect('line', 0, 0, w * 2 + 52, h * 2 + 52, 52)
        end
        if a2 then
            gc_setLineWidth(26)
            gc_setColor(r2, g2, b2, a2)
            gc_mRect('line', 0, 0, w * 2 + 26, h * 2 + 26, 39)
        end
    else
        -- Card
        if not GAME.invisCard then
            if self.burn then
                if URM and M.AS == 2 then
                    gc_setColor(1, .42, .26)
                else
                    gc_setColor(
                        GAME.time % .16 < .08 and
                        (faceUp and COLOR.LF or COLOR.lF) or
                        (faceUp and COLOR.lY or COLOR.Y)
                    )
                end
            else
                local b = STAT.cardBrightness / 100
                gc_setColor(b, b, b)
            end
            if GAME.playing and M.SB > 0 then
                local freezeOverlayTime = (11 - max(GAME.floor, GAME.negFloor == 0 and 10 or GAME.negFloor)) / (GAME.omega and 4 or 2)
                local freezeOverlayValue = 0
                if self.freezeGrace <= freezeOverlayTime then
                    freezeOverlayValue = 1 - self.freezeGrace / freezeOverlayTime
                    local gotR, gotG, gotB = gc.getColor()
                    gc_setColor(MATH.cLerp(gotR, (gotR + .6235 * 2) / 3, freezeOverlayValue), MATH.cLerp(gotG, (gotG + .9647 * 2) / 3, freezeOverlayValue), MATH.cLerp(gotB, (gotB + .9922 * 2) / 3, freezeOverlayValue))
                end
            end
            gc_draw(img, -img:getWidth() / 2, -img:getHeight() / 2)
            if img2 then
                gc_draw(img2, -img2:getWidth() / 2, -img2:getHeight() / 2)
            end
        end
        if GAME.playing and M.PN > 0 and self.reversed and faceUp then
            gc_setColor(1, 1, 1, ThrobAlpha.card)
            gc_draw(texture.throb, -texture.throb:getWidth() / 2, -texture.throb:getHeight() / 2)
        end

        -- Outline (draw)
        if a1 then
            gc_setColor(r1, g1, b1, a1)
            if self.id ~= "PN" or (M.IN == 2 and GAME.invisCard) then gc_draw(activeFrame, -activeFrame:getWidth() / 2, -activeFrame:getHeight() / 2)
            elseif M.IN == 1 and self.kx > 0 then gc_draw(activeFrameFool, -activeFrameFool:getWidth() / 2, -activeFrameFool:getHeight() / 2)
            else
                local frame = (M.IN > 0 or sign(self.kx) == -1) and activeFrameFoolBack or activeFrameFool
                gc_draw(frame, -frame:getWidth() / 2, -frame:getHeight() / 2)
            end
        end
        if a2 then
            gc_setColor(r2, g2, b2, a2)
            if self.id ~= "PN" or (M.IN == 2 and GAME.invisCard) then gc_draw(activeFrame2, -activeFrame2:getWidth() / 2, -activeFrame2:getHeight() / 2)
            elseif M.IN == 1 and self.kx > 0 then gc_draw(activeFrameFool2, -activeFrameFool2:getWidth() / 2, -activeFrameFool2:getHeight() / 2)
            else
                local frame = (M.IN > 0 or sign(self.kx) == -1) and activeFrameFoolBack2 or activeFrameFool2
                gc_draw(frame, -frame:getWidth() / 2, -frame:getHeight() / 2)
            end
        end

        -- Menu UI
        if not playing then
            gc_push('transform')
            if not self.upright and GAME.revDeckSkin and faceUp then
                gc_setColor(1, 1, 1, ThrobAlpha.card)
                gc_draw(texture.throb, -texture.throb:getWidth() / 2, -texture.throb:getHeight() / 2)
            end
            if completion[self.id] > 0 then
                img = self.active and TEXTURE.star1 or TEXTURE.star0
                local t = self.upright and self.float or 1
                local blur = (FloatOnCard == self.initOrder or not self.upright) and 0 or -.2
                local x = lerp(155, 0, t)
                local y = lerp(-370, -330, t)
                local cr = lerp(.16, .42, t)
                local revMastery = completion[self.id] >= 2
                local ultraMastery = completion[self.id] == 3
                local pulseTime = getTime() * 34.7807 + self.x
                if GAME.slowmo then pulseTime = pulseTime / 3.13
                elseif GAME.nightcore then pulseTime = pulseTime * 1.3 end
                local ang = -t * 6.2832
                local angShake = ultraMastery and sin(pulseTime * 2) / 25.133 or 0
                if URM then angShake = angShake * (GAME.anyRev and 2.5 or 1.75) end
                if self.active then angShake = angShake * (not self.upright and 1.2 or 1.1) end
                gc_scale(abs(1 / self.kx * self.ky), 1)
                -- Base star
                local colorPulseHalf = .15 * sin(pulseTime / 2)
                local colorPulseQuarter = .15 * sin(pulseTime / 4)
                local ultraBlurGB = ultraMastery and .65 + colorPulseQuarter or .5
                local ultraStarGB = ultraMastery and .85 + colorPulseHalf or 1
                if self.upright then
                    if revMastery then
                        gc_setColor(ultraMastery and .65 - colorPulseHalf or .5, ultraBlurGB, ultraBlurGB)
                        gc_blurCircle(blur, -x, -y, cr * 260)
                        gc_setColor(ultraMastery and .85 - colorPulseHalf or 1, ultraStarGB, ultraStarGB)
                        gc_mDraw(img, -x, -y, ang - angShake, lerp(.16, .42, t))
                    end
                    gc_setColor(ultraMastery and .65 - colorPulseHalf or .5, ultraBlurGB, ultraBlurGB)
                    gc_blurCircle(blur, x, y, cr * 260)
                    gc_setColor(ultraMastery and .85 - colorPulseHalf or 1, ultraStarGB, ultraStarGB)
                    gc_mDraw(img, x, y, ang + angShake, lerp(.16, .42, t))
                else
                    local colorPulse = .15 * sin(pulseTime)
                    local ultraRevBlurGB = ultraMastery and .35 + colorPulseHalf or .2
                    if revMastery then
                        gc_setColor(ultraMastery and .35 - colorPulse or .2, ultraRevBlurGB, ultraRevBlurGB)
                        gc_blurCircle(blur, -x, -y, cr * 260)
                        gc_setColor(ultraMastery and .85 - colorPulse or 1, ultraMastery and .7 + colorPulse or .7, ultraMastery and .7 + colorPulse or .2)
                        gc_mDraw(img, -x, -y, ang - angShake, lerp(.16, .42, t))
                    end
                    gc_setColor(ultraMastery and .35 - colorPulse or .2, ultraRevBlurGB, ultraRevBlurGB)
                    gc_blurCircle(blur, x, y, cr * 260)
                    gc_setColor(ultraMastery and .85 - colorPulse or 1, ultraMastery and .7 + colorPulse or .7, ultraMastery and .7 + colorPulse or .2)
                    gc_mDraw(img, x, y, ang + angShake, lerp(.16, .42, t))
                end
                -- Float star
                if not self.active then
                    if revMastery then
                        gc_setColor(ultraMastery and lerp(.65, .85, ((colorPulseQuarter + colorPulseHalf) * 10)/6) - colorPulseHalf or .5, ultraBlurGB, ultraBlurGB, t)
                        gc_blurCircle(blur, -x, -y, cr * 260)
                        gc_setColor(ultraMastery and .85 - colorPulseHalf or 1, ultraStarGB, ultraStarGB, ultraMastery and t + .15 + max(colorPulseHalf, colorPulseQuarter) or t)
                        gc_mDraw(TEXTURE.star1, -x, -y, ang - angShake, lerp(.16, .42, t))
                        gc_mDraw(TEXTURE.star1, x, y, ang + angShake, lerp(.16, .42, t))
                    else
                        gc_setColor(1, 1, 1, t)
                        gc_mDraw(TEXTURE.star1, x, y, ang, lerp(.16, .42, t))
                    end
                end
                if ultraMastery and ZENITHA.getDevMode() then
                    gc_push()
                        gc_translate(x, y)
                        gc_rotate(pulseTime / 4)
                        gc_setColor(1, 0, 0)
                        gc_rectangle("fill", -2.5, -2.5, lerp(62.6, 78.07, t), 5) -- colorPulseQuarter
                        gc_rotate(pulseTime / 2 - pulseTime / 4)
                        gc_setColor(0, 1, 0)
                        gc_rectangle("fill", -2.5, -2.5, lerp(62.6, 78.07, t), 5) -- colorPulseHalf
                        gc_rotate(pulseTime - pulseTime / 2)
                        gc_setColor(0, 0, 1)
                        gc_rectangle("fill", -2.5, -2.5, lerp(62.6, 78.07, t), 5) -- colorPulse
                    gc_pop()
                end
            end
            gc_pop()
        end
    end

    -- Icon cover
    if faceUp then
        gc_setColor((GAME.glassCard and ModData.color or ModData.textColor)[self.id])
        local active = playing and self.inLastCommit or not playing and self.active
        if M.EX == 0 then
            if active then
                gc_setLineWidth(6)
                gc_circle('line', 156.5, -246, 68, 4)
                gc_setAlpha(.62)
                gc_circle('fill', 156.5, -246, 72, 4)
            else
                gc_setLineWidth(4)
                gc_circle('line', 156.5, -246, 72, 4)
            end
        elseif active then
            gc_setAlpha(.62)
            gc_circle('fill', 156.5, -246, 72, 4)
        end
    end

    gc_pop()
end

return Card
