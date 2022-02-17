os.loadAPI("scripts/utils.lua")

local directions = {
    FORWARD = 1,
    UP = 2,
    DOWN = 3,
    RIGHT = 4,
    LEFT = 5,
    BACK = 6
}

function check(ore_list)
    local path = {}

    local dir = checkAndDig(ore_list)
    if dir ~= nil then
        for i, value in ipairs(dir) do
            table.insert(path, value)
        end
    end

    while utils.tableLength(path) > 0 do
        
        dir = checkAndDig(ore_list)
        
        if dir ~= nil then
            for i, value in ipairs(dir) do
                table.insert(path, value)
            end
        
        else
            walk(getOpposite(table.remove(path, utils.tableLength(path))))
        end
    end
end

function checkAndDig(ore_list)
    local has_block, data = turtle.inspect()
    if utils.contains(ore_list, data.name) then
        turtle.dig()
        turtle.forward()
        return { directions.FORWARD }
    end

    local has_block, data = turtle.inspectUp()
    if utils.contains(ore_list, data.name) then
        turtle.digUp()
        turtle.up()
        return { directions.UP }
    end

    local has_block, data = turtle.inspectDown()
    if utils.contains(ore_list, data.name) then
        turtle.digDown()
        turtle.down()
        return { directions.DOWN }
    end

    turtle.turnRight()
    local has_block, data = turtle.inspect()
    if utils.contains(ore_list, data.name) then
        turtle.dig()
        turtle.forward()
        return { directions.RIGHT, directions.FORWARD }
    end

    turtle.turnLeft()
    turtle.turnLeft()
    local has_block, data = turtle.inspect()
    if utils.contains(ore_list, data.name) then
        turtle.dig()
        turtle.forward()
        return { directions.LEFT, directions.FORWARD }
    end
    turtle.turnRight()
    
    return nil
end

function walk(direction)
    if (direction == directions.FORWARD) then
        turtle.forward()
    end

    if (direction == directions.UP) then
        turtle.up()
    end

    if (direction == directions.DOWN) then
        turtle.down()
    end

    if (direction == directions.RIGHT) then
        turtle.turnRight()
    end

    if (direction == directions.LEFT) then
        turtle.turnLeft()
    end

    if (direction == directions.BACK) then
        turtle.back()
    end
end

function getOpposite(direction)
    if (direction == directions.FORWARD) then
        return directions.BACK
    end

    if (direction == directions.UP) then
        return directions.DOWN
    end

    if (direction == directions.DOWN) then
        return directions.UP
    end

    if (direction == directions.RIGHT) then
        return directions.LEFT
    end

    if (direction == directions.LEFT) then
        return directions.RIGHT
    end

    if (direction == directions.BACK) then
        return directions.FORWARD
    end
end