-- Fortress of the Dark Overlord Army Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('43_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--bW:UseProp(1264)
	--bW:UseProp(1263)
	bW:WalkTo(-218, -358, -5685)
	bW:KillMobs(3000)

	bW:WalkTo(-202, -283, -4364)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(4111, -363, -4069)
	bW:Wait(2000)
	bW:KillMobs(3000)

	bW:WalkTo(4957, -355, -3007)

	bW:WalkTo(5716, -390, -442)

	bW:WalkTo(5490, -331, 457)
	bW:KillMobs(3000)

	bW:WalkTo(5757, -366, 155)

	bW:WalkTo(4970, -355, -2980)
	bW:Wait(2000)
	bW:KillMobs(3000)

	bW:WalkTo(4321, -364, -4115)

	bW:WalkTo(4178, -358, -4114) 
	bW:MoveForward(331, -339, -4279) 
	bW:MoveForward(-913, -272, -3780) 
	bW:MoveForward(-2129, -110, -4387) 
	bW:MoveForward(-2475, 28, -4336) 
	bW:MoveForward(-3824, 203, -4789) 
	bW:WalkTo(-4415, 173, -4521) 
	bW:KillMobs(2000)
	bW:Wait(1500)
	bW:WalkTo(-4764, 205, -3946) 
	bW:MoveForward(-5084, 93, -3467) 
	bW:MoveForward(-5278, 8, -3295) 
	bW:MoveForward(-5301, -22, -2936) 
	bW:MoveForward(-5498, -75, -2756) 
	bW:MoveForward(-5702, -232, -2161) 
	bW:WalkTo(-6346, -347, 149) 
	bW:KillMobs(2000)
	bW:Wait(1500)
	bW:WalkTo(-6521, -353, 201) 
	bW:WalkTo(-6055, -343, -1615) 
	bW:MoveForward(-5358, -29, -2902) 
	bW:MoveForward(-4969, 179, -3708) 
	bW:MoveForward(-4418, 191, -4076) 
	bW:KillMobs(1500)
	bW:MoveForward(-3978, 183, -4685) 
	bW:MoveForward(-2895, 129, -4599) 
	bW:MoveForward(-1036, -270, -3927) 
	bW:WalkTo(-134, -287, -4452) 
	bW:KillMobs(2000)
	bW:Wait(5000)
	bW:WalkTo(-427, -275, -3445) 
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:WalkTo(-431, -159, -2864) -- gate
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(3000)
	bW:Wait(5000)

	--bW:EnterGate('43_BossA')

	return bW
end
