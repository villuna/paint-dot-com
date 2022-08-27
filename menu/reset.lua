
reset = {}

function reset.draw()
    love.graphics.setColor(0.5, 0.5, 0, 1)
    love.graphics.rectangle("fill", 0, 0, 90, 60, 0)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print("reset (r)", 20, 30)
end

function reset.update()
    -- check if r is pressed
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    if love.keyboard.isDown("r") or (
        love.mouse.isDown(1) and x > 0 and x < 90 and y > 0 and y < 60 ) then
        love.load()
    end
end