
Ball = Class{}

function Ball:init(x, y, radius, speedX, speedY)
    self.x = x
    self.y = y
    self.radius = radius
    self.speedX = speedX
    self.speedY = speedY
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Ball:update(dt)
    self.x = self.x + self.speedX * dt
    self.y = self.y + self.speedY * dt
end
