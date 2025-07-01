-- Forest of Death Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('17-3A')
	bW:WalkTo(-199, -300, -2501)
	--bW:Teleport(-199, -300, -2501)
	bW:KillMobs(2000)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:WalkTo(8, -302, -2392)
	bW:Wait(2000)
	bW:UseProp(385)

	bW:WalkTo(-153, -288, -1502)

	bW:WalkTo(-1383, -293, 153)
	--bW:Teleport(-1383, -293, 153)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(-1504, -285, 310)
	bW:Wait(1000)
	bW:UseProp(383)

	--bW:UseProp(415) -- chest
	--bW:UseProp(416) -- chest

	bW:WalkTo(-2601, -264, 1445)

	--bW:Teleport(-2612, -236, 2984)
	bW:WalkTo(-2612, -236, 2984)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(3000)
	bW:Wait(1000)
	bW:UseProp(384)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:UseProp(384)
	
	bW:WalkTo(-4283, -239, 4899) -- gate

	--bW:EnterGate('17-BossA')

	return bW
end
