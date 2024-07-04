function love.load()
    -- import global variables
    require 'global.background'
    require 'global.bird'
    require 'global.pipe'
    require 'global.screen'
    require 'global.gap'

    bird = Bird()

    --[[
       ############################################################################## setting
    ]]

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
end
