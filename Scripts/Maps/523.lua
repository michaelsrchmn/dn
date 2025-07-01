-- Ancient Library Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('37_BossA')
	bW:WalkTo(-70, -788, -826)
	bW:KillMobByName('Rune Tiger Lord')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
