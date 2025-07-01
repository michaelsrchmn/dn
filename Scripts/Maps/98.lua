-- Frost Wind Forest Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('10-BossA')
	bW:KillMobByName('Goblin Boss Jyakuku')
	bW:KillMobs(5000)

	return bW
end

