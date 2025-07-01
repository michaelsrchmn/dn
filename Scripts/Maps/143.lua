-- Church Ruins Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('19-3A')
	bW:WalkTo(-1058, -712, 257)
	bW:KillMobs(1500)

	bW:WalkTo(-1592, -706, 568)

	bW:WalkTo(-3032, -701, 617)
	bW:KillMobs(2000)
	bW:DestroyProp(259)
	bW:KillMobs(2000)
	bW:DestroyProp(258)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:UseProp(232)

	bW:WalkTo(-2400, -701, 549)

	bW:WalkTo(-16, -712, 564)
	bW:KillMobs(1000)
	bW:Wait(5000)
	bW:KillMobs(1000)

	bW:WalkTo(251, -712, 567)

	bW:WalkTo(-299, -712, 576)
	bW:KillMobs(1000)

	bW:WalkTo(1370, -704, 666)
	bW:KillMobs(2000)
	bW:DestroyProp(260)
	bW:KillMobs(2000)
	bW:DestroyProp(261)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:WalkTo(3635, -701, 574) -- gate
	--bW:EnterGate('19-BossA')

	return bW
end
