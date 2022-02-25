os.loadAPI("libs/digUtils.lua")

function square()
    io.write("Height : ")
    local height = tonumber(read())
    io.write("Width : ")
    local width = tonumber(read())
    io.write("Depth : ")
    local depth = tonumber(read())

    digUtils.DigRectangle(width, depth, height)
end

square()