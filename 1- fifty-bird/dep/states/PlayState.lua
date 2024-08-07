local PlayState = Class {
    __includes = BaseState
}

function PlayState:enter(params)
    local paused = params.paused or false
    if paused then
        bird = params.bird
        pipeArray = params.pipeArray
        self.lastGap = params.lastGap
    else
        -- initializing global to default value (reset difficulty handles)
        initGlobals()
    end
end

function PlayState:init()
    -- bird object
    bird = Bird()

    -- initializing gap attributes
    self.lastGap = {}
    self.lastGap.passed = PIPE.distance -- set to constent distance to spawn every time respective distance is passed
    self.lastGap.size = GAP.size -- saving last gap's size to transit the new gap according to it
    self.lastGap.center = GAME.dim.vh / 2 -- last y to transit new pipe according to it

    -- pipes tables to save the created pipes
    pipeArray = {}
end

function PlayState:update(dt)
    -- pause the game
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('pause', {
            paused = true,
            bird = bird,
            pipeArray = pipeArray,
            lastGap = self.lastGap
        })
    end

    -- update bird logic
    bird:update(dt)

    -- spawn pipes
    local passedNow = dt * PIPE.speed
    self.lastGap.passed = self.lastGap.passed + passedNow -- update passed distance
    if self.lastGap.passed >= PIPE.distance then
        -- new gap size
        local newGap = math.random(GAP.size, GAP.size * 1.5)

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

        if GAME.gravity < 15 then
            GAME.gravity = GAME.gravity * 1.05
        end

        if GAME.bgSpeed['7'] < 300 then
            for i = 1, 7, 1 do
                GAME.bgSpeed[tostring(i)] = GAME.bgSpeed[tostring(i)] * 1.05
            end
            PIPE.speed = 1.1 * GAME.bgSpeed['7']
        end
        logText = PIPE.speed

        if GAP.size >= GAME.dim.vh / 4 then
            GAP.size = GAP.size * 0.95
        end

        -- if (GAP.transition) < 0.5 then
        --     GAP.transition = GAP.transition * 1.05
        -- end

        if PIPE.distance > (BIRD.w + PIPE.w) then
            PIPE.distance = PIPE.distance * 0.95
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
    local font = fonts.cubic(GAME.dim.vh / 12)
    local text = 'Score: ' .. tostring(bird.score)
    love.graphics.print(text, font, 0, 0)
end

return PlayState
