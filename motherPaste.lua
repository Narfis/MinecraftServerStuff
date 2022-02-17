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


readAll("https://pastebin.com/raw/z34t40W7", "scripts/utils.lua")
readAll("https://pastebin.com/raw/DKgngctY", "woodchuck.lua")