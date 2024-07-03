local Bird = Class {}

function Bird:init()
    -- initialize bird image
    self.image = images.bird

    -- vertical velocity for falling logic 
    self.dy = 0

    -- initialize dimensions
    self.width = 30
    self.height = 25

    -- initialize position
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGTH / 2 - self.height / 2

    -- initialize sides
    self.top = self.x
    self.down = self.x + self.height
    self.left = self.y
    self.right = self.y + self.width
end

local function handleInput(self)
    if love.keyboard.keysPressed["space"] then
        self.dy = -JUMP_SPEED
    end
end

function Bird:update(dt)
    -- handle inputs
    handleInput(self, dt)

    -- handle gravity logic
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy

    -- calculate sides
    self.top = self.x
    self.down = self.x + self.height
    self.left = self.y
    self.right = self.y + self.width
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y, 0, self.width / self.image:getWidth(),
        self.height / self.image:getHeight())
end

return Bird
