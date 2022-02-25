os.loadAPI("libs/utils.lua")

local directions = {
    FORWARD = 1,
    UP = 2,
    DOWN = 3,
    RIGHT = 4,
    LEFT = 5,
    BACK = 6
}

function DigRectangle(width, depth, height)
    TryForward()
    local up = false
    for i = 1, width do
        if i ~= 1 then
            if i % 2 == 0 then
                turtle.turnLeft()
                TryForward()
                turtle.turnLeft()
            else
                turtle.turnRight()
                TryForward()
                turtle.turnRight()
            end
        end

        for j = 1, depth do

            if up then
                up = false
            else
                up = true
            end

            for k = 1, height - 1 do
                if up then
                    turtle.digUp()
                    turtle.up()
                else
                    turtle.digDown()
                    turtle.down()
                end
            end
            if j ~= depth then
                TryForward()
            end
        end
    end
end

function CheckForNode(ore_list)
    local path = {}

    local dir = checkAndDig(ore_list)
    if dir ~= nil then
        for i, value in ipairs(dir) do
            table.insert(path, value)
        end
    end

    while utils.tableLength(path) > 0 do
        dir = digUtils.ClearNode(ore_list)
        
        if dir ~= nil then
            for i, value in ipairs(dir) do
                table.insert(path, value)
            end
        
        else
            Walk(GetOpposite(table.remove(path, utils.tableLength(path))))
        end
    end
end

function ClearNode(ore_list)
    local has_block, data = turtle.inspect()
    if utils.contains(ore_list, data.name) then
        TryForward()
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
        TryForward()
        return { directions.RIGHT, directions.FORWARD }
    end

    turtle.turnLeft()
    turtle.turnLeft()
    local has_block, data = turtle.inspect()
    if utils.contains(ore_list, data.name) then
        TryForward()
        return { directions.LEFT, directions.FORWARD }
    end
    turtle.turnRight()
    
    return nil
end

function Walk(direction)
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

function GetOpposite(direction)
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

function TryForward()
    local moved = false
    while moved == false do
        turtle.dig()
        moved = turtle.forward()
    end
end