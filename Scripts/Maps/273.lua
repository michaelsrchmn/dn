-- Dark Mines Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('27_3A')
	bW:WalkTo(-4086, 313, 3528)

	bW:WalkTo(-3512, 295, 4372)
	bW:DestroyProp(125)

	bW:WalkTo(-2901, 289, 5360)
	bW:KillMobs(1000)

	bW:WalkTo(-4436, 314, 3192)

	bW:WalkTo(-3031, 287, 1508)
	bW:Wait(3000)
	bW:KillMobs(1000)

	bW:WalkTo(-1453, 293, 1222)
	bW:Wait(2000)
	bW:KillMobs(1000)

	bW:WalkTo(1134, 310, 899)
	bW:KillMobs(2000)

	bW:WalkTo(3804, 303, 578)
	bW:KillMobs(2000)

	bW:WalkTo(3804, 303, 578)
	bW:UseProp(229)
	bW:UseProp(493)

	bW:WalkTo(4464, 319, 545)

	bW:WalkTo(5364, 297, -113) 

	bW:MoveForward(5835, 163, -805) 
	bW:MoveForward(5305, -147, -1925) 
	bW:KillMobs(1000)
	bW:WalkTo(3175, -622, -3108) 
	bW:KillMobs(2500)
	bW:Wait(10000)
	bW:WalkTo(3175, -622, -3108) 
	bW:MoveForward(2900, -658, -3178) 
	--[[bW:Teleport(5077, -241, -2089)
	bW:WalkTo(5077, -241, -2089)
	bW:Wait(70000)
	bW:WalkTo(3287, -613, -3082)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(7000)

	bW:WalkTo(2900, -656, -3205)---]]
	--bW:EnterGate('27_BossA')
	return bW
end

