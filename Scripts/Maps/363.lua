-- Dark Overlord Training Camp Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('36_3A')

	bW:UseProp(843)
	--bW:WalkTo(-1025, -1219, -2261)
	bW:Teleport(-1025, -1219, -2261)
	bW:KillMobs(1000)

	--bW:WalkTo(-2191, -1240, -2094)
	bW:Teleport(-2191, -1240, -2094)
	bW:AttackProp(647)

	--bW:WalkTo(-2113, -1031, 532)
	bW:Teleport(-2113, -1031, 532)
	bW:KillMobs(1500)

	--bW:WalkTo(-5, -875, 1227)
	bW:Teleport(-5, -875, 1227)
	bW:KillMobs(1500)
	bW:AttackProp(648)
	bW:Teleport(1936, 55, -728)
	bW:KillMobs(2000)
	bW:Teleport(2963, 208, 3931)
	bW:AttackProp(654)
	bW:KillMobs(3000)

	bW:EnterGate('36_BossA')

	return bW
end
