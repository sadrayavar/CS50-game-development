function love.update(dt)
    -- update states
    gStateMachine:update(dt)

    -- clearing global keyboard handling state
    love.keyboard.keysPressed = {}
end
