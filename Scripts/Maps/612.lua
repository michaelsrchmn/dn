-- Shadow of Evil Spirit Map 2
require "botWorker"
function GetBotWorker()
	local bW = BotWorker('61_BossA')
	
	bW:MoveForward(1231, -826, -2842) 
	bW:KillMobs(1500)
	
	bW:WalkTo(898, -884, -2134) 
	bW:MoveForward(511, -882, -939) 
	bW:MoveForward(680, -882, 172) 
	bW:KillMobs(4000)
	
	bW:WalkTo(760, -882, 936) 
	bW:MoveForward(612, -1094, 3158) 
	
	bW:MoveForward(666, -1288, 4669) 
	bW:KillMobs(10000)
	return bW
end