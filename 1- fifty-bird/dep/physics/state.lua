local function getState(staticObj, dynamicObj)
    local d_right = dynamicObj.left + dynamicObj.width
    local d_down = dynamicObj.top + dynamicObj.height
    local s_right = staticObj.left + staticObj.width
    local s_down = staticObj.top + staticObj.height

    local result = 0

    if d_down < staticObj.top then -- 1 ~ 5
        result = 5 * 0
    elseif dynamicObj.top < staticObj.top and staticObj.top <= d_down then -- 6 ~ 10
        result = 5 * 1
    elseif staticObj.top <= dynamicObj.top and d_down <= s_down then -- 11 ~ 15
        result = 5 * 2
    elseif dynamicObj.top <= s_down and s_down < d_down then -- 16 ~ 20
        result = 5 * 3
    elseif s_down < dynamicObj.top then -- 21 ~ 25
        result = 5 * 4
    end

    if d_right < staticObj.left then -- 1, 6, 11, 16, 21
        result = result + 1
    elseif dynamicObj.left < staticObj.left and staticObj.left <= d_right then -- 2, 7, 12, 17, 22
        result = result + 2
    elseif staticObj.left <= dynamicObj.left and d_right <= s_right then -- 3, 8, 13, 18, 23
        result = result + 3
    elseif dynamicObj.left <= s_right and s_right < d_right then -- 4, 9, 14, 19, 24
        result = result + 4
    elseif s_down < dynamicObj.left then -- 5, 10, 15, 10, 25
        result = result + 5
    end

    return result
end

return getState