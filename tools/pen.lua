-- TEMPLATE
-- Use this as a base for creating a tool

pen = {
    name = "pen",
    description = "just a pen",
    isHeld = false,
    px = 0, -- "previous x"
    py = 0,
    im_sc = 1/16, -- image scaler
    im_rot = math.pi * 3/4, -- image rotater for in hand
    im_width = 15,
    im_height = 60
}

function pen.load()
    pen.image = love.graphics.newImage("assets/tools/pen.png")
end

function pen.paint()
    love.graphics.setCanvas(paper.canvas)
        -- Do your drawing in here
        if love.mouse.isDown(1) then
            local x = love.mouse.getX() - 200
            local y = love.mouse.getY() - 200
            if pen.isHeld then
                love.graphics.setColor(color.r, color.g, color.b, 1)
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