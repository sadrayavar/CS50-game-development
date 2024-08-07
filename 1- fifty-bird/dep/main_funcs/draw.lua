local function drawBackground(drawable, x)
    love.graphics.draw(drawable, x, 0, 0, GAME.dim.vw / drawable:getWidth(), GAME.dim.vh / drawable:getHeight())
    love.graphics.draw(drawable, x + GAME.dim.vw, 0, 0, GAME.dim.vw / drawable:getWidth(),
        GAME.dim.vh / drawable:getHeight())
end

function love.draw()
    Push:start()

    -- render background in all of states
    for i = 1, 7, 1 do
        drawBackground(images.background[tostring(i)], -bgPos[tostring(i)])
    end

    -- render states
    gStateMachine:render()

    -- kind of log
    love.graphics.print(logText)

    Push:finish()
end

