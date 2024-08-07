function love.update(dt)
    -- update background in all of states
    for i = 1, 7, 1 do
        bgPos[tostring(i)] = (bgPos[tostring(i)] + GAME.bgSpeed[tostring(i)] * dt) % GAME.dim.vw
    end
    -- update states
    gStateMachine:update(dt)

    -- clearing global keyboard handling state
    love.keyboard.keysPressed = {}
end
