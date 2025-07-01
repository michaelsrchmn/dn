-- Catacombs Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('40_BossA')
	bW:KillMobByName('Chompy')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
