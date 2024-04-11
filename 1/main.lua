require 'constants'
push = require 'lib.push'
Class = require 'lib.class'
require 'player'
require 'ball'
require 'wall'
require 'class_set'
require 'global'
local last_state = ""

function love.load()
    -- settings
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle(TITLE)
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGTH, WINDOW_WIDTH, WINDOW_HEIGTH, WINDOW_MODE)
    math.randomseed(os.time())
    
    -- fonts
    font={
        ['menu'] = love.graphics.newFont("asset/fonts/SunnyspellsRegular-MV9ze.otf", 14),
        ['score'] = love.graphics.newFont("asset/fonts/SunnyspellsRegular-MV9ze.otf", 22),
        ['message'] = love.graphics.newFont("asset/fonts/SunnyspellsRegular-MV9ze.otf", 28),
        ['hint'] = love.graphics.newFont("asset/fonts/SunnyspellsRegular-MV9ze.otf", 14)
    }
    sound={
        -- ['paddle_move'] = love.audio.newSource("paddle.wav", "static"),
        -- ['select'] = love.audio.newSource("paddle.wav", "static"),
        -- ['wall'] = love.audio.newSource("ball.wav", "static"),
        -- ['score'] = love.audio.newSource("hit.wav", "static"),
        -- ['win'] = love.audio.newSource("hit.wav", "static"),
        -- ['lose'] = love.audio.newSource("hit.wav", "static"),
    }

    game_state = 'select'
    log={}
    
    ball = nil
    enemy = nil
    player1 = nil
    player2 = nil
    walls = nil
end

function love.resize(w,h)
    push:resize(w,h)
end

function love.keypressed(key)
    if game_state == 'select' then -- select state
        if key == "escape" then love.event.quit() end

        if key == "t" then -- PvC
            game_state = "PvC"
            ball = Ball(1)

            local player_heigth=5
            enemy = Player(VIRTUAL_WIDTH / 2, 0, nil, player_heigth, 0,nil, nil, ball.speed*2/3,false,true,false,false) -- enemy
            player1 = Player(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGTH - line_thick - player_heigth, nil, player_heigth,1, 'left', 'right', ball.speed,false,false,false,true) -- player 1
            player2 = nil

            walls = Class_set({
                [0] = Wall(0, 0, VIRTUAL_WIDTH, line_thick,0, false, true, false, false), -- enemy wall
                [1] = Wall(0, VIRTUAL_HEIGTH - line_thick, VIRTUAL_WIDTH,line_thick,1, false, false, false, true) -- player 1 wall
            }, 2)
        elseif key == "y" then -- PvP
            game_state = "PvP"

            if math.random() > .5 then
                ball = Ball(1)
            else
                ball = Ball(2)
            end

            player1 = Player(VIRTUAL_HEIGTH - line_thick - 3, nil, nil, nil, 'left', 'right', 200) -- player 1
            player2 = Player(0, nil, nil, nil, 'a', 'd', 100) -- player2
            enemy = nil

            walls = Class_set({
                [0] = Wall(0, 0, VIRTUAL_WIDTH, line_thick, false, false, true, false, 1), -- player 2 wall
                [1] = Wall(0, VIRTUAL_HEIGTH - line_thick, VIRTUAL_WIDTH, line_thick, true, false, false, false, 2) -- player 1 wall
            }, 2)
        elseif key == "u" then -- PPvC
        elseif key == "i" then -- PvPvC
        end
    elseif game_state == 'PvC' or game_state == 'PvP' or game_state == 'PPvC' or game_state == 'PvPvC' then -- play state
        if key == "escape" then
            last_state = game_state
            game_state = 'pause'
        end
    elseif game_state == 'pause' then -- pause state
        if key == "escape" then
            game_state = 'select'
        elseif key == "space" then
            game_state = last_state
        end
    end
end

function love.update(dt)
    if game_state == 'PvC' or game_state == 'PvP' or game_state == 'PPvC' or game_state == 'PvPvC' then -- play state
        local temp = not (enemy == nil) and enemy:update(dt)
        local temp = not (player1 == nil) and player1:update(dt)
        local temp = not (player2 == nil) and player2:update(dt)
        walls:update(dt)
        ball:update(dt)
    elseif game_state == 'victory' then
        sound.win:play()
        if love.keyboard.isDown('space') then game_state="select"end
    elseif game_state == 'lost' then
        sound.lose:play()
        if love.keyboard.isDown('space') then game_state="select"end
    end
end

function love.draw()
    push:start()
    -- FPS calculation
    if DEBUG then love.graphics.print("FPS: "..love.timer.getFPS(), VIRTUAL_WIDTH-50, 0) end

    if game_state == "select" then
        -- background color
        love.graphics.clear(0, 0, 0, 255)

        local list_of_text = {
            [0] = {text = "Click \"Esc\" to Exit"},
            [1] = {text = "Click \"t\" to play vs computer"},
            [2] = {text = "Click \"y\" to play vs human"},
            [3] = {text = "Click \"u\" to play with human vs computer"},
            [4] = {text = "Click \"i\" to play vs human vs computer"},
        }

        print_line(list_of_text, 5)
    elseif game_state == 'PvC' or game_state == 'PvP' or game_state == 'PPvC' or game_state == 'PvPvC' then -- play state
        if ball.serve then 
            love.graphics.setFont(font.hint)
            local text='Press "space" to shoot the ball.'
            local left= VIRTUAL_WIDTH / 2 - love.graphics.getFont():getWidth(text)/2
            love.graphics.print(text, left, VIRTUAL_HEIGTH/2)
        end

        -- score list
        love.graphics.setFont(font.score)
        if game_state == 'PvC' then
            local top=VIRTUAL_HEIGTH/2
            local left=VIRTUAL_WIDTH/2-love.graphics.getFont():getWidth("15")/2
            if not (player1 == nil) then love.graphics.print(player1.score, left, top+VIRTUAL_HEIGTH/4) end
            if not (enemy == nil) then love.graphics.print(enemy.score, left, top-VIRTUAL_HEIGTH/4) end
        elseif game_state == 'PvP' then
        elseif game_state == 'PPvC' then
        elseif game_state == 'PvPvC' then
        end

        -- -- log
        -- local line_heigth=14
        -- for i=1,VIRTUAL_HEIGTH/line_heigth  do
        -- love.graphics.print(log[i] or 'nil', VIRTUAL_WIDTH-200, i*line_heigth)
        -- end

        ball:render()
        local temp = not (enemy == nil) and enemy:render()
        local temp = not (player1 == nil) and player1:render()
        local temp = not (player2 == nil) and player2:render()
        walls:render()
    elseif game_state == 'victory' then
        print_line({[0]={text="You have won!",font=font.message},[1]={text="Press \"space\" to go to main menu",font=font.menu}},2)
    elseif game_state == 'lost' then
        print_line({[0]={text="You should try again.",font=font.message},[1]={text="Press \"space\" to go to main menu",font=font.menu}},2)
    elseif game_state == 'pause' then
        local list_of_text = {
            [0] = {text = "PAUSE"},
            [1] = {text = "Click \"esc\" to Exit"},
            [2] = {text = "Click \"space\" to continue playing"}
        }

        print_line(list_of_text, 3)
    end

    push:finish()
end

--[[
    global objects
]]
function print_line(list_of_text, length)
    for i = 0, length - 1 do
        love.graphics.setFont(list_of_text[i].font or font.hint) 
        
        local text = list_of_text[i].text

        local width = love.graphics.getFont():getWidth(text)
        local heigth = love.graphics.getFont():getHeight()

        local left = VIRTUAL_WIDTH / 2 - width / 2
        local top = VIRTUAL_HEIGTH * (i + 1) / (length + 1) - heigth / 2

        love.graphics.print(text, left, top)
    end
end