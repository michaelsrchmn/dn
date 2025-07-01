-- Sigh Canyon Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('14-BossA')
	--bW:KillMobsByName('Coldtime Harpy')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
