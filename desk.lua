-- msg @tomstephen if any of this stops working!

curr_tooltip = {
    active = false,
    name = "",
    description = ""
}

desk = {}

drawer = {
    x = 450,
    y = 125,
    width = 300,
    height = 500,
    edge_thickness = 50,

    image_parts = {},
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
    for key, val in pairs(tools.tools) do
        local tempCollider = {ident = val, obj = desk.world:newRectangleCollider(love.math.random(460, 650), love.math.random(210, 350), love.math.random(20, 100), love.math.random(20, 100))}
        table.insert(drawer.colliders, tempCollider)
    end

    for key, val in pairs(drawer.colliders) do
        val.obj:setRestitution(0.99)
        val.obj:setLinearDamping(0.1)
        val.obj:setAngularDamping(0.5)
        val.obj:applyLinearImpulse(math.random(-300, 300), math.random(-100, 100))
    end

end

function drawTable()
    -- legs
    -- go here!
    
    -- table top
    love.graphics.setColor(0.4, 0.3, 0, 100)
    love.graphics.rectangle("fill", 100, 100, 700, 568)
end

--function drawDrawer()
--    love.graphics.setColor(1, 1, 0, 1)
--    love.graphics.circle("fill", drawer.x + drawer.width + drawer.edge_thickness * 2, drawer.y + drawer.height / 2, 50)
--end
function drawDrawer()
    love.graphics.setColor(1, 1, 0, 1)
    --love.graphics.circle("fill", drawer.x + drawer.width + drawer.edge_thickness * 2, drawer.y + drawer.height / 2, 50)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(drawer.image_parts.bg, drawer.x, drawer.y + 20, 0, 0.35, 0.55)
    love.graphics.draw(drawer.image_parts.top_board, drawer.x, drawer.y - 20, 0, 0.37, 0.65)
    love.graphics.draw(drawer.image_parts.head_board, drawer.x + drawer.width - 160, drawer.y - 45, 0, 0.4, 0.5)
    love.graphics.draw(drawer.image_parts.bottom_board, drawer.x - 10, drawer.y + drawer.height - drawer.edge_thickness - 10, 0, 0.37, 0.3)

    love.graphics.draw(drawer.image_parts.handle, drawer.x + drawer.width + drawer.edge_thickness * 2 - 20, drawer.y + drawer.height / 2 - 90, 0, 0.4, 0.4)
end

function drawTooltip()
    -- get mouse location
    mx = love.mouse.getX() + 20
    my = love.mouse.getY()
    -- draw tooltip bg
    love.graphics.setColor(0, 1, 0.5, 1)
    love.graphics.rectangle("fill", mx, my, 80, 50)
    -- draw tooltip text
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print(curr_tooltip.name, mx + 5, my + 5)
    love.graphics.print(curr_tooltip.description, mx + 5, my + 20)
end

function desk.load()
    wf = require "libraries/windfield"
    desk.world = wf.newWorld(0, 0, true)
    -- desk.world:setQueryDebugDrawing(false)

    createDrawPhysics()

    stillHeld = false
    broken = false

    drawer.image_parts.bg = love.graphics.newImage("assets/table/drawer_bg.png")
    drawer.image_parts.handle = love.graphics.newImage("assets/table/drawer_handle.png")
    drawer.image_parts.bottom_board = love.graphics.newImage("assets/table/drawer_bottom_board.png")
    drawer.image_parts.head_board = love.graphics.newImage("assets/table/drawer_headboard.png")
    drawer.image_parts.top_board= love.graphics.newImage("assets/table/drawer_top_board.png")
end

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
            drawer.x = clamp(drawer.x, 450, 800)

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

    -- see if mouse is hovering over a tool
    -- if not love.mouse.isDown(1) then
    for key, val in pairs(drawer.colliders) do
        local cx = val.obj:getX()
        local cy = val.obj:getY()
        local mx = love.mouse.getX()
        local my = love.mouse.getY()

        local dist = math.sqrt((cx - mx)^2 + (cy - my)^2)
        if dist < 30 then
            curr_tooltip.active = true
            curr_tooltip.name = val.ident.name
            curr_tooltip.description = val.ident.description

            if love.mouse.isDown(1) then
                selected_tool = val.ident
            end

            goto tooltip_found
        end
    end
    curr_tooltip.active = false
    -- end
    ::tooltip_found::
end

function desk.draw()
    drawDrawer()
    drawTable()
    desk.world:draw() -- probably remove this later, just debug info
    if curr_tooltip.active then
        drawTooltip()
    end
end
