-- Frost Wind Valley Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('7-2A')
	bW:WalkTo(-754, -365, -2224)
	--bW:Teleport(-742, -373, -2088) 
	bW:KillMobs(2000)

	bW:WalkTo(409, -446, -1418)
	--bW:Teleport(1027, -399, -1100) 
	bW:KillMobs(2000)

	--bW:EnterGate('7-BossA')
	bW:WalkTo(3749, -296, -946) -- gate

	return bW
end

