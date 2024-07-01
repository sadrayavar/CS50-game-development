Wall = Class {}

function Wall:init(left, top, width, heigth,owner,left_inf,top_inf,right_inf,down_inf)
    self.top = top
    self.left = left
    self.heigth = heigth
    self.width = width

    self.owner=owner
 
    self.left_inf = left_inf or false
    self.top_inf = top_inf or false
    self.right_inf = right_inf or false
    self.down_inf = down_inf or false

    self.last_collide=-1
end

function Wall:update(dt)
    local current_collide=collide_num(self, ball)
    
    if is_collide(self.last_collide, current_collide, self.left_inf,self.top_inf,self.right_inf,self.down_inf) then
        local point= (self.owner==ball.who_shoot) and -1 or 1

        if ball.who_shoot == 0 then
            enemy.score = enemy.score + point

            if enemy.score>=10 then game_state="lost"
            elseif enemy.score<=-5 then game_state="victory" end
        elseif ball.who_shoot == 1 then
            player1.score = player1.score + point

            if player1.score>=10 then game_state="victory"
            elseif player1.score<=-5 then game_state="lost" end
        elseif ball.who_shoot == 2 then
        end

        table.insert(log,enemy.score)
        
        ball.serve = true 
    end
    
    self.last_collide=current_collide
end

function Wall:render()
    love.graphics.rectangle('fill', self.left, self.top, self.width, self.heigth)
end

