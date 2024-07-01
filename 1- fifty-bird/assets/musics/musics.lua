function musics()
    -- musics root path
    local root_path = "assets/musics/"

    -- paddle_move
    local paddle_move = love.audio.newSource(root_path .. "paddle.wav", "static")

    -- all musics dictionary
    local sounds = {
        ['paddle_move'] = paddle_move
    }

    return sounds
end
