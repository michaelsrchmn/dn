-- Dried Marissa Spring Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('35_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--bW:UseProp(1499)
	--bW:WalkTo(-401, 203, -6528)
	--bW:Wait(3000)
	--bW:KillMobs(2000)

	--bW:WalkTo(-273, 187, -4237)

	--bW:WalkTo(1122, 406, -1799)
	--bW:KillMobs(2000)

	--bW:WalkTo(297, 276, 194)
	--bW:KillMobs(2000)

	--bW:WalkTo(-639, 178, 1751)

	--bW:WalkTo(-274, 183, 2355)
	--bW:DestroyProp(1500)
	--bW:DestroyProp(1502)
	--bW:DestroyProp(1501)
	--bW:DestroyProp(1503)
	--bW:DestroyProp(1504)
	--bW:DestroyProp(1507)
	--bW:DestroyProp(1512)
	--bW:KillMobs(2000)

	--bW:WalkTo(-1435, 182, 4654)
	--bW:DestroyProp(1513)
	--bW:DestroyProp(1514)

	--bW:WalkTo(-2502, 961, 2674)
	--bW:KillMobs(2000)

	--bW:WalkTo(-1422, 969, 2054)

	--bW:WalkTo(-578, 974, -1155)
	--bW:KillMobs(2000)
	bW:IgnoreMobs(true)
	bW:WalkTo(-327, 203, -6358) 
	bW:WalkTo(-201, 184, -4193) 
	bW:MoveForward(868, 246, -3314) 
	bW:MoveForward(1183, 404, -2054) 
	bW:MoveForward(686, 392, -349) 
	bW:MoveForward(-606, 180, 1781) 
	bW:MoveForward(-268, 183, 2339) 
	bW:DestroyProp(1500)
	bW:DestroyProp(1502)
	bW:DestroyProp(1501)
	bW:DestroyProp(1503)
	bW:DestroyProp(1504)
	bW:DestroyProp(1507)
	bW:MoveForward(-550, 139, 4712) 
	bW:MoveForward(-1482, 185, 4681) 
	bW:DestroyProp(1513)
	bW:DestroyProp(1514)
	bW:MoveForward(-2946, 507, 4494) 
	bW:MoveForward(-3415, 728, 3398) 
	bW:MoveForward(-3044, 932, 2736) 
	bW:WalkTo(-1488, 962, 2412) 
	bW:MoveForward(-812, 959, -383) 
	bW:WalkTo(-568, 974, -1706) 
	bW:UseProp(1554) -- RC
	bW:IgnoreMobs(false)
	bW:KillMobsY(1500, 100)
	bW:UseProp(1554) -- RC
	bW:WalkTo(-1137, 974, -1563) 
	bW:MoveForward(-1812, 385, -1047) 
	bW:WalkTo(-2855, 404, -125) 
	bW:MoveForward(-5015, 446, -1037) 
	bW:Wait(5000)
	bW:MoveForward(-4257, 399, -769) 
	bW:Wait(2000)
	bW:KillMobByName('Follower Greed Wrath')
	bW:KillMobs(2000)
	--bW:WalkTo(
	--[[bW:Teleport(-5767, 404, -874)
	bW:Wait(5000)
	bW:WalkTo(-5191, 418, -931)
	bW:Wait(5000)
	bW:KillMobByName('Follower Greed Wrath')
	bW:KillMobs(2000)
	bW:Wait(3000)--]]

	bW:EnterGate('35_3A')

	return bW
end
