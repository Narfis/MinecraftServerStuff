os.loadAPI("libs/digUtils.lua")


function CreateFarm()
    local getSize = tonumber(read())
    local height = 1
    digUtils.DigRectangle(getSize * 9, getSize * 9, height, false)
end


function main()
    os.write("Enter 1 to farm\nEnter 2 to create a farm")
    local choice = tonumber(read())
    if choice == 1 then
        return
    elseif choice == 2 then
        CreateFarm()
    end
end


main()