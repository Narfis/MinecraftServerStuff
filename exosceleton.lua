os.loadAPI("libs/utils.lua")

function formation(n)
    local count = 0
    local a = isInInv(n, 1)
    while a < 16 and a > 0 do
        a = utils.isInInv(n, a+1)
        count = count + turtle.getItemCount(a)
    end
    print(count)
end


formation("computercraft:turtle_normal")