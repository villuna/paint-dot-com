-- TEMPLATE
-- Use this as a base for creating a tool

brush = {
    name = "A wet brush",
    description = "wet until it's dry"
    -- TODO: some kind of image/model for the drawer
}
stars = {}
ink = 1
function generate_stars()
    local screen_width, screen_height = love.graphics.getDimensions()
    local max_stars = 1000 * ink   -- how many stars we want
    if ink > 0.008 then
        ink = ink*0.99
    end
   -- table which will hold our stars
 
    for i=1, max_stars do   -- generate the coords of our stars
       local x = love.math.random(-10, 10) + love.mouse.getX()-200   -- generate a "random" number for the x coord of this star
       local y = love.math.random(-10,10) + love.mouse.getY()-200   -- both coords are limited to the screen size, minus 5 pixels of padding
       stars[i] = {x, y}   -- stick the values into the table
    end

end

function brush.paint()
    -- Go absolutely wild here
    -- This function is called every update

    if love.mouse.isDown(1) then
        love.graphics.setCanvas(paper.canvas)
            love.graphics.setColor(0, 0, 1, 1)
            love.graphics.setBlendMode("alpha")
            generate_stars()
            for i, star in ipairs(stars) do   -- loop through all of our stars
                love.graphics.points(star[1], star[2])   -- draw each point
                end
        love.graphics.setCanvas()
    elseif love.mouse.isDown(2) and love.mouse.getX() < 200 then
        ink = 1
    end
    

end