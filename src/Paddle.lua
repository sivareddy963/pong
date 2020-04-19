
Paddle = Class{}

function Paddle:init(x, y, width, height, speed)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = speed
end

function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Paddle:update(dt)
    
end
