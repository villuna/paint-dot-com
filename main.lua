selected_tool = nil

function love.load()
    require "desk"
    require "paper"
    require "tools/lsd"
    require "tools/pencil"

    selected_tool = pencil
    
    paper.load()
    desk.load()

end

function love.update(dt)
    desk.update(dt)
    paper.update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)
    desk.draw()
    paper.draw()
end