os.loadAPI("/rom/apis/colors")

--[[ Variables ]]--
local offset = 0
local sel = 1
local printThanks = false

local bgColour, textColour, selectedBgColour, selectedTextColour

if term.isColour() then
 bgColour = colors.black
 textColour = colors.green
 selectedBgColour = colors.yellow
 selectedTextColour = colors.black
else
 bgColour = colors.white
 textColour = colors.black
 selectedBgColour = colors.black
 selectedTextColour = colors.white
end

local maxX, maxY = term.getSize()
local running
maxY = maxY - 6

--[[ Functions ]]--

clear = function()
 term.clear()
 term.setCursorPos(1,1)
end

local function centerWrite(txt)
 local x, y = term.getCursorPos()
 term.setCursorPos(math.floor(maxX/2-#tostring(txt)/2),y)
 write(txt)

end

local function redraw(tbl, sel, offset, logo)
 term.setBackgroundColour(bgColour)
 clear()

 term.setCursorPos(1, (maxY + 4))
 term.setTextColour(colors.red)
 write(logo)
 term.setTextColour(textColour)

 for i=1, maxY do
  if tbl[i] ~= nil then
   term.setCursorPos(1, i)
   if (i+offset) == sel then
    term.setBackgroundColour(selectedBgColour)
    term.clearLine()
    term.setTextColour(selectedTextColour)
    centerWrite("[ "..tbl[i + offset].text.." ]")
   else
    term.setBackgroundColour(bgColour)
    term.clearLine()
    term.setTextColour(textColour)
    centerWrite(tbl[i + offset].text)
   end
  end
 end

end

local function checkTable(tbl)
 for i,v in ipairs(tbl) do
  if v.handler == nil or type(v.handler) ~= "function" then
   if term.isColour() then
    term.setTextColour(colors.red)
   end
   print("Menu item \""..i.."\" has no valid handler!")
   local txt = textutils.serialize(tostring(v.handler))
   error("handler = "..txt, 0)
  elseif v.text == nil then
   if term.isColour() then
    term.setTextColour(colors.red)
   end
   print("Menu item \""..i.."\" has no text!")
   local txt = textutils.serialize(tostring(v.text))
   error("text = "..txt, 0)
  end
 end
end

runMenu = function(tbl, logo)
 if type(tbl) ~= "table" then
  error("Invalid arguments!\nUsage: menuApi.runMenu(menu_table)", 0)
 elseif #tbl < 2 then
  error("Not enough items in menu!\nAt least 2 items are required!", 0)
 end

 checkTable(tbl)

 running = true
 while running do
  term.setCursorBlink(false)
  os.queueEvent("")
  os.pullEvent()
  redraw(tbl, sel, offset, logo)
  local ev = {os.pullEvent()}
  if ev[1] == "key" then
   if ev[2] == keys.up then
    if sel > 1 then sel = sel - 1 end
    if offset > 0 then offset = offset - 1 end
   elseif ev[2] == keys.down then
    if sel < #tbl then sel = sel + 1 end
    if offset < math.max(#tbl - maxY, 0) then offset = offset + 1 end
   elseif ev[2] == keys.enter then
    term.setBackgroundColour(colors.black)
    term.setTextColour(colors.white)
    clear()
    tbl[sel].handler()
   end
  elseif ev[1] == "mouse_scroll" then
   if ev[2] == -1 then
    if sel > 1 then sel = sel - 1 end
    if offset > 0 then offset = offset - 1 end
   elseif ev[2] == 1 then
    if sel < #tbl then sel = sel + 1 end
    if offset < math.max(#tbl - maxY, 0) then offset = offset + 1 end
   end
  elseif ev[1] == "mouse_click" then
   if tbl[(ev[4] + offset)] ~= nil then
    sel = ev[4] + offset
    redraw(tbl, sel, offset)
    sleep(.1)
    term.setBackgroundColour(colors.black)
    term.setTextColour(colors.white)
    clear()
    tbl[(ev[4] + offset)].handler()
   end
  end
 end
end

stopMenu = function()
 running = false
 term.setBackgroundColour(colors.black)
 if printThanks == true then
  if term.isColour() == true then
   term.setTextColour(colors.yellow)
  end
  clear()
  centerWrite("Thank you for using HD's menu api.")
  print("")
 else
  clear()
 end
end

listMethods = function()
 local tmp = {}
 for i,v in pairs(menuApi) do
  table.insert(tmp, i.."()")
 end
 textutils.pagedTabulate(tmp)
 local tmp = nil
end

local function isColour(color)
 if term.isColour() then
  if type(color) == "string" then
   if colors[color] ~= nil then
    return {true, colors[color]}
   else
    return false
   end
  elseif type(color) == "number" then
   if color >= 1 and color <= colors.black then
    return {true, color}
   else
    return false
   end
  else
   return false
  end
 else
  return false
 end
end

setBackgroundColour = function(color)
 local tmp = isColour(color)
 if tmp[1] then
  bgColour = tmp[2]
 end
end

setBarColour = function(color)
 local tmp = isColour(color)
 if tmp[1] then
  selectedBgColour = tmp[2]
 end
end

setTextColour = function(color)
 local tmp = isColour(color)
 if tmp[1] then
  textColour = tmp[2]
 end
end

setBarTextColour = function(color)
 local tmp = isColour(color)
 if tmp[1] then
  selectedTextColour = tmp[2]
 end
end

setBarTextColor = setBarTextColour
setTextColor = setTextColour
setBarColor = setBarColour
setBackgroundColor = setBackgroundColour
