-- Catacombs Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('3-BossA')
	bW:KillMobByName('Minotaur Umrak')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
