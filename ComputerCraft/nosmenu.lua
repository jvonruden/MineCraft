
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

term.setTextColor( colors.green )
print("")
print("I love the smell of NOS is the morning")
print("")
print("")
term.setTextColor( colors.yellow )
print("Hit any key to continue")
print("")


local event, key = os.pullEvent( "key" )


term.clear()
term.setCursorPos(1,1)
term.setTextColor( colors.red )
print("*** General Info ****")
print("1. EnderTank Assignments")
print("2. NosFUEL Information")
print("")


while true do

  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event

  if  keys.getName( key )  == "one" then
    os.run({}, "nosnet/ComputerCraft/NosNetApps/Info/etanks.lua")
    break
  end
end
