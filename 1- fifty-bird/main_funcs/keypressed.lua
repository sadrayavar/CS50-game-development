function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

-- initialize global input handling mechanism to handle input events outside of main.lua file
love.keyboard.keysPressed = {}
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end
