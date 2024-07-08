CountdownState = Class {
    __includes = BaseState
}

function CountdownState:init()
    countdwonNumber = 3
    virtualTimePerSec = 0.5
    countdownTimer = countdwonNumber + 1
end

function CountdownState:update(dt)
    countdownTimer = countdownTimer + dt

    if countdownTimer >= countdwonNumber then

        countdownTimer = 0
    end
end

function CountdownState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)

    -- printing game name
    local x = (VIRTUAL_WIDTH - fonts.cubic:getWidth(countdwonNumber)) / 2
    local y = VIRTUAL_HEIGHT / 4
    love.graphics.print(countdwonNumber, fonts.fancy, x, y)
end
