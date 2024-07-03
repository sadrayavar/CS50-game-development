local Pipe = Class {}

function Pipe:init(gap)
    -- initialize bird image
    self.image = images.pipe

    -- initialize dimensions
    self.width = 50
    self.height = VIRTUAL_HEIGTH

    -- initialize gap
    self.gap = gap

    -- initialize position
    self.y = math.random(self.gap, VIRTUAL_HEIGTH)
    self.x = VIRTUAL_WIDTH

    -- initialize sides
    self.top = self.x
    self.down = self.x + self.height
    self.left = self.y
    self.right = self.y + self.width

    -- initializing remove property to avoid glitch
    self.remove = false
end

function Pipe:update(dt)
    self.x = self.x - PIPE_SPEED * dt

    -- calculate sides
    self.top = self.x
    self.down = self.x + self.height
    self.left = self.y
    self.right = self.y + self.width
end

function Pipe:render()
    love.graphics.draw(self.image, self.x, self.y, 0, self.width / self.image:getWidth(),
        self.height / self.image:getHeight())
    love.graphics.draw(self.image, self.x, self.y - self.gap, 0, self.width / self.image:getWidth(),
        -self.height / self.image:getHeight())
end

return Pipe
