-- Saint Haven
require "botWorker"
function GetBotWorker()
	local bW = BotWorker('SaintHaven')
	--HideCharacter(1700, 1181, 9200)
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
		--bW:Teleport(864, 1181, 9219)
		if actorSelf:getDistance(D3DXVECTOR3(3963, 455, -2747)) <= actorSelf:getDistance(D3DXVECTOR3(848,1181,9226)) then
			bW:WalkTo(3963, 455,-2747)
			bW:Wait(10000)
			bW:InitNPC('Blacksmith Berlin')
		else
			bW:WalkTo(848, 1181, 9226) 
			bW:Wait(10000)
			bW:InitNPC("Merchant Kelly")
		end
	elseif profileManager.bAutoSell then
		--bW:Teleport(864, 1181, 9219)
		if actorSelf:getDistance(D3DXVECTOR3(3963, 455, -2747)) <= actorSelf:getDistance(D3DXVECTOR3(848,1181,9226)) then
			bW:WalkTo(3963, 455,-2747)
			bW:Wait(10000)
			bW:InitNPC('Blacksmith Berlin')
		else
			bW:WalkTo(848, 1181, 9226) 
			bW:Wait(10000)
			bW:InitNPC("Merchant Kelly")
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
	if IsTalkingToNpc() then
		if IsTalkingToNpc("Merchant Kelly") then
			--PrintToChat("Talking to Merchant Kelly")
			if IsDlgOption("Purchase Items/Repair Items") then
				--PrintToChat("Found option Purchase")
				ChooseDlgOption(0)
				--PrintToChat("Choosing dialog option...")
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
		end
	end
end--]]
LogString("Saint Haven Script Loaded")
