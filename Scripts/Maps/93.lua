-- Silent Monastery Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('9-BossA')
	--bW:KillMobsByName('Minotaur Umbaba')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

