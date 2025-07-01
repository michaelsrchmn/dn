-- Raiders Den Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('13-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-840, -1269, 545)

	bW:WalkTo(-873, -1193, -1002)
	bW:KillMobs(1000)

	bW:WalkTo(-216, -1185, -1581)
	bW:KillMobs(1000)

	bW:WalkTo(842, -1149, -1153)
	bW:KillMobs(1000)

	bW:WalkTo(1013, -1127, 1150)
	bW:KillMobs(2000)

	bW:WalkTo(2246, -1127, 1917) -- gate
	--bW:EnterGate('13-3A')

	--[[bW:Teleport(-1025, -1223, 227) 
	bW:WalkTo(-907,-1193,-1185)
	bW:KillMobs(1500)
	bW:Wait(1000)
	bW:KillMobs(1500)
	
	bW:WalkTo(471, -1149, -1363) 
	bW:Wait(2000)
	bW:Teleport(922, -1149, -1077) 
	bW:Wait(500)
	bW:KillMobs(1500)
	
	bW:Teleport(746, -1127, 1398)
	bW:KillMobs(2000)--]]
	return bW
end
