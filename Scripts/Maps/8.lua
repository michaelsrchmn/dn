-- Calderock Village

require "botWorker"

function GetBotWorker()
	local bW = BotWorker('CataractGateway')
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
		if IsPointInArea(actorSelf.pos, -6549, -138, -6029, -1656) then
			bW:WalkTo(-5010, -1885, -2856) 
			bW:Wait(5000)
			bW:InitNPC('Blacksmith Corin')
		else
			bW:WalkTo(-4039, -1909, 2175)
			bW:Wait(5000)
			bW:InitNPC("Merchant May")
		end
		--[[bW:WalkTo(-4039, -1909, 2175)
		bW:Wait(5000)
		bW:InitNPC("Merchant May")--]]
	elseif profileManager.bAutoSell then
		if IsPointInArea(actorSelf.pos, -6549, -138, -6029, -1656) then
			bW:WalkTo(-5010, -1885, -2856) 
			bW:Wait(5000)
			bW:InitNPC('Blacksmith Corin')
		else
			bW:WalkTo(-4039, -1909, 2175)
			bW:Wait(5000)
			bW:InitNPC("Merchant May")
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
		if IsTalkingToNpc("Merchant May") then
			print("Talking to Merchant May")
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
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
		end
	end
end
--]]
print("Loaded Calderock Village Script")