tools = {}

selected_tool = nil

function tools.load() 
    tools.tools = {
        lsd,
        pencil,
        graphic_stamp,
        brush
    }

    selected_tool = brush
end