require 'botWorker'
require 'basic'
require 'maps'
require 'Quest'
require 'questlist'
local worker = nil
local bReinitNpc = false
local rvr_quests = nil

function OnLoad()
	print("RVR Mission Board Bot Plugin Loaded - created by svinx")
	rvr_quests = { Q_WHATS_WRONG, Q_UNRELENTING_LOVE, Q_CHINESE_MEDICINE, Q_IMPARTING_SECRET_RECIPES, Q_MAN_WITH_GRUDGE, Q_DELIVERIES_FIRST_MONTH_II, Q_DRAGON_FOLLOWERS_RECRUIT_NOTICE, Q_DRAGON_FOLLOWERS_CLUB }
end

function OnUnload()
	if rvr_quests then
		rvr_quests = nil
	end
end

function OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == RVR_1 then
		GetRVRWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == RVR_1 and not worker then
		print("Starting RVR Mission Board Bot")
		print("Note: Please have auto-sell enabled or the bot will stop when your inventory is full.")
		if HasAnyQuestsInList(rvr_quests) and not IsAnyQuestComplete(rvr_quests) then
			print("Has the MB Quest but it's not completed")
			botManager.nextMapID = RVR_1
		else
			print("Does not have a quest / quest completed")
			botManager.nextMapID = RIVERWORT_WHARF
		end
		print("Getting BotWorker")
		GetRVRWorker()
	end
end

function OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == RVR_1 then
		print("Stopping RVR Mission Board Bot")
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

function GetRVRWorker()
	if IsGoingToMap() then
		return
	end
	--print("In GetRVRWorker")
	local mapID = GetMapID()
	if mapID == LOTUS_MARSH then
		worker = LotusMarsh()
	elseif mapID == RIVERWORT_WHARF then
		worker = RiverwortWharf_RVR()
	elseif mapID == RVR_1 then
		worker = RiverwortVillageRuins_1()
	else
		GoToMap(LOTUS_MARSH)
	end
end


function LotusMarsh()
	local bW = BotWorker('LotusMarshTown')
	print("Lotus Marsh BotWorker")
	--HideCharacter(1700, 1181, 9200)
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if HasAnyQuestsInList(rvr_quests) and not IsAnyQuestComplete(rvr_quests) then
		print("Has the MB Quest but it's not completed")
		botManager.nextMapID = RVR_1
	else
		print("Does not have a quest / quest completed")
		botManager.nextMapID = RIVERWORT_WHARF
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

function RiverwortWharf_RVR()
	local bW = BotWorker('LiverwortFerry')
	print("Riverwort Wharf Script")
	if IsAnyQuestComplete(rvr_quests) then
		print("ReInit NPC = true, Has completed a quest")
		bW:WalkTo(-196, -776, 4726)  
		bW:Wait(5000)
		bW:InitNPCXYZ(-336,-776,4843)
		bReinitNpc = true
	elseif not HasAnyQuestsInList(rvr_quests) then
		print("Does not have a quest in the list")
		bW:WalkTo(-196, -776, 4726) 
		bW:Wait(5000)
		bW:InitNPCXYZ(-336,-776,4843)
	else
		print("No quest is complete / Already has a quest")
		GoToDungeon(RVR_1)
	end
	return bW
end

function RiverwortVillageRuins_1()
local bW = BotWorker('51-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:WalkTo(-3345, 851, -2926)
	bW:WalkTo(-4904, 912, -1111)
	--bW:WalkTo(-5041, 917, -859)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(-5179, 969, 2186)
	--Teleport(-5179, 969, 2186)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:Teleport(-6129, 1189, 4041)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(-6022, 1289, 5816)
	bW:Teleport(-3047, 1558, 6515)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:Teleport(8446, 1643, -8230)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(8408, 1261, -5829)
	bW:WalkTo(8089, 1261, -4584)
	bW:KillMobs(2000)
	bW:Wait(3000)

	--bW:Teleport(2478, 2469, 1581)
	--bW:Teleport(10049, 1261, -6374)
	bW:Teleport(9408, 1261, -6358)
	bW:WalkTo(10049, 1261, -6357)
	bW:Wait(10000)
	bW:WalkTo(2579, 2469, 3044)
	bW:KillMobByName('Bishop Hermaton')
	bW:Finish()--]]
	--------NON-Teleport--------
	bW:WalkTo(-4217, 899, -1955)
	if questManager:hasQuest(Q_DELIVERIES_FIRST_MONTH_II:GetID()) then
		bW:UseProp(731)
	end
	bW:KillMobs(10000)
	if questManager:hasQuest(Q_CHINESE_MEDICINE:GetID()) then
		bW:UseProp(1074)
	end
	bW:WalkTo(-5159, 941, 1981) 
	bW:KillMobs(10000)
	--bW:WalkTo(-6305, 1268, 5149) 
	--bW:KillMobs(2000)
	bW:WalkTo(-4137, 1550, 6107)
	bW:KillMobs(2000)
	bW:WalkTo(-2501, 1557, 6712) 
	bW:ForwardPropTime(393, 2000)
	bW:ForwardPropTime(1099, 3500)
	bW:KillMobs(2000)
	bW:WalkTo(8362, 1261, -5922) 
	bW:Wait(2000)
	bW:ForwardPropTime(698, 5000)
	--bW:WalkTo(8308, 1267, -3760) 
	--bW:Wait(2000)
	bW:Wait(2000)
    --bW:WalkTo (8187, 1267, -2920)
    bW:MoveForward(8160, 1267, -3006)
    bW:Wait(1000)
    --bW:KillInAreaF(1000, 10000, 8160, 1267, -3006)
	bW:KillInAreaFByName('Jungle Assay Lich', 1000, 10000, 8160, 1267, -3006)
	bW:KillInAreaF(1000, 10000, 8160, 1267, -3006)
    bW:MoveForward(8062, 1262, -4839)
    bW:MoveForward(8543, 1270, -6413)
    bW:MoveForward(9730, 1263, -6355)
    bW:ForwardPropTime(395, 2000)
    bW:Wait(1000)
    bW:KillMobByName("Bishop Hermaton")
	bW:Wait(1000)
	bW:KillMobByName("Bishop Hermaton")
	bW:KillMobs(2000)
	return bW
end

function OnSpawnProp()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= RVR_1 then
		return
	end
	if GetLastPropSpawn() == 698 then
		UseProp(698)
	elseif GetLastPropSpawn() == 734 then
		UseProp(734)
	end
end

function OnNpcDialog()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= RVR_1 then
		return
	end
	local mapID = GetMapID()
	--print("OnNpcDialog")
	if mapID == RIVERWORT_WHARF then
		if IsTalkingToNpc() then
			if IsDlgOption("[Lv.42] Riverwort Village Ruins") then
				print("Choosing RVR")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Normal] What's Wrong?") then
				print("What's wrong?")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Unrelenting Love") then
				print("Unrelenting Love")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Chinese Medicine") then
				print("Chinese Medicine")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hard] Imparting Secret Recipes") then
				print("Imparting Secret Recipes")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Man with Grudge") then
				print("Man With Grudge")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] Dragon Followers Recruitment Notice") then
				print("Dragon Followers Recruitment Notice")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Party] You're not Alone II") and IsDlgOption("[Master] Urgent News:") then
				print("[Master] Urgent News:")
				ChooseDlgOption(1)
			elseif IsDlgOption("[Master] Urgent News:") then
				print("[Master] Urgent News:")
				ChooseDlgOption(0)
			--[[elseif IsDlgOption("[Party] You're not Alone II") then
				print("[Party] You're not Alone II")
				ChooseDlgOption(0)--]]
			elseif IsDlgOption("[Search]") then
				print("Search")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Deliveries") then
				print("Deliveries")
				ChooseDlgOption(0)
			elseif IsDlgOption("Clear") then
				print("Clear")
				ChooseDlgOption(0)
			elseif IsDlgOption("Find out") then
				print("Find out lost post at RVR")
				ChooseDlgOption(0)
			elseif IsDlgOption("Defeat") then
				print("Defeat")
				ChooseDlgOption(0)
			elseif IsDlgOption("Continue") then
				print("Continue")
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
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= RVR_1 then
		return
	end
	local mapID = GetMapID()
	print("In OnNpcDialogClosed")
	if mapID == RIVERWORT_WHARF then
		if bReinitNpc then
			local actor = actorManager:getActor(-336,-776,4843)
			InitNpcDlg(actor)
			bReinitNpc = false
		else
			GoToDungeon(RVR_1)
		end
	end
end