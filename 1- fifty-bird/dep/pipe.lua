local Pipe = Class {}

function Pipe:init(gap)
    -- settings
    self.remove = false -- initializing remove property to avoid glitch
    self.gap = gap

    -- initialize dimensions
    self.transition = gapTrans * lastPipe.gap
    self.lowerBound = math.min(lastPipe.y + self.transition, VIRTUAL_HEIGTH)
    self.upperBound = math.max(gap, lastPipe.y - self.transition)
    self.lower = {
        ['x'] = VIRTUAL_WIDTH,
        ['y'] = math.random(self.upperBound, self.lowerBound),
        ['w'] = 50,
        ['h'] = VIRTUAL_HEIGTH - gap
    }
    self.upper = {
        ['x'] = self.lower.x,
        ['y'] = self.lower.y - gap - self.lower.h,
        ['w'] = self.lower.w,
        ['h'] = self.lower.h
    }

    -- update last y
    lastPipe.y = self.lower.y

    -- initialize last state according to bird
    -- self.topLastState = getState(self.topSides, bird)
    -- self.bottomLastState = getState(self.bottomSides, bird)
end

function Pipe:update(dt)
    -- move pipes to the left
    self.lower.x = self.lower.x - PIPE_SPEED * dt
    self.upper.x = self.upper.x - PIPE_SPEED * dt

    -- -- update left & right slides values 
    -- self.topSides.left = self.x
    -- self.topSides.right = self.x + self.w
    -- self.bottomSides.left = self.x
    -- self.bottomSides.right = self.x + self.w

    --[[
        detect and update collision state
    ]]
    -- local currentTopCollideState = getState(self.topSides, bird)
    -- local currentBottomCollideState = getState(self.bottomSides, bird)

    -- isCollide(self.topLastState, currentTopCollideState)
    -- isCollide(self.bottomLastState, currentBottomCollideState)

    -- self.topLastState = currentTopCollideState
    -- self.bottomLastState = currentBottomCollideState
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

    -- local text = 'y' .. self.lower.y .. "\nh" .. self.lower.h
    -- love.graphics.print(text, self.lower.x, self.lower.y)

    -- local text = self.transition .. "#" .. self.lowerBound .. "#" .. self.upperBound .. '\n' .. self.gap
    -- love.graphics.print(text, self.upper.x, self.upper.y + self.upper.h + self.gap / 2 - 5)

    -- local text = "\nb" .. self.upper.y + self.upper.h
    -- love.graphics.print(text, self.upper.x, self.upper.y + self.upper.h - 50)
end

return Pipe
