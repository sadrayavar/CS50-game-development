return function()
    local pipe = {
        ['w'] = 50, -- width of each pipe
        ['speed'] = GLOB.game.bgSpeed['7'] * 1.05, -- pipe speed (pixel per second)
        ['distance'] = 5 * GLOB.bird.w -- distance between pipes
    }
    pipe.distance = pipe.distance + pipe.w -- increment distance between pipes by the pipe width

    return pipe
end
