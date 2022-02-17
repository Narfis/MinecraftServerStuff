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


<<<<<<< HEAD
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/utils.lua", "scripts/utilities.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/woodchuck.lua", "woodchuck.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/miner.lua", "miner.lua")
=======
readAll("https://pastebin.com/raw/z34t40W7", "scripts/utils.lua")
readAll("https://pastebin.com/raw/DKgngctY", "woodchuck.lua")
>>>>>>> ae187be7fd14fb11165c965ad43c1eefec8af4ae
