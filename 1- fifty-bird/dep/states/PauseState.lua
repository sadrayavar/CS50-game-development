local PauseState = Class {
    __includes = BaseState
}

function PauseState:enter(params)
    if params.paused or false then
        self.bird = params.bird
        self.pipeArray = params.pipeArray
        self.lastGap = params.lastGap
    end
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') then -- continue playing
        gStateMachine:change('play', {
            paused = true,
            bird = self.bird,
            pipeArray = self.pipeArray,
            lastGap = self.lastGap
        })
    elseif love.keyboard.wasPressed('q') then -- Go to title menu
        gStateMachine:change("title")
    end
end

function PauseState:render()
    -- global attributes for menu options
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)
    local font = fonts.dense(GAME.dim.vh / 12)
    local y = GAME.dim.vh / 4

    -- continue plating
    local text = 'Press "Enter" to start playing'
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y)

    -- 
    local text = 'Press "Q" to return to main menu'
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, 2 * y)
end

return PauseState
