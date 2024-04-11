Ball = Class {}

function Ball:init(player)
    -- set position
    self.left=VIRTUAL_WIDTH/2
    self.top=VIRTUAL_HEIGTH/2
    self:stick()

    self.width = VIRTUAL_WIDTH / 80
    self.heigth = VIRTUAL_WIDTH / 80

    self.serve = true

    -- who will shoot
    self.who_shoot = player

    self.speed = VIRTUAL_WIDTH/3
end

function Ball:update(dt)
    if self.serve then
        if self.who_shoot == 0 then
            -- self.serve = false -- serve automatic from enemy
            self.serve = not (love.keyboard.isDown('space')) -- serve with key from enemy mode
        else
            self.serve = not (love.keyboard.isDown('space'))
        end
        
        self:stick()
        self.dx = math.random((-0.25 * self.speed), (0.25 * self.speed))
        self.dy = (self.top < (VIRTUAL_HEIGTH / 2)) and self.speed or -self.speed
        
        return
    end

    --[[
        check side wall colliding
    ]]
    if self.left<=0 then
        self.dx = -self.dx
        self.left=1
    end
    if self.left>=VIRTUAL_WIDTH-1 then
        self.dx = -self.dx
        self.left=VIRTUAL_WIDTH-self.width-1
    end

    -- move
    self.top = self.top + dt * self.dy
    self.left = self.left + dt * self.dx
end

function Ball:render()
    love.graphics.rectangle("fill", self.left, self.top, self.width, self.heigth)
end

function Ball:stick()
    if game_state == 'PvC' then
        if self.who_shoot == 0 then
            self.top = enemy.top + enemy.heigth + self.heigth / 2
            self.left = enemy.left + enemy.width / 2 - self.width / 2
        elseif self.who_shoot == 1 then
            self.top = player1.top - self.heigth - 5
            self.left = player1.left + player1.width / 2 - self.width / 2
        end
    elseif game_state == 'PvP' then
        if self.who_shoot == 1 then
            self.top = player1.top - self.heigth - 5
            self.left = player1.left + player1.width / 2 - self.width / 2
        elseif self.who_shoot == 2 then
            self.top = enemy.top + enemy.heigth + self.heigth / 2
            self.left = enemy.left + self.width / 2
        end
    elseif game_state == 'PPvC' then
        if self.who_shoot == 0 then
        elseif self.who_shoot == 1 then
        elseif self.who_shoot == 2 then
        end
    elseif game_state == 'PvPvC' then
        if self.who_shoot == 0 then
        elseif self.who_shoot == 1 then
        elseif self.who_shoot == 2 then
        end
    end
end

