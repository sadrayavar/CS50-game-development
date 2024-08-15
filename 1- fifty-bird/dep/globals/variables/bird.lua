return function()
    local bird = {
        ['w'] = 0.05 * GLOB.game.dim.vw, -- width of the bird according to the screen size
        ['h'] = 0.07 * GLOB.game.dim.vh, -- height of the bird according to the screen size

        ['jump'] = GLOB.game.gravity * 0.3, -- to have reasonable jumping velocity according to the gravity

        ['margin'] = { -- increment fraction of bird to margin in order to prevent edge colliding 
            ['left'] = 0.1,
            ['top'] = 0.3,
            ['right'] = 0.4,
            ['bottom'] = 0.3
        }
    }

    return bird
end
