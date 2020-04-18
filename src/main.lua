
--[[ Game startup setup ]]
function love.load()
    love.window.setTitle("Pong!")
    WINDOW_WIDTH, WINDOW_HEIGHT, FLAGS = love.window.getMode()
end

--[[ Drawing area ]]
function love.draw()
    love.graphics.printf(
        "Welcome to Pong!", 0, 20, WINDOW_WIDTH, "center")
end
