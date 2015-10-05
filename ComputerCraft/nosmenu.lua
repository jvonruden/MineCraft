
term.clear()
term.setCursorPos(1,1)
local ascii = [[
_   _  ___  ____             _
| \ | |/ _ \/ ___| _ __   ___| |_
|  \| | | | \___ \| '_ \ / _ \ __|
| |\  | |_| |___) | | | |  __/ |_
|_| \_|\___/|____/|_| |_|\___|\__|

]]

term.setTextColor( colors.red )
print(ascii)


monitor = peripheral.wrap("top")
monitor.setCursorPos(1, 1)
monitor.setTextColor( colors.yellow )
monitor.setTextScale(3)
monitor.write("NOS")
monitor.setTextColor( colors.green )
monitor.setCursorPos(5, 4)
monitor.setTextScale(1)
monitor.write("System Network")

term.setTextColor( colors.green )
print("")
print("I love the smell of NOS is the morning")
print("")
print("")
term.setTextColor( colors.yellow )

print("1. EnderTank Assignments")
print("2. NosFUEL Information")
print("")


while true do

  local event, key = os.pullEvent( "key" )

  if  keys.getName( key )  == "one" then
    os.run({}, "nosnet/ComputerCraft/NosNetApps/Info/etanks.lua")
    break
  end

  if  keys.getName( key )  == "two" then
    os.run({}, "nosnet/ComputerCraft/NosNetApps/Info/nosfuel.lua")
    break
  end

end
