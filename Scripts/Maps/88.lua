-- Parelina's Resting Place Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('8-BossA')
	bW:KillMobByName('Troll Jukuruku')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

