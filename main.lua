-- include other files
require "desk"
require "paper"
require "tools"
require "bg"
require "menu"
require "colour_picker"
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

function love.load()
    menu.load()
    bg.load()
    tools.load()
    paper.load()
    desk.load()
    no_typos_allowed.load()
    col_pick.load()
end

function love.update(dt)
    desk.update(dt)
    paper.update()
    menu.update(dt)
    col_pick.update()
    no_typos_allowed.update(dt)
end

function reset_col()
    love.graphics.setColor(1, 1, 1, 1)
end

function love.draw()
    -- love.graphics.setBackgroundColor(0.36, 0.36, 0.36, 1)
    reset_col()
    bg.draw()
    reset_col()
    desk.draw()
    reset_col()
    menu.draw()
    reset_col()
    col_pick.draw()
    reset_col()
    paper.draw()
    reset_col()
    tools.draw()
    reset_col()
    no_typos_allowed.draw()
end

function love.keypressed(key)
    no_typos_allowed.newchar(key)
end
