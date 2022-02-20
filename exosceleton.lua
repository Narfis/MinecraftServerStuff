os.loadAPI("libs/utils.lua")

function formation(n)
    local count = 0
    local a = utils.isInInv(n, 1)
    while a <= 16 and a > 0 do
        count = count + turtle.getItemCount(a)
        a = utils.isInInv(n, a+1)
    end
    print(count)
end


formation("computercraft:turtle_normal")