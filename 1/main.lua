require 'constants'
push = require 'push'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle("Hello World")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGTH, WINDOW_WIDTH, WINDOW_HEIGTH, WINDOW_MODE)

end

function love.draw()
    push:start()

    -- background color
    love.graphics.clear(3, 0, 20, 255)

    -- Do I like this?
    love.graphics.setFont(love.graphics.newFont("CuteEasterPersonalUse-Wy8nV.ttf", 12))
    local text = "Do I like this?"
    local font_heigth = love.graphics.getFont():getHeight()
    local font_width = love.graphics.getFont():getWidth(text)
    local font_pos = {
        x = VIRTUAL_WIDTH / 2 - font_width / 2,
        y = 0
    }
    love.graphics.print(text, font_pos.x, font_pos.y)

    -- menu_line
    local line_heigth = 1
    love.graphics.rectangle('fill', 0, font_heigth, VIRTUAL_WIDTH, line_heigth)

    -- players
    local player_width = 20
    local player_heigth = 3

    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - player_width / 2, font_heigth + line_heigth, player_width,
        player_heigth)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - player_width / 2, VIRTUAL_HEIGTH - player_heigth, player_width,
        player_heigth)

    -- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, (VIRTUAL_HEIGTH + font_heigth + line_heigth) / 2 - 2, 4, 4)

    push:finish()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
