os.loadAPI("libs/digUtils.lua")
os.loadAPI("libs/utils.lua")


function CreateFarm()
    print("Size: ")
    local getSize = tonumber(read())
    if getSize % 2 == 0 then
        print("No, only odd numbers please")
        return
    end
    local height = 2
    local totalDirt = 0
    for i = 1, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == "minecraft:dirt" then
                totalDirt = totalDirt + turtle.getItemCount(i)
            end
        end
    end
    totalDirt = totalDirt + (10 * getSize)
    turtle.select(utils.getEmptySpace())
    turtle.equipRight()
    local getPickaxe = utils.isInInv("minecraft:diamond_pickaxe", 1)
    local getHoe = utils.isInInv("minecraft:diamond_hoe", 1)
    if  getPickaxe == -1 or getHoe == -1 then
        print("Get a diamond diamond pickaxe and a diamond hoe before you start")
        sleep(2)
        print("bitch")
        return
        
    end
    turtle.select(getPickaxe)
    turtle.equipRight()
    if totalDirt < ((getSize*2)^2) then
        print("Not enough dirt bitchass")
        return
    end

    local yeet = CreateWaterSource()
    if yeet == -1 then
        return
    end
    turtle.select(1)
    digUtils.DigRectangle(getSize * 9, getSize * 9, height, true)
    turtle.up()
    turtle.turnRight()
    turtle.turnRight()
    turtle.placeDown()

    PlaceFarm(getSize * 9, getSize * 9)
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
    local bucketErr = FillBuckets(getSize^2)
    if bucketErr == -1 then
        print("Get more buckets")
        return
    end
    CreateWaterHoles(getSize * 9)
end

function CreateWaterHoles(size)
    turtle.forward()
    turtle.turnLeft()
    for i = 1, 5 do
        turtle.forward()
    end
    turtle.turnRight()
    for i = 1, size do
        if i % 5 == 0 then
            turtle.digDown()
            turtle.down()
            turtle.select(utils.isInInv("minecraft:dirt", 1))
            turtle.placeDown()
            turtle.up()
            turtle.select(utils.isInInv("minecraft:water_bucket", 1))
            turtle.placeDown()
        end
        turtle.forward()
    end
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, size do
        turtle.forward()
    end

end


function FillBuckets(numberOfBuckets)
    local filledBuckets = 0
    while filledBuckets < numberOfBuckets do
        local bucket = utils.isInInv("minecraft:bucket", 1)
        if bucket == -1 then
            return -1
        end
        turtle.select(bucket)
        turtle.placeDown()
    end
end

function CreateWaterSource()
    local waters = 0
    for i = 1, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == "minecraft:water_bucket" then
                waters = waters + turtle.getItemCount(i)
            end
        end
    end
    if waters > 1 then
        local sel = utils.isInInv("minecraft:dirt", 1)
        while turtle.getItemCount(sel) < 12 do
            sel = utils.isInInv("minecraft:dirt", sel + 1)
            if sel == -1 then
                print("No can do")
                return -1
            end
        end
        turtle.select(sel)
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.down()
        turtle.placeDown()
        turtle.turnLeft()
        turtle.place()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.placeDown()
        turtle.turnLeft()
        turtle.place()
        turtle.turnRight()
        turtle.place()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.placeDown()
        turtle.turnLeft()
        turtle.place()
        turtle.turnRight()
        turtle.place()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.placeDown()
        turtle.turnLeft()
        turtle.place()
        turtle.turnRight()
        turtle.turnRight()
        turtle.forward()
        turtle.up()
        turtle.turnRight()
        turtle.dig()
        local bucket = utils.isInInv("minecraft:water_bucket", 1)
        turtle.select(bucket)
        turtle.placeDown()
        turtle.forward()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
        bucket = utils.isInInv("minecraft:water_bucket",1)
        turtle.select(bucket)
        turtle.placeDown()
        turtle.dig()
        turtle.forward()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
        turtle.forward()
        return
    end
    return -1
end

function PlaceFarm(width, height)
    turtle.select(utils.isInInv("minecraft:dirt", 1))
    for i = 1, width do
        for j = 1, height-1 do
            if turtle.getItemCount() <= 0 then
                turtle.select(utils.isInInv("minecraft:dirt", 1))
            end
            turtle.forward()
            turtle.placeDown()

        end
        if i == width then
            turtle.forward()
            turtle.turnRight()
            turtle.turnRight()
        else
            if i % 2 == 0 then
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
                turtle.placeDown()
            else
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                turtle.placeDown()
            end
        end
    end
end


function main()
    print("Enter 1 to farm\nEnter 2 to create a farm")
    local choice = tonumber(read())
    if choice == 1 then
        return
    elseif choice == 2 then
        CreateFarm()
    end
end


main()