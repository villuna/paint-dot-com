printer = {}

function printer.load()
    printer.dispImage = love.graphics.newImage("assets/menu_buttons/print.png")
end

function printer.update()
    -- check if r is pressed
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    if love.mouse.isDown(1) and x > 128 and x < 128 + 64 and y > 0 and y < 64 then
        -- print to file, filename = current time+date
        paper.canvas:newImageData():encode("png","printer"..os.time()..".png")
    end
end

function printer.draw()
    love.graphics.draw(printer.dispImage, 128, 0, 0, 1/2, 1/2)
end