os.loadAPI("libs/digUtils.lua")
os.loadAPI("libs/utils.lua")


function CreateFarm()
    local getSize = tonumber(read())
    local height = 1
    local totalDirt = 0
    for i = 1, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == "minecraft:dirt" then
                totalDirt = totalDirt + turtle.getItemCount(i)
            end
        end
    end
    local getPickaxe = utils.isInInv("minecraft:diamond_pickaxe", 1)
    if totalDirt < ((getSize*2)^2) then
        turtle.equipRight()
        if  getPickaxe == -1 then
            print("Get a diamond diamond pickaxe before you start")
            sleep(2)
            print("bitch")
            return
            
        end
        print("Not enough dirt bitchass")
        return
    end
    turtle.select(getPickaxe)
    turtle.equipRight()
    turtle.select(1)
    digUtils.DigRectangle(getSize * 9, getSize * 9, height, false)
end


function main()
    os.write("Enter 1 to farm\nEnter 2 to create a farm")
    local choice = tonumber(read())
    if choice == 1 then
        return
    elseif choice == 2 then
        CreateFarm()
    end
end


main()