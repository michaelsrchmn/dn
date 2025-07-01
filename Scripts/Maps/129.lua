-- Sleepers' Temple Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('16-BossA')
	bW:KillMobByName('Minotaur Umnodu')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

