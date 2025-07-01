-- Frost Wind Forest Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('10-2A')
	bW:WalkTo(-1171, -268, -1289)
	--bW:Teleport(-1171, -268, -1289)
	bW:KillMobs(2000)

	bW:WalkTo(1489, -497, -694)

	bW:WalkTo(1233, -659, 688)
	--bW:Teleport(1233, -659, 688)
	bW:KillMobs(2000)

	--bW:EnterGate('10-BossA')
	bW:WalkTo(1529, -665, 2849) 

	return bW
end
