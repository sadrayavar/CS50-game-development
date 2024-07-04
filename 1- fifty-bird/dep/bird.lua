local Bird = Class {}

function Bird:init()
    -- vertical velocity for falling logic 
    self.dy = 0

    -- initialize dimensions
    self.w = 30
    self.h = 25
    self.x = VIRTUAL_WIDTH / 2 - self.w / 2
    self.y = VIRTUAL_HEIGTH / 2 - self.h / 2

    self.wall = {
        ['u'] = {
            ['x'] = 0,
            ['y'] = -10,
            ['w'] = VIRTUAL_WIDTH,
            ['h'] = 10
        },
        ['l'] = {
            ['x'] = 0,
            ['y'] = VIRTUAL_HEIGTH,
            ['w'] = VIRTUAL_WIDTH,
            ['h'] = 10
        }
    }
    lastColl = {
        ['u'] = getState(self, self.wall.u),
        ['l'] = getState(self, self.wall.l)
    }
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
    if isCollide(lastColl.u, getState(self, self.wall.u)) then
        collusion = collusion + 1
    end
    if isCollide(lastColl.l, getState(self, self.wall.l)) then
        collusion = collusion + 1
    end
end

function Bird:render()
    love.graphics
        .draw(images.bird, self.x, self.y, 0, self.w / images.bird:getWidth(), self.h / images.bird:getHeight())
end

return Bird
