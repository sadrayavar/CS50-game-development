local ScoreState = Class {
    __includes = BaseState
}

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') then -- start playing
        gStateMachine:change('countdown', {
            paused = false
        })
    elseif love.keyboard.wasPressed('q') then -- go to title
        initGlobals() -- initializing global to default value (reset difficulty handles)
        gStateMachine:change("title")
    end
end

function ScoreState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)
    local y = GAME.dim.vh / 4

    -- printing bad news
    local font = fonts.cubic(GAME.dim.vh / 8)
    local text = 'You have lost!'
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y - font:getHeight(text) / 2)

    -- printing player's score
    local font = fonts.cubic(GAME.dim.vh / 4)
    local text = 'Score: ' .. tostring(self.score)
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y * 2 - font:getHeight(text) / 2)

    -- printing Exit hint
    local font = fonts.dense(GAME.dim.vh / 12)
    local text = 'Enter "Q" to switch to Title Menu, or "Enter" to continue playing.'
    local x = (GAME.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y * 3 - font:getHeight(text) / 2)
end

return ScoreState
