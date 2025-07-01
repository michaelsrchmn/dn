function OnNpcDialog()
	if not IsGoingToMap() or not botManager.isEnabled then
		return
	end
	if IsTalkingToNpc("Sene") then
		local nextID = GetNextMapID()
		if IsDlgOption("Purchase Ticket to Mana Ridge") then
			if nextID == 5 then
				ChooseDlgOption(0)
			elseif nextID == 8 then
				ChooseDlgOption(1)
			elseif nextID == 11 then
				ChooseDlgOption(2)
			elseif nextID == 15 then
				ChooseDlgOption(3)
			end
		elseif IsDlgOption("Board Airship") then
			ChooseDlgOption(1)
		end
	elseif IsTalkingToNpc("Ticket Agent Iris") then
		local nextID = GetNextMapID()
		if IsDlgOption("Purchase Ticket to Prairie Town") then
			if nextID == 1 then
				ChooseDlgOption(0)
			elseif nextID == 8 then
				ChooseDlgOption(1)
			elseif nextID == 11 then
				ChooseDlgOption(2)
			elseif nextID == 15 then
				ChooseDlgOption(3)
			end
		elseif IsDlgOption("Board Airship") then
			ChooseDlgOption(1)
		end
	elseif IsTalkingToNpc("Lorraine") then
		local nextID = GetNextMapID()
		if IsDlgOption("Purchase Ticket to Prairie Town") then
			if nextID == 1 then
				ChooseDlgOption(0)
			elseif nextID == 5 then
				ChooseDlgOption(1)
			end
		elseif IsDlgOption("Board Airship") then
			ChooseDlgOption(1)
		end
	elseif IsTalkingToNpc("Ticket Agent Arnen") then
		local nextID = GetNextMapID()
		if IsDlgOption("Purchase Ticket to Saint Haven") then
			if nextID == 11 then
				ChooseDlgOption(0)
			elseif nextID == 15 then
				ChooseDlgOption(1)
			end
		elseif IsDlgOption("Board Airship") then
			ChooseDlgOption(0)
		end
	elseif IsTalkingToNpc("Ticket Agent Sorene") then
		local nextID = GetNextMapID()
		if IsDlgOption("Purchase Ticket to Prairie Town") then
			if nextID == 1 then
				ChooseDlgOption(0)
			elseif nextID == 5 then
				ChooseDlgOption(1)
			elseif nextID == 8 then
				ChooseDlgOption(2)
			elseif nextID == 15 then
				ChooseDlgOption(3)
			end
		elseif IsDlgOption("Board Airship") then
			ChooseDlgOption(1)
		elseif IsDlgOption("Buy A Boarding Ticket") then
			ChooseDlgOption(1)
		end
	elseif IsTalkingToNpc("Ticket Agent Karenne") then
		local nextID = GetNextMapID()
		if IsDlgOption("Purchase Ticket to Prairie Town") then
			if nextID == 1 then
				ChooseDlgOption(0)
			elseif nextID == 5 then
				ChooseDlgOption(1)
			elseif nextID == 8 then
				ChooseDlgOption(2)
			elseif nextID == 11 then
				ChooseDlgOption(3)
			end
		elseif IsDlgOption("Board Airship") then
			ChooseDlgOption(1)
		end
	end
end

function OnLoad()
	print("Map Travel Plugin Loaded - created by svinx")
end
