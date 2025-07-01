-- Raiders Ambush Point Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('18-BossA')
	bW:KillMobByName('Hobgoblin Syracuse')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

