require 'assets.fonts.fonts'
require 'assets.images.images'
require 'assets.musics.musics'
require 'assets.sounds.sounds'

function love.load()
    -- pixelize images instead of making them blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- set title
    love.window.setTitle(TITLE)

    -- set push library resizing properties 
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGTH, WINDOW_WIDTH, WINDOW_HEIGTH, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    -- set random seed for randomizing purpose
    math.randomseed(os.time())

    -- assets
    fonts = fonts()
    images = images()
    musics = musics()
    sounds = sounds()
end
