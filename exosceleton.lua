function formation()
    local count = 0
    local a = isInInv("computercraft:turtle_expanded", 1)
    while a < 16 and a > 0 do
        a = utils.isInInv("computercraft:turtle_expanded", a+1)
        count = count + 1
        if a == -1 then
            break
        end
    end
    print(count)

    if count > 4 then
        print("Suuuh")
    end

end