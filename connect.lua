rednet.open("left")

computerID = nil

while computerID == nil do
    rednet.broadcast("connect")
    local id, data, c, d, e = rednet.receive(2)
    if a ~= nil then
        local lastA = tonumber(id)
        for i = 1, 10 do
            rednet.send(lastA, "arp")
            id, data, c, d, e = rednet.receive(2)
            if tonumber(a) == lastA then
                computerID = lastA
            end
        end
    end
    if computerID == nil then
        print("No connection")
    end
end

print("Connected to computer",computerID)