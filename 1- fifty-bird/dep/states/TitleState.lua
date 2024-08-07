local TitleState = Class {
    __includes = BaseState
}

function TitleState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') then -- start playing
        gStateMachine:change('countdown', {
            paused = false
        })
    elseif love.keyboard.wasPressed('escape') then -- quit the game 
        love.event.quit()
    end
end

function TitleState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)

    -- printing game name
    local text = 'Fifty Bird'
    local font = fonts.cubic(GAME.dim.vh / 3.5)
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    local y = GAME.dim.vh / 4
    love.graphics.print(text, font, x, y)

    -- printing key hint
    local text = 'Press "Enter" to start playing and "Esc" to exit!'
    local font = fonts.dense(GAME.dim.vh / 12)
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, 3 * y)
end

return TitleState
