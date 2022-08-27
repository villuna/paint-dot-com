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
    require "tools/brush"

    tools.load()
    paper.load()
    desk.load()

end

function love.update(dt)
    desk.update(dt)
    paper.update(dt)
end

function love.draw()
    print("hello world")
    love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)
    desk.draw()
    paper.draw()

end