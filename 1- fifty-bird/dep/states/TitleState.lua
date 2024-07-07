TitleState = Class {
    __includes = BaseState
}

function TitleState:update(dt)
    if love.keyboard.wasPressed('e') then -- start playing
        gStateMachine:change('countdown')
    elseif love.keyboard.wasPressed('escape') then -- quit the game 
        love.event.quit()
    end
end

function TitleState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)

    -- printing game name
    local text = 'Fifty Bird'
    local x = (VIRTUAL_WIDTH - fonts.cubic:getWidth(text)) / 2
    local y = VIRTUAL_HEIGHT / 4
    love.graphics.print(text, fonts.cubic, x, y)

    -- printing key hint
    local text = 'Press "E" to start playing and "Esc" to exit!'
    local x = (VIRTUAL_WIDTH - fonts.dense:getWidth(text)) / 2
    love.graphics.print(text, fonts.dense, x, 3 * y)
end
