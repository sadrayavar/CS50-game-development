function collide_num(s,d)
    local d_right = d.left + d.width
    local d_down = d.top + d.heigth
    local s_right = s.left + s.width
    local s_down = s.top + s.heigth

    local result=0
    
    if d_down<s.top then -- 1 ~ 5
        result=5*0
    elseif d.top<s.top and s.top<=d_down then -- 6 ~ 10
        result=5*1
    elseif s.top<=d.top and d_down<=s_down then -- 11 ~ 15
        result=5*2
    elseif d.top<=s_down and s_down<d_down then -- 16 ~ 20
        result=5*3
    elseif s_down<d.top then -- 21 ~ 25
        result=5*4
    end

    if d_right<s.left then -- 1, 6, 11, 16, 21
        result=result+1
    elseif d.left<s.left and s.left<=d_right then -- 2, 7, 12, 17, 22
        result=result+2
    elseif s.left<=d.left and d_right<=s_right then -- 3, 8, 13, 18, 23
        result=result+3
    elseif d.left<=s_right and s_right<d_right then -- 4, 9, 14, 19, 24
        result=result+4
    elseif s_down<d.left then -- 5, 10, 15, 10, 25
        result=result+5
    end

    return result
end

function is_collide(last,current,left_inf,top_inf,right_inf,down_inf)
    local left_inf=left_inf or false
    local top_inf=top_inf or false
    local right_inf=right_inf or false
    local down_inf=down_inf or false
    
    --[[
        both actuallu or colliding and there is no need to path checking
    ]]
    if 6 < current and current < 20 then
        local mod= current % 5

        if mod == 2 or mod == 3 or mod == 4 then
            return true
        end 
    end 

    --[[
        path checking if the last on the corners 
        if it's empty then it is going to check in the strip section
    ]]
    if last==1 then --top-left
    elseif last==5 then --top-right
    elseif last==21 then --down-left
    elseif last==25 then --down-right
    end

    --[[
        path checking if the last on the strips
    ]]
    if left_inf and (last%5 == 0) then--rigth strip
        if current==6 or current==11 or current==16 then
            return true
        end
    end
    if top_inf and (21<=last and last<=25) then--down strip
        if current==2 or current==3 or current==4 then
            return true
        end
    end
    if right_inf and (last%5 == 1) then--left strip
        if current==10 or current==15 or current==20 then
            return true
        end
    end
    if down_inf and (1<=last and last<=5) then--top strip
        if current==22 or current==23 or current==24 then
            return true
        end
    end

    return false
end