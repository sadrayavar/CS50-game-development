local function isCollide(lastState, currentState, left_inf, top_inf, right_inf, down_inf)
    local left_inf = left_inf or false
    local top_inf = top_inf or false
    local right_inf = right_inf or false
    local down_inf = down_inf or false

    --[[
        both actuallu or colliding and there is no need to path checking
    ]]
    if 6 < currentState and currentState < 20 then
        local mod = currentState % 5

        if mod == 2 or mod == 3 or mod == 4 then
            return true
        end
    end

    --[[
        path checking if the lastState on the corners 
        if it's empty then it is going to check in the strip section
    ]]
    if lastState == 1 then -- top-left
    elseif lastState == 5 then -- top-right
    elseif lastState == 21 then -- down-left
    elseif lastState == 25 then -- down-right
    end

    --[[
        path checking if the lastState on the strips
    ]]
    if left_inf and (lastState % 5 == 0) then -- rigth strip
        if currentState == 6 or currentState == 11 or currentState == 16 then
            return true
        end
    end
    if top_inf and (21 <= lastState and lastState <= 25) then -- down strip
        if currentState == 2 or currentState == 3 or currentState == 4 then
            return true
        end
    end
    if right_inf and (lastState % 5 == 1) then -- left strip
        if currentState == 10 or currentState == 15 or currentState == 20 then
            return true
        end
    end
    if down_inf and (1 <= lastState and lastState <= 5) then -- top strip
        if currentState == 22 or currentState == 23 or currentState == 24 then
            return true
        end
    end

    return false
end

return isCollide