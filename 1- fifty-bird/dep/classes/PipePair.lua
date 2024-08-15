local PipePair = Class {}

function PipePair:init(lastSize, lastCenter, gapSize)
    -- initializing remove property to avoid glitch
    self.rmvbl = false

    -- deside the direction of transition
    local direct = math.random() > 0.5 -- true for down and false for up

    -- calculate new center
    local trans = lastSize * GLOB.gap.transition
    self.center = lastCenter + ((direct) and (trans) or (-trans))

    -- calculate new upper and lower bound
    local newUp = self.center - gapSize / 2
    local newDown = self.center + gapSize / 2

    -- move pipes to screen if it's out of screen
    if newDown > GLOB.game.dim.vh - 10 then
        newDown = GLOB.game.dim.vh - 10
        newUp = newDown - gapSize
        self.center = newDown - gapSize / 2
    end
    if newUp < 10 then
        newUp = 10
        newDown = newUp + gapSize
        self.center = newUp + gapSize / 2
    end

    -- set pipe dimensions
    local pw = GLOB.pipe.w
    local ph = GLOB.game.dim.vh
    local px = GLOB.game.dim.vw
    local pyu = newUp - ph -- for upper pipe
    local pyl = newDown -- for lower pipe

    -- create pipes
    self.topPipe = Pipe(px, pyu, pw, ph, true)
    self.btmPipe = Pipe(px, pyl, pw, ph)
end

function PipePair:update(dt)
    self.btmPipe:update(dt)
    self.topPipe:update(dt)
end

function PipePair:render()
    self.btmPipe:render()
    self.topPipe:render()
end

return PipePair
