-- Shadow Forest Core Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('4-BossA')

	bW:KillMobByName('Goblin Boss Jyaja')
	bW:KillMobs(10000)
	bW:Finish()
	return bW
end
