os.loadAPI("scripts/miner.lua")
os.loadAPI("libs/utils.lua")

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

for i = 1,64 do
    turtle.dig()
    turtle.digUp()
    turtle.forward()
    miner.check(ores)
end

for i = 1, 64 do
    if ~turtle.detectDown() then
        slot = utils.isInInv("minecraft:cobblestone", 1)
        if slot ~= 1 then
            turtle.select(slot)
            turtle.placeDown()
        end
    end
end