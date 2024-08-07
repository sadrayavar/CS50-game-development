-- fonts root path
local rootPath = "assets/fonts/"

-- all fonts dictionary
return {
    -- menu fonts
    ['cubic'] = function(size)
        return love.graphics.newFont(rootPath .. "From Cartoon Blocks.ttf", size)
    end,
    ['fancy'] = function(size)
        return love.graphics.newFont(rootPath .. "Blueberry .ttf", size)
    end,
    ['dense'] = function(size)
        return love.graphics.newFont(rootPath .. "SunnyspellsRegular-MV9ze.otf", size)
    end
}
