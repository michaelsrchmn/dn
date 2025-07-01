require 'botWorker'
require 'basic'
require 'maps'
require 'quest'
require 'questlist'
local worker
local bReinitNpc
local dtmi_quests

function OnLoad()
	bReinitNpc = false
	dtmi_quests = { Q_PRIDE, Q_SCRAMBLED_EGGS, Q_PUZZLE_KING_CHALLENGE, Q_LITTLE_COLLECTOR_VII, Q_REHABILITATION, Q_PROOF_OF_POWER }
end

function OnUnload()
	if dtmi_quests then
		dtmi_quests = nil
	end
	
	if worker then
		worker = nil
	end
end

function OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DTMI_1 then
		GetDTMIWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DTMI_1 then
		print("Starting DTMI Mission Board Bot")
		print("Note: Please have auto-sell enabled or the bot will stop when your inventory is full.")
		if HasAnyQuestsInList(dtmi_quests) and not IsAnyQuestComplete(dtmi_quests) then
			print("Has the MB Quest but it's not completed")
			botManager.nextMapID = DTMI_1
		else
			print("Does not have a quest / quest completed")
			botManager.nextMapID = BLIZZARD_PLAIN
		end
		print("Getting BotWorker")
		GetDTMIWorker()
	end
end

function OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DTMI_1 then
		print("Stopping DTMI Mission Board Bot")
		if worker then
			worker = nil
		end
	end
end

function OnTick()
	if worker then
		worker:tick()
	end
end

function GetDTMIWorker()
	if IsGoingToMap() then
		return
	end
	--print("In GetDTMIWorker")
	local mapID = GetMapID()
	if mapID == CALDEROCK_VILLAGE then
		worker = CalderockVillage()
	elseif mapID == BLIZZARD_PLAIN then
		worker = BlizzardPlain()
	elseif mapID == DTMI_1 then
		worker = DarkTowerMagicInstitute_1()
	elseif mapID == DTMI_2 then
		worker = DarkTowerMagicInstitute_2()
	elseif mapID == DTMI_3 then
		worker = DarkTowerMagicInstitute_3()
	else
		GoToMap(CALDEROCK_VILLAGE)
	end
end

function CalderockVillage()
	local bW = BotWorker('CataractGateway')
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if HasAnyQuestsInList(dtmi_quests) and not IsAnyQuestComplete(dtmi_quests) then
		print("Has the MB Quest but it's not completed")
		botManager.nextMapID = DTMI_1
	else
		print("Does not have a quest / quest completed")
		botManager.nextMapID = BLIZZARD_PLAIN
	end
	if NeedsRepair() and profileManager.bRepairItemAtNpcOption or profileManager.bAutoSell then
		print("Needs repair or auto-merchanting enabled")
		bW:WalkTo(-4039, -1909, 2175)
		bW:Wait(5000)
		bW:InitNPC("Merchant May")
	else
		if botManager.nextMapID == DTMI_1 then
			GoToDungeon(botManager.nextMapID)
		else
			GoToMap(botManager.nextMapID)
		end
	end
	return bW
end

function BlizzardPlain()
	local bW = BotWorker('BlizzardPlain')
	print("DTMI MB::Blizzard Plain")
	bW:ForwardTime(0)
	if IsAnyQuestComplete(dtmi_quests) then
		print("ReInit NPC = true, Has completed a quest")
		--bW:Teleport(-324, -2423, -2290)
		bW:WalkTo(-2523, -587, 1504) 
		bW:Wait(1000)
		bW:InitNPCXYZ(-2842,-586,1746)
		bReinitNpc = true
	elseif not HasAnyQuestsInList(dtmi_quests) then
		print("Does not have a quest in the list")
		--bW:Teleport(-324, -2423, -2290)
		bW:WalkTo(-2523, -587, 1504) 
		bW:Wait(1000)
		bW:InitNPCXYZ(-2842,-586,1746)
		print("After selecting InitNPCXYZ")
	else
		print("No quest is complete / Already has a quest")
		GoToDungeon(DTMI_1)
	end
	return bW
end

function DarkTowerMagicInstitute_1()
	local bW = BotWorker('21-2A')
	AddMobToIgnoreList(0, 'Blizzard Vampire Bat')
	AddMobToIgnoreList(1, 'Blizzard Baby Tarantula')
	AddMobToIgnoreList(2, 'Blizzard Dwarf Tarantula')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[bW:Teleport(44, 0, 49)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(-2062, 0, 1690)
	bW:Wait(1000)
	bW:KillMobs(1000)--]]
	bW:WalkTo(1017, 0, -1524)

	bW:WalkTo(50, 0, -1404)

	bW:WalkTo(44, 0, 49)
	bW:KillMobs(1000)

	bW:WalkTo(100, 0, 1589)
	bW:UseProp(618)

	bW:WalkTo(30, 0, 1579)


	bW:WalkTo(-1483, 0, 1669)
	bW:DestroyProp(533)
	bW:KillMobs(3000)
	bW:WalkTo(-2437, 0, 1648) 
	bW:ForwardPropTime(561, 20000)
	--bW:WalkTo(-2849, 0, 1708) -- gate
	--bW:EnterGate('21-3A')

	return bW
end

function DarkTowerMagicInstitute_2()
	local bW = BotWorker('21-3A')
	AddMobToIgnoreList(0, 'Blizzard Vampire Bat')
	AddMobToIgnoreList(1, 'Blizzard Baby Tarantula')
	AddMobToIgnoreList(2, 'Blizzard Dwarf Tarantula')
	--[[bW:Teleport(-2075, 0, -2190)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:DestroyProp(414)

	bW:Teleport(1431, 0, -1331)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(1494, 0, 716)
	bW:Wait(1000)
	bW:KillMobs(1000)--]]
	bW:WalkTo(-1959, 0, -1617)

	bW:WalkTo(-2075, 0, -2190)
	bW:KillMobs(1000)
	bW:DestroyProp(414)

	bW:WalkTo(-1808, 0, -2695)
	bW:KillMobs(1000)
	bW:WalkTo(1405, 0, -2927)
	bW:UseProp(617)
	bW:WalkTo(1431, 0, -1331)
	if questManager:hasQuest(Q_PUZZLE_KING_CHALLENGE:GetID()) then
		bW:Wait(1000)
		bW:UseProp(592)
		bW:Wait(2000)
		bW:UseProp(591)
		bW:Wait(2000)
		bW:UseProp(593)
		bW:Wait(2000)
		bW:UseProp(590)
		bW:Wait(4000)
		bW:UseProp(600)
	end
	bW:KillMobs(1000)

	bW:WalkTo(1800, 0, -295)
	bW:DestroyProp(443)
	bW:KillMobs(2000)
	bW:DestroyProp(546)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:WalkTo(1390, 0, 1217) 
	bW:ForwardPropTime(487, 20000)
	--bW:WalkTo(1323, 0, 1618) -- gate
	--bW:EnterGate('21-BossA')

	return bW
end

function DarkTowerMagicInstitute_3()
	local bW = BotWorker('21-BossA')
	bW:KillMobByName('Spider Queen Raren')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function OnNpcDialog()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DTMI_1 then
		return
	end
	local mapID = GetMapID()
	--print("OnNpcDialog")
	if mapID == BLIZZARD_PLAIN then
		if IsTalkingToNpc() then
			if IsDlgOption("[Lv.18] Dark Tower Magic Institute") then
				print("Choosing DTMI")
				ChooseDlgOption(2)
			elseif IsDlgOption("[Normal] Pride") then
				print("[Normal] Pride")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Scrambled Eggs") then
				print("[Hunt] Scrambled Eggs")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Puzzle King Challenge") then
				print("[Acquire] Puzzle King Challenge")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hard] The Little Collector VII") then
				print("[Hard] The Little Collector VII")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Rehabilitation") then
				print("[Hunt] Rehabilitation")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] Proof of Power") then
				print("[Master] Proof of Power")
				ChooseDlgOption(0)
			elseif IsDlgOption("Continue") then
				print("Continue")
				ChooseDlgOption(0)
			elseif IsDlgOption("Clear Dark Tower Magic Institute") then
				print("Clear DTMI once")
				ChooseDlgOption(0)
			elseif IsDlgOption("Defeat 5 Blizzard Spotted Spider") then
				print("Defeat 5 Blizzard Spotted Spider")
				ChooseDlgOption(0)
			elseif IsDlgOption("Collect 1 Rare Puzzle Piece") then
				print("Collect 1 Rare Puzzle Piece")
				ChooseDlgOption(0)
			elseif IsDlgOption("Defeat Spider Queen Raren") then
				print("Defeat Spider Queen Raren")
				ChooseDlgOption(0)
			elseif IsDlgOption("Accept Mission") then
				print("Accept Mission")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Mission Completed]") then
				print("Mission Completed")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Completed]") then
				print("Completed")
				ChooseDlgOption(0)
			elseif IsDlgOption("(Receive Reward)") then
				print("Receiving Reward")
				ChooseDlgOption(0)
			else
				print("Close Dialog")
				CloseNpcDlg()
			end
		end
	end
end

function OnNpcDialogClosed()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DTMI_1 then
		return
	end
	local mapID = GetMapID()
	print("In OnNpcDialogClosed")
	if mapID == BLIZZARD_PLAIN then
		if bReinitNpc then
			local actor = actorManager:getActor(-2842,-586,1746)
			InitNpcDlg(actor)
			bReinitNpc = false
		else
			GoToDungeon(DTMI_1)
		end
	end
end

print("DTMI Mission Board Bot Plugin Loaded - created by svinx")