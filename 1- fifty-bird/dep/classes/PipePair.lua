local PipePair = Class {}

function PipePair:init(lastSize, lastCenter, bird)
    -- initializing remove property to avoid glitch
    self.rmvbl = false

    -- deside the direction of transition
    local direct = math.random() > 0.5 -- true for down and false for up

    -- calculate new center
    local trans = lastSize * GAP.transition
    self.center = lastCenter + ((direct) and (trans) or (-trans))

    -- new gap size
    self.gapSize = math.random(GAP.range.low, GAP.range.high)

    -- calculate new upper and lower bound
    local newUp = self.center - self.gapSize / 2
    local newDown = self.center + self.gapSize / 2

    -- move pipes to screen if it's out of screen
    if newDown > GAME.dim.vh - 10 then
        newDown = GAME.dim.vh - 10
        newUp = newDown - self.gapSize
        self.center = newDown - self.gapSize / 2
    end
    if newUp < 10 then
        newUp = 10
        newDown = newUp + self.gapSize
        self.center = newUp + self.gapSize / 2
    end

    -- -- log
    -- logText = ''
    -- logText = logText .. (direct and 'down' or 'up') .. '   trans:' .. trans
    -- logText = logText .. '\n'
    -- logText = logText .. lastSize .. '==center' .. lastCenter
    -- logText = logText .. '\n'
    -- logText = logText .. self.gapSize .. '==center' .. self.center
    -- logText = logText .. '\n'
    -- logText = logText .. '\n'
    -- logText = logText .. '\n'
    -- logText = logText .. newUp - newUp % 1
    -- logText = logText .. '\n'
    -- logText = logText .. newDown - newDown % 1

    -- set pipe dimensions
    local pw = PIPE.w
    local ph = GAME.dim.vh
    local px = GAME.dim.vw
    local pyu = newUp - ph -- for upper pipe
    local pyl = newDown -- for lower pipe

    -- create pipes
    self.topPipe = Pipe(px, pyu, pw, ph, bird, true)
    self.btmPipe = Pipe(px, pyl, pw, ph, bird)
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
