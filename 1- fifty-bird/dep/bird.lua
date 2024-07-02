local Bird = Class {}

function Bird:init()
    self.image = images.bird

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGTH / 2 - self.height / 2

    -- vertical velocity for falling logic 
    self.dy = 0
end

local function handleInput(self)
    if love.keyboard.keysPressed["space"] then
        self.dy = - 5
    end
end

function Bird:update(dt)
    -- handle inputs
    handleInput(self, dt)

    -- handle gravity logic
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y, 0, 0.5, 0.5)
end

return Bird
