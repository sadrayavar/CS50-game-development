-- images root path
local rootPath = "assets/images/"

-- all images dictionary
return {
    -- background images
    ['background'] = {
        ['1'] = love.graphics.newImage(rootPath .. "background/nature/1.png"),
        ['2'] = love.graphics.newImage(rootPath .. "background/nature/2.png"),
        ['3'] = love.graphics.newImage(rootPath .. "background/nature/3.png"),
        ['4'] = love.graphics.newImage(rootPath .. "background/nature/4.png"),
        ['5'] = love.graphics.newImage(rootPath .. "background/nature/5.png"),
        ['6'] = love.graphics.newImage(rootPath .. "background/nature/6.png"),
        ['7'] = love.graphics.newImage(rootPath .. "background/nature/7.png")
    },

    -- bird image
    ['bird'] = love.graphics.newImage(rootPath .. "bird/bird.png"),

    -- pipe image
    ['pipe'] = love.graphics.newImage(rootPath .. "pipe/pipe.png")
}
