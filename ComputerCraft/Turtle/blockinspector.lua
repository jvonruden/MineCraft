
function main()
	local success, block = turtle.inspect() 	
	if success then
		print("Block name: ", block.name)
		print("Block metadata: ", block.metadata)
	end	
			
end		


main()