-- Floating Island Beach Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('64_1A')
	--bW:Teleport(5915, -1055, -4174)
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[bW:Teleport(-5973, 705, 457)
	bW:Wait(3000)
	bW:WalkTo(-6265, 596, 1120)
	bW:KillMobs(1500)

	bW:Teleport(-5952, 659, 5360)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(-5432, 603, 6769)
	bW:WalkTo(-2845, 503, 6712)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(-1079, 73, 7402)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(-1816, -764, 9050)
	bW:Wait(1000)
	bW:KillMobs(2000)

	bW:WalkTo(-3152, -890, 10853)
	bW:Wait(5000)
	bW:KillMobs(2500)

	bW:Teleport(-7634, -1411, 9030)
	bW:Wait(1000)
	bW:WalkTo(-8088, -1463, 8571)
	bW:Wait(7000)
	bW:KillMobs(3000)

	bW:Teleport(-5808, -911, 3928)
	bW:WalkTo(-5295, -859, 3885)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:Teleport(-6643, -877, -1181)
	bW:WalkTo(-6925, -870, -1147)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:Teleport(-6064, -1197, -4795)
	bW:WalkTo(-5889, -1319, -6785)
	bW:KillMobs(2500)--]]
	
	bW:WalkTo(5880, -1060, -4207) 
	bW:MoveForward(6152, -1015, -3886)
	
	bW:Wait(2000)
	bW:WalkTo(-6003, 638, 1308) 
	bW:Wait(1500)
	bW:KillMobs(2000)
	
	bW:WalkTo(-6303, 651, 2662) 
	bW:MoveForward(-5951, 666, 5111) 
	bW:KillMobs(2000)
	
	bW:WalkTo(-5559, 636, 6676) 
	bW:MoveForward(-4410, 653, 7090) 
	bW:WalkTo(-2958, 536, 6765) 
	bW:WalkTo(-1496, 644, 6091) 
	bW:KillMobsY(2000, 60)
	bW:WalkTo(-2616, 462, 6764) 
	bW:WalkTo(-1425, 164, 6885) 
	bW:WalkTo(-934, 71, 7357) 
	bW:WalkTo(-2551, -398, 7700) 
	bW:WalkTo(-1055, -703, 8498) 
	bW:KillMobs(3000)
	bW:WalkTo(-2001, -830, 9632) 
	bW:KillMobs(1500)
	bW:Wait(2000)
	
	bW:WalkTo(-3901, -951, 11066) 
	bW:KillMobs(4000)
	
	bW:WalkTo(-6419, -1187, 9938) 
	bW:MoveForward(-7086, -1337, 9164) 
	bW:MoveForward(-9036, -1510, 7890) 
	bW:Wait(1000)
	bW:KillMobs(5000)
	
	bW:WalkTo(-7939, -1321, 5065) 
	bW:MoveForward(-7142, -1086, 4242) 
	bW:MoveForward(-5870, -922, 3899) 
	bW:MoveForward(-4639, -661, 2645) 
	bW:Wait(2000)
	bW:KillMobs(5000)
	bW:WalkTo(-4426, -537, 2083) 
	bW:WalkTo(-4421, -670, 111) 
	bW:MoveForward(-4890, -753, -442) 
	bW:WalkTo(-6376, -876, -1170) 
	bW:KillMobs(5000)
	bW:WalkTo(-6200, -817, -2425) 
	bW:MoveForward(-6284, -869, -3139) 
	bW:WalkTo(-6322, -1130, -4586) 
	bW:WalkTo(-5372, -1450, -8807) 
	bW:KillMobs(10000)
	
	return bW
end
