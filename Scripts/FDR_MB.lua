require 'botWorker'
require 'basic'
require 'maps'
require 'Quest'
require 'questlist'
local worker = nil
local bReinitNpc = false
local fdr_quests = nil

function OnLoad()
	fdr_quests = { Q_MAPOLOGY_IX, Q_SOUPY_GOODNESS, Q_HARONS_LOST_COMB, Q_ASCENDENCE, Q_MATRIARCH_RHASATKA, Q_BLUE_PEBBLES, Q_EXPENSIVE_WATER, Q_ASSAULT_IX }
	print("FDR Mission Board Bot Plugin Loaded - created by svinx")
end

function OnUnload()
	if fdr_quests then
		fdr_quests = nil
	end
end

function OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == FDR_1 then
		GetFDRWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == FDR_1 and not worker then
		print("Starting FDR Mission Board Bot")
		print("Note: Please have auto-sell enabled or the bot will stop when your inventory is full.")
		if HasAnyQuestsInList(fdr_quests) and not IsAnyQuestComplete(fdr_quests) then
			print("Has the MB Quest but it's not completed")
			botManager.nextMapID = FDR_1
		else
			print("Does not have a quest / quest completed")
			botManager.nextMapID = HERMALTE_PORT
		end
		print("Getting BotWorker")
		GetFDRWorker()
	end
end

function OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == FDR_1 then
		print("Stopping FDR Mission Board Bot")
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

function GetFDRWorker()
	if IsGoingToMap() then
		return
	end
	local mapID = GetMapID()
	if mapID == SAINT_HAVEN then
		worker = SaintHaven()
	elseif mapID == HERMALTE_PORT then
		worker = HermaltePort_FDR()
	elseif mapID == FDR_1 then
		worker = FloodedDownstreamRuins_1()
	elseif mapID == FDR_2 then
		worker = FloodedDownstreamRuins_2()
	elseif mapID == FDR_3 then
		worker = FloodedDownstreamRuins_3()
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
	if HasAnyQuestsInList(fdr_quests) and not IsAnyQuestComplete(fdr_quests) then
		print("Has the MB Quest but it's not completed")
		botManager.nextMapID = FDR_1
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
		if botManager.nextMapID == FDR_1 then
			GoToDungeon(botManager.nextMapID)
		else
			GoToMap(botManager.nextMapID)
		end
	end
	return bW
end

function HermaltePort_FDR()
	local bW = BotWorker('HermaltePort')
	print("Hermalte Port Script")
	if IsAnyQuestComplete(fdr_quests) then
		print("ReInit NPC = true, Has completed a quest") 
		bW:WalkTo(3747, -1012, 688) 
		bW:Wait(5000)
		bW:InitNPCXYZ(3830,-1008,582)
		bReinitNpc = true
	elseif not HasAnyQuestsInList(fdr_quests) then
		print("Does not have a quest in the list")
		bW:WalkTo(3747, -1012, 688)  
		bW:Wait(5000)
		bW:InitNPCXYZ(3830,-1008,582)
	else
		print("No quest is complete / Already has a quest")
		GoToDungeon(FDR_1)
	end
	return bW
end

function FloodedDownstreamRuins_1()
	local bW = BotWorker('34_2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-658, -43, -6696)
	bW:UseProp(354)
	bW:WalkTo(-2581, -458, -6258) 
	bW:UseProp(355)
	bW:WalkTo(-3340, -443, -6106)
	bW:WalkTo(-3424, -443, -6579)
	bW:ForwardPropTime(357, 5000)
	bW:WalkTo(-3985, -425, -3725)
	bW:WalkTo(-4039, -408, -2939)
	bW:WalkTo(-4039, -408, -2939) 
	bW:WalkTo(-4067, -416, -2247) 
	bW:KillMobs(1500)
	bW:WalkTo(-4024, -421, -1622) 
	bW:Wait(1000)
	bW:WalkTo(-4353, -426, -728) 
	bW:WalkTo(-6212, -177, -394) 
	bW:WalkTo(-6810, -82, 932)
	bW:WalkTo(-4911, -423, 1065) 
	bW:KillMobs(2000)
	bW:WalkTo(-2507, 54, 1555) 
	bW:UseProp(362)
	bW:Wait(2000)
	bW:ForwardPropTime(361, 5000)
	bW:WalkTo(-53, 359, 3975)
    bW:WalkTo(-334, 284, 4566)
	bW:WalkTo(-830, -402, 6727) 
	bW:KillMobs(2000)
	bW:WalkTo(-893, -421, 8008)
	return bW
end 

function FloodedDownstreamRuins_2()
	local bW = BotWorker('34_3A')
	bW:WalkTo(1153, -580, 1686) 
	bW:UseFDRProp("Looter Brother Ice Mage")
	bW:Wait(1000)
	bW:WalkTo(1420, -270, 3455) 
	bW:KillMobs(2000)
	bW:WalkTo(770, -281, 3441) 
	bW:WalkTo(372, -230, 3455) 
	bW:ForwardTime(1000)
	bW:WalkTo(-277, -150, 3532) 
	bW:WalkTo(-4059, 433, 3681) 
	if questManager:hasQuest(Q_BLUE_PEBBLES:GetID()) then
		bW:UseProp(439)
	end
	bW:KillMobByName("Looter Brother Ice Mage")
	bW:KillMobByName("Ruin Guardian")
	bW:KillMobs(10000)
	bW:WalkTo(-6599, 446, 3588) -- gate

	return bW
end 

function FloodedDownstreamRuins_3()
	local bW = BotWorker('34_BossA')
	bW:WalkTo(1956, -515, -86)
	bW:KillMobByName('Rouge')
	bW:KillMobByName('Ruska') -- Abyss
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end

function OnNpcDialog()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= FDR_1 then
		return
	end
	local mapID = GetMapID()
	--print("OnNpcDialog")
	if mapID == HERMALTE_PORT then
		if IsTalkingToNpc() then
			if IsDlgOption("[Lv.30] Flooded Downstream Ruins") then
				print("Choosing FDR")
				ChooseDlgOption(1)
			elseif IsDlgOption("[Normal] MapologyIX") then
				print("[Normal] MapologyIX")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Soupy Goodness") then
				print("[Hunt] Soupy Goodness")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Collect] Harori's Lost Comb") then
				print("[Collect] Harori's Lost Comb")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hard] Ascendance") then
				print("[Hard] Ascendance")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] Wanted: Matriarch Rhastka") then
				print("[Hunt] Wanted: Matriarch Rhastka")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Collect] Blue Pebbles") then
				print("[Collect] Blue Pebbles")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] Expensive Water") then
				print("[Master] Expensive Water")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] Assault IX") then
				print("[Master] Assault IX")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hidden] Flooded Downstream Ruins") then
				print("FDR")
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
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= FDR_1 then
		return
	end
	local mapID = GetMapID()
	print("In OnNpcDialogClosed")
	if mapID == HERMALTE_PORT then
		if bReinitNpc then
			local actor = actorManager:getActor(3830,-1008,582)
			InitNpcDlg(actor)
			bReinitNpc = false
		else
			GoToDungeon(FDR_1)
		end
	end
end

