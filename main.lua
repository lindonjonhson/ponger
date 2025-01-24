WINDOW_WIDTH = 1280     -- declaring variables for window height and width
WINDOW_HEIGHT = 720

function love.load() -- Starts the game
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT,
    {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

-- Called after update by LOVE2D, used to draw anything to the screen, updated or otherwise.

function love.draw()
    love.graphics.printf(
        'Part 1 of Pong!',
        0,
        WINDOW_HEIGHT/2-6,
        WINDOW_WIDTH,
        'center'
    )
end