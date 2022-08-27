eraser = {
    name = "scuffed eraser",
    description = "your mum bought this at the supermarket for your older sibling five years ago. It's kinda hard and might smudge your work."
}



function eraser.paint()
    -- Go absolutely wild here
    -- This function is called every update

    love.graphics.setCanvas(paper.canvas)
        -- Do your drawing in here
    
    love.graphics.setCanvas()
end