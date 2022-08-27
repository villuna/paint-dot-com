blobhaj = {
    blobhajs = {
        "assets/blobhaj/BigBlobhajHug.png",
        "assets/blobhaj/BlobHajMlem.png",
        "assets/blobhaj/BlobhajBlanketBlue.png",
        "assets/blobhaj/BlobhajBlanketSlate.png",
        "assets/blobhaj/BlobhajHeart.png",
        "assets/blobhaj/BlobhajHoldAsp.png",
        "assets/blobhaj/BlobhajHoldSassage.png",
        "assets/blobhaj/BlobhajHugFullBody.png",
        "assets/blobhaj/BlobhajPrideHeart.png",
        "assets/blobhaj/BlobhajReach.png",
        "assets/blobhaj/BlobhajSadReach.png",
        "assets/blobhaj/BlobhajShock.png",
        "assets/blobhaj/BlobhajTinyHeart.png",
        "assets/blobhaj/BlobhajTransPrideHeart.png",
        "assets/blobhaj/BlobhajfBlobbyHug.png",
        "assets/blobhaj/OctopusRead.png"
    }  ,
    name = "blobhaj stamp",
    description = "uqcs mascot",
    wasDown = false,
    scale = 1/16
}

function blobhaj.paint()
    if love.mouse.isDown(1) and not blobhaj.wasDown then
        blobhaj.wasDown = true
        local filepath = blobhaj.blobhajs[math.random(#blobhaj.blobhajs)]
        if love.mouse.getX() > 200 and love.mouse.getX() < 700 and love.mouse.getY() > 200 and love.mouse.getY() < 600 then
            local stamp_image = love.graphics.newImage(filepath)
                love.graphics.setCanvas(paper.canvas)
                    local imageData = love.image.newImageData(filepath)
                    local width, height = imageData:getDimensions()
                    width = width * blobhaj.scale
                    height = height * blobhaj.scale
                    love.graphics.draw(stamp_image, love.mouse.getX() - 200 - width / 2, love.mouse.getY() - 200 - height / 2, math.random(-3.14/8, 3.14/8), blobhaj.scale, blobhaj.scale)
                love.graphics.setCanvas()
        end
    else
        if not love.mouse.isDown(1) then
            blobhaj.wasDown = false
        end
    end
end