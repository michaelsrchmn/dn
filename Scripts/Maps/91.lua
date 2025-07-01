-- Silent Monastery Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('9-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-3303, 0, 531)
	bW:KillMobs(1000)

	bW:WalkTo(-2129, 0, 626)
	bW:KillMobs(1000)

	bW:WalkTo(-2134, 0, 1620)

	bW:Wait(5000)
	bW:KillMobs(1000)
	bW:UseProp(282)

	bW:WalkTo(-2129, 0, 626)

	bW:WalkTo(-981, 0, 561)

	bW:WalkTo(-684, 0, -389)
	bW:KillMobs(2000)

	bW:WalkTo(662, 6, -925) -- gate

	--bW:EnterGate('9-2A')
	--[[
	
	bW:Teleport(-2204, 0, 662) 
	bW:KillMobs(1000)
	
	bW:WalkTo(-2135, 0, 1736) 
	bW:Wait(2000)
	bW:KillMobs(1000)
	bW:UseProp(282)
	bW:Wait(2000)
	
	bW:Teleport(-767, 0, 122)  
	bW:KillMobs(4000)--]]
	return bW
end

