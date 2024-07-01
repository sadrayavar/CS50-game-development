function sounds()
    -- sounds root path
    local root_path = "assets/sounds/"

    -- paddle_move
    local paddle_move = love.audio.newSource(root_path .. "paddle.wav", "static")

    -- select
    local select = love.audio.newSource(root_path .. "paddle.wav", "static")

    -- wall
    local wall = love.audio.newSource(root_path .. "ball.wav", "static")

    -- score
    local score = love.audio.newSource(root_path .. "hit.wav", "static")

    -- win
    local win = love.audio.newSource(root_path .. "hit.wav", "static")

    -- lose
    local lose = love.audio.newSource(root_path .. "hit.wav", "static")

    -- all sounds dictionary
    local sounds = {
        ['paddle_move'] = paddle_move,
        ['select'] = select,
        ['wall'] = wall,
        ['score'] = score,
        ['win'] = win,
        ['lose'] = lose
    }

    return sounds
end
