local Pipe = Class {}

function Pipe:init(x, y, w, h, bird, top)
    -- initialize dimensions
    self.x = x
    self.y = y
    self.w = w
    self.h = h

    -- to prevent multi scoring for a pipe
    self.scored = false

    -- initialize bird
    self.bird = bird

    -- invert the upper pipe
    self.top = top or false

    -- this variable is essential to calculate the collusion with the bird using my own collusion detection library that detects collusion even in higher speeds
    self.lastColl = getState(self, self.bird)
end

function Pipe:update(dt)
    -- move pipe to the left
    self.x = self.x - PIPE.speed * dt

    -- calculate the current state of this pipe according to the bird
    local crrntState = getState(self, self.bird)

    -- check if collusion is made
    if isCollide(self.lastColl, crrntState) then
        gStateMachine:change('score', {
            score = self.bird.score
        })
    end

    -- update last collusion state
    self.lastColl = crrntState

    -- increase score
    if self.top and not self.scored then
        if self.x + self.w < self.bird.x then
            self.bird.score = self.bird.score + 1
            self.scored = true
        end
    end
end

function Pipe:render()
    -- calculate dimensions to render pipe
    local x, y = self.x, self.y
    local hs = self.w / images.pipe:getWidth()
    local vs = self.h / images.pipe:getHeight()

    -- invert pipe if its top one
    if self.top then
        vs = vs * -1
        y = y + self.h
    end

    -- render pipe
    love.graphics.draw(images.pipe, x, y, 0, hs, vs)
end

return Pipe
