function readAll(theLink, name)
    local r = http.get(theLink)
    local f = fs.open( shell.resolve(name), "w" )
    f.write( r.readAll() )
    f.close()
    r.close()
end

fs.makeDir("scripts")
fs.makeDir("scripts/miner.lua")
fs.makeDir("scripts/woodchuck.lua")


readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/utils.lua", "scripts/utils.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/woodchuck.lua", "scripts/woodchuck.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/miner.lua", "scripts/miner.lua")
