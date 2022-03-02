os.loadAPI("libs/utils.lua")
os.loadAPI("libs/digUtils.lua")

function square()
    io.write("Height : ")
    local height = tonumber(read())
    io.write("Width : ")
    local width = tonumber(read())
    io.write("Depth : ")
    local depth = tonumber(read())

    digUtils.DigRectangle(width, depth, height, false)
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
    local plant = false
    local chop = false
    local slot = 0

    for i = 1, width do
        local choppedTrees = 0
        for j = 1, depth do
            FindTree(woodTypes)
            local yes = ChopTree(woodTypes)
            print(yes)
            choppedTrees = choppedTrees + 1
            PlantSapling()
        end
    end
end

function FindTree(woodTypes)
    local found = false
    local type = nil
    while found == false do
        hasBlock, data = turtle.inspect()
        if utils.contains(woodTypes, data.name) then
            type = data.name
            found = true
        end
        
        if hasBlock then
            if string.match("sapling", data.name) == nil then
                digUtils.TryForward()
            end
        else
            digUtils.TryForward()
        end
    end
    return type
end

function ChopTree(woodTypes)
    local above = false
    local blocks = 0
    while above == false do
        local has_block, data = turtle.inspectUp()
        if utils.contains(woodTypes, data.name) then
            turtle.digUp()
            turtle.up()
            blocks = blocks + 1
        else
            above = true
        end
    end

    for i = 1, blocks do
        turtle.down()
    end
end

function PlantSapling(saplingType)
    local slot = utils.isInInv(saplingType, 1)
    if slot ~= -1 do
        turtle.select(slot)
        digUtils.TryForward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.place()
        turtle.turnLeft()
        turtle.turnLeft()
    end
end

FarmWood(woods)