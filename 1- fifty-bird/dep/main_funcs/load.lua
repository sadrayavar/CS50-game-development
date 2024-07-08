function love.load()
    -- set title
    love.window.setTitle(TITLE)

    -- pixelize images instead of making them blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- set push library resizing properties 
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGTH, {
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
        ['countdown'] = function()
            return CountdownState()
        end
    }
    gStateMachine:change('title')
end
