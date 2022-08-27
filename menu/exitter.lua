exitter = {}

function exitter.load()
    exitter.dispImage = love.graphics.newImage("assets/menu_buttons/close.png")
end

function exitter.update()
    -- check if r is pressed
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    if love.mouse.isDown(1) and x > 0 and x < 64 and y > 0 and y < 64 then
        love.event.quit()
    end
end

function exitter.draw()
    love.graphics.draw(exitter.dispImage, 0, 0, 0, 1/2, 1/2)
end