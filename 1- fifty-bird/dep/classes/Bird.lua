local Bird = Class {}

function Bird:init()
    -- it's the best place to save the player score
    self.score = 0

    -- vertical velocity for falling logic 
    self.dy = 0

    -- initialize dimensions
    self.w = BIRD.w
    self.h = BIRD.h
    self.x = (GAME.dim.vw - self.w) / 2 -- place it in the middle
    self.y = (GAME.dim.vh - self.h) / 2 -- place it in the middle
end

function Bird:update(dt)
    -- handle inputs
    if love.keyboard.keysPressed["space"] then
        self.dy = -BIRD.jump
    end

    -- increment velocity and position of the bird according to it
    self.dy = self.dy + GAME.gravity * dt
    self.y = self.y + self.dy

    -- vertical edge collusion
    if (self.y <= 0) or (self.y + self.h >= GAME.dim.vh) then
        gStateMachine:change('score', {
            score = self.score
        })
    end
end

function Bird:render()
    -- get margins
    local mrgn = BIRD['margin']

    -- left margined position
    local mx = self.x - (mrgn['left'] * self.w)

    -- top margined position
    local my = self.y - (mrgn['top'] * self.h)

    -- vetical margined position
    local mvs = self.h / images.bird:getHeight()
    mvs = mvs * (1 + mrgn['top'] + mrgn['bottom']) -- include margin

    -- horizontal margined position
    local mhs = self.w / images.bird:getWidth()
    mhs = mhs * (1 + mrgn['left'] + mrgn['right']) -- include margin

    -- render bird
    love.graphics.draw(images.bird, mx, my, 0, mhs, mvs)
end

return Bird
