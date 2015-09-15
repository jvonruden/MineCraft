
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


function place_current_level()


end



function main(tower_height)

  local cobble_stone_slot = find_item_slot("minecraft:cobblestone")
  local ladder_slot = find_item_slot("minecraft:ladder")
  local fuel_level = turtle.getFuelLevel()
  
  
  if ladder_slot == nil or cobble_stone_slot == nil and fuel_level < 250 then 
    print("Missing Required Materials: cobble stone or ladders or fuel")
    return  
  end
  
  --Todo: check for all required Materials based on tower current_height - NO

  
  
	local cobble_stone_placed = false
  
   
  if ladder_slot ~= nil and cobble_stone_slot ~= nil then
    print("Missing Required Materials: cobble stone and ladders")
  end
  
    for current_height=1,tower_height do
      
    end
    
  end
  
   		

    cobble_stone_placed = place_cobblestone(cobble_stone_slot)       
    
    if (cobble_stone_placed) then
      place_ladder(ladder_slot)  
    end   
  end
  
  turtle.up()
  
  turtle.down()
       
end		


main()