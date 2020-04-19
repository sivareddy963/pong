
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

function Ball:hasCollided(paddle)
    local isBallInYRange = self.y >= paddle.y and self.y <= paddle.y + paddle.height

    local ballLeftX = self.x - self.radius
    local ballRightX = self.x + self.radius

    local paddleLeftX = paddle.x
    local paddleRightX = paddle.x + paddle.width

    local isBallsLeftTouching = ballLeftX <= paddleRightX and ballLeftX > paddleLeftX
    local isBallsRightTouching = ballRightX >= paddleLeftX and ballRightX < paddleRightX

    return isBallInYRange and (isBallsLeftTouching or isBallsRightTouching)
end

function Ball:hasHitWall()
    local ballTop = self.y - self.radius
    local ballBottom = self.y + self.radius

    local hasHitTop = ballTop <= 0
    local hasHitBottom = ballBottom >= WINDOW_HEIGHT

    return hasHitTop or hasHitBottom
end

function Ball:hasGoneOut()
    return self.x < 0 or self.x > WINDOW_WIDTH
end
