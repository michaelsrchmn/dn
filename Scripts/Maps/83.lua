-- Frost Wind Valley Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('7-BossA')
	bW:UseProp(115)
	bW:KillMobByName('Orc Baku')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

