
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
monitor.write("NOSnet - All Your Dreams Come True")
monitor.setTextColor( colors.green )
monitor.write("Fuel Tank Status: Oil - Lava - Eth - Fuel - Exp")
monitor.setTextColor( colors.blue )
monitor.write("Trade Entries - 23")

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
