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
    bgPos = {}
    for i = 1, 7, 1 do
        bgPos[tostring(i)] = 0
    end

    -- log text
    logText = ''

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
