function love.update(dt)
    -- update backgrounds
    local BG_SPEED = {
        ['0'] = 0,
        ['1'] = 20,
        ['2'] = 40
    }
    bgPos['0'] = (bgPos['0'] + BG_SPEED['0'] * dt) % VIRTUAL_WIDTH
    bgPos['1'] = (bgPos['1'] + BG_SPEED['1'] * dt) % VIRTUAL_WIDTH
    bgPos['2'] = (bgPos['2'] + BG_SPEED['2'] * dt) % VIRTUAL_WIDTH

    -- update states
    gStateMachine:update(dt)

    -- clearing global keyboard handling state
    love.keyboard.keysPressed = {}
end
