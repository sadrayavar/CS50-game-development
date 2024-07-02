local function drawBackground(drawable, x)
    love.graphics.draw(drawable, x, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(), VIRTUAL_HEIGTH / drawable:getHeight())
    love.graphics.draw(drawable, x + VIRTUAL_WIDTH, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(),
        VIRTUAL_HEIGTH / drawable:getHeight())
end

function love.draw()
    Push:start()

    -- render background
    drawBackground(images.background['0'], -bg0PositionX)
    drawBackground(images.background['1'], -bg1PositionX)
    drawBackground(images.background['2'], -bg2PositionX)

    -- render bird
    bird:render()

    -- kind of log
    local text = ""
    text = text .. "+" .. bird.y
    text = text .. "+" .. bird.dy
    love.graphics.print(text)

    Push:finish()
end

