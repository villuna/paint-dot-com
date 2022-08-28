printer = {
    timeout = 0
}

function printer.load()
    printer.dispImage = love.graphics.newImage("assets/menu_buttons/print.png")
end

function printer.update(dt)
    -- check if r is pressed
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    if love.mouse.isDown(1) and x > 128 and x < 128 + 64 and y > 0 and y < 64 and printer.timeout == 0 then
        printer.timeout = 2
        -- print to file, filename = current time+date
        paper.canvas:newImageData():encode("png","printer"..os.time()..".png")
    end

    if printer.timeout > 0 then
        printer.timeout = printer.timeout - dt
    else
        printer.timeout = 0
    end

end

function printer.draw()
    love.graphics.draw(printer.dispImage, 128, 0, 0, 1/2, 1/2)

    if printer.timeout > 0 then
        love.graphics.print({{0,0,0,1}, "Saved to "..love.filesystem.getSaveDirectory( )}, 200, 22, nil, 1.25)
    end
end
