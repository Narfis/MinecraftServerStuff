function readAll(theLink, name)
    local r = http.get(theLink)
    local f = fs.open( shell.resolve(name), "w" )
    f.write( r.readAll() )
    f.close()
    r.close()
end

fs.makeDir("scripts")
fs.makeDir("libs")

--libs
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/utils.lua", "libs/utils.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/digUtils.lua", "libs/digUtils.lua")

--scripts
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/woodchuck.lua", "scripts/woodchuck.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/mine.lua", "scripts/mine.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/digger.lua", "scripts/digger.lua")
readAll("https://raw.githubusercontent.com/Narfis/MinecraftServerStuff/master/treeFarmer.lua", "treeFarm")


fs.delete("motherPastexd")