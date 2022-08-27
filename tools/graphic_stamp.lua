-- Graphic Stamp takes an image in Graphics and places it at cursor

graphic_stamp = {
    name = "Graphic Stamp",
    description = "These boots were made for stamping, and that's almost what they do."
    -- TODO: some kind of image/model for the drawer
    -- Only 1 stamp per click
    -- Stamp/Image Selection
    }

local stamp_image = love.graphics.newImage("assets/graphics/sigmundfreud3.png")

function graphic_stamp.paint()
    -- Called Every Update
    
    if love.mouse.isDown(1) then
        if love.mouse.getX() > 200 and love.mouse.getX() < 700 and love.mouse.getY() > 200 and love.mouse.getY() < 600 then
            love.graphics.setCanvas(paper.canvas)
                love.graphics.setBlendMode("alpha")
                love.graphics.draw(stamp_image, love.mouse.getX() - 200, love.mouse.getY() - 200)
            love.graphics.setCanvas()
        end
    end
end

function loadImage(path)
    local info = love.filesystem.getInfo( path )
    if info then
        return love.graphics.newImage( path )
    end
end
