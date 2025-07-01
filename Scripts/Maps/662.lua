-- Closed Ice Valley Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('66_BossA')
	bW:UseProp(156)
	bW:KillMobByName('Troll Zuchret')	
	bW:Finish()
	
	return bW
end
