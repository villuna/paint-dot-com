paper = {}

function paper.load()
    paper.canvas = love.graphics.newCanvas(500, 400) -- width, height

    love.graphics.setCanvas(paper.canvas)
        love.graphics.clear()
        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle('fill', 0, 0, 500, 400)
    love.graphics.setCanvas()
    
end

function paper.update()
    selected_tool.paint()
end

function paper.draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(paper.canvas, 200, 200)
end