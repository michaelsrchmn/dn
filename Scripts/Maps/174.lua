-- Road of No Return Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('23-BossA')
	bW:KillMobByName('Ogre Chubaka')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
