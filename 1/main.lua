require 'constants'

function love.load()
    love.window.setTitle("Hello World")
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGTH, WINDOW_MODE)
end

function love.draw()
    local text = "Hello World!"

    local font_width = love.graphics.getFont():getWidth(text)
    local font_height = love.graphics.getFont():getHeight()

    local x = WINDOW_WIDTH / 2 - font_width / 2
    local y = WINDOW_HEIGTH / 2 - font_height / 2

    love.graphics.print(text, x, y)
end
