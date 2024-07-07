-- fonts root path
local rootPath = "assets/fonts/"

-- all fonts dictionary
return {
    -- menu fonts
    ['cubic'] = love.graphics.newFont(rootPath .. "From Cartoon Blocks.ttf", VIRTUAL_HEIGHT / 3.5),
    ['fancy'] = love.graphics.newFont(rootPath .. "Blueberry .ttf", VIRTUAL_HEIGHT / 12),
    ['dense'] = love.graphics.newFont(rootPath .. "SunnyspellsRegular-MV9ze.otf", VIRTUAL_HEIGHT / 12)
}
