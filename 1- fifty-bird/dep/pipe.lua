local Pipe = Class {}

function Pipe:init(inputGap)
    -- settings
    self.remove = false -- initializing remove property to avoid glitch

    -- initialize dimensions
    self.transition = gap.trans * pipe.last.gap
    self.lowerBound = math.min(pipe.last.y + self.transition, VIRTUAL_HEIGHT)
    self.upperBound = math.max(inputGap, pipe.last.y - self.transition)
    self.lower = {
        ['x'] = VIRTUAL_WIDTH,
        ['y'] = math.random(self.upperBound, self.lowerBound),
        ['w'] = 50,
        ['h'] = VIRTUAL_HEIGHT - inputGap
    }
    self.upper = {
        ['x'] = self.lower.x,
        ['y'] = self.lower.y - inputGap - self.lower.h,
        ['w'] = self.lower.w,
        ['h'] = self.lower.h
    }

    -- update last y
    pipe.last.y = self.lower.y

    -- initialize last state according to bird
    self.uppertState = getState(self.upper, bird.b)
    self.lowertState = getState(self.lower, bird.b)
end

function Pipe:update(dt)
    -- move pipes to the left
    self.lower.x = self.lower.x - pipe.SPEED * dt
    self.upper.x = self.upper.x - pipe.SPEED * dt

    --[[
        detect and update collision state
    ]]
    local crntUppertState = getState(self.upper, bird.b)
    local crntLowertState = getState(self.lower, bird.b)

    if isCollide(self.uppertState, crntUppertState) or isCollide(self.lowertState, crntLowertState) then
        collusion = collusion + 1
    end

    self.uppertState = crntUppertState
    self.lowertState = crntLowertState
end

function Pipe:render()
    love.graphics.draw(images.pipe, -- image
    self.lower.x, -- left position
    self.lower.y, -- top position
    0, -- rotation
    self.lower.w / images.pipe:getWidth(), -- horizontal scale 
    self.lower.h / images.pipe:getHeight() -- vertical scale
    )

    love.graphics.draw(images.pipe, -- image
    self.upper.x, -- left position
    self.upper.y + self.upper.h, -- top position (I', add it to its height so it fixes the scaling movement)
    0, -- rotation
    self.upper.w / images.pipe:getWidth(), -- horizontal scale
    -self.upper.h / images.pipe:getHeight() -- vertical scale
    )
end

return Pipe
