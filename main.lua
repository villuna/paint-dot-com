function love.load()
    -- include other files
    require "desk"
    require "paper"
    require "tools"
    -- include all the tools
    -- remember to add them to tools.lua!
    require "tools/lsd"
    require "tools/pencil"
    require "tools/graphic_stamp"
    require "tools/pen"
    require "tools/blobhaj"
    require "menu/reset"
    require "tools/brush"
    require "no-typos-allowed"
    
    tools.load()
    paper.load()
    desk.load()
    no_typos_allowed.load()
end

function love.update(dt)
    desk.update(dt)
    paper.update(dt)
    no_typos_allowed.update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)

    desk.draw()
    paper.draw()
    no_typos_allowed.draw()
end

function love.keypressed(key)
    no_typos_allowed.newchar(key)
end
