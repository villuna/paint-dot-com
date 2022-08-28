require "libraries/simple-slider"

-- global colour var
color = {r = 0.5, g = 0.5, b = 0.5}
col_pick = {}

function col_pick.setR(n)
    color.r = n
end

function col_pick.setG(n)
    color.g = n
end

function col_pick.setB(n)
    color.b = n
end

function col_pick.load()
    col_pick.rSlider = newSlider(1100, 10, 100, 0.5, 0, 1, function (v) col_pick.setR(v) end)
    col_pick.gSlider = newSlider(1100, 30, 100, 0.5, 0, 1, function (v) col_pick.setG(v) end)
    col_pick.bSlider = newSlider(1100, 50, 100, 0.5, 0, 1, function (v) col_pick.setB(v) end)
end

function col_pick.update()
    col_pick.rSlider:update()
    col_pick.gSlider:update()
    col_pick.bSlider:update()
end

function col_pick.draw()
    love.graphics.setColor(0.1, 0.1, 0.1, 1) -- dark grey
    love.graphics.rectangle("fill", 1040, 0, 175, 60)
    
    love.graphics.setColor(1, 1, 1, 1) -- white
    col_pick.rSlider:draw()
    col_pick.gSlider:draw()
    col_pick.bSlider:draw()

    love.graphics.setColor(color.r, color.g, color.b, 1)
    love.graphics.rectangle("fill", 1160, 5, 50, 50)
end