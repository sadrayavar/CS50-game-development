-- pipes tables to save the created pipes
pipes = {}

-- pipe speed
PIPE_SPEED = 60 -- (difficulty handle)

-- distance between pipes
local pipeDistance = 1 -- (difficulty handle)

-- the time it takes for every piep to spawn
spawnEvery = PIPE_SPEED / 30 * pipeDistance

-- spawn timer to handle pipe spawning  
spawnTimer = spawnEvery -- set to spawnEvery so it spawns as soon as the game started 
