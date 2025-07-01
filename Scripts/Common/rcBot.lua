require 'botWorker'
require 'maps'

class 'RCBot'
function RCBot:__init(_townID, _dungeonID, _dungeonName, _dEntranceID, _dEntranceName, _botName, _message)
	self.townID = _townID
	self.dungeonID = _dungeonID
	self.dungeonName = _dungeonName
	self.dEntranceID = _dEntranceID
	self.dEntranceName = _dEntranceName
	self.pickupRange = 0
	self.botName = _botName
	self.message = _message
	self.propID = 0
	self.propX = 0
	self.propY = 0
	self.propZ = 0
	self.worker = nil
	self.bSpawnRoyalChest = false
	self.rCount = 0
	self.nAttempts = 0
	print(self.message)
end

function RCBot:SetProp(_propID, _propX, _propY, _propZ)
	self.propID = _propID
	self.propX = _propX
	self.propY = _propY
	self.propZ = _propZ
end

function RCBot:OnChangeMap()
	if botManager.isEnabled and profileManager.botType == BOT_RC and profileManager.rcDungeonID == self.dungeonID then
		print(string.format("%s OnChangeMap", self.botName))
		self:GetBotWorker()
	end
end

function RCBot:OnStartBot()
	if botManager.isEnabled and profileManager.botType == BOT_RC and profileManager.rcDungeonID == self.dungeonID then
		print(string.format("Starting %s RC Bot", self.botName))
		self:GetBotWorker()
	end
end

function RCBot:OnStopBot()
	if not botManager.isEnabled and profileManager.botType == BOT_RC and profileManager.rcDungeonID == self.dungeonID then
		print(string.format("Stopping %s RC Bot", self.botName))
		if self.worker then
			self.worker:delete()
			self.worker = nil
		end
		self.bSpawnRoyalChest = false
		self.rCount = 0
		self.nAttempts = 0
	end
end

function RCBot:OnTick()
	if self.worker then
		self.worker:tick()
	end
end

function RCBot:OnSpawnProp()
	if not botManager.isEnabled or not profileManager.botType == BOT_RC or not GetMapID() == self.dungeonID then
		return
	end
	local propID = GetLastPropSpawn()
	if propID == self.propID then
		self.bSpawnRoyalChest = true
	end
end

function RCBot:GetBotWorker()
	local mapID = GetMapID()
	--print(mapID)
	if IsGoingToMap() then
		print("RCBot::On the way to map")
		return nil
	elseif mapID == self.dungeonID then
		print(string.format("RCBot::dungeon worker %i", self.dungeonID))
		self.worker = self:DungeonWorker()
	elseif mapID == self.dEntranceID then
		print(string.format("RCBot::entrance worker %i", self.dEntranceID))
		self.worker = self:EntranceWorker()
	elseif mapID == self.townID then
		print(string.format("RCBot::town worker %i", self.townID))
		if mapID == PRAIRIE_TOWN then
			self.worker = self:PrairieTown()
		elseif mapID == MANA_RIDGE then
			self.worker = self:ManaRidge()
		elseif mapID == CALDEROCK_VILLAGE then
			self.worker = self:CalderockVillage()
		elseif mapID == SAINT_HAVEN then
			self.worker = self:SaintHaven()
		elseif mapID == LOTUS_MARSH then
			self.worker = self:LotusMarsh()
		end
	else
		print(string.format("RCBot::Going to starting town map %i", self.townID))
		GoToMap(self.townID)
	end
end

function RCBot:DungeonWorker()
	local bW = BotWorker(self.dungeonName)
	if self.bSpawnRoyalChest then
		print("Getting Royal Chest")
		self.rCount = self.rCount + 1
		self.bSpawnRoyalChest = false
		bW:UseProp(self.propID)
		bW:Teleport(self.propX, self.propY, self.propZ)
		--bW:WalkTo(3065, 0, 3675)
		bW:Wait(2000)
		bW:LootItems(1500)
		bW:ReturnToStageEntrance()
	else
		print("Returning to stage entrance")
		--print(self.dungeonName)
		bW:ReturnToStageEntrance()
	end
	self.nAttempts = self.nAttempts + 1
	print(string.format("Found %i/%i Royal Chests",self.rCount, self.nAttempts))
	return bW
end

function RCBot:EntranceWorker()
	local bW = BotWorker(self.dEntranceName)
	if inventoryManager.slotsAvailable == 0 and botManager.bAutoSell then
		print("Going back to town")
		ReturnToTown()
	else
		--print("Going to dungeon")
		bW:GoToDungeonID(self.dungeonID)
	end	
	return bW
end

function RCBot:PrairieTown()
	local bW = BotWorker('PrairieTown')
	if profileManager.bAutoSell then
		print("RCBot::Selling items turned on, going to sell items")
		bW:WalkTo(783, -1617, 1666)
		bW:Wait(5000)
		bW:InitNPC("Merchant Doris")
	else
		print("RCBot::Selling items turned off, going to dungeon")
		GoToDungeon(self.dungeonID)
	end
	return bW
end

function RCBot:ManaRidge()
	local bW = BotWorker('ManaRidge')
	if profileManager.bAutoSell then
		print("RCBot::Selling items turned on, going to sell items")
		bW:WalkTo(-974, -375, 277)
		bW:Wait(5000)
		bW:InitNPC("Merchant Jenny")
	else
		print("RCBot::Selling items turned off, going to dungeon")
		GoToDungeon(self.dungeonID)
	end

	return bW
end

function RCBot:CalderockVillage()
	local bW = BotWorker('CataractGateway')
	if profileManager.bAutoSell then
		print("RCBot::Selling items turned on, going to sell items")
		bW:WalkTo(-4039, -1909, 2175)
		bW:Wait(5000)
		bW:InitNPC("Merchant May")
	else
		print("RCBot::Selling items turned off, going to dungeon")
		GoToDungeon(self.dungeonID)
	end
	return bW
end

function RCBot:SaintHaven()
	local bW = BotWorker('SaintHaven')
	if profileManager.bAutoSell then
		print("RCBot::Selling items turned on, going to sell items")
		bW:Teleport(651, 1181, 9068)
		bW:Wait(5000)
		bW:InitNPC("Merchant Kelly")
	else
		print("RCBot::Selling items turned off, going to dungeon")
		GoToDungeon(self.dungeonID)
	end
	return bW
end

function RCBot:LotusMarsh()
	local bW = BotWorker('LotusMarshTown')
	if profileManager.bAutoSell then
		print("RCBot::Selling items turned on, going to sell items")
		bW:WalkTo(4803, -30, 1572)
		bW:Wait(5000)
		bW:InitNPC("Merchant Lucita")
	else
		print("RCBot::Selling items turned off, going to dungeon")
		GoToDungeon(self.dungeonID)
	end

	return bW
end
