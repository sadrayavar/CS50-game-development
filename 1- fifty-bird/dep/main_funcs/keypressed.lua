function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

-- initialize global input handling mechanism to handle input events outside of main.lua file
love.keyboard.keysPressed = {}
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end
