reset = {}

function reset.load()
    reset.dispImage = love.graphics.newImage("assets/menu_buttons/reset.png")
end

function reset.update()
    -- check if r is pressed
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    if love.mouse.isDown(1) and x > 64 and x < 128 and y > 0 and y < 64 then
        love.load()
    end
end

function reset.draw()
    love.graphics.draw(reset.dispImage, 64, 0, 0, 1/2, 1/2)
end