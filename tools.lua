tools = {}

selected_tool = nil

function tools.load() 
    tools.tools = {
        lsd,
        pencil,
        graphic_stamp,
        pen
    }

    selected_tool = lsd
end