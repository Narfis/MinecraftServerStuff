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
    "minecraft:oak_log",
    "minecraft:birch_log",
    "minecraft:spruce_log"
}

local saplings = {
    "minecraft:oak_sapling",
    "minecraft:birch_sapling",
    "minecraft:spruce_sapling"
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
            local type = FindTree(woodTypes)
            ChopTree(woodTypes)
            type = GetType(type)
            choppedTrees = choppedTrees + 1
            if (j < depth) then
                PlantSapling(type)
            end
        end
        
        if i < width then
            if left then
                left = false
                turtle.turnLeft()
                
                local type = FindTree(woodTypes)
                ChopTree(woodTypes)
                type = GetType(type)

                turtle.turnLeft()

                PlantSapling(type)

            else
                left = true
                turtle.turnRight()
                
                local type = FindTree(woodTypes)
                ChopTree(woodTypes)
                type = GetType(type)

                turtle.turnRight()

                PlantSapling(type)
            end
        end
        if i == 1 then
            depth = depth - 1
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
    if slot ~= -1 then
        turtle.select(slot)
        digUtils.TryForward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.place()
        turtle.turnLeft()
        turtle.turnLeft()
    end
end

function GetType(woodType)
    for i = 1, utils.tableLength(woods) do
        if woods[i] == woodType then
            return saplings[i]
        end
    end
end

FarmWood(woods)