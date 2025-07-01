-- Catacombs Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('36_BossA')
	bW:WalkTo(-181, -1794, 784)
	bW:Wait(5000)
	bW:KillMobByName('Jakobo')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
