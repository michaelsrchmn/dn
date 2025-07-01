-- Ancient Temple Ruins Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('2-BossA')
	bW:KillMobByName('Troll Jukanook')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
