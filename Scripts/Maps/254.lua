-- Sanctuary Core Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('25-BossA')
	bW:KillMobByName('Shadow Dark Scream')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
