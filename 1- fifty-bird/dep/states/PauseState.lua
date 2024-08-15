local PauseState = Class {
    __includes = BaseState
}

function PauseState:enter(params)
    -- save the game setting parameters so i can pass it to play state 
    self.pipeArray = params.pipeArray
    self.lastGap = params.lastGap
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('escape') then -- if escape is pressed
        -- play click sound
        sounds.click():play()

        -- continue to play after countdown
        stateMachine:change('countdown', {
            ['pipeArray'] = self.pipeArray,
            ['lastGap'] = self.lastGap
        })
    elseif love.keyboard.wasPressed('q') then -- if q is pressed
        -- play click sound
        sounds.click():play()

        -- Go to title menu
        stateMachine:change("title")
    end
end

function PauseState:render()
    -- global attributes for menu options
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)
    local font = fonts.dense(GLOB.game.dim.vh / 12)
    local y = GLOB.game.dim.vh / 4

    -- continue plating
    local text = 'Press "Escape" to '
    text = text .. ((stateMachine.previous == 'title') and ('start') or ('continue'))
    text = text .. ' playing'
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y)

    -- 
    local text = 'Press "Q" to return to main menu'
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, 2 * y)
end

return PauseState
