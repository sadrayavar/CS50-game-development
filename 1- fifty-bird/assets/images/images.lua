-- images root path
local rootPath = "assets/images/"

-- background images
local background = {
    ['0'] = love.graphics.newImage(rootPath .. "background/0.png"),
    ['1'] = love.graphics.newImage(rootPath .. "background/1.png"),
    ['2'] = love.graphics.newImage(rootPath .. "background/2.png")
}

-- bird image
local bird = love.graphics.newImage(rootPath .. "bird/bird.png")

-- all images dictionary
return {
    ['background'] = background,
    ['bird'] = bird
}