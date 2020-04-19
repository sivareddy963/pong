
Class = require "class"

require "Paddle"
require "Ball"

PADDLE_SPEED = 250
PADDLE_WIDTH = 14
PADDLE_HEIGHT = 80

BALL_RADIUS = PADDLE_WIDTH/2
BALL_SPEED = PADDLE_SPEED

-- Game startup setup
function love.load()
    math.randomseed(os.time())

    love.window.setTitle("Pong!")
    WINDOW_WIDTH, WINDOW_HEIGHT, FLAGS = love.window.getMode()

    local paddleInitialY = WINDOW_HEIGHT/2 - PADDLE_HEIGHT/2
    leftPaddle = Paddle(0, paddleInitialY, PADDLE_WIDTH, PADDLE_HEIGHT, PADDLE_SPEED, "w", "s")
    rightPaddle = Paddle(WINDOW_WIDTH - PADDLE_WIDTH, paddleInitialY, PADDLE_WIDTH, PADDLE_HEIGHT, PADDLE_SPEED, "up", "down")

    resetBall()
end

-- Drawing area
function love.draw()
    love.graphics.setBackgroundColor(30/255, 25/255, 50/255) -- Random color picked by Dheeru

    love.graphics.setNewFont(25)
    love.graphics.printf("Welcome to Pong!", 0, 20, WINDOW_WIDTH, "center")
    love.graphics.setNewFont(15)
    love.graphics.printf("Press space to start...", 0, 60, WINDOW_WIDTH, "center")

    leftPaddle:draw()
    rightPaddle:draw()

    ball:draw()
end

function love.update(dt)
    if ball:hasCollided(leftPaddle) or ball:hasCollided(rightPaddle) then
        ball.speedX = -ball.speedX * 1.1
        ball.speedY = ball.speedY * (math.random(3, 8) / 4)
    elseif ball:hasGoneOut() then
        resetBall()
    end

    if ball:hasHitWall() then
        ball.speedY = -ball.speedY
    end

    leftPaddle:update(dt)
    rightPaddle:update(dt)

    ball:update(dt)
end

-- Events
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "space" then
        ballSpeedX = math.random(1, 2) == 1 and -BALL_SPEED or BALL_SPEED
        ball = Ball(WINDOW_WIDTH/2, WINDOW_HEIGHT/2, BALL_RADIUS, ballSpeedX, math.random(-BALL_SPEED, BALL_SPEED))
    end
end

function resetBall()
    ball = Ball(WINDOW_WIDTH/2, WINDOW_HEIGHT/2, BALL_RADIUS, 0, 0)
end
