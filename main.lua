function love.load()
    -- include other files
    require "desk"
    require "paper"
    require "tools"
    require "bg"
    -- include all the tools
    -- remember to add them to tools.lua!
    require "tools/lsd"
    require "tools/pencil"
    require "tools/graphic_stamp"
    require "tools/pen"
    require "tools/blobhaj"
    require "menu/reset"
    require "tools/brush"
    
    bg.load()
    tools.load()
    paper.load()
    desk.load()
end

function love.update(dt)
    desk.update(dt)
    paper.update(dt)
    reset.update()
end

function love.draw()
    -- love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)
    bg.draw()

    desk.draw()
    reset.draw()
    paper.draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "r" then
        love.load()
    end
end
