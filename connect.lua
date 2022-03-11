rednet.open("left")

computerID = nil

while computerID == nil do
    rednet.broadcast("connect")
    local id, data, c, d, e = rednet.receive(2)
    if id ~= nil then
        local lastId = tonumber(id)
        for i = 1, 10 do
            rednet.send(lastId, "arp")
            id, data, c, d, e = rednet.receive(2)
            if tonumber(id) == lastId then
                computerID = lastId
                break
            end
        end
    end
    if computerID == nil then
        print("No connection")
    end
end

print("Connected to computer",computerID)