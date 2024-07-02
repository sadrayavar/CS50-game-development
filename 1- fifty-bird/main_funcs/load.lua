function love.load()
    -- assets
    fonts = fonts
    images = images
    sounds = sounds
    musics = musics

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

    -- background related variables
    bg0PositionX = 0
    bg1PositionX = 0
    bg2PositionX = 0

    -- initialize bird
    bird = Bird()
end
