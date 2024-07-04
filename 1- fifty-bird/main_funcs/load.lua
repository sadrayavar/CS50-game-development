function love.load()
    -- pixelize images instead of making them blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- set title
    love.window.setTitle(TITLE)

    -- set push library resizing properties 
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
