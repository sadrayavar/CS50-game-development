local Bird = Class {}

function Bird:init()
    -- vertical velocity for falling logic 
    self.dy = 0

    -- initialize dimensions
    self.w = 30
    self.h = 25
    self.x = VIRTUAL_WIDTH / 2 - self.w / 2
    self.y = VIRTUAL_HEIGHT / 2 - self.h / 2

    self.jump = GRAVITY * 0.3 -- bird jumping velocity
    self.MARGIN = {
        ['top'] = 1.5,
        ['right'] = 1.5,
        ['left'] = 1.5,
        ['bottom'] = 1.5
    }
    self.score = 0

    self.wall = {
        ['u'] = {
            ['x'] = 0,
            ['y'] = -100,
            ['w'] = VIRTUAL_WIDTH,
            ['h'] = 100
        },
        ['l'] = {
            ['x'] = 0,
            ['y'] = VIRTUAL_HEIGHT,
            ['w'] = VIRTUAL_WIDTH,
            ['h'] = 100
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
        self.dy = -self.jump
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
    -- multiplying with a positive number so it wont get edgy on collusion detection
    love.graphics.draw(images.bird, -- 
    self.MARGIN.left + self.x, --  
    self.MARGIN.top + self.y, -- 
    0, -- 
    (1 - self.MARGIN.right / 100) * self.w / images.bird:getWidth(), -- 
    (1 - self.MARGIN.bottom / 100) * self.h / images.bird:getHeight() -- 
    )
end

return Bird
