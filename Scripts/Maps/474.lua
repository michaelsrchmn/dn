-- Spirit Grave Tomb Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('37_3A')
	bW:UseProp(688)
	bW:UseProp(367)
	bW:UseProp(614)
	bW:Teleport(-190, 45, 937)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:EnterGate('37_BossA')

	return bW
end
