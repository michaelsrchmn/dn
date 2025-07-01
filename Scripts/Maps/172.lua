-- Road of No Return Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('23-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-108, -1577, 3629)
	bW:DestroyProp(334)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:DestroyProp(335)

	bW:WalkTo(940, -1594, 3728)

	bW:WalkTo(1839, -1543, 2514)

	bW:WalkTo(2635, -1379, 541)
	bW:UseProp(438)
	bW:DestroyProp(343)
	bW:KillMobs(2000)
	
	bW:WalkTo(2794, -1303, -992) -- gate

	--bW:EnterGate('23-3A')
	
	--[[bW:Teleport(334, -1591, 3680)
	bW:DestroyProp(334)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:Teleport(2635, -1379, 541)
	bW:UseProp(438)
	bW:DestroyProp(343)
	bW:KillMobs(2000)--]]

	return bW
end
