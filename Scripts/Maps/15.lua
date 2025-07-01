-- Saint Haven

require "botWorker"

function GetBotWorker()
	local bW = BotWorker('LotusMarshTown')
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
		if actorSelf:getDistance(D3DXVECTOR3(4775, -30, 1558)) <= actorSelf:getDistance(D3DXVECTOR3(2007, 0, 1892)) then
			bW:WalkTo(4803, -30, 1572)
			bW:Wait(5000)
			bW:InitNPC("Merchant Lucita")
		else
			bW:WalkTo(2007,0,1892)
			bW:Wait(5000)
			bW:InitNPC('Blacksmith Molin')
		end
	elseif profileManager.bAutoSell then
		if actorSelf:getDistance(D3DXVECTOR3(4775, -30, 1558)) <= actorSelf:getDistance(D3DXVECTOR3(2007, 0, 1892)) then
			bW:WalkTo(4803, -30, 1572)
			bW:Wait(5000)
			bW:InitNPC("Merchant Lucita")
		else
			bW:WalkTo(2007,0,1892)
			bW:Wait(5000)
			bW:InitNPC('Blacksmith Molin')
		end
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
		if IsTalkingToNpc("Merchant Lucita") then
			if IsDlgOption("Shop Trade") == true then
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
end
--]]
