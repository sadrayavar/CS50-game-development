local function drawBackground(drawable, x)
    love.graphics.draw(drawable, x, 0, 0, GAME.dim.vw / drawable:getWidth(),
        GAME.dim.vh / drawable:getHeight())
    love.graphics.draw(drawable, x + GAME.dim.vw, 0, 0, GAME.dim.vw / drawable:getWidth(),
        GAME.dim.vh / drawable:getHeight())
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
    love.graphics.print(logText)

    Push:finish()
end

