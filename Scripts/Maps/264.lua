-- Prayer's Resting Place Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('26-BossA')

	--bW:WalkTo(-868, 2871, -909)
	bW:Teleport(-1501, 2862, -872) 
	bW:Wait(2000)
	bW:Teleport(-291, 2871, -870) 
	bW:Wait(5000)
	bW:KillMobByName('Manticore Keruru')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
