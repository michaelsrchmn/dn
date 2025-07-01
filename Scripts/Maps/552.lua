-- East Ancient Armory Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('55_2A')
	--bW:UseProp(1181) -- maybe 277
	--bW:UseProp(1179)
	bW:Teleport(7267, -474, -3068)
	bW:WalkTo(6700, -465, -2780)
	bW:KillMobByName('Guardian Lamia Protector')
	bW:KillMobs(2000)
	bW:WalkTo(6769, -465, -4321)
	bW:Wait(2000)
	bW:Teleport(691, 257, 5481)
	bW:Wait(2000)
	bW:WalkTo(754, 257, 5985)
	bW:EnterGate('55_BossA')

	return bW
end
