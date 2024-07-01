function images()
    -- images root path
    local root_path = "assets/images/"

    -- background images
    local background = {
        ['0'] = love.graphics.newImage(root_path .. "background/0.png"),
        ['1'] = love.graphics.newImage(root_path .. "background/1.png"),
        ['2'] = love.graphics.newImage(root_path .. "background/2.png")
    }

    -- bird image
    local bird = love.graphics.newImage(root_path .. "bird/bird.png")

    -- all images dictionary
    local images = {
        ['background'] = background,
        ['bird'] = bird
    }

    return images
end
