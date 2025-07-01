-- Sigh Canyon Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('14-3A')
	bW:WalkTo(-1788, 30, -2181)
	bW:KillMobs(1000)

	bW:WalkTo(-482, -12, -1688)
	bW:KillMobs(1000)

	bW:WalkTo(2484, -23, -2790)
	bW:KillMobs(1000)
	bW:UseProp(298)

	bW:WalkTo(869, 33, -414)
	bW:WalkTo(2484, -23, -2790)
	bW:KillMobs(800)

	bW:WalkTo(797, 238, 626)
	bW:KillMobs(1000)

	bW:WalkTo(214, -27, 3193) -- gate
	--bW:EnterGate('14-BossA')

	return bW
end
