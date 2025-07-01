require 'botWorker'
require 'basic'
require 'maps'
require 'Quest'
require 'questlist'
local worker = nil
local bReinitNpc = false
local dok_quests = nil

function OnLoad()
	print("DOK Mission Board Bot Plugin Loaded - created by svinx")
	dok_quests = { Q_MAPOLOGY_IV, Q_DO_NOT_QUIT_FANCLUB, Q_INVASION_PLAN, Q_SCOUTING_DARK_OVERLORD, Q_WANTED_FLAME_WING, Q_ESCAPE_PLAN, Q_WAR_MATERIALS, Q_TOTAL_ATTACK_IV }
end

function OnUnload()
	if dok_quests then
		dok_quests = nil
	end
end

function OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DOK_1 then
		GetDOKWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DOK_1 and not worker then
		print("Starting DOK Mission Board Bot")
		print("Note: Please have auto-sell enabled or the bot will stop when your inventory is full.")
		if HasAnyQuestsInList(dok_quests) and not IsAnyQuestComplete(dok_quests) then
			print("Has the MB Quest but it's not completed")
			botManager.nextMapID = DOK_1
		else
			print("Does not have a quest / quest completed")
			botManager.nextMapID = FOOTHILLS_OF_BLACK_MOUNTAIN
		end
		print("Getting BotWorker")
		GetDOKWorker()
	end
end

function OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_MB and profileManager.mbDungeonID == DOK_1 then
		print("Stopping DOK Mission Board Bot")
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

function GetDOKWorker()
	if IsGoingToMap() then
		return
	end
	--print("In GetDOKWorker")
	local mapID = GetMapID()
	if mapID == SAINT_HAVEN then
		worker = SaintHaven()
	elseif mapID == FOOTHILLS_OF_BLACK_MOUNTAIN then
		worker = FoothillsOfBlackMountain_DOK()
	elseif mapID == DOK_1 then
		worker = DarkOverlordKeep_1()
	elseif mapID == DOK_2 then
		worker = DarkOverlordKeep_2()
	elseif mapID == DOK_3 then
		worker = DarkOverlordKeep_3()
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
	if HasAnyQuestsInList(dok_quests) and not IsAnyQuestComplete(dok_quests) then
		print("Has the MB Quest but it's not completed")
		botManager.nextMapID = DOK_1
	else
		print("Does not have a quest / quest completed")
		botManager.nextMapID = FOOTHILLS_OF_BLACK_MOUNTAIN
	end
	if NeedsRepair() or profileManager.bAutoSell then
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
		if botManager.nextMapID == DOK_1 then
			GoToDungeon(botManager.nextMapID)
		else
			GoToMap(botManager.nextMapID)
		end
	end
	return bW
end

function FoothillsOfBlackMountain_DOK()
	local bW = BotWorker('SkirtOfBlackMountain')
	print("Foothills of Black Mountain Script")
	if IsAnyQuestComplete(dok_quests) then
		print("ReInit NPC = true, Has completed a quest")
		--bW:Teleport(835, -1364, 1523) 
		bW:WalkTo(835, -1364, 1523) 
		bW:Wait(5000)
		bW:InitNPCXYZ(801,-1334,1836)
		bReinitNpc = true
	elseif not HasAnyQuestsInList(dok_quests) then
		print("Does not have a quest in the list")
		--bW:Teleport(-324, -2423, -2290)
		bW:WalkTo(835, -1364, 1523) 
		bW:Wait(5000)
		bW:InitNPCXYZ(801,-1334,1836)
	else
		print("No quest is complete / Already has a quest")
		GoToDungeon(DOK_1)
	end
	return bW
end

function DarkOverlordKeep_1()
	local bW = BotWorker('28_1A')
	if profileManager.bDungeonCompletionAB then
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(147, 127,-1610)
	bW:KillMobs(1500)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:WalkTo(-1237, 196, -1673)

	bW:WalkTo(-3115, 435, -1477)
	
	bW:AddMobToIgnoreList(1, 'Worshiper Armored Hound')
	bW:WalkTo(-3344, 718, -74)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:RemoveMobFromIgnoreList(1)

	bW:WalkTo(-1890, 1019, 197)
	--bW:KillMobs(800)

	bW:WalkTo(-1170, 1065, 214)
	bW:KillMobs(800)
	bW:Wait(2000)
	bW:KillMobs(800)

	bW:IgnoreMobs(true)
	bW:WalkTo(-1067, 1066, 725)
	bW:WalkTo(-1004, 1062, 1916)
	bW:WalkTo(-980, 1074, 2746) 
	bW:DestroyProp(551)
	bW:IgnoreMobs(false)
	bW:KillMobs(3000)
	bW:Wait(3000)
	bW:KillMobs(3000)
	bW:Wait(3000)
	bW:KillMobs(3000)
	bW:WalkTo(-1383, 1081, 3006) -- gate
	
	return bW
end

function DarkOverlordKeep_2()
	local bW = BotWorker('28_3A')
	bW:WalkTo(-1090, -738, -5407)
	bW:Wait(1000)
	if questManager:hasQuest(Q_ESCAPE_PLAN:GetID()) then
		bW:UseProp(334)
		bW:Wait(1000)
		bW:UseProp(335)
		bW:Wait(1000)
		bW:UseProp(332)
		bW:Wait(1000)
		bW:UseProp(333)
		bW:Wait(1000)
	end
	bW:WalkTo(-1191, -1354, -1614)
	bW:Wait(1000)

	bW:WalkTo(-1191, -1354, -1614)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	
	bW:WalkTo(-1280, -1361, -1353) -- center
	
	bW:WalkTo(-1202, -896, 1494) -- gate

	return bW
end

function DarkOverlordKeep_3()
	local bW = BotWorker('28_BossA')
	bW:AddMobToIgnoreList(1, 'Gargoyle')
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:Wait(500)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:RemoveMobFromIgnoreList(1)
	bW:KillMobs(10000)
	bW:KillMobByName('Gargoyle')

	return bW
end

function OnNpcDialog()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DOK_1 then
		return
	end
	local mapID = GetMapID()
	--print("OnNpcDialog")
	if mapID == FOOTHILLS_OF_BLACK_MOUNTAIN then
		if IsTalkingToNpc() then
			if IsDlgOption("[Lv.26] Dark Overlord Keep") then
				print("Choosing DOK")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Normal] Mapology IV") then
				print("[Normal] Mapology IV")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt] You May Not Leave The Fanclub!!") then
				print("[Hunt] You May Not Leave The Fanclub!!")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Invasion Plan") then
				print("[Acquire] Invasion Plan")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hard]Scouting of the Dark Overlord") then
				print("[Hard]Scouting of the Dark Overlord")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hunt]Wanted: Flame Wing") then
				print("[Hunt]Wanted: Flame Wing")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Acquire] Escape Plan") then
				print("[Acquire] Escape Plan")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] War materials") then
				print("[Master] War materials")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Master] Total Attack IV") then
				print("[Master] Total Attack IV")
				ChooseDlgOption(0)
			elseif IsDlgOption("[Hidden] Dark Overlord Keep") then
				print("[Hidden] Dark Overlord Keep")
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
			elseif IsDlgOption("Dark Overlord Keep, clear") then
				print("Clear Dark Overlord Keep")
				ChooseDlgOption(0)
			elseif IsDlgOption("Defeat 1 Worshiper Ogre Barbarian") then
				print("Defeat 1 Worshiper Ogre Barbarian")
				ChooseDlgOption(0)
			elseif IsDlgOption("Collect 1 Invasion Plans") then
				print("Collect 1 Invasion Plan")
				ChooseDlgOption(0)
			elseif IsDlgOption("Defeat Boss Firewing") then
				print("Defeat Boss Firewing")
				ChooseDlgOption(0)
			elseif IsDlgOption("Collect 3 Black Steel Keys") then
				print("Collect 3 Black Steel Keys")
				ChooseDlgOption(0)
			else
				print("Close Dialog")
				CloseNpcDlg()
			end
		end
	end
end

function OnNpcDialogClosed()
	if not botManager.isEnabled or profileManager.botType ~= BOT_MB or profileManager.mbDungeonID ~= DOK_1 then
		return
	end
	local mapID = GetMapID()
	print("In OnNpcDialogClosed")
	if mapID == FOOTHILLS_OF_BLACK_MOUNTAIN then
		if bReinitNpc then
			local actor = actorManager:getActor(801,-1334,1836)
			InitNpcDlg(actor)
			bReinitNpc = false
		else
			GoToDungeon(DOK_1)
		end
	end
end