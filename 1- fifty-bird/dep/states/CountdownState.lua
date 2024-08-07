local CountdownState = Class {
    __includes = BaseState
}

function CountdownState:enter(params)
    self.paused = params.paused
    if self.paused then
        bird = params.bird
        self.pipeArray = params.pipeArray
        self.lastGap = params.lastGap
    end
end

function CountdownState:init()
    self.numbersToCount = 3
    self.virtualSec = 0.5
end

function CountdownState:update(dt)
    self.numbersToCount = self.numbersToCount - (dt / self.virtualSec)
    if self.numbersToCount <= 0.01 then
        if self.paused then
            gStateMachine:change('play', {
                paused = true,
                bird = bird,
                pipeArray = self.pipeArray,
                lastGap = self.lastGap
            })
        end
        gStateMachine:change('play', {
            paused = false
        })
    end
end

function CountdownState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)

    -- printing numbers
    local font = fonts.cubic(GAME.dim.vh / 3)
    local x = (GAME.dim.vw - font:getWidth(math.floor(self.numbersToCount))) / 2
    local y = GAME.dim.vh / 4
    love.graphics.print(tostring(math.ceil(self.numbersToCount)), font, x, y)

    -- printing pause hint
    local font = fonts.dense(GAME.dim.vh / 12)
    local text = 'Hint: Press "Esc" to pause during playing!'
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, 3 * y)
end

return CountdownState
