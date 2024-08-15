local CountdownState = Class {
    __includes = BaseState
}

function CountdownState:enter(params)
    if stateMachine.previous == 'pause' then -- if unpaused
        -- pass the game setting varibales
        self.pipeArray = params.pipeArray
        self.lastGap = params.lastGap
    end

    -- initialize countdown related parameters from global variable
    self.numbersToCount = GLOB.game.countdown.numbersToCount
    self.previousNumber = math.ceil(self.numbersToCount)
    self.virtualSec = GLOB.game.countdown.virtualSec
end

function CountdownState:update(dt)
    -- updating countdown numbers
    self.numbersToCount = self.numbersToCount - (dt / self.virtualSec)

    -- check if timer is decremented
    if not (self.previousNumber == math.ceil(self.numbersToCount)) then
        self.previousNumber = self.previousNumber - 1

        -- play coundtdown sound if timer increments
        sounds.countdown():play()
    end

    -- switch to play state after time is passed
    if self.numbersToCount <= 0.01 then
        -- play start sound
        sounds.start():play()

        -- switch to play state
        stateMachine:change('play', {
            ['paused'] = stateMachine.previous == 'pause',
            ['pipeArray'] = self.pipeArray,
            ['lastGap'] = self.lastGap
        })
    end
end

function CountdownState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)

    -- printing numbers
    local font = fonts.cubic(GLOB.game.dim.vh / 3)
    local x = (GLOB.game.dim.vw - font:getWidth(math.floor(self.numbersToCount))) / 2
    local y = GLOB.game.dim.vh / 4
    love.graphics.print(tostring(math.ceil(self.numbersToCount)), font, x, y)

    -- printing pause hint
    local font = fonts.dense(GLOB.game.dim.vh / 12)
    local text = 'Hint: Press "Esc" to pause during playing!'
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, 3 * y)
end

return CountdownState
