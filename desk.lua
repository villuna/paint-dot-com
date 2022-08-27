desk = {}

function createDrawPhysics()
    drawer = {}
    drawer.left_edge = desk.world:newRectangleCollider(800, 200, 10, 250)
    drawer.right_edge = desk.world:newRectangleCollider(1210, 200, 10, 250)
    drawer.top_edge = desk.world:newRectangleCollider(810, 200, 400, 10)
    drawer.bottom_edge = desk.world:newRectangleCollider(810, 440, 400, 10)

    drawer.left_edge:setType("static")
    drawer.right_edge:setType("static")
    drawer.top_edge:setType("static")
    drawer.bottom_edge:setType("static")

    drawer.colliders = {}
    for i = 1, 15 do
        table.insert(drawer.colliders, desk.world:newRectangleCollider(love.math.random(810, 1150), love.math.random(210, 350), 30, 50))
    end

    for key, val in pairs(drawer.colliders) do
        val:setRestitution(0.99)
        val:setLinearDamping(0.1)
        val:setAngularDamping(0.5)
        val:applyLinearImpulse(math.random(-300, 300), math.random(-100, 100))
    end

end

function drawTable()
    -- legs
    -- go here!
    
    -- table top
    love.graphics.setColor(0.4, 0.3, 0, 100)
    love.graphics.rectangle("fill", 100, 100, 700, 568)
end

function drawDrawer()
end

function desk.load()
    wf = require "libraries/windfield"
    desk.world = wf.newWorld(0, 0, true)
    desk.world:setQueryDebugDrawing(true)

    createDrawPhysics()
end

function desk.update(dt)
    speed = 200 * dt
    if love.keyboard.isDown("d") then
        -- move drawer right
        drawer.left_edge:setPosition(drawer.left_edge:getX() + speed, drawer.left_edge:getY())
        drawer.right_edge:setPosition(drawer.right_edge:getX() + speed, drawer.right_edge:getY())
        drawer.top_edge:setPosition(drawer.top_edge:getX() + speed, drawer.top_edge:getY())
        drawer.bottom_edge:setPosition(drawer.bottom_edge:getX() + speed, drawer.bottom_edge:getY())
    end
    if love.keyboard.isDown("a") then
        -- move drawer left
        drawer.left_edge:setPosition(drawer.left_edge:getX() - speed, drawer.left_edge:getY())
        drawer.right_edge:setPosition(drawer.right_edge:getX() - speed, drawer.right_edge:getY())
        drawer.top_edge:setPosition(drawer.top_edge:getX() - speed, drawer.top_edge:getY())
        drawer.bottom_edge:setPosition(drawer.bottom_edge:getX() - speed, drawer.bottom_edge:getY())
    end

    desk.world:update(dt)
end



function desk.draw()
    drawTable()
    drawDrawer()
    desk.world:draw() -- probably remove this later, just debug info
end