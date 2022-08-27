-- msg @tomstephen if any of this stops working!

desk = {}

drawer = {
    x = 800,
    y = 125,
    width = 300,
    height = 500,
    edge_thickness = 50
}
-- note that the x,y of the drawer is the position of the top left outer corner

function createDrawPhysics()
    drawer.edges = {}
    -- oh god oh f who wrote this?
    drawer.edges.left_edge = desk.world:newRectangleCollider(drawer.x, drawer.y, drawer.edge_thickness, drawer.height)
    drawer.edges.right_edge = desk.world:newRectangleCollider(drawer.x + drawer.width + drawer.edge_thickness, drawer.y, drawer.edge_thickness, drawer.height)
    drawer.edges.top_edge = desk.world:newRectangleCollider(drawer.x + drawer.edge_thickness, drawer.y, drawer.width, drawer.edge_thickness)
    drawer.edges.bottom_edge = desk.world:newRectangleCollider(drawer.x + drawer.edge_thickness, drawer.y + drawer.height - drawer.edge_thickness, drawer.width, drawer.edge_thickness)

    for key, val in pairs(drawer.edges) do
        val:setType("static")
    end

    drawer.colliders = {}
    for i = 1, 15 do
        table.insert(drawer.colliders, desk.world:newRectangleCollider(love.math.random(810, 1000), love.math.random(210, 350), love.math.random(20, 100), love.math.random(20, 100)))
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
    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.circle("fill", drawer.x + drawer.width + drawer.edge_thickness * 2, drawer.y + drawer.height / 2, 50)
end

function desk.load()
    wf = require "libraries/windfield"
    desk.world = wf.newWorld(0, 0, true)
    desk.world:setQueryDebugDrawing(true)

    createDrawPhysics()
end

stillHeld = false
broken = false

function desk.update(dt)
    speed = 200 * dt
    if love.keyboard.isDown("d") then
        -- move drawer right
        drawer.x = drawer.x + speed
    end
    if love.keyboard.isDown("a") then
        -- move drawer left
        drawer.x = drawer.x - speed
    end

    if love.mouse.isDown(1) then
        local dist_to_handle = math.sqrt((love.mouse.getX() - (drawer.x + drawer.width + drawer.edge_thickness * 2))^2 + (love.mouse.getY() - (drawer.y + drawer.height / 2))^2)
        if dist_to_handle < 50 or stillHeld then
            stillHeld = true
            local targetx = love.mouse.getX() - drawer.width - drawer.edge_thickness * 2

            drawer.x = drawer.x + (targetx - drawer.x) * 20 * dt

            if (targetx - drawer.x) * 20 * dt > 40 then
                for key, val in pairs(drawer.edges) do
                    broken = true
                    val:setType("dynamic")
                    val:applyLinearImpulse(math.random(-30000, 30000), math.random(-30000, 30000))
                    val:applyAngularImpulse(math.random(-30000, 30000), math.random(-30000, 30000))
                end
            end
        end
    else
        stillHeld = false
    end


    if not broken then
        -- interestingly ":newRectangleCollider" uses (x,y) top left rectangles, whereas
        -- ":setPosition" uses (x,y) center rectangles, hence the added terms to shift it
        drawer.edges.left_edge:setPosition(drawer.x + drawer.edge_thickness / 2, drawer.y + drawer.height / 2)
        drawer.edges.right_edge:setPosition(drawer.x + drawer.width + drawer.edge_thickness * 3 / 2, drawer.y + drawer.height / 2)
        drawer.edges.top_edge:setPosition(drawer.x + drawer.edge_thickness + drawer.width / 2, drawer.y + drawer.edge_thickness / 2)
        drawer.edges.bottom_edge:setPosition(drawer.x + drawer.edge_thickness + drawer.width / 2, drawer.y + drawer.height - drawer.edge_thickness / 2)
    end

    desk.world:update(dt)
end

function desk.draw()
    drawTable()
    drawDrawer()
    desk.world:draw() -- probably remove this later, just debug info
end