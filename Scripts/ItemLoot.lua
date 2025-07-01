local LOOT_MAX_DISTANCE = 150
local LOOT_DELAY = 150
local LOOT_DELAY_RC = 700
local UPDATE_DROP_LIST_DELAY = 2000
local UPDATE_DROP_LIST_RC_DELAY = 3000
local updateDropListTimer = 0
local lastLootTime = 0
local drops

function OnLoad()
	print("Item Pickup Plugin Loaded - created by svinx")
	drops = {}
end

function OnUnload()
	drops = nil
end

function OnChangeMap()
	drops = {}
	updateDropListTimer = 0
	lastLootTime = 0
end

function GetDropList()
	local drop_list = {}
	local count = dropManager.iCount
	if count == 0 then
		return nil
	else
		for i = 0, count-1, 1 do
			local drop = dropManager:getDrop(i)
			if drop ~= nil then
				table.insert(drop_list, drop)
			end
		end
		return drop_list
	end
end

function OnTick()
	if not botManager.isEnabled then
		return
	end
	if profileManager.bItemPickup then
		if updateDropListTimer < GetTickCount() then
			drops = GetDropList()
			if profileManager.botType == BOT_RC then
				updateDropListTimer = GetTickCount() + UPDATE_DROP_LIST_RC_DELAY
				lastLootTime = GetTickCount() + LOOT_DELAY_RC
			else
				updateDropListTimer = GetTickCount() + UPDATE_DROP_LIST_DELAY
				lastLootTime = GetTickCount() + LOOT_DELAY
			end
		end
		if drops == nil then
			return
		end
		local count = #drops
		if count > 0 then
			if lastLootTime == 0 then
				if profileManager.botType == BOT_RC then
					lastLootTime = GetTickCount() + LOOT_DELAY_RC
				else
					lastLootTime = GetTickCount() + LOOT_DELAY
				end
			elseif lastLootTime < GetTickCount() then
				for i, drop in ipairs(drops) do
					if drop ~= nil then
						local distance = actorSelf:getDistance(drop.pos)
						if not profileManager.bOnlyPickupGold and drop.id ~= 0 and inventoryManager.slotsAvailable > 0 and distance <= LOOT_MAX_DISTANCE and not botManager:IsItemLootFiltered(drop) then
							--print("getting item")
							LootItem(drop)
							table.remove(drops,i)
							lastLootTime = 0
							break
						elseif drop.id == 0 and distance <= LOOT_MAX_DISTANCE then
							--print("getting gold")
							LootItem(drop)
							table.remove(drops,i)
							lastLootTime = 0
							break
						end
					end
				end
			end
		else
			lastLootTime = 0
		end
	end
end
