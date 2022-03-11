function main()

    local monitor = peripheral.find("monitor")
    local colony = peripheral.find("colonyIntegrator")

    if monitor == nil then error("Couldn't find a monitor") end
    if colony == nil then error("Couldn't find a Colony Integrator") end
    if not colony.isInColony() then error("Not in a colony") end

    local sizeX, sizeY = monitor.getSize()

    local box = CreateBox(20, 20, 10, 10)

    DrawBox(monitor, box)
end

function SetCursorByPercent(monitor, box, posX, posY)
    local monitorSizeX, monitorSizeY = monitor.getSize()
    local boxSizeX, boxSizeY = box:GetSize()
    monitor.setCursorPos((posX / 100) * sizeX, (posY / 100) * sizeY)
end

function DrawBox(monitor, box)
    local sizeX, sizeY = box:GetSize()
    local posX, posY = box:GetPosition()
    for i = 1, sizeX do
        monitor.setCursorPos(posX + i)
        monitor.write("■")
    end
end

function CreateBox(sizeX, sizeY, posX, posY)
    local object = {}

    object.sizeX = sizeX
    object.sizeY = sizeY
    object.posX = posX
    object.posY = posY

    function object:GetSize()
        return object.sizeX, object.sizeY
    end

    function object:GetPosition()
        return object.posX, object.posY
    end

    function object:SetPosition(x, y)
        object.posX = x
        object.posY = y
    end

    function object:SetSize(x, y)
        object.sizeX = x
        object.sizeY = y
    end

    return object
end