-- Encroached Temple Ruins Boss Map

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('62_BossA')
	bW:WalkTo(180, 100, -2187) 
	bW:MoveForward(236, 78, -463) 
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobs(10000)
	bW:Wait(3000)
	bW:KillMobs(10000)
	
	return bW
end