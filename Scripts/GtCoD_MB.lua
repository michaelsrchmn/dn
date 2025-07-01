require 'botWorker'
require 'basic'
require 'maps'
require 'Quest'
require 'questlist'
local worker = nil
local bReinitNpc = false
local gtcod_quests = nil

function OnLoad()
	gtcod_quests = { Q_SHOW_ME, Q_SAFE_WALKWAY, Q_HOUND_IN_MY_HEAD, Q_LONG_DISTANCE, Q_TINY_HALF_GOLEM, Q_HIDDEN_CHUCKIE_VII, Q_PREACHER_OF_LOVE, Q_ASSAULT_VII }
	print("GtCoD Mission Board Bot Plugin Loaded - created by svinx")
end

function OnUnload()
	if gtcod_quests then
		gtcod_quests = nil
	end
end

function OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == GTCOD_1 then
		GetGTCODWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == GTCOD_1 and not worker then
		print("Starting GTCOD Mission Board Bot")
		print("Note: Please have auto-sell enabled or the bot will stop when your inventory is full.")
		if HasAnyQuestsInList(gtcod_quests) and not IsAnyQuestComplete(gtcod_quests) then
			print("Has the MB Quest but it's not completed")
			botManager.nextMapID = GTCOD_1
		else
			print("Does not have a quest / quest completed")
			botManager.nextMapID = HERMALTE_PORT
		end
		print("Getting BotWorker")
		GetGTCODWorker()
	end
end

function OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == GTCOD_1 then
		print("Stopping GtCoD Mission Board Bot")
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

function GetGTCODWorker()
	if IsGoingToMap() then
		return
	end
	local mapID = GetMapID()
	if mapID == SAINT_HAVEN then
		worker = SaintHaven()
	elseif mapID == HERMALTE_PORT then
		worker = HermaltePort_GTCOD()
	elseif mapID == GTCOD_1 then
		worker = GatesToCityOfDeath_1()
	elseif mapID == GTCOD_2 then
		worker = GatesToCityOfDeath_2()
	elseif mapID == GTCOD_3 then
		worker = GatesToCityOfDeath_3()
	else
		GoToMap(SAINT_HAVEN)
	end
end

function SaintHaven()
	local bW = BotWorker('SaintHaven')
	print("Saint Haven BotWorker")
	--HideCharacter(1700, 1181, 9200)
	if profileManager.bTownTimerAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetTownWait())
	end
	if HasAnyQuestsInList(gtcod_quests) and not IsAnyQuestComplete(gtcod_quests) then
		print("Has the MB Quest but it's not completed")
		botManager.nextMapID = GTCOD_1
	else
		print("Does not have a quest / quest completed")
		botManager.nextMapID = HERMALTE_PORT
	end
	if NeedsRepair() or profileManager.bAutoSell then
		print("Needs repair or auto-merchanting enabled")
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
		if botManager.nextMapID == GTCOD_1 then
			GoToDungeon(botManager.nextMapID)
		else
			GoToMap(botManager.nextMapID)
		end
	end
	return bW
end

function HermaltePort_GTCOD()
	local bW = BotWorker('HermaltePort')
	print("Hermalte Port Script")
	if IsAnyQuestComplete(gtcod_quests) then
		print("ReInit NPC = true, Has completed a quest") 
		bW:WalkTo(-2392, -872, 7026)  
		bW:Wait(5000)
		bW:InitNPCXYZ(-2300, -872, 6907)
		bReinitNpc = true
	elseif not HasAnyQuestsInList(gtcod_quests) then
		print("Does not have a quest in the list")
		bW:WalkTo(-2392, -872, 7026) 
		bW:Wait(5000)
		bW:InitNPCXYZ(-2300, -872, 6907)
	else
		print("No quest is complete / Already has a quest")
		GoToDungeon(GTCOD_1)
	end
	return bW
end

function GatesToCityOfDeath_1()
	local bW = BotWorker('42-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(-2212, -933, -2919)
	bW:KillMobs(2000)
	bW:Teleport(977, -1288, -4961) 
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Teleport(2873, -1288, -2772) 
	bW:Wait(2000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-2250, -916, -2498) 
	bW:KillMobs(2000)
	bW:WalkTo(-1645, -919, -3560) 
	bW:UseProp(156)
	bW:WalkTo(-1924, -938, -3264) 
	bW:Wait(7000)
	bW:WalkTo(-1416, -919, -3417) 
	bW:WalkTo(581, -1288, -5392) 
	bW:KillMobs(2000)
	bW:WalkTo(1635, -1288, -4230) 
	bW:WalkTo(2285, -1288, -3465) 
	bW:KillMobs(2000)
	bW:WalkTo(3330, -1288, -2312) 
	return bW
end

function GatesToCityOfDeath_2()
	local bW = BotWorker('42-3A')
	--[[---------Teleport-----------
	bW:Teleport(3018, -606, -2382) 
	bW:Wait(2000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-2884, -604, -3024) 
	bW:KillMobs(2000)
	bW:WalkTo(-2403, -604, -2749) 
	bW:WalkTo(-1494, -606, -2896) 
	bW:WalkTo(234, -606, -2716) 
	bW:WalkTo(618, -606, -3315) 
	bW:UseProp(358)
	bW:Wait(5000)
	bW:WalkTo(766, -606, -4157) 
	bW:KillMobs(2000)
	bW:WalkTo(1322, -606, -4089) 
	bW:WalkTo(3080, -606, -3843) 
	bW:WalkTo(2963, -606, -2441) 
	bW:KillMobs(2000)
	bW:WalkTo(4649, -606, -2268) 
	return bW
end

function GatesToCityOfDeath_3()
	local bW = BotWorker('42-BossA')
	--[[---------Teleport-----------
	bW:Teleport(3733, 202, -1243) 
	bW:KillMobByName("Rrrumble")
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(3789, 202, -1961) 
	bW:KillMobByName("Rrrumble")
	bW:KillMobs(2000)
	return bW
end

function OnNpcDialog()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= GTCOD_1 then
		return
	end
	local mapID = GetMapID()
	--print("OnNpcDialog")
	if mapID == HERMALTE_PORT then
		if IsTalkingToNpc() then
			if IsDlgOption("[Lv.36] Gates to Death City") then
				print("Choosing Gates to Death City")
				ChooseDlgOption(3)
			elseif IsDlgOption("Assault VII") then
				print("Assault VII")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Normal] Show Me!") then
				print("Show Me")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Safe Walkway") then
				print("[Hunt] Safe Walkway")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Hound in my Head") then
				print("[Acquire] Hound in my Head")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hard] Long Distance") then
				print("[Hard] Long Distance")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Wanted: Tiny Half Golem") then
				print("Wanted: Tiny Half Golem")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Finding Hidden Chuckie VII") then
				print("Finding Hidden Chuckie VII")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] Preacher of Love") then
				print("Preacher of Love")
				ChooseDlgOption(0)
			elseif IsDlgOption("Defeat") then
				print("Defeat the Boss of Gates to City of Death")
				ChooseDlgOption(0)
			elseif IsDlgOption("Finding") then
				print("Finding")
				ChooseDlgOption(0)
			elseif IsDlgOption("Clear") then
				print("Clear")
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
			elseif IsDlgOption("[Mission completed]") then
				print("Mission Completed")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Completed]") then
				print("Completed")
				ChooseDlgOption(0)
			elseif IsDlgOption("(Receive Reward)") then
				print("Receiving Reward")
				ChooseDlgOption(0)
			elseif IsDlgOption("Collect") then
				print("Collect")
				ChooseDlgOption(0)
			else
				print("Close Dialog")
				CloseNpcDlg()
			end
		end
	end
end

function OnNpcDialogClosed()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= GTCOD_1 then
		return
	end
	local mapID = GetMapID()
	print("In OnNpcDialogClosed")
	if mapID == HERMALTE_PORT then
		if bReinitNpc then
			local actor = actorManager:getActor(-2300, -872, 6907)
			InitNpcDlg(actor)
			bReinitNpc = false
		else
			GoToDungeon(GTCOD_1)
		end
	end
end

