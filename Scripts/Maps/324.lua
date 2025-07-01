-- River Ruins Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('32_BossA')
	--bW:KillMobByName('Lizardmen Dreen Scales')
	bW:KillMobs(2000)
	bW:Wait(5000)
	bW:UseProp(1038)
	bW:WalkTo(-5037, 237, 2381)
	bW:MoveForward(-4686, 279, 2379) 
	bW:Wait(5000)
	bW:KillMobs(3000)
	bW:Wait(3000)
	bW:WalkTo(-2427, -543, 5761) 
	bW:MoveForward(-834, -516, 5668) 
	bW:Wait(2000)
	bW:KillMobs(3000)

  return bW
end

