local PlayState = Class {
    __includes = BaseState
}

function PlayState:enter(params)
    if params.paused then -- if it's unpaused
        -- reinit game setting to continue playing where its left
        self.lastGap = params.lastGap
        pipeArray = params.pipeArray
    else -- if it's just started
        -- initializing global to default value to reset difficulty handles
        initGlobals()

        -- bird object
        bird = Bird()

        -- initializing gap attributes
        self.lastGap = {}
        self.lastGap.passed = GLOB.pipe.distance -- set to constent distance to spawn every time respective distance is passed
        self.lastGap.size = GLOB.gap.size -- saving last gap's size to transit the new gap according to it
        self.lastGap.center = GLOB.game.dim.vh / 2 -- last y to transit new pipe according to it

        -- pipes tables to save the created pipes
        pipeArray = {}

        -- initialize soundtrack source if it's just started
        soundtrack = musics.play('loop')
    end

    -- play track
    soundtrack:play()
end

function PlayState:update(dt)
    -- pause the game
    if love.keyboard.wasPressed('escape') then -- if escape is pressed
        -- play pause sound
        sounds.pause():play()

        -- stop playing soundtrack
        love.audio.pause(soundtrack)

        -- pass the game setting related parameters so it is possible to continuo the game where its paused
        stateMachine:change('pause', {
            ['pipeArray'] = pipeArray,
            ['lastGap'] = self.lastGap
        })
    end

    -- update bird logic
    bird:update(dt)

    -- spawn pipes
    local passedNow = dt * GLOB.pipe.speed
    self.lastGap.passed = self.lastGap.passed + passedNow -- update passed distance
    if self.lastGap.passed >= GLOB.pipe.distance then
        -- new gap size
        local newGap = math.random(GLOB.gap.size, GLOB.gap.size * 1.5)

        -- generate pipe and insert it to the pipe table        
        local newPair = PipePair(self.lastGap.size, self.lastGap.center, newGap)
        table.insert(pipeArray, newPair)

        -- trigger collusion flag on two next pairs
        local i = 0
        for key, pair in pairs(pipeArray) do
            if not pair.topPipe.scored then
                i = i + 1

                if i < 3 then
                    pair.topPipe.collide = true
                    pair.btmPipe.collide = true
                else
                    break
                end
            end
        end

        -- update last gap
        self.lastGap = {
            ['passed'] = 0, -- update spawn timer
            ['size'] = newGap, -- update last gap size
            ['center'] = newPair.center -- update last gap center
        }

        --[[
            increase difficulty
        ]]

        if GLOB.game.gravity < 15 then
            GLOB.game.gravity = GLOB.game.gravity * 1.05
        end

        if GLOB.game.bgSpeed['7'] < 300 then
            for i = 1, 7, 1 do
                GLOB.game.bgSpeed[tostring(i)] = GLOB.game.bgSpeed[tostring(i)] * 1.05
            end
            GLOB.pipe.speed = 1.1 * GLOB.game.bgSpeed['7']
        end

        if GLOB.gap.size >= GLOB.game.dim.vh / 4 then
            GLOB.gap.size = GLOB.gap.size * 0.95
        end

        if GLOB.pipe.distance > (GLOB.bird.w + GLOB.pipe.w) then
            GLOB.pipe.distance = GLOB.pipe.distance * 0.95
        end
    end

    -- move pipes
    for k, p in pairs(pipeArray) do
        p:update(dt)

        -- set removable flag on pipes
        if p.btmPipe.x < -p.btmPipe.w then
            p.rmvbl = true
        end
    end

    -- remove pipes
    for k, p in pairs(pipeArray) do
        if p.rmvbl then
            table.remove(pipeArray, k)
        end
    end
end

function PlayState:render()
    -- render bird
    bird:render()

    -- render pipe
    for k, p in pairs(pipeArray) do
        p:render()
    end

    -- print score
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)
    local font = fonts.cubic(GLOB.game.dim.vh / 12)
    local text = 'Score: ' .. tostring(bird.score)
    love.graphics.print(text, font, 0, 0)
end

return PlayState
