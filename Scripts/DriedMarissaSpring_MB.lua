require 'botWorker'
require 'basic'
require 'maps'
require 'quest'
require 'questlist'
local worker
local bReinitNpc
local dms_quests --{ Q_ASSAULT_VIII } --{Q_MAPOGRAPHY_VIII,Q_SWEET_REVENGE, Q_ASSAULT_VIII}

function OnLoad()
	dms_quests = { Q_ASSAULT_VIII }
	bReinitNpc = false
end

function OnUnload()
	dms_quests = nil
end

function OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DRIED_MARISSA_SPRING_1 then
		GetDMSWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DRIED_MARISSA_SPRING_1 then
		print("Starting DMS Mission Board Bot")
		print("Note: Please have auto-sell enabled or the bot will stop when your inventory is full.")
		if HasAnyQuestsInList(dms_quests) and not IsAnyQuestComplete(dms_quests) then
			print("Has the MB Quest but it's not completed")
			botManager.nextMapID = DRIED_MARISSA_SPRING_1
		else
			print("Does not have a quest / quest completed")
			botManager.nextMapID = FOOTHILLS_OF_BLACK_MOUNTAIN
		end
		print("Getting BotWorker")
		GetDMSWorker()
	end
end

function OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DRIED_MARISSA_SPRING_1 then
		print("Stopping DMS Mission Board Bot")
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

function GetDMSWorker()
	if IsGoingToMap() then
		return
	end
	--print("In GetDMSWorker")
	local mapID = GetMapID()
	if mapID == SAINT_HAVEN then
		worker = SaintHaven()
	elseif mapID == FOOTHILLS_OF_BLACK_MOUNTAIN then
		worker = FoothillsOfBlackMountain()
	elseif mapID == DRIED_MARISSA_SPRING_1 then
		worker = DriedMarissaSpring_1()
	elseif mapID == DRIED_MARISSA_SPRING_2 then
		worker = DriedMarissaSpring_2()
	elseif mapID == DRIED_MARISSA_SPRING_3 then
		worker = DriedMarissaSpring_3()
	else
		GoToMap(SAINT_HAVEN)
	end
end

function SaintHaven()
	local bW = BotWorker('SaintHaven')
	print("Saint Haven BotWorker")
	HideCharacter(1700, 1181, 9200)
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if HasAnyQuestsInList(dms_quests) and not IsAnyQuestComplete(dms_quests) then
		print("Has the MB Quest but it's not completed")
		botManager.nextMapID = DRIED_MARISSA_SPRING_1
	else
		print("Does not have a quest / quest completed")
		botManager.nextMapID = FOOTHILLS_OF_BLACK_MOUNTAIN
	end
	if NeedsRepair() or profileManager.bAutoSell then
		print("Needs repair or auto-merchanting enabled")
		bW:Teleport(864, 1181, 9219)
		bW:WalkTo(651, 1181, 9068)
		bW:Wait(10000)
		bW:InitNPC("Merchant Kelly")
	else
		if botManager.nextMapID == DRIED_MARISSA_SPRING_1 then
			GoToDungeon(botManager.nextMapID)
		else
			GoToMap(botManager.nextMapID)
		end
	end
	return bW
end

function FoothillsOfBlackMountain()
	local bW = BotWorker('SkirtOfBlackMountain')
	print("Foothills of Black Mountain Script")
	if IsAnyQuestComplete(dms_quests) then
		print("ReInit NPC = true, Has completed a quest")
		--bW:Teleport(-324, -2423, -2290)
		bW:WalkTo(-366, -2432, -2522)
		bW:Wait(1000)
		bW:InitNPCXYZ(-182,-2417,-2272)
		bReinitNpc = true
	elseif not HasAnyQuestsInList(dms_quests) then
		print("Does not have a quest in the list")
		--bW:Teleport(-324, -2423, -2290)
		bW:WalkTo(-366, -2432, -2522)
		bW:Wait(1000)
		bW:InitNPCXYZ(-182,-2417,-2272)
		print("After selecting InitNPCXYZ")
	else
		print("No quest is complete / Already has a quest")
		GoToDungeon(DRIED_MARISSA_SPRING_1)
	end
	return bW
end

function DriedMarissaSpring_1()
	local bW = BotWorker('35_1A')
	print("DMS_1 Script")
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:IgnoreMobs(true)
	bW:WalkTo(-327, 203, -6358) 
	bW:WalkTo(-201, 184, -4193) 
	bW:MoveForward(868, 246, -3314) 
	bW:MoveForward(1183, 404, -2054) 
	bW:MoveForward(686, 392, -349) 
	bW:MoveForward(-606, 180, 1781) 
	bW:MoveForward(-268, 183, 2339) 
	bW:DestroyProp(1500)
	bW:DestroyProp(1502)
	bW:DestroyProp(1501)
	bW:DestroyProp(1503)
	bW:DestroyProp(1504)
	bW:DestroyProp(1507)
	bW:MoveForward(-550, 139, 4712) 
	bW:MoveForward(-1482, 185, 4681) 
	bW:DestroyProp(1513)
	bW:DestroyProp(1514)
	bW:MoveForward(-2946, 507, 4494) 
	bW:MoveForward(-3415, 728, 3398) 
	bW:MoveForward(-3044, 932, 2736) 
	bW:WalkTo(-1488, 962, 2412) 
	bW:MoveForward(-812, 959, -383) 
	bW:WalkTo(-568, 974, -1706) 
	bW:UseProp(1554) -- RC
	bW:IgnoreMobs(false)
	bW:KillMobsY(1500, 100)
	bW:UseProp(1554) -- RC
	bW:WalkTo(-1137, 974, -1563) 
	bW:MoveForward(-1812, 385, -1047) 
	bW:WalkTo(-2855, 404, -125) 
	bW:MoveForward(-5015, 446, -1037) 
	bW:Wait(5000)
	bW:MoveForward(-4257, 399, -769) 
	bW:Wait(2000)
	bW:KillMobByName('Follower Greed Wrath')
	bW:KillMobs(2000)

	return bW
end

function DriedMarissaSpring_2()
	local bW = BotWorker('35_3A')
	print("DMS_2 Script")
	bW:Teleport(-889, -1300, -3840)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:EnterGate('35_BossA')

	return bW
end

function DriedMarissaSpring_3()
	local bW = BotWorker('35_BossA')
	print("DMS_3 Script")
	bW:MoveForward(-2070, 1706, -3924) 
	bW:MoveForward(-2440, 1754, -3160) 
	bW:MoveForward(-1992, 1783, -2649) 
	bW:MoveForward(-992, 1791, -2616) 
	bW:KillMobByName('Wraith Red Eyes')
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobByName('Wraith Red Eyes')
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobByName('Wraith Red Eyes')
	bW:KillMobs(10000)
	bW:Wait(3000)
	--bW:WalkTo(-1529, 1794, -2649)

	return bW
end

--[[function OnStageClear()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DRIED_MARISSA_SPRING_1 then
		return
	end
	if NeedsRepair() then
		RepairEquipment()
	end
	print("Stage Cleared")
	if IsAnyQuestComplete(dms_quests) and inventoryManager.slotsAvailable >= 2 then
		ReturnToStageEntrance()
	elseif profileManager.bAutoSell and inventoryManager.slotsAvailable <= 2 then
		ReturnToTown()
	else
		print("Inventory full and auto-sell is not enabled. Cannot do quest anymore.")
	end
end--]]

function OnNpcDialog()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DRIED_MARISSA_SPRING_1 then
		return
	end
	local mapID = GetMapID()
	--print("OnNpcDialog")
	if mapID == FOOTHILLS_OF_BLACK_MOUNTAIN then
		if IsTalkingToNpc() then
			if IsDlgOption("[Lv.30] Dried Marissa Spring") then
				print("Choosing Dried Marissa Spring")
				ChooseDlgOption(1)
			elseif IsDlgOption("[Master] Assault VIII") then
				print("[Master] Assault VIII")
				ChooseDlgOption(0)
			elseif IsDlgOption("Continue") then
				print("Continue")
				ChooseDlgOption(0)
			elseif IsDlgOption("Clear Dried Marissa Spring at C rank") then
				print("Clear Dried Marissa Spring at C rank")
				ChooseDlgOption(0)
			elseif IsDlgOption("Accept Mission") then
				print("Accept Mission")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Mission Completed]") then
				print("Mission Completed")
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
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DRIED_MARISSA_SPRING_1 then
		return
	end
	local mapID = GetMapID()
	print("In OnNpcDialogClosed")
	if mapID == FOOTHILLS_OF_BLACK_MOUNTAIN then
		if bReinitNpc then
			local actor = actorManager:getActor(-182,-2417,-2272)
			InitNpcDlg(actor)
			bReinitNpc = false
		else
			GoToDungeon(DRIED_MARISSA_SPRING_1)
		end
	end
end

print("DMS Mission Board Bot Plugin Loaded - created by svinx")