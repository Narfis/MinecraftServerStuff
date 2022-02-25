function DigRectangle(width, depth, height)
    local up = false
    for i = 1, depth do

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

        for j = 1, width do
            TryForward()

            if j % 2 == 0 then
                up = false
            else
                up = true
            end

            for k = 1, height do
                if up then
                    turtle.digUp()
                    turtle.up()
                else
                    turtle.digDown()
                    turtle.down()
                end
            end
            TryForward()
        end
    end
end

function TryForward()
    local moved = false
    while moved == false do
        turtle.dig()
        moved = turtle.forward()
    end
end

DigRectangle(3, 3, 3)