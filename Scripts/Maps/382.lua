-- Road to Death City Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('38_2A')
	bW:UseProp(330)
	bW:UseProp(562)
	bW:UseProp(95)
	bW:WalkTo(247, 0, -3714)
	bW:KillMobs(2000)

	bW:WalkTo(-200, 0, -2639)
	bW:Wait(3000)
	bW:UseProp(326)
	bW:Wait(5000)

	bW:UseProp(166)
	bW:Teleport(-168, -8, -424)
	bW:KillMobs(2000)
	bW:EnterGate('38_BossA')

	return bW
end
