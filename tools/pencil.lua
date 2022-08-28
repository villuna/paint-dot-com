pencil = {
    name = "a pencil",
    description = "a little scratchy. don't press it too hard.",

    base_colour = {54/255, 53/255, 61/255},
    sharpness = 1,
    min_radius = 2,
    max_radius = 4,
    variance = 0.2,
    previous = nil,

    -- Todo
    length = 1, -- for use with the sharpener
    snapped = false, -- lmao,
}

function lerp(min, max, t)
    assert(0 <= t and t <= 1) -- min <= max and 
    return (1 - t) * min + t * max
end

function points_between(x1, y1, x2, y2)
    local N = math.max(math.max(math.abs(y2 - y1), math.abs(x2 - x1)) / pencil.radius(),1)

    local points = {}

    for i = 1,N do
        local x = lerp(x1, x2, i/N)
        local y = lerp(y1, y2, i/N)

        points[i] = {x = x, y = y} 
    end

    return points
end

function clamp(x, min, max)
    if x < min then
        return min
    elseif x > max then
        return max
    else
        return x
    end
end

function pencil.radius()
    return lerp(pencil.min_radius, pencil.max_radius, 1 - pencil.sharpness)
end

function pencil.alpha()
    return lerp(0.3, 0.8, pencil.sharpness)
end

function pencil.setColour(x, y)
    local noise = love.math.noise(x,y) - 0.5
    love.graphics.setColor(pencil.base_colour[1] + pencil.variance * noise, 
                           pencil.base_colour[2] + pencil.variance * noise, 
                           pencil.base_colour[3] + pencil.variance * noise,
                           pencil.alpha())
end

function pencil.draw_point(px, py)
    local r = pencil.radius()
    local randx = love.math.random(1000)
    local randy = love.math.random(1000)

    for x = -r, r do
        for y = -r, r do
            if x*x + y*y < r*r then
                pencil.setColour(x + randx, y + randy)
                love.graphics.points(px + x, py + y)
            end
        end
    end
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end


function pencil.load()
    -- pencil.image = love.graphics.newImage("assets/tools/pencil.png")
end

function pencil.paint()
    if love.mouse.isDown(1) then
        if love.mouse.getX() > 200 and love.mouse.getX() < 700 and love.mouse.getY() > 200 and love.mouse.getY() < 600 then
            love.graphics.setCanvas(paper.canvas)

                if previous ~= nil then
                    -- Interpolate between previous position and current position
                    -- pencil.draw_point(love.mouse.getX() - 200, love.mouse.getY() - 200)
                    local points = points_between(love.mouse.getX() - 200, love.mouse.getY() - 200, previous.x, previous.y)
                    for i, point in pairs(points) do
                        -- print("points:", dump(points))
                        -- print(point.x)
                        pencil.draw_point(point.x, point.y)
                    end
                else
                    -- Just draw a point here
                    pencil.draw_point(love.mouse.getX() - 200, love.mouse.getY() - 200)
                end
                
                previous = {x = love.mouse.getX() - 200, y = love.mouse.getY() - 200}

            love.graphics.setCanvas()

            -- make it a bit blunter
            pencil.sharpness = clamp(pencil.sharpness - 0.005, 0, 1)
        end
    else
        previous = nil
    end
end