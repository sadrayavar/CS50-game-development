local Bird = Class {}

function Bird:init()
    -- initialize bird image
    self.image = images.bird

    -- vertical velocity for falling logic 
    self.dy = 0

    -- initialize dimensions
    self.w = 30
    self.h = 25

    -- initialize position
    self.x = VIRTUAL_WIDTH / 2 - self.w / 2
    self.y = VIRTUAL_HEIGTH / 2 - self.h / 2
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

    --detect collusion to up and down
    -- isCollide()
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y, 0, self.w / self.image:getWidth(),
        self.h / self.image:getHeight())
end

return Bird
