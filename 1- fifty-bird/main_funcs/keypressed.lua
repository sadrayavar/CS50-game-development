function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    
    if key == 'escape' then
        love.event.quit()
    end
end
