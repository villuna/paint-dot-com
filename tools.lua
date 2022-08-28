tools = {}

selected_tool = nil

function tools.load() 
    tools.tools = {
        lsd,
        -- pencil,
        graphic_stamp,
        pen,
        -- blobhaj,
        -- brush
    }

    selected_tool = pen

    for key, val in pairs(tools.tools) do
        val.load()
    end
end

function tools.draw()
    love.graphics.draw(selected_tool.image, love.mouse.getX(), love.mouse.getY(), selected_tool.im_rot, selected_tool.im_sc, selected_tool.im_sc)
end