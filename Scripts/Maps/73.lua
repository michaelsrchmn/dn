-- Ancient Temple Excavation Site Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('5-BossA')
	--bW:KillMobByName('Shaman Brethren Karapacio')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
