-- Dark Tower Magic Institute Map 1 (152.lua)

require "botWorker"
function GetBotWorker()
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