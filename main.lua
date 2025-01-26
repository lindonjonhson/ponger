push = require 'push'   -- using a library
                        -- push will take our 1280x720 window and turn it into a virtual resolution of 432x243


WINDOW_WIDTH = 1280     -- declaring variables for window height and width
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432     -- declaring variables for virtual window
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load() -- Starts the game

    love.graphics.setDefaultFilter('nearest', 'nearest') -- using a text filter

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key) -- If escape is hit, quit the game
    if key == 'escape' then
        love.event.quit()
    end
end

-- Called after update by LOVE2D, used to draw anything to the screen, updated or otherwise.

function love.draw()

    push:apply('start') -- Push will start rendering the virtual resolution

    love.graphics.clear(0/255, 143/255, 17/255, 255/255) -- setting screen color to green


    -- title
    love.graphics.printf(
        'Part 1 of Pong!', 0, 10, VIRTUAL_WIDTH, 'center'
    )

    -- creating the objects

    -- first paddle - left side
    love.graphics.rectangle('fill', 10, 30, 5, 20)

    -- second paddle - right side
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

    -- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH/2 - 2, VIRTUAL_HEIGHT/2 - 2, 4, 4)

    push:apply('end')
end