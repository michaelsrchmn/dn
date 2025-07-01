-- Prairie Town

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('PrairieTown')
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
		bW:WalkTo(708, -1612, 1679) 
		bW:Wait(5000)
		bW:InitNPC("Merchant Doris")
	elseif profileManager.bAutoSell then
		bW:WalkTo(708, -1612, 1679) 
		bW:Wait(5000)
		bW:InitNPC("Merchant Doris")
	else
		bW:GoToDungeonID(botManager.dungeon)
	end

	return bW
end

--[[function OnNpcDialog()
	if botManager.isEnabled == false then
		return
	end
	if IsTalkingToNpc() == true then
		if IsTalkingToNpc("Merchant Doris") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Sene") then
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
		end
	end
end--]]