
function find_item_slot(item_name)
  for i=1,16 do
    local item = turtle.getItemDetail(i)
    if item and item.name == item_name then
		return i
    end
  end
  return nil
end

function place_item_front(item_slot)
  turtle.select(item_slot)
  return turtle.place()
end

function place_cobblestone(cobble_stone_slot)
    turtle.forward() 
    return place_item_front(cobble_stone_slot) 
end

function place_ladder(ladder_slot)
      turtle.back()      
      place_item_front(ladder_slot)
end


function place_current_level(cobble_stone_slot, ladder_slot)
    local cobble_stone_placed = place_cobblestone(cobble_stone_slot)       
    if (cobble_stone_placed) then
      place_ladder(ladder_slot)  
    end 
end



function main(tower_height)

  -- Init
  local cobble_stone_slot = find_item_slot("minecraft:cobblestone")
  local ladder_slot = find_item_slot("minecraft:ladder")
  local fuel_level = turtle.getFuelLevel()
  local up_count = 1
  
  --Init 
  if ladder_slot == nil or cobble_stone_slot == nil and fuel_level < 200 then 
    print("Missing Required Materials: cobble stone or ladders or fuel")
    return  
  end

  --build tower
  for current_height=1,tower_height do
    place_current_level(cobble_stone_slot, ladder_slot)   
    turtle.up()
    up_count = up_count + 1  
    cobble_stone_slot = find_item_slot("minecraft:cobblestone")
    ladder_slot = find_item_slot("minecraft:ladder")         
  end

  --Build Tower Top
  turtle.forward()
  place_cobblestone(cobble_stone_slot)
  
  --Return to Bottom
  turtle.back()
  turtle.back()  
  for down=1,up_count do
    turtle.down()    
  end
    
    
end
  
  
local args = { ... }
main(args[1])