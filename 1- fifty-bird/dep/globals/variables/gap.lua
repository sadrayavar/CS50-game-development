return function()
    local gap = {
        ['transition'] = 0.1, -- the fraction of current gap height which the next one can transit
        ['size'] = GLOB.game.dim.vh / 2 -- new gap range
    }

    return gap
end
