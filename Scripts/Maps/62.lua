-- Catacombs Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('3-2A')
	bW:WalkTo(16, 0, -1054)
	bW:UseProp(241)

	bW:WalkTo(993, 0, -1053)
	bW:KillMobs(1000)

	bW:WalkTo(2563, 0, -1064)
	bW:UseProp(368)
	bW:KillMobs(2000)
	bW:UseProp(350)

	bW:WalkTo(-1549, 0, -926)
	bW:UseProp(366)
	bW:KillMobs(1000)

	bW:WalkTo(-1763, 0, 886)

	bW:WalkTo(-3280, 0, 829)
	bW:KillMobs(1500)
	bW:UseProp(351)
	bW:WalkTo(-3281, 0, 234) 
	bW:ForwardPropTime(417, 2000)

	--bW:EnterGate('3-BossA')

	--[[bW:UseProp(241)
	bW:Teleport(1188, 0, -1029) 
	bW:KillMobs(750)
	bW:Teleport(2747, 0, -1019) 
	bW:UseProp(368)
	bW:KillMobs(1500)
	bW:UseProp(350)
	bW:Teleport(-1549, 0, -926)
	bW:UseProp(366)
	bW:KillMobs(1000)
	bW:Teleport(-3280, 0, 829)
	bW:KillMobs(1500)
	bW:UseProp(351)--]]
	
  return bW
end