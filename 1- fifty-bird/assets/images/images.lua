-- images root path
local rootPath = "assets/images/"

-- all images dictionary
return {
    -- background images
    ['background'] = {
        ['0'] = love.graphics.newImage(rootPath .. "background/0.png"),
        ['1'] = love.graphics.newImage(rootPath .. "background/1.png"),
        ['2'] = love.graphics.newImage(rootPath .. "background/2.png")
    },

    -- bird image
    ['bird'] = love.graphics.newImage(rootPath .. "bird/bird.png"),

    -- pipe image
    ['pipe'] = love.graphics.newImage(rootPath .. "pipe/pipe.png")
}
