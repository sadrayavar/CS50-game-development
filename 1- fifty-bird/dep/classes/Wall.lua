local Wall = Class {}

function Wall:init(x, y, w, h)
    -- initialize dimensions
    self.x = x
    self.y = y
    self.w = w
    self.h = h

    -- this variable is essential to calculate the collusion with the bird using my own collusion detection library that detects collusion even in higher speeds
    self.lastColl = getState(self, bird)
end

function Wall:update(dt)
    -- calculate the current state of this pipe according to the bird
    local crrntState = getState(self, bird)

    -- check if collusion is made
    if isCollide(self.lastColl, crrntState) then
        gStateMachine:change('score', {
            score = bird.score
        })
    end

    -- update last collusion state
    self.lastColl = crrntState
end

return Wall
