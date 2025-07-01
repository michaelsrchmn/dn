-- Catacombs Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('3-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-3295, 0, 607)
	bW:KillMobs(1000)

	bW:WalkTo(-2125, 0, 662)
	--bW:MoveForward(-2138, 0, 1678)

	bW:WalkTo(-2138, 0, 1678)
	bW:Wait(5000)
	bW:KillMobs(1000)
	bW:Wait(5000)
	bW:WalkTo(-2122, 0, 2074) 
	bW:UseProp(328)

	bW:WalkTo(-2117, 0, 749)
	--bW:MoveForward(-2117, 0, 749)

	bW:WalkTo(-844, 0, 726)
	--bW:MoveForward(-750, 0, -59)
	
	bW:WalkTo(-750, 0, -59)
	bW:KillMobs(1000)

	bW:WalkTo(-692, 0, -801)
	bW:KillMobs(1000)
	--bW:EnterGate('3-2A')
	bW:WalkTo(695, 0, -864) -- gate
	--[[
	bW:Teleport(-2606, -3, 607) 
	bW:KillMobs(1000)
	
	bW:WalkTo(-2138, 0, 1678)
	bW:Wait(5000)
	bW:KillMobs(1000)
	bW:Wait(1000)
	bW:UseProp(328)
	bW:Teleport(-719, 0, -868) 
	bW:Wait(2500)
	bW:KillMobs(2000)--]]

  return bW
end
