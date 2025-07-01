-- Forest of Death Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('17-BossA')
	bW:KillMobByName('Burnessa')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
