-- Forsaken Islet Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('30_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[bW:UseProp(654)
	bW:UseProp(654)
	bW:UseProp(1485)
	bW:UseProp(1485)
	bW:UseProp(1516)
	bW:UseProp(1516)
	bW:Wait(2000)
	bW:RepeatDungeon()--]]
	bW:WalkTo(-6103, -1363, -7346)
	bW:KillMobs(1500)

	bW:WalkTo(-5668, -1266, -5473)

	bW:WalkTo(-6355, -1096, -4366)
	bW:KillMobs(200)

	bW:WalkTo(-6350, -1071, -4251)
	bW:KillMobs(200)

	bW:WalkTo(-6264, -1013, -3970)
	bW:KillMobs(1000)

	bW:WalkTo(-6393, -875, -1306)
	bW:Wait(2000)
	bW:KillMobs(1500)

	bW:WalkTo(-8759, -926, -84)
	bW:KillMobs(2000)

	bW:WalkTo(-6395, -874, -1332)

	bW:WalkTo(-5661, -839, -952)

	bW:WalkTo(-4253, -605, 612)
	bW:KillMobs(1500)

	bW:MoveForward(-5043, -869, 4085) 
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:MoveForward(-7330, -1114, 4265) 
	bW:MoveForward(-8471, -1366, 6168) 
	bW:KillMobs(2500)

	--bW:WalkTo(-7245, -1127, 4350) 
	--bW:MoveForward(-8780, -1413, 6329) 
	bW:KillMobs(2500)
	bW:WalkTo(-6629, -1199, 9780)
	bW:KillMobs(1500)

	bW:WalkTo(-5299, -1030, 11047)
	bW:KillMobs(2000)

	bW:WalkTo(-2706, -875, 10763)

	bW:WalkTo(-2305, -827, 9491)
	bW:KillMobs(1000)

	bW:WalkTo(-1425, -680, 8314)
	bW:DestroyProp(522)

	bW:WalkTo(-2823, -407, 7943)
	bW:KillMobs(500)

	bW:WalkTo(-1079, 71, 7353)
	bW:KillMobs(500)

	bW:WalkTo(-1827, 284, 6781)
	bW:KillMobs(3000)

	bW:WalkTo(-4458, 655, 7015)

	bW:WalkTo(-5599, 634, 6595)

	bW:WalkTo(-5941, 663, 5718)
	bW:KillMobs(1500)
	bW:DestroyProp(1607)

	bW:WalkTo(-6388, 614, 2002)
	bW:KillMobByName('Sticky Thorn')
	bW:KillMobs(2000)

	return bW
end

