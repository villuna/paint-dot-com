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
    if love.mouse.isDown(1) then
		if love.mouse.getX() > 200 and love.mouse.getX() < 700 and love.mouse.getY() > 200 and love.mouse.getY() < 600 then
            love.graphics.print("MOUSE DOWN!", 10, 10)
            love.graphics.setCanvas(paper.canvas)
                love.graphics.setColor(love.math.random(), love.math.random(), love.math.random(), 1)
                love.graphics.setBlendMode("alpha")
                love.graphics.rectangle("fill", love.mouse.getX() - 200, love.mouse.getY() - 200, 20, 20)
            love.graphics.setCanvas()
        end
	end	
end

function paper.draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(paper.canvas, 200, 200)
end