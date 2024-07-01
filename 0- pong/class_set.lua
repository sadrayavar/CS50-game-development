Class_set = Class {}

function Class_set:init(table, length)
    self.table = table
    self.length = length
end

function Class_set:update(dt)
    for i = 0, self.length - 1 do
        local wall = self.table[i]
        wall:update(dt)
    end
end

function Class_set:render()
    for i = 0, self.length - 1 do
        local wall = self.table[i]
        wall:render()
    end
end
