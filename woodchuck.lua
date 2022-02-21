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
        
        local woodSplit = ultils.getEmptySpace()
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

--refuel on coal 80 steps
function CalcFuel(range)
    local curr = turtle.getFuelLevel()
    if curr < (range * 2 + 100) then
        local numberOfCoal = (range * 2 + 100)/80
        while curr < (range * 2 + 100) do
            local getItem = utils.isInInv("minecraft:coal", 1)
            if getItem == -1 then
                print("Not enough coal, get some more you poor ass bitch")
                return -1
            end
            turtle.select(getItem)
            turtle.refuel()
            curr = turtle.getFuelLevel()
            print(getItem)
        end
    end
end



function GetMeSomeWoody(max)
    local fuel = CalcFuel(max)
    if fuel == -1 then
        print("Fucking retard")
        return
    end

    for i = 1, max do
        if turtle.detect() then
            local y, data = turtle.inspect()
            if string.match(data.name, "grass") then
                turtle.dig()
                turtle.forward()
            end
            if string.match(data.name, "log") then
                turtle.dig()
                turtle.forward()
                while turtle.detectUp() do
                    turtle.digUp()
                    turtle.up()
                end
                while turtle.detectDown() ~= true do
                    turtle.down()
                end
            else
                turtle.up()
                turtle.digUp()
                turtle.forward()
            end
        else
            if turtle.detectDown() ~= true then
                turtle.down()
            else
                turtle.forward()
            end
        end
    end
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, 50 do
        turtle.digUp()
        turtle.up()
    end
    for i = 1, max do
        turtle.forward()
    end
    while turtle.detectDown() ~= true do
        turtle.down()
    end
end

print("How far?")
local choice = read()

if tonumber(choice) then
    GetMeSomeWoody(tonumber(choice))
else
    print("Not a number u donkey")
end 