function love.load()
    -- set title
    love.window.setTitle(GAME.title)

    -- pixelize images instead of making them blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- set push library resizing properties 
    Push:setupScreen(GAME.dim.vw, GAME.dim.vh, GAME.dim.w, GAME.dim.h, {
        fullscreen = true,
        resizable = false,
        vsync = true
    })

    -- set random seed for randomizing purpose
    math.randomseed(os.time())

    -- requiring assets
    fonts = fonts
    images = images
    sounds = sounds
    musics = musics

    -- background starting position
    bgPos = {
        ['0'] = 0,
        ['1'] = 0,
        ['2'] = 0
    }

    -- initialize state machine
    gStateMachine = StateMachine {
        ['title'] = function()
            return TitleState()
        end,
        ['play'] = function()
            return PlayState()
        end,
        ['pause'] = function()
            return PauseState()
        end,
        ['countdown'] = function()
            return CountdownState()
        end,
        ['score'] = function()
            return ScoreState()
        end
    }
    gStateMachine:change('title')
end
