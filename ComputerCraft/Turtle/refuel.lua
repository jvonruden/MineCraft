function PrintFuelStatus(maxFuelLevel, currFuelLevel)
 	print("    Max Turtle Fuel Level: ", turtle.getFuelLimit())
	print("Current Turtle Fuel Level: ", turtle.getFuelLevel())
end

function RefuelUsingSlot(slotNumber)
	turtle.select(slotNumber)
	local currFuelLevel = turtle.getFuelLevel()
	local maxFuelLevel = turtle.getFuelLimit() 
	if (currFuelLevel < maxFuelLevel) then
		if (turtle.refuel(0)) then 		
			turtle.refuel(turtle.getItemCount(slotNumber))	
		else
			print("Skipped - No Fuel in Turtle Slot 1")
		end
	end
end

function main()
 	PrintFuelStatus()
	 
	local refuelSlot = 1
	turtle.select(refuelSlot)	 

	while turtle.refuel(0) do
		RefuelUsingSlot(refuelSlot)
		refuelSlot = refuelSlot + 1
		turtle.select(refuelSlot)
	end
	
 	PrintFuelStatus()	
			
end		

main()