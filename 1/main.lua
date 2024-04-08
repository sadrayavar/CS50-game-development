require 'constants'
push = require 'push'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle("Hello World")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGTH, WINDOW_WIDTH, WINDOW_HEIGTH, WINDOW_MODE)
end

function love.draw()
    push:start()

    local text = "Do I like this?"

    local font_width = love.graphics.getFont():getWidth(text)
    local font_height = love.graphics.getFont():getHeight()

    local x = VIRTUAL_WIDTH / 2 - font_width / 2
    local y = VIRTUAL_HEIGTH / 2 - font_height / 2

    love.graphics.print(text, x, y)

    push:finish()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
