-- River Ruins Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('32_3A')
	--[[bW:WalkTo(-5933, -52, 3098)
	bW:KillMobs(1000)

	bW:Teleport(3709, -30, 3147)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:Teleport(-54, -30, 4323)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(1634, -30, 3917)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:UseProp(1167)
	bW:Wait(3000)

	bW:Teleport(1566, 6, 6382)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:Wait(2000)
	bW:UseProp(1199)

	bW:Teleport(3242, 2, 2570)
	bW:Wait(3000)

	bW:KillMobs(3000)--]]
	bW:WalkTo(-5933, -52, 3098)
	bW:KillMobs(1000)

	bW:WalkTo(-5933, -52, 3098)

	bW:WalkTo(-5311, -42, 3420)

	bW:WalkTo(-4805, -6, 3757)

	bW:WalkTo(-3709, -30, 3147)
	bW:KillMobs(1500)

	bW:WalkTo(-2690, -30, 3349) 

	--bW:WalkTo(-1159, -30, 3929)

	bW:MoveForward(-122, -30, 4182) 
	--bW:WalkTo(-54, -30, 4323)
	bW:KillMobs(1000)

	bW:WalkTo(-61, -30, 4299) 
	bW:WalkTo(987, -30, 4186)

	bW:WalkTo(1634, -30, 3917)
	bW:KillMobs(1000)
	bW:UseProp(1167)

	bW:WalkTo(2342, -30, 4885)

	bW:WalkTo(1566, 6, 6382)
	bW:KillMobs(1500)
	bW:UseProp(1199)

	bW:WalkTo(1650, 6, 6160) 
	bW:MoveForward(2404, -27, 5030) 	

	--bW:WalkTo(3019, -30, 2717) 
	bW:MoveForward(2013, -29, 3346) 

	--bW:WalkTo(GetPropPos(1200))
	--bW:MoveForward(3184, 2, 2633) 
	bW:MoveForward(3172, 0, 2633) 
	bW:TeleportV(GetPropPos(1200))

	bW:Wait(5000)
	bW:KillMobs(3000)
	bW:WalkTo(3752, 632, 179) --gate
	--bW:EnterGate('32_BossA')

	return bW
end
