local function drawBackground(drawable, x)
    love.graphics.draw(drawable, x, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(), VIRTUAL_HEIGTH / drawable:getHeight())
    love.graphics.draw(drawable, x + VIRTUAL_WIDTH, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(),
        VIRTUAL_HEIGTH / drawable:getHeight())
end

function love.draw()
    Push:start()

    -- render background in all of states
    drawBackground(images.background['0'], -bg0PositionX)
    drawBackground(images.background['1'], -bg1PositionX)
    drawBackground(images.background['2'], -bg2PositionX)

    -- render states
    gStateMachine:render()

    -- kind of log
    local text = ""
    text = text .. "+" .. collusion
    love.graphics.print(text)

    Push:finish()
end

