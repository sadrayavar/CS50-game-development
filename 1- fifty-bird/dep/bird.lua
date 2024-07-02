local Bird = Class {}

function Bird:init()
    self.image = images.bird

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGTH / 2 - self.height / 2
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y, 0, 0.5, 0.5)
end

function Bird:update(dt)
    
end

return Bird
