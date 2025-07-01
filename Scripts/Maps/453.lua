-- Ghost Town of Isolated Forest Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('45_BossA')
	bW:KillMobByName('Wisp Giant')
	bW:KillMobs(5000)
	
	return bW
end