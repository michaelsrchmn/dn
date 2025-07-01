--Gates to Death City Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('42-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(-2212, -933, -2919)
	bW:KillMobs(2000)
	bW:Teleport(977, -1288, -4961) 
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Teleport(2873, -1288, -2772) 
	bW:Wait(2000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-2250, -916, -2498) 
	bW:KillMobs(2000)
	bW:WalkTo(-1645, -919, -3560) 
	bW:UseProp(156)
	bW:WalkTo(-1924, -938, -3264) 
	bW:Wait(7000)
	bW:WalkTo(-1416, -919, -3417) 
	bW:WalkTo(581, -1288, -5392) 
	bW:KillMobs(2000)
	bW:WalkTo(1635, -1288, -4230) 
	bW:WalkTo(2285, -1288, -3465) 
	bW:KillMobs(2000)
	bW:WalkTo(3330, -1288, -2312) 
	return bW
end