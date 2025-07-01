-- Ancient Temple Excavation Site Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('29-BossA')
	bW:KillMobByName('Ogre Crushy')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
