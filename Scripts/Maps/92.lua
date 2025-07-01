-- Silent Monastery Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('9-2A')
	bW:WalkTo(-36, 0, -1039)
	bW:UseProp(241)
	--bW:WalkTo(-36, 0, -1039)

	bW:WalkTo(1025, 0, -1023)
	bW:KillMobs(1000)

	bW:UseProp(394)
	bW:WalkTo(2474, 0, -1006)
	bW:KillMobs(1000)
	bW:UseProp(373)

	bW:WalkTo(-1432, -9, -1089)
	bW:UseProp(348)
	bW:KillMobs(1000)

	bW:WalkTo(-1816, -10, 784)

	bW:WalkTo(-3245, -10, 812)
	bW:KillMobs(1000)
	bW:UseProp(371)

	bW:WalkTo(-3268, 43, -433) -- gate
	--bW:WalkTo(
	--bW:EnterGate('9-BossA')
	--[[bW:UseProp(241)
	bW:Teleport(1106, 0, -1086) 
	bW:KillMobs(1000)
	
	bW:UseProp(394)
	bW:Teleport(2644, 0, -1016) 
	bW:KillMobs(1000)
	bW:UseProp(373)
	
	bW:Teleport(-1432, -9, -1089)
	bW:UseProp(348)
	bW:KillMobs(1000)
	
	bW:Teleport(-3245, -10, 812)
	bW:KillMobs(1000)
	bW:UseProp(371)--]]
	return bW
end 