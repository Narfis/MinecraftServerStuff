function contains(table, val)
    for i, value in ipairs(table) do
        if value == val then
            return true
        end
    end
    return false
end

function tableLength(table, val)
    local count = 0
    for i in ipairs(table) do
        count = count + 1
    end
    return count
end


function isInInv(itemId, start) 
    if start > 16 then
        return -1
    end
    for i = start, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == itemId then
                return i
            end
        end
    end
    return -1
end

function getEmptySpace()
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            return i
        end
    end 
    return -1
end