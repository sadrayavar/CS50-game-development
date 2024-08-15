return function()
    local game = {
        ['title'] = "Fifty Bird (My Version)", -- title of the game window
        ['gravity'] = 9, -- gravity velocity that effects bird's fallingّ
        ['ar'] = 16 / 9, -- aspect ratio
        ['bgSpeed'] = { -- update backgrounds
            ['1'] = 10,
            ['2'] = 15,
            ['3'] = 20,
            ['4'] = 25,
            ['5'] = 40,
            ['6'] = 50,
            ['7'] = 60
        },
        ['volume'] = {
            -- musics
            ['menu'] = 0.35,
            ['play'] = 0.1,

            -- sounds
            ['lost'] = 1,
            ['score'] = 1,
            ['jump'] = 10,
            ['countdown'] = 4,
            ['start'] = 1,
            ['click'] = 1,
            ['pause'] = 1
        },
        ['countdown'] = {
            ['numbersToCount'] = 3,
            ['virtualSec'] = 0.5
        },
        ['dim'] = {
            ['vh'] = 288 -- virtual screen height
        }
    }
    game.dim.w, game.dim.h = love.graphics.getDimensions() -- real dimensions of the game window
    game.dim.vw = game.ar * game.dim.vh -- virtual screen width

    return game
end
