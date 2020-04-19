
Class = require "class"

require "Paddle"
require "Ball"

PADDLE_SPEED = 200
PADDLE_WIDTH = 14
PADDLE_HEIGHT = 80

BALL_RADIUS = PADDLE_WIDTH/2

-- Game startup setup
function love.load()
    love.window.setTitle("Pong!")
    WINDOW_WIDTH, WINDOW_HEIGHT, FLAGS = love.window.getMode()

    local paddleInitialY = WINDOW_HEIGHT/2 - PADDLE_HEIGHT/2
    leftPaddle = Paddle(0, paddleInitialY, PADDLE_WIDTH, PADDLE_HEIGHT, PADDLE_SPEED)
    rightPaddle = Paddle(WINDOW_WIDTH - PADDLE_WIDTH, paddleInitialY, PADDLE_WIDTH, PADDLE_HEIGHT, PADDLE_SPEED)

    ball = Ball(WINDOW_WIDTH/2, WINDOW_HEIGHT/2, BALL_RADIUS)
end

-- Drawing area
function love.draw()
    love.graphics.setBackgroundColor(30/255, 25/255, 50/255) -- Random color picked by Dheeru
    love.graphics.printf("Welcome to Pong!", 0, 20, WINDOW_WIDTH, "center")

    leftPaddle:draw()
    rightPaddle:draw()

    ball:draw()
end

-- Events
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
