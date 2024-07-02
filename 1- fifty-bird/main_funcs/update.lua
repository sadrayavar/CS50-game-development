function love.update(dt)
    -- update backgrounds
    bg0PositionX = (bg0PositionX + BACKGROUND_0_SPEED * dt) % VIRTUAL_WIDTH
    bg1PositionX = (bg1PositionX + BACKGROUND_1_SPEED * dt) % VIRTUAL_WIDTH
    bg2PositionX = (bg2PositionX + BACKGROUND_2_SPEED * dt) % VIRTUAL_WIDTH

    -- update bird logic
    bird:update(dt)

    -- clearing global keyboard handling state
    love.keyboard.keysPressed = {}
end
