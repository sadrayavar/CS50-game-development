TitleState = Class {
    __includes = BaseState
}

function TitleState:update(dt)
    if love.keyboard.wasPressed('Enter') then -- start playing
        gStateMachine:change('play')
    elseif love.keyboard.wasPressed('escape') then -- quit the game 
        love.event.quit()
    end
end

function TitleState:render()
    local text = 'Press "Enter" to start playing!'
    love.graphics.print(text, fonts.a, (VIRTUAL_WIDTH - love.graphics.getFont():getWidth(text)) / 2, VIRTUAL_HEIGHT / 3)
    local text = 'Press "Esc" to Exit.'
    love.graphics.print(text, fonts.b, (VIRTUAL_WIDTH - love.graphics.getFont():getWidth(text)) / 2,
        2 * VIRTUAL_HEIGHT / 3)
end
