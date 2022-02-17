function readAll(theLink, name)
    local r = http.get(theLink)
    local f = fs.open( shell.resolve(name), "w" )
    f.write( r.readAll() )
    f.close()
    r.close()
end

fs.makeDir("scripts")
fs.makeDir("scripts/miner")
fs.makeDir("scripts/woodchuck")


readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/utils.lua", "scripts/utilities.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/woodchuck.lua", "woodchuck.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/miner.lua", "miner.lua")