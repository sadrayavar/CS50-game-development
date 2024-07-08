local function drawBackground(drawable, x)
    love.graphics.draw(drawable, x, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(), VIRTUAL_HEIGHT / drawable:getHeight())
    love.graphics.draw(drawable, x + VIRTUAL_WIDTH, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(),
        VIRTUAL_HEIGHT / drawable:getHeight())
end

function love.draw()
    Push:start()

    -- render background in all of states
    drawBackground(images.background['0'], -bgPos['0'])
    drawBackground(images.background['1'], -bgPos['1'])
    drawBackground(images.background['2'], -bgPos['2'])

    -- render states
    gStateMachine:render()

    -- kind of log
    local text = ""
    text = text .. "+" .. 'log'
    love.graphics.print(text)

    Push:finish()
end

