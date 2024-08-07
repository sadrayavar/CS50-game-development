local PlayState = Class {
    __includes = BaseState
}

function PlayState:enter(params)
    if params.paused or false then
        self.bird = params.bird
        self.pipeArray = params.pipeArray
        self.lastGap = params.lastGap
    end
end

function PlayState:init()
    -- bird object
    self.bird = Bird()

    -- horizontal walls
    local wallThick = 500
    self.upperWall = Wall(0, -wallThick, GAME.dim.vw, wallThick, self.bird)
    self.lowerWall = Wall(0, GAME.dim.vh, GAME.dim.vw, wallThick, self.bird)

    -- initializing gap attributes
    self.lastGap = {}
    self.lastGap.passed = PIPE.distance -- set to constent distance to spawn every time respective distance is passed
    self.lastGap.size = GAP.range.high -- saving last gap's size to transit the new gap according to it
    self.lastGap.center = GAME.dim.vh / 2 -- last y to transit new pipe according to it

    -- pipes tables to save the created pipes
    self.pipeArray = {}
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('pause', {
            paused = true,
            bird = self.bird,
            pipeArray = self.pipeArray,
            lastGap = self.lastGap
        })
    end

    -- update bird logic
    self.bird:update(dt)

    -- update wall logic
    self.upperWall:update(dt)
    self.lowerWall:update(dt)

    -- spawn pipes
    local passedNow = dt * PIPE.speed
    self.lastGap.passed = self.lastGap.passed + passedNow -- update spawnTimer
    if self.lastGap.passed >= PIPE.distance then
        -- generate pipe and insert it to the pipe table        
        local newPair = PipePair(self.lastGap.size, self.lastGap.center, self.bird)
        table.insert(self.pipeArray, newPair)

        -- update last gap
        self.lastGap = {
            ['passed'] = 0, -- update spawn timer
            ['size'] = newPair.gapSize, -- update last gap size
            ['center'] = newPair.center -- update last gap center
        }
    end

    -- move pipes
    for k, p in pairs(self.pipeArray) do
        p:update(dt)

        -- set removable flag on pipes
        if p.btmPipe.x < -p.btmPipe.w then
            p.rmvbl = true
        end
    end

    -- remove pipes
    for k, p in pairs(self.pipeArray) do
        if p.rmvbl then
            table.remove(self.pipeArray, k)
        end
    end
end

function PlayState:render()
    -- render bird
    self.bird:render()

    -- render pipe
    for k, p in pairs(self.pipeArray) do
        p:render()
    end

    -- print score
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)
    local font = fonts.cubic(GAME.dim.vh / 12)
    local text = 'Score: ' .. tostring(self.bird.score)
    love.graphics.print(text, font, 0, 0)
end

return PlayState
