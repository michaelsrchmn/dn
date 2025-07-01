-- Mutants Habitat

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('59_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-1987, -942, -6902) 
	bW:KillMobs(3000)
	bW:WalkTo(-250, -966, -6429) 
	bW:Wait(5000)
	bW:WalkTo(-5721, -413, 8239) 
	bW:Wait(1500)
	bW:KillMobs(1500)
	bW:Wait(5000)
	bW:KillMobs(1500)
	bW:IgnoreMobs(true)
	bW:WalkTo(-8122, -433, 7779) 
	bW:WalkTo(-8186, -428, 7088) 
	bW:AttackPropTime(670, 5000)
	bW:IgnoreMobs(false)
	bW:KillMobs(3000)
	bW:WalkTo(-10291, -368, 7598) 
	bW:Wait(5000)
	bW:IgnoreMobs(true)
	bW:WalkTo(6243, -959, 4702) 
	bW:AttackPropTime(222, 5000)
	bW:WalkTo(4213, -821, 7828) 
	bW:AttackPropTime(53, 5000)
	bW:IgnoreMobs(false)
	bW:KillMobs(5000)
	bW:WalkTo(4336, -1356, 5536) 
	bW:WalkTo(2566, -1522, 4350) 
	bW:Wait(5000)
	bW:KillMobs(10000)
	bW:Wait(5000)
	bW:KillMobs(10000)
	bW:Wait(5000)
	bW:KillMobs(10000)
	
	return bW
end