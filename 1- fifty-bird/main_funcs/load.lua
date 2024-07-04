function love.load()
    -- set title
    love.window.setTitle("Fifty Bird (My Version)")

    -- pixelize images instead of making them blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- set push library resizing properties 
    WINDOW_WIDTH, WINDOW_HEIGTH = love.graphics.getDimensions()
    VIRTUAL_WIDTH, VIRTUAL_HEIGTH = 512, 288
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGTH, WINDOW_WIDTH, WINDOW_HEIGTH, {
        fullscreen = true,
        resizable = false,
        vsync = true
    })

    -- set random seed for randomizing purpose
    math.randomseed(os.time())

    -- assets
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
        end
    }
    gStateMachine:change('play')
end
