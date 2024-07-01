Player = Class {}

function Player:init(left, top, width, heigth,owner, left_button, right_button, speed,left_inf,top_inf,right_inf,down_inf)
    self.width = width or VIRTUAL_WIDTH / 10
    self.left = left - self.width    / 2
    self.top = top
    self.heigth = heigth or 5
    self.right = self.left + self.width
    self.down = self.top + self.heigth

    self.left_button = left_button or false
    self.right_button = right_button or false

    self.speed = speed
    self.dx = 0
    self.dy = 0
    self.position = 'down'
    self.score = 0

    self.owner=owner
    self.last_collide=-3
    
    self.left_inf=left_inf or false
    self.top_inf=top_inf or false
    self.right_inf=right_inf or false
    self.down_inf=down_inf or false
end


function Player:update(dt)
    local current_collide=collide_num(self, ball)
    
    --[[
        controls
    ]]
    if self.left_button then -- controled by human
        if love.keyboard.isDown(self.left_button) then
            self.left = math.max(0, self.left - dt * self.speed)
        end
        if love.keyboard.isDown(self.right_button) then
            self.left = math.min(VIRTUAL_WIDTH - self.width, self.left + dt * self.speed)
        end
    else -- controled by AI
        if ball.who_shoot==0 then
            if self.left+self.width<VIRTUAL_WIDTH/2 then
                self.left = math.min(VIRTUAL_WIDTH - self.width, self.left + dt * self.speed)
            elseif self.left > VIRTUAL_WIDTH/2 then
                self.left = math.max(0, self.left - dt * self.speed)
            end
        else
            local ball_center = ball.left + ball.width / 2
            
            if ball_center < self.left then
                self.left = math.max(0, self.left - dt * self.speed)
            elseif ball_center > self.left + self.width then
                self.left = math.min(VIRTUAL_WIDTH - self.width, self.left + dt * self.speed)
            end
        end
    end

    --[[
        check paddle colliding
    ]]
    if game_state == 'PvC' then
        if (not ball.serve) and is_collide(self.last_collide,current_collide, self.left_inf,self.top_inf,self.right_inf,self.down_inf) then
            ball.top = (self.owner==0) and (enemy.down + 1) or (player1.top - ball.heigth - 1)
            ball.dx = ball.speed * leverage(self, ball) * math.random(0.75,1.25)
            ball.dy = -ball.dy
            ball.who_shoot = self.owner
        end
    elseif game_state == 'PvP' then
    elseif game_state == 'PPvC' then
    elseif game_state == 'PvPvC' then
    end

    self.last_collide=current_collide
end

function Player:render()
    love.graphics.rectangle('fill', self.left, self.top, self.width, self.heigth)
end