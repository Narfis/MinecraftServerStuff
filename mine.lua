os.loadAPI("scripts/miner.lua")
os.loadAPI("libs/utils.lua")
full = false
ores = {
    "minecraft:gold_ore",
    "minecraft:iron_ore",
    "minecraft:coal_ore",
    "minecraft:lapis_ore",
    "minecraft:diamond_ore",
    "minecraft:redstone_ore",
    "minecraft:emerald_ore",
    "minecraft:nether_gold_ore",
    "minecraft:ancient_debris",
    "minecraft:copper_ore",
    "minecraft:deepslate_coal_ore",
    "minecraft:deepslate_copper_ore",
    "minecraft:deepslate_diamond_ore",
    "minecraft:deepslate_emerald_ore",
    "minecraft:deepslate_gold_ore",
    "minecraft:deepslate_iron_ore",
    "minecraft:deepslate_lapis_ore",
    "minecraft:deepslate_redstone_ore"
}
dropList  = {
    "minecraft:diamond",
    "minecraft:redstone",
    "minecraft:raw_iron",
    "minecraft:raw_gold",
    "minecraft:coal",
    "minecraft:lapis",
    "minecraft:emerald"
}


function DoMine()
    for i = 1,128 do
        local fullCount = 0
        if turtle.getItemCount(16) > 0 and fullCount < 3 then
            DropStuff()
            fullCount = fullCount + 1
        end
        if fullCount > 1 then
            full = true
        end
        turtle.dig()
        turtle.digUp()
        turtle.forward()
        miner.check(ores)
    end
    
    for i = 1, 128 do
        if turtle.detectDown() == false then
            slot = utils.isInInv("minecraft:cobblestone", 1)
            if slot ~= -1 then
                turtle.select(slot)
                turtle.placeDown()
            end
        end
    turtle.back()
    end
end

function DropStuff()
    for i = 1, 16 do
        if turtle.getItemCount(i) > 0 then
            local yes = turtle.getItemDetail(i)
            local inOres = false
            for j = 1, utils.tableLength(dropList) do
                if yes == dropList[j] then
                    inOres = true
                end
            end
            if inOres == false then
                turtle.select(i)
                turtle.drop()
                turtle.select(1)
            end
        end
    end
end

print("Give direction, 1 for right and -1 for left")
dir = tonumber(read())
while utils.CalcFuel(128) ~= -1 and full == false do
    DoMine()
    turtle.back()
    if dir == 1 then
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        dir = 0

    elseif dir == 0 then
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        dir = 1
    end
end

