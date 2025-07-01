-- Church Ruins Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('19-BossA')
	bW:KillMobByName('Hobfrey')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
