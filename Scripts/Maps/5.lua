-- Mana Ridge

require "botWorker"
require "basic"

function GetBotWorker()
	local bW = BotWorker('ManaRidge')
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
		if IsPointInArea(actorSelf.pos, 18, 1910, -1999, 282) then
			bW:WalkTo(967, -576, -721)
		end
		bW:WalkTo(-974, -375, 277)
		bW:Wait(5000)
		bW:InitNPC("Merchant Jenny")
	elseif profileManager.bAutoSell then
		if IsPointInArea(actorSelf.pos, 18, 1910, -1999, 282) then
			bW:WalkTo(967, -576, -721)
		end
		bW:WalkTo(-974, -375, 277)
		bW:Wait(5000)
		bW:InitNPC("Merchant Jenny")
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
		if IsTalkingToNpc("Merchant Jenny") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
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
		end
	end
end
--]]

