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

    -- Setting scores
    p1Score = 0
    p2Score = 0

    --Setting paddle positions
    p1Y = 30
    p2Y = VIRTUAL_HEIGHT-50

end

function love.update(dt)

    -- Adding movement to paddles

    -- player 1 movement
    if love.keyboard.isDown('w') then
        -- add negative paddle speed to current Y scaled by deltaTime
        p1Y = p1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        -- add negative paddle speed to current Y scaled by deltaTime
        p1Y = p1Y + PADDLE_SPEED * dt
    end

    -- player 2 movement
    if love.keyboard.isDown('up') then
        -- add negative paddle speed to current Y scaled by deltaTime
        p2Y = p2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        -- add negative paddle speed to current Y scaled by deltaTime
        p2Y = p2Y + PADDLE_SPEED * dt
    end

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

    -- P1 score
    love.graphics.printf(
        p1Score, 0, 0, VIRTUAL_WIDTH, 'center'
    )

    -- creating the objects

    -- first paddle - left side
    love.graphics.rectangle('fill', 10, p1Y, 5, 20)

    -- second paddle - right side
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, p2Y, 5, 20)

    -- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH/2 - 2, VIRTUAL_HEIGHT/2 - 2, 4, 4)

    push:apply('end')
end