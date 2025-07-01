-- Death Basin Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('24-BossA')
	bW:KillMobByName('Scarlet Scythe Reaper')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
