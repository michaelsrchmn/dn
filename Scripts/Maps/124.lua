-- Forest Sanctuary Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('15-BossA')
	bW:KillMobByName('Gargoyle Twin Horn')
	bW:KillMobs(10000)

	--bW:Finish()

	return bW
end

