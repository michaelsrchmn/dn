-- River Ruins Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('32_2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:UseProp(1176)
	bW:WalkTo(-5022, -29, 969)
	bW:KillMobs(1000)

	bW:WalkTo(-2930, -9, -363)
	bW:Wait(3000)
	bW:KillMobs(1000)

	--bW:WalkTo(-2697, 2, 87) -- stuck possiblity
	bW:WalkTo(-2942, -22, -733)  
	bW:MoveForward(-1760, -30, 1162)
	--bW:WalkTo(-2151, -17, 731)

	bW:WalkTo(-915, -30, 1370) -- stuck possbility
	bW:KillMobs(800)

	bW:WalkTo(-267, -30, 1977) -- strange movement

	bW:WalkTo(672, -16, 818)
	bW:KillMobs(800)

	bW:WalkTo(2371, 10, -184)
	bW:MoveForward(2956, 9, 34) 
	bW:KillMobs(1500)

	bW:WalkTo(4426, -29, 822)

	bW:WalkTo(5569, -22, 454)
	bW:KillMobs(2000)

	bW:WalkTo(6999, -25, 921) -- gate
	--[[bW:Teleport(-5022, -29, 969)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(-2930, -9, -363)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(-915, -30, 1370)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(672, -16, 818)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(2371, 10, -184)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(5569, -22, 454)
	bW:Wait(1000)
	bW:KillMobs(2000)--]]
	--bW:EnterGate('32_3A')

	return bW
end
