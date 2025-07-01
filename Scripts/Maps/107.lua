-- Orc Base Camp Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('12-BossA')
	bW:UseProp(118)
	bW:KillMobByName('Assault Captain Cleave Dregark')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

