
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
monitor.setTextColor( colors.red )
monitor.write("_   _  ___  ____             _")
monitor.setCursorPos(1, 2)
monitor.setTextColor( colors.green )
monitor.write("| \ | |/ _ \/ ___| _ __   ___| |_")
monitor.setCursorPos(1, 3)
monitor.setTextColor( colors.blue )
monitor.write("|  \| | | | \___ \| '_ \ / _ \ __|")
monitor.setCursorPos(1, 4)
monitor.setTextColor( colors.yellow )
monitor.write("| |\  | |_| |___) | | | |  __/ |_")
monitor.setCursorPos(1, 5)
monitor.setTextColor( colors.red )
monitor.write("|_| \_|\___/|____/|_| |_|\___|\__|")

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
