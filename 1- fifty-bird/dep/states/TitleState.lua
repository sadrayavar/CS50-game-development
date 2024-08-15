local TitleState = Class {
    __includes = BaseState
}

function TitleState:enter()
    -- initialize menu soundtrack source and play it
    soundtrack = musics.menu('loop')
    soundtrack:play()
end

function TitleState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') then -- if enter is pressed
        -- play click sound
        sounds.click():play()

        -- stop playing the soundtrack
        love.audio.pause(soundtrack)

        -- start counting down
        stateMachine:change('countdown')
    elseif love.keyboard.wasPressed('escape') then -- if Esc is pressed
        -- play click sound
        sounds.click():play()

        -- quit the game 
        love.event.quit()
    end
end

function TitleState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)

    -- printing game name
    local text = 'Fifty Bird'
    local font = fonts.cubic(GLOB.game.dim.vh / 3.5)
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    local y = GLOB.game.dim.vh / 4
    love.graphics.print(text, font, x, y)

    -- printing key hint
    local text = 'Press "Enter" to start playing and "Esc" to exit!'
    local font = fonts.dense(GLOB.game.dim.vh / 12)
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, 3 * y)
end

return TitleState
