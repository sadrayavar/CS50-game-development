local function getState(staticObj, dynamicObj)
    local d_right = dynamicObj.x + dynamicObj.w
    local d_down = dynamicObj.y + dynamicObj.h
    local s_right = staticObj.x + staticObj.w
    local s_down = staticObj.y + staticObj.h

    local result = 0

    if d_down < staticObj.y then -- 1 ~ 5
        result = 5 * 0
    elseif dynamicObj.y < staticObj.y and staticObj.y <= d_down then -- 6 ~ 10
        result = 5 * 1
    elseif staticObj.y <= dynamicObj.y and d_down <= s_down then -- 11 ~ 15
        result = 5 * 2
    elseif dynamicObj.y <= s_down and s_down < d_down then -- 16 ~ 20
        result = 5 * 3
    elseif s_down < dynamicObj.y then -- 21 ~ 25
        result = 5 * 4
    end

    if d_right < staticObj.x then -- 1, 6, 11, 16, 21
        result = result + 1
    elseif dynamicObj.x < staticObj.x and staticObj.x <= d_right then -- 2, 7, 12, 17, 22
        result = result + 2
    elseif staticObj.x <= dynamicObj.x and d_right <= s_right then -- 3, 8, 13, 18, 23
        result = result + 3
    elseif dynamicObj.x <= s_right and s_right < d_right then -- 4, 9, 14, 19, 24
        result = result + 4
    elseif s_down < dynamicObj.x then -- 5, 10, 15, 10, 25
        result = result + 5
    end

    return result
end

return getState