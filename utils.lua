function contains(table, val)
    for i, value in ipairs(table) do
        if value == val then
            return true
        end
    end
    return false
end

function tableLength(table, val)
    local count = 0
    for i in ipairs(table) do
        count = count + 1
    end
    return count
end


function isInInv(itemId, start) 
    if start > 16 then
        return -1
    end
    for i = start, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == itemId then
                return i
            end
        end
    end
    return -1
end

function getEmptySpace()
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            return i
        end
    end 
    return -1
end

function RemoveGravel()
    local b, data = turtle.inspect()
    while data.name == "minecraft:gravel" or data.name == "minecraft:sand" do
        turtle.dig()
        sleep(1)
        b, data = turtle.inspect()
    end
end

function CalcFuel(range)
    local curr = turtle.getFuelLevel()
    if curr < (range * 2 + 200) then
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