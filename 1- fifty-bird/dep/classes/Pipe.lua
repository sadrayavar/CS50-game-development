local Pipe = Class {}

function Pipe:init(x, y, w, h, top)
    -- initialize dimensions
    self.x = x
    self.y = y
    self.w = w
    self.h = h

    -- flags
    self.top = top or false -- invert the upper pipe
    self.scored = false -- to prevent multi scoring for a pipe
    self.collide = false -- to only calculate the collusion on front pipe 

    -- this variable is essential to calculate the collusion with the bird using my own collusion detection library that detects collusion even in higher speeds
    self.lastColl = getState(self, bird)
end

function Pipe:update(dt)
    -- move pipe to the left
    self.x = self.x - PIPE.speed * dt

    -- do not calculate if this pipe is passed (performance)
    if self.collide then
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

    -- when passed the pipe pairs:
    if not self.scored and self.top then
        if self.x + self.w < bird.x then
            -- increment score
            bird.score = bird.score + 1

            -- trigger collide flag
            for key, pipePair in pairs(pipeArray) do
                if not pipePair.topPipe.scored then
                    pipePair.topPipe.collide = false
                    pipePair.btmPipe.collide = false
                    break
                end
            end

            -- trigger score flag
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
