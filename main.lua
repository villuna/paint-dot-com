function love.load()
    -- include other files
    require "desk"
    require "paper"
    require "tools"
    -- include all the tools
    -- remember to add them to tools.lua!
    require "tools/lsd"
    require "tools/pencil"
    require "tools/graphic_stamp"
    require "menu/reset"



    
    tools.load()
    paper.load()
    desk.load()
    -- reset.load()

end

function love.update(dt)
    desk.update(dt)
    paper.update(dt)
    reset.update()
end

function love.draw()
    love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)
    desk.draw()
    paper.draw()
    reset.draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "r" then
        love.load()
    end
end