require "menu/exitter"
require "menu/reset"
require "menu/printer"

menu = {}

function menu.load()
    exitter.load()
    reset.load()
    printer.load()
end

function menu.update(dt)
    exitter.update()
    reset.update()
    printer.update()
end

function menu.draw()
    exitter.draw()
    reset.draw()
    printer.draw()
end