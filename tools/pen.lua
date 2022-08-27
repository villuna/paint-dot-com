-- TEMPLATE
-- Use this as a base for creating a tool

pen = {
    name = "pen",
    description = "just a pen",
    isHeld = false,
    px = 0, -- "previous x"
    py = 0
    -- TODO: some kind of image/model for the drawer
}

function pen.paint()
    love.graphics.setCanvas(paper.canvas)
        -- Do your drawing in here
        if love.mouse.isDown(1) then
            local x = love.mouse.getX() - 200
            local y = love.mouse.getY() - 200
            if pen.isHeld then
                love.graphics.setColor(0, 1, 0, 1)
                love.graphics.line(pen.px, pen.py, x, y)
            else
                pen.isHeld = true
            end
            pen.px = x 
            pen.py = y
        else
            pen.isHeld = false
        end
    love.graphics.setCanvas()
end