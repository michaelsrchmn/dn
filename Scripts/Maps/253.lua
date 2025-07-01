-- Sanctuary Core Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('25-3A')

	bW:WalkTo(-30, -298, -1408)

	bW:WalkTo(238, -298, -888)
	bW:UseProp(780)
	bW:Wait(3000)
	bW:KillMobs(3000)
	bW:Wait(3000)
	bW:KillMobs(3000)
	bW:Wait(3000)
	bW:KillMobs(3000)
	bW:UseProp(44)
	bW:UseProp(45)
	bW:UseProp(46)
	bW:UseProp(580)

	bW:WalkTo(-72, -298, -184)

	bW:WalkTo(-57, -298, 1058)
	bW:KillMobs(2000)

	bW:WalkTo(-54, -298, 1237)
	bW:WalkTo(-17, 363, 3339) -- gate 

	--bW:EnterGate('25-BossA')

	return bW
end
