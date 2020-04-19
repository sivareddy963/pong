
Paddle = Class{}

function Paddle:init(x, y, width, height, speed, upKey, downKey)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = speed
    self.upKey = upKey
    self.downKey = downKey
end

function Paddle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(dt)
    if love.keyboard.isDown(self.upKey) then
        self.y = math.max(0, self.y - self.speed * dt)
    elseif love.keyboard.isDown(self.downKey) then
        self.y = math.min(WINDOW_HEIGHT - self.height, self.y + self.speed * dt)
    end
end
