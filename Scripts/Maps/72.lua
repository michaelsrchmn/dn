-- Ancient Temple Excavation Site Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('5-2A')
	bW:WalkTo(1216,-330,1624)
	--bW:Teleport(1122, -322, 949) 
	bW:KillMobs(1000)

	bW:WalkTo(1587, -316, 60)

	bW:WalkTo(630, 73, -1009)

	bW:WalkTo(-1095, 60, -939)
	--bW:Teleport(-1768, 77, -941)
	bW:KillMobs(1500)

	--bW:EnterGate('5-BossA')
	bW:WalkTo(-2366, 101, -3381)  -- gate

  return bW
end
