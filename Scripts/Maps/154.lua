-- Catacombs Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('21-BossA')
	bW:KillMobByName('Spider Queen Raren')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
