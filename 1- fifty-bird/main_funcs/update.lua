function love.update(dt)
    -- update spawnTimer
    spawnTimer = spawnTimer + dt

    -- update backgrounds
    bg0PositionX = (bg0PositionX + BACKGROUND_0_SPEED * dt) % VIRTUAL_WIDTH
    bg1PositionX = (bg1PositionX + BACKGROUND_1_SPEED * dt) % VIRTUAL_WIDTH
    bg2PositionX = (bg2PositionX + BACKGROUND_2_SPEED * dt) % VIRTUAL_WIDTH

    -- update bird logic
    bird:update(dt)

    --[[
        update pipe logic
    ]]
    -- spawn pipes
    if spawnTimer > 2 then
        table.insert(pipes, Pipe(math.random(75, 100)))
        spawnTimer = 0
    end

    for key, pipe in pairs(pipes) do
        -- move pipes
        pipe:update(dt)

        -- remove pipes
        if pipe.x < -pipe.width then
            table.remove(pipes, key)
        end
    end

    -- clearing global keyboard handling state
    love.keyboard.keysPressed = {}
end
