function love.load()
    -- pixelize images instead of making them blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- set title
    love.window.setTitle(TITLE)

    -- set push library resizing properties 
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGTH, WINDOW_WIDTH, WINDOW_HEIGTH, {
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

    -- assets
    fonts = require('assets.fonts.fonts')
    images = require("assets.images.images")
    sounds = require("assets.sounds.sounds")
    musics = require("assets.musics.musics")
end
