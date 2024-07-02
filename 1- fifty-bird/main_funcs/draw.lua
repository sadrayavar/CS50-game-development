local function drawBackground(drawable, x)
    love.graphics.draw(drawable, x, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(), VIRTUAL_HEIGTH / drawable:getHeight())
    love.graphics.draw(drawable, x + VIRTUAL_WIDTH, 0, 0, VIRTUAL_WIDTH / drawable:getWidth(),
        VIRTUAL_HEIGTH / drawable:getHeight())
end

function love.draw()
    push:start()

    drawBackground(images.background['0'], -bg0PositionX)
    drawBackground(images.background['1'], -bg1PositionX)
    drawBackground(images.background['2'], -bg2PositionX)

    local text = ""
    text = text .. "+" .. bg0PositionX
    text = text .. "+" .. bg1PositionX
    text = text .. "+" .. bg2PositionX
    love.graphics.print(text)

    push:finish()
end

