os.loadAPI("libs/utils.lua")
os.loadAPI("libs/digUtils.lua")

function square()
    io.write("Height : ")
    local height = tonumber(read())
    io.write("Width : ")
    local width = tonumber(read())
    io.write("Depth : ")
    local depth = tonumber(read())

    digUtils.DigRectangle(width, depth, height)
end

local woods = {
    "minecraft:oak_log"
}

function FarmWood(woodTypes)

    io.write("Width : ")
    local width = tonumber(read())
    io.write("Depth : ")
    local depth = tonumber(read())

    local left = false

    for i = 1, width do
        for j = 1, depth do
            local has_block, data = turtle.inspect()
            if utils.contains(woodTypes, data.name) then
                ChopTree(woodTypes)
            end
            digUtils.TryForward()
        end

        if left then
            left = false
            turtle.turnLeft()
            digUtils.TryForward()
            digUtils.TryForward()
            turtle.turnLeft()
        else
            left = true
            turtle.turnRight()
            digUtils.TryForward()
            digUtils.TryForward()
            turtle.turnRight()
        end

    end
end

function ChopTree(woodTypes)
    local above = false
    local blocks = 0
    while above == false do
        local has_block, data = turtle.inspectUp()
        if utils.contains(woodTypes, data.name) then
            turtle.digUp()
            turtle.up()
            above = above + 1
        else
            above = false
        end
    end

    for i = 1, blocks do
        turtle.down()
    end
end