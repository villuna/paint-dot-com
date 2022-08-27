function love.load()
    require "desk"
    require "paper"

    paper.load()
end

function love.update()
    desk.update()
    paper.update()
end

function love.draw()
    love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)
    desk.draw()
    paper.draw()
end