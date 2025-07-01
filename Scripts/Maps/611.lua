-- Shadow of Evil Spirit Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('61_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	
	bW:WalkTo(-3318, -514, -3510) 
	bW:MoveForward(-2938, -533, -2225) 
	bW:KillMobs(2000)
	bW:WalkTo(-2183, -514, -2200) 
	bW:WalkTo(-1678, -330, -413) 
	bW:Wait(1000)
	bW:KillMobs(2500)
	bW:WalkTo(-2056, -404, 552) 
	bW:Wait(1000)
	bW:KillMobs(2500)
	bW:WalkTo(-1807, -404, 743) 
	bW:Wait(1000)
	bW:KillMobs(2500)
	bW:WalkTo(-1421, -465, 1458) 
	bW:Wait(1000)
	bW:KillMobs(1500)
	bW:WalkTo(-1476, -754, 3311) 
	bW:WalkTo(967, -713, 3919) 
	bW:KillMobs(2500)
	bW:WalkTo(1799, -803, 4650) 
	
	return bW
	
end
	