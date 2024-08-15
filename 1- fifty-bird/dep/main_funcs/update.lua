function love.update(dt)
    -- update background in all of states
    for i = 1, 7, 1 do
        bgPos[tostring(i)] = (bgPos[tostring(i)] + GLOB.game.bgSpeed[tostring(i)] * dt) % GLOB.game.dim.vw
    end

    -- update states
    stateMachine:update(dt)

    -- clearing global keyboard handling state
    love.keyboard.keysPressed = {}
end
