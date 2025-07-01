-- Ruins of Lost Time Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('47_2A')
	bW:Teleport(7215, -304, -1504)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:UseProp(261)
	bW:Teleport(6265, 99, 879)
	bW:KillMobs(2000)
	bW:UseProp(568)
	bW:Teleport(4991, 270, 3725)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:UseProp(259)

	bW:EnterGate('47_3A')

	return bW
end
