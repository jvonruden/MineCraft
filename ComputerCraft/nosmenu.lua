
term.clear()

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


while true do

  local event, key = os.pullEvent( "key" ) -- limit os.pullEvent to the 'key' event  
  if key == keys.e then -- if the key pressed was 'e'

    break
  end
end
