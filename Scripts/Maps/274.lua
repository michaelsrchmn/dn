-- Silent Monastery Main Hall Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('27_BossA')
	bW:KillMobByName('Sulfur Hurrgak')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
