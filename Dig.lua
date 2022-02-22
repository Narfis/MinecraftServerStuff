DigRectangle(3, 3, 3)

function DigRectangle(width, depth, height)
    for i = 1, depth do

        if i % 2 == 0 then
            turtle.turnLeft()
            TryForward()
            turtle.turnLeft()
        else
            turtle.turnRight()
            TryForward()
            turtle.turnRight()
        end

        for j = 1, width do
            TryForward()

            for k = 1, height do
                if up then
                    turtle.digUp()
                    turtle.up()
                else
                    turtle.digDown()
                    turtle.down()
                end
            end
        end
    end
end

function TryForward() do
    local moved = false
    while moved == false do
        turtle.dig()
        moved = turtle.forward()
    end
end