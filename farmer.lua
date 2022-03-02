os.loadAPI("libs/digUtils.lua")
os.loadAPI("libs/utils.lua")


function CreateFarm()
    local getSize = tonumber(read())
    local height = 2
    local totalDirt = 0
    for i = 1, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == "minecraft:dirt" then
                totalDirt = totalDirt + turtle.getItemCount(i)
            end
        end
    end
    turtle.select(utils.getEmptySpace())
    turtle.equipRight()
    local getPickaxe = utils.isInInv("minecraft:diamond_pickaxe", 1)
    if totalDirt < ((getSize*2)^2) then
        if  getPickaxe == -1 then
            print("Get a diamond diamond pickaxe before you start")
            sleep(2)
            print("bitch")
            return
            
        end
        print("Not enough dirt bitchass")
        return
    end

    local yeet = CreateWaterSource()
    if yeet == -1 then
        return
    end
    turtle.select(getPickaxe)
    turtle.equipRight()
    turtle.select(1)
    digUtils.DigRectangle(getSize * 9, getSize * 9, height, true)
    turtle.up()
    turtle.turnRight()
    turtle.turnRight()
    turtle.placeDown()

    PlaceFarm(getSize * 9, getSize * 9)
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
        while turtle.getItemCount(sel) < 4 do
            sel = utils.isInInv("minecraft:dirt", sel + 1)
            if sel == -1 then
                print("No can do")
                return -1
            end
        end
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.down()
        turtle.placeDown()
        turtle.dig()
        turtle.forward()
        turtle.placeDown()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.placeDown()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.placeDown()
        turtle.turnRight()
        turtle.forward()
        turtle.turnLeft()
        turtle.up()
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight() 
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