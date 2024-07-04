local Bird = Class {}

function Bird:init()
    -- vertical velocity for falling logic 
    self.dy = 0

    -- initialize dimensions
    self.w = 30
    self.h = 25
    self.x = VIRTUAL_WIDTH / 2 - self.w / 2
    self.y = VIRTUAL_HEIGTH / 2 - self.h / 2
end

function Bird:update(dt)
    -- handle inputs
    if love.keyboard.keysPressed["space"] then
        self.dy = -ANTI_GRAVITY
    end

    -- handle gravity logic
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy

    -- detect collusion to up and down
    -- isCollide()
end

function Bird:render()
    love.graphics
        .draw(images.bird, self.x, self.y, 0, self.w / images.bird:getWidth(), self.h / images.bird:getHeight())
end

return Bird
