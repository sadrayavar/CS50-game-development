PlayState = Class {
    __includes = BaseState
}

function PlayState:init()
    GRAVITY = 9 -- (difficulty handle)

    collusion = 0

    bird = {
        ['b'] = Bird(),
        ['jump'] = GRAVITY * 0.3, -- bird jumping velocity
        ['MARGIN'] = {
            ['top'] = 1.5,
            ['right'] = 1.5,
            ['left'] = 1.5,
            ['bottom'] = 1.5
        },
        ['score'] = 0
    }

    gap = {
        -- the fraction of current gap that the next one can transit
        ['trans'] = 0.5,

        -- new gap range
        ['range'] = {
            ['low'] = 60, -- (difficulty handle)
            ['high'] = 75 -- (difficulty handle)
        }
    }

    -- distance between pipes
    pipe = {
        -- pipes tables to save the created pipes
        set = {},

        -- used to save the point in which the new gap will be transmitted from
        ['last'] = {
            ['y'] = VIRTUAL_HEIGTH / 2,
            ['gap'] = nil
        },

        -- distance between pipes
        distance = 1, -- (difficulty handle)

        -- pipe speed
        SPEED = 60 -- (difficulty handle)
    }
    -- the time it takes for every pipe to spawn
    pipe.spawnEvery = pipe.SPEED / 30 * pipe.distance

    -- spawn timer to handle pipe spawning  
    pipe.spawnTimer = pipe.spawnEvery -- set to spawnEvery so it spawns as soon as the game started 
end

function PlayState:update(dt)
    -- update spawnTimer
    pipe.spawnTimer = pipe.spawnTimer + dt

    -- update bird logic
    bird.b:update(dt)

    --[[
        update pipe logic
        ]]
    -- spawn pipes
    if pipe.spawnTimer > pipe.spawnEvery then
        -- update the gap
        pipe.last.gap = math.random(gap.range.low, gap.range.high)

        -- generate pipe and insert it to the pipe table        
        table.insert(pipe.set, Pipe(pipe.last.gap))

        -- update spawn timer
        pipe.spawnTimer = 0
    end

    for k, p in pairs(pipe.set) do
        -- move pipes
        p:update(dt)

        -- set removable pipes
        if p.lower.x < -p.lower.w then
            p.remove = true
        end
    end

    -- remove pipes
    for k, p in pairs(pipe.set) do
        if p.remove then
            table.remove(pipe.set, k)
        end
    end
end

function PlayState:render()
    -- render bird
    bird.b:render()

    -- render pipe
    for key, value in pairs(pipe.set) do
        value:render()
    end
end
