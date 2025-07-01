-- Ancient Temple Ruins Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('2-2A')
	bW:WalkTo(-1364,94,-1580)
	bW:KillMobs(1000)

	bW:WalkTo(539, 84, -1008)
	bW:WalkTo(1609, -317, 55)

	bW:WalkTo(880, -322, 869)
	bW:KillMobs(1000)
	bW:Finish()

	bW:WalkTo(1700, -319, 3249)
	--bW:EnterGate('2-BossA')
	--[[bW:Teleport(-872, 71, -1150)
	bW:KillMobs(1000)
	bW:Teleport(450, -322, 1432)
	bW:KillMobs(1000)
	bW:Finish()--]]

  return bW
end
