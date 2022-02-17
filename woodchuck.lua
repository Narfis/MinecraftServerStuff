os.loadAPI("libs/utils.lua")


function burnWood()
    turtle.select(1)
    local furnace = utils.isInInv("minecraft:furnace", 1)
    local wood = utils.isInInv("minecraft:oak_log", 1)
    if furnace == -1 then
        return
    end
    while wood < 16 and wood > 0 do
        while turtle.getItemCount(wood) < 2 do
            wood = utils.isInInv("minecraft:oak_log", wood+1)
            if wood == -1 then
                return
            end
        end
        
        turtle.dig()
        turtle.digDown()
        turtle.select(furnace)
        turtle.place()
        
        local woodSplit = getEmptySpace()
        if woodSplit ~= -1 then
            turtle.select(wood)
            turtle.dropDown(turtle.getItemCount()/2)
            turtle.select(woodSplit)
            turtle.suckDown()
            turtle.drop()
            turtle.up()
            turtle.forward()
            turtle.select(wood)
            turtle.dropDown()
            turtle.back()
            turtle.down()
        end
    end
end


function getEmptySpace()
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            return i
        end
    end 
    return -1
end

burnWood()