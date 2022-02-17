function contains(list, val)
    for i, value in ipairs(list) do
        if value == val then
            return true
        end
    end
    return false
end


function isInInv(s, start) 
    for i = start, 16 do
        if turtle.getItemCount(i) > 0 then
            if turtle.getItemDetail(i).name == s then
                return i
            end
        end
    end
    return -1
end