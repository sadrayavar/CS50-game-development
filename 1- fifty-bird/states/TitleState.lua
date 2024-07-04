TitleState = Class {
    __includes = BaseState
}

function TitleState:update(dt)
    love.keyboard.wasPressed()
end

function TitleState:render()
end
