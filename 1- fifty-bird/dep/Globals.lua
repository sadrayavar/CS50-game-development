local function initGlobals()
    GAME = {
        ['title'] = "Fifty Bird (My Version)", -- title of the game window
        ['gravity'] = 9, -- gravity velocity that effects bird's fallingّ
        ['ar'] = 16 / 9, -- aspect ratio
        ['dim'] = {
            ['vh'] = 288 -- virtual screen height
        },
        ['bgSpeed'] = { -- update backgrounds
            ['1'] = 10,
            ['2'] = 15,
            ['3'] = 20,
            ['4'] = 25,
            ['5'] = 40,
            ['6'] = 50,
            ['7'] = 60
        }
    }
    GAME.dim.w, GAME.dim.h = love.graphics.getDimensions() -- real dimensions of the game window
    GAME.dim.vw = GAME.ar * GAME.dim.vh -- virtual screen width

    BIRD = {
        ['w'] = 0.05 * GAME.dim.vw, -- width of the bird according to the screen size
        ['h'] = 0.07 * GAME.dim.vh, -- height of the bird according to the screen size

        ['jump'] = GAME.gravity * 0.3, -- to have reasonable jumping velocity according to the gravity

        ['margin'] = { -- increment fraction of bird to margin in order to prevent edge colliding 
            ['left'] = 0.1,
            ['top'] = 0.3,
            ['right'] = 0.4,
            ['bottom'] = 0.3
        }
    }

    GAP = {
        ['transition'] = 0.1, -- the fraction of current gap height which the next one can transit
        ['size'] = GAME.dim.vh / 2 -- new gap range
    }

    PIPE = {
        ['w'] = 50, -- width of each pipe
        ['speed'] = GAME.bgSpeed['7'] * 1.05, -- pipe speed (pixel per second)
        ['distance'] = 5 * BIRD.w -- distance between pipes
    }
    PIPE.distance = PIPE.distance + PIPE.w -- increment distance between pipes by the pipe width
end

return initGlobals
