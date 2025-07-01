-- Dried Marissa Spring Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('35_BossA')
	bW:MoveForward(-2070, 1706, -3924) 
	bW:MoveForward(-2440, 1754, -3160) 
	bW:MoveForward(-1992, 1783, -2649) 
	bW:MoveForward(-992, 1791, -2616) 
	bW:KillMobByName('Wraith Red Eyes')
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobByName('Wraith Red Eyes')
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobByName('Wraith Red Eyes')
	bW:KillMobs(10000)
	bW:Wait(3000)
	--bW:UseProp(437) -- mission board quest ??

  return bW
end
