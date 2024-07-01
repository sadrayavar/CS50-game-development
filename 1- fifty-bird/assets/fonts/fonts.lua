function fonts()
    -- fonts root path
    local root_path = "assets/fonts/"

    -- menu fonts
    local menu = love.graphics.newFont(root_path .. "SunnyspellsRegular-MV9ze.otf", 14)

    -- score fonts
    local score = love.graphics.newFont(root_path .. "SunnyspellsRegular-MV9ze.otf", 22)

    -- message fonts
    local message = love.graphics.newFont(root_path .. "SunnyspellsRegular-MV9ze.otf", 28)

    -- hint fonts
    local hint = love.graphics.newFont(root_path .. "SunnyspellsRegular-MV9ze.otf", 14)

    -- all fonts dictionary
    local fonts = {
        ['menu'] = menu,
        ['score'] = score,
        ['message'] = message,
        ['hint'] = hint
    }

    return fonts
end
