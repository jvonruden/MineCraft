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
  if (turtle.detect() == false) then
    turtle.select(item_slot)
    return turtle.place()
  end
  return false    
end

function place_item_down(item_slot)
  if (turtle.detectDown() == false) then
    turtle.select(item_slot)
    return turtle.placeDown()
  end
  return true    
end

function place_item_up(item_slot)
  if (turtle.detectUp() == false) then
    turtle.select(item_slot)
    return turtle.placeUp()
  end
  return true    
end