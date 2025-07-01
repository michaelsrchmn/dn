-- Marian's Shrine Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('11-BossA')
	bW:KillMobByName('Dragon Follower')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

