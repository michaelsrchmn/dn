-- Parelina's Resting Place Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('8-2A')
	bW:WalkTo(-2202, 22, 1350)
	--bW:Teleport(-2202, 22, 1350)
	bW:KillMobs(1000)

	bW:WalkTo(-476, 22, 1514)
	--bW:Teleport(-476, 22, 1514)
	bW:KillMobs(1000)

	bW:WalkTo(-389, 22, 381)
	--bW:Teleport(-389, 22, 381)
	bW:KillMobs(1000)

	bW:WalkTo(917, 22, 203)
	--bW:Teleport(917, 22, 203)
	bW:KillMobs(2000)

	bW:WalkTo(1999, 22, 198) -- gate

	--bW:EnterGate('8-BossA')
	
	return bW
end

