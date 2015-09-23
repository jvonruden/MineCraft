function find_item_slot(item_name)
  for i=1,16 do
    local item = turtle.getItemDetail(i)
    if item and item.name == item_name then
		return i
    end
  end
  return nil
end

function place_item_down(item_slot)
  if (turtle.detectDown() == false) then
    turtle.select(item_slot)
    return turtle.placeDown()
  end
  return true    
end

function place_bridge_segment(cobble_stone_slot)
    place_item_down(cobble_stone_slot)     
end

function main(input_distance)

  -- Init
  local cobble_stone_slot = find_item_slot("minecraft:cobblestone")
  local fuel_level = turtle.getFuelLevel()
  
  if (input_distance == nil or input_distance == 0) then
    print("Missing Required Distance Input.")
    return
  end
  
  if cobble_stone_slot == nil and fuel_level < 200 then 
    print("Missing Required Materials: cobble stone or fuel")
    return  
  end

  --main out
  for curr_dist=1,input_distance do
    turtle.forward()  
    cobble_stone_slot = find_item_slot("minecraft:cobblestone")    
    place_bridge_segment(cobble_stone_slot)
  end 
    
  --main - turn around
  turtle.turnLeft()
  turtle.forward()
  cobble_stone_slot = find_item_slot("minecraft:cobblestone")
  place_bridge_segment(cobble_stone_slot)
  turtle.turnLeft()
    
  -- main back
  for curr_dist=1,input_distance do    
    turtle.forward()  
    cobble_stone_slot = find_item_slot("minecraft:cobblestone")    
    place_bridge_segment(cobble_stone_slot)  
  end
  place_bridge_segment(cobble_stone_slot)
end	


local args = { ... }
main(args[1])