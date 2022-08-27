-- TEMPLATE
-- Use this as a base for creating a tool

test_tool = {
    name = "test tool",
    description = "this tool does not exist. you should not be seeing it."
    -- TODO: some kind of image/model for the drawer
}

function test_tool.paint()
    -- Go absolutely wild here
    -- This function is called every update

    print("Hello world!")

    love.graphics.setCanvas(paper.canvas)
        -- Do your drawing in here
    
    love.graphics.setCanvas()
end