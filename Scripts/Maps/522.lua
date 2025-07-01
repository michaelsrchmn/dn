-- Ancient Library Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('52_2A')
	--bW:UseProp(453)
	--bW:UseProp(633)
	--bW:UseProp(650)
	bW:Teleport(-1, -440, 2944)

	bW:EnterGate('52_BossA')

	return bW
end
