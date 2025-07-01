require 'Quest'

local MAX_INT = 4294967295
local VK_F2 = 0x71
local VK_F3 = 0x72
local VK_F4 = 0x73

function OnLoad()	

end

function GetDistanceSqr(p1,p2)
    return (p1.x - p2.x) ^ 2 + ((p1.y) - (p2.y)) ^ 2 + (p1.z - p2.z) ^ 2
end

function GetDistance(p1,p2)
    return math.sqrt(GetDistanceSqr(p1,p2))
end

function MoveSelf(vPos)
	--print("WalkTo")
	if actorSelf:getDistance(vPos) < 60 then
		ResetMoveTo()
		return true
	end
	--print("Before Aim At")
	--AimAt(vPos)
	--print("After Aim At")
	actorSelf:MoveTo(vPos)
	--print("After MoveTo")
	return false
end

function MoveSelfToMob(pos)
	if actorSelf:getDistance(pos) < 150 then
		ResetMoveTo()
		return true
	end
	--AimAt(pos)
	actorSelf:MoveTo(pos)
	return false
end

function MoveSelfToDrop(pos)
	if actorSelf:getDistance(pos) < 150 then
		ResetMoveTo()
		return true
	end
	--AimAt(pos)
	actorSelf:MoveTo(pos)
	return false
end

function MoveSelfToProp(pos)
	if actorSelf:getDistance(pos) < 100 then
		ResetMoveTo()
		return true
	end
	actorSelf:MoveTo(pos)
	return false
end
--[[function NewMoveSelf()
	local vPos = actorSelf.nextPos
	if actorSelf:getDistance(vPos) < 20 then
		actorSelf:MoveForward(false)
		return true
	end
	AimAt(vPos)
	actorSelf:MoveForward(vPos)
	return false
end--]]

function MoveForward(vPos)
	if actorSelf:getDistance(vPos) < 75 then
		actorSelf:MoveForward(false)
		return true
	end
	AimAt(vPos)
	--print("setting move forwarD")
	actorSelf:MoveForward(true)
	return false
end

function GetLowerHpMob(range)
    local tmp = nil
    local count = actorManager.iCount
    for i = 0, count-1, 1 do
        local actor = actorManager:getActor(i)
        if actor ~= nil and actor.isMob and actorSelf:getDistance(actor.pos) <= range and (tmp == nil or actor.hp < tmp.hp) then
          tmp = actor
        end
    end
    return tmp
end

function GetNearestMob(range)
    local nc  = nil
    local smallest_dist = range
    local count = actorManager.iCount
	--print("GetNearestMob")
    for i = 0, count-1, 1 do
        local actor = actorManager:getActor(i)
		--print("Getting actor...")
		--DrawText(string.format("i:%i",i),20,60)
        if actor ~= nil and actor.isMob == true and actor.hp > 0 and not IsMobIgnored(actor.name) then
			--print("Actor is mob")
            local d = actorSelf:getDistance(actor.pos)
            if d <= smallest_dist then
                nc = actor
                smallest_dist = d
            end
        end
    end
    return nc
end

function GetNearestMobByName(name, range)
    local nc  = nil
    local smallest_dist = range
    local count = actorManager.iCount
	--print("GetNearestMob")
    for i = 0, count-1, 1 do
        local actor = actorManager:getActor(i)
		--print("Getting actor...")
		--DrawText(string.format("i:%i",i),20,60)
        if actor ~= nil and actor.isMob == true and actor.hp > 0 and actor.name == name and not IsMobIgnored(actor.name) then
			--print("Actor is mob")
            local d = actorSelf:getDistance(actor.pos)
            if d <= smallest_dist then
                nc = actor
                smallest_dist = d
            end
        end
    end
    return nc
end
function GetNearestMobY(range, maxY)
	local nc  = nil
    local smallest_dist = range
    local count = actorManager.iCount
	--print("GetNearestMob")
    for i = 0, count-1, 1 do
        local actor = actorManager:getActor(i)
		--print("Getting actor...")
		--DrawText(string.format("i:%i",i),20,60)
        if actor ~= nil and actor.isMob == true and actor.hp > 0 and not IsMobIgnored(actor.name) then
			--print("Actor is mob")
            local d = actorSelf:getDistance(actor.pos)
			local dY = math.abs(actorSelf.y - actor.y)
            if d <= smallest_dist and dY <= maxY then
                nc = actor
                smallest_dist = d
            end
        end
    end
    return nc
end

function GetNearestItem(range)
	if not profileManager.bItemPickup then
		return nil
	end
    local nc  = nil
    local smallest_dist = range
    local count = dropManager.iCount
    for i = 0, count-1, 1 do
        local drop = dropManager:getDrop(i)
		--DrawText(string.format("i:%i",i),20,60)
        if drop ~= nil and not botManager:IsItemLootFiltered(drop) then
			if not profileManager.bOnlyPickupGold and drop.id ~= 0 and drop.id ~= -1 and inventoryManager.slotsAvailable > 0 then
				local d = actorSelf:getDistance(drop.pos)
				if d <= smallest_dist then
					nc = drop
					smallest_dist = d
				end
			elseif drop.id == 0 then
				local d = actorSelf:getDistance(drop.pos)
				if d <= smallest_dist then
					nc = drop
					smallest_dist = d
				end
			end
        end
    end
    return nc
end


function GetFarthestMob()
    local fc  = nil
    local biggest_dist = -1
    local count = actorManager.iCount
    for i = 0, count-1, 1 do
        local actor = actorManager:GetActor(i)
        if  self:check_if_target(actor)  then
            local d =  actorSelf:getDistance(actor.pos)
            if d<=self.range and d>biggest_dist then
                fc = actor
                biggest_dist = d
            end
        end
    end
    return fc
end

skillTimer = 0
function DoSkills()
	if not profileManager.bUseSkills then
		return
	end
	if skillTimer == 0 then
		skillTimer = GetTickCount()
	end
	if skillTimer <= GetTickCount() then
		skillTimer = GetTickCount() + 200
		local count = skillManager.iCount
		--print(string.format("Skill Count %i",count))
		for i = 0,count-1, 1 do
			local skill = skillManager:GetSkill(i)
			if skill ~= nil and skill.cooldownTime > 0 and skill.cooldownTimeLeft == 0 then
				actorSelf:UseSkill(skill.id)
			end
		end
	end
end

function PointAndShoot(vPos)
	if actorSelf:getDistance(vPos) > 30 then
		AimAt(vPos)
	end
	UseSkills()
	Attack()
end

function PointAndShootActor(target)
	if actorSelf:getDistance(target.pos) > 30 then
		AimAt(target)
	end
	UseSkills()
	Attack()
end

function Point(vPos)
	AimAt(vPos)
end

function IsAnyQuestComplete(questList)
	for i, dnQuest in ipairs(questList) do
		if dnQuest:IsCompleted() then
			return true
		end
	end
	return false
end

function HasAnyQuestsInList(questList)
	for i, dnQuest in ipairs(questList) do
		if dnQuest:HasQuest() then
			return true
		end
	end
	return false
end

function IsPointInArea(point, smallest_x, largest_x, smallest_z, largest_z)
	if point.x >= smallest_x and point.x <= largest_x and point.z >= smallest_z and point.z <= largest_z then
		return true
	end
	return false
end