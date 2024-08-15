local ScoreState = Class {
    __includes = BaseState
}

function ScoreState:enter(params)
    -- pass score to showcase on 'you lost' screen 
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') then -- if enter is pressed
        -- play click sound
        sounds.click():play()

        -- start playing
        stateMachine:change('countdown', {
            ['paused'] = false
        })
    elseif love.keyboard.wasPressed('q') then
        -- play click sound
        sounds.click():play()

        -- initializing global to default value (reset difficulty handles)
        initGlobals()

        -- go to title
        stateMachine:change("title")
    end
end

function ScoreState:render()
    love.graphics.setColor(0 / 255, 0 / 255, 0 / 255)
    local y = GLOB.game.dim.vh / 4

    -- printing bad news
    local font = fonts.cubic(GLOB.game.dim.vh / 8)
    local text = 'You have lost!'
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y - font:getHeight(text) / 2)

    -- printing player's score
    local font = fonts.cubic(GLOB.game.dim.vh / 4)
    local text = 'Score: ' .. tostring(self.score)
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y * 2 - font:getHeight(text) / 2)

    -- printing Exit hint
    local font = fonts.dense(GLOB.game.dim.vh / 12)
    local text = 'Enter "Q" to switch to Title Menu, or "Enter" to continue playing.'
    local x = (GLOB.game.dim.vw - font:getWidth(text)) / 2
    love.graphics.print(text, font, x, y * 3 - font:getHeight(text) / 2)
end

return ScoreState
