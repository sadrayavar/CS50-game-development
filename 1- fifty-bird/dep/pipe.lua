local Pipe = Class {}

function Pipe:init(gap)
    -- settings
    self.remove = false -- initializing remove property to avoid glitch
    self.gap = gap -- initialize gap

    -- initialize dimensions
    self.lower = {
        ['x'] = VIRTUAL_WIDTH,
        ['y'] = math.random(self.gap, VIRTUAL_HEIGTH),
        ['w'] = 50,
        ['h'] = VIRTUAL_HEIGTH - self.gap
    }
    self.upper = {
        ['x'] = self.lower.x,
        ['y'] = self.lower.y - self.gap - self.lower.h,
        ['w'] = self.lower.w,
        ['h'] = self.lower.h
    }
end

function Pipe:update(dt)
    -- move pipes to the left
    self.lower.x = self.lower.x - PIPE_SPEED * dt
    self.upper.x = self.upper.x - PIPE_SPEED * dt
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
