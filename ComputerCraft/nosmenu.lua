os.loadAPI("nosnet/ComputerCraft/NosNetApps/Libs/menu.lua")
menu = _G["menu.lua"]

term.clear()
term.setCursorPos(1,1)
local ascii = [[_   _  ___  ____             _
| \ | |/ _ \/ ___| _ __   ___| |_
|  \| | | | \___ \| '_ \ / _ \ __|
| |\  | |_| |___) | | | |  __/ |_
|_| \_|\___/|____/|_| |_|\___|\__|
]]

local m = {
[1] = { text = "About", handler = function() shell.run("nosnet/ComputerCraft/NosNetApps/") end},
[2] = { text = "NOS Fuel", handler = function() shell.run("NosNetApps/Info/nosfuel.lua") sleep(1) end},
[3] = { text = "Trading Post", handler = function() shell.run("adventure") end},
[4] = { text = "News", handler = function() shell.run("lua") end},
}

menu.runMenu(m,ascii)
