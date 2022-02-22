function CreateFarm()
    --height 38
    local height = 5
    io.write("Width : ")
    local width = tonumber(read())
    io.write("Depth : ")
    local depth = tonumber(read())
    local turn = 1
    local up = 1
    for k = 1, width-1 do
        for i = 1, depth -1 do
            for j = 1, height do
                if up == 1 then
                    turtle.digUp()
                    turtle.up()
                elseif up == -1 then
                    turtle.digDown()
                    turtle.down()
                end
            end
            turtle.dig()
            turtle.forward()
        end
        if turn == 1 then
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
            turtle.turnRight()
        elseif turn == -1 then
            turtle.turnLeft()
            turtle.dig()
            turtle.forward()
            turtle.turnLeft()
        end
    end
end

function Farm()

end



io.write("1 to Farm trees, 2 to create a new farm : ")
local choice = tonumber(read())


if choice == 1 then
   Farm()
end
if choice == 2 then
    CreateFarm()
end