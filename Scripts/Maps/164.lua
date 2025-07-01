-- Silent Monastery Main Hall Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('22-BossA')
	bW:KillMobByName('Blow Strange Mage Leila')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
