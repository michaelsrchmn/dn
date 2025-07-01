-- Marian's Shrine Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('11-2A')
	bW:WalkTo(1255, -6, -813)
	bW:KillMobs(500)

	bW:WalkTo(1725, -9, -288)
	bW:KillMobs(1000)

	bW:WalkTo(1725, -9, -288)

	bW:WalkTo(1184, -10, 744)

	bW:WalkTo(-211, -11, 660)
	bW:KillMobs(2000)

	--bW:EnterGate('11-BossA')
	bW:WalkTo(-2363, -2, 1549) -- gate

	return bW
end

