-- Silent Monastery Main Hall Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('22-3A')
	bW:WalkTo(-96, 0, -441)

	bW:WalkTo(-582, 0, 199)

	bW:WalkTo(-131, 0, 2510)
	bW:DestroyProp(373)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:WalkTo(-124, 0, 521)

	bW:WalkTo(1849, 0, 171)
	bW:DestroyProp(374)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:WalkTo(-1865, 0, 162)
	bW:DestroyProp(375)
	bW:Wait(3000)
	bW:KillMobs(1500)
	bW:Wait(5000)

	--bW:EnterGate('22-BossA')
	--[[bW:Teleport(-131,0,2510)
	bW:DestroyProp(373)
	bW:Wait(3000)
	bW:KillMobs(1500)
	bW:Wait(20000)
	
	bW:Teleport(1849,0,171)
	bW:DestroyProp(374)
	bW:Wait(3000)
	bW:KillMobs(1500)
	bW:Wait(20000)
	
	bW:Teleport(-1865, 0, 162)
	bW:DestroyProp(375)
	bW:Wait(3000)
	bW:KillMobs(1500)
	bW:Wait(5000)--]]

	return bW
end
