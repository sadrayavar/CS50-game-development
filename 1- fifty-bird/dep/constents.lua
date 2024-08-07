GAME = {
    ['title'] = "Fifty Bird (My Version)", -- title of the game window
    ['gravity'] = 9, -- gravity velocity that effects bird's fallingّ
    ['ar'] = 16 / 9, -- aspect ratio
    ['dim'] = {
        ['vh'] = 288 -- virtual screen height
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
    ['transition'] = 0.5, -- the fraction of current gap height which the next one can transit

    ['range'] = { -- new gap range
        ['low'] = GAME.dim.vh / 5,
        ['high'] = GAME.dim.vh / 2
    }
}

PIPE = {
    ['w'] = 50, -- width of each pipe
    ['speed'] = 60 * 2, -- pipe speed (pixel per second)
    ['distance'] = 4 * BIRD.w -- distance between pipes
}
PIPE.distance = PIPE.distance + PIPE.w -- increment distance between pipes by the pipe width