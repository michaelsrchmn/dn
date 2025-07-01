-- Flooded Downstream Ruins Map 3 (344.lua)

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('34_BossA')
	bW:WalkTo(1956, -515, -86)
	bW:KillMobByName('Rouge')
	bW:KillMobByName('Ruska') -- Abyss
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end