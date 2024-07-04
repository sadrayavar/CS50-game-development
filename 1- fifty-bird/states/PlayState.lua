PlayState = Class {
    __includes = BaseState
}

function PlayState:update(dt)
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
    if spawnTimer > spawnEvery then
        -- update the gap
        lastPipe.gap = math.random(gapRange.low, gapRange.high)

        -- generate pipe and insert it to the pipe table        
        table.insert(pipes, Pipe(lastPipe.gap))

        -- update spawn timer
        spawnTimer = 0
    end

    for key, pipe in pairs(pipes) do
        -- move pipes
        pipe:update(dt)

        -- set removable pipes
        if pipe.lower.x < -pipe.lower.w then
            pipe.remove = true
        end
    end

    -- remove pipes
    for key, pipe in pairs(pipes) do
        if pipe.remove then
            table.remove(pipes, key)
        end
    end
end

function PlayState:render()
    -- render bird
    bird:render()

    -- render pipe
    for key, value in pairs(pipes) do
        value:render()
    end
end
