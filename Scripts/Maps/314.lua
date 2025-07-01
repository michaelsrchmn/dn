-- Abandoned Welton Hollow Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('31_BossA')
	bW:KillMobByName('Stonewing')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
