bg = {}

bg.filepaths = {"assets/floor/floor1.png", "assets/floor/floor2.png", "assets/floor/floor3.png"}

function bg.load()
    math.randomseed(os.time())
    local filepath = bg.filepaths[math.random(#bg.filepaths)]
    bg.image = love.graphics.newImage(filepath)

    bg.sx = love.graphics.getWidth() / bg.image:getWidth()
    bg.sy = love.graphics.getHeight() / bg.image:getHeight()
end

function bg.draw()
    love.graphics.draw(bg.image, 0, 0, 0, bg.sx, bg.sy)
end