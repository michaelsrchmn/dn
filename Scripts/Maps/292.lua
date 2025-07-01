-- Collapsed Mine Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('29-2A')
	bW:WalkTo(-4288, 556, -1779)

	bW:WalkTo(-2590, 162, -2376)
	bW:KillMobs(2000)

	bW:WalkTo(-152, -17, -1148)
	bW:KillMobs(2000)

	bW:WalkTo(2049, -12, 831)

	bW:WalkTo(1550, -17, 2609)
	bW:KillMobs(1000)
	bW:Wait(2000)

	--bW:Teleport(3388, -845, 4090)
	bW:WalkTo(2072, -11, 3184)
	bW:WalkTo(2591, 15, 3730) 
	bW:MoveForward(3050, -847, 4252) 
	bW:KillMobs(2000)
	bW:UseProp(267)
	bW:Wait(8000)
	bW:WalkTo(1652, -863, 5252) -- gate
	--bW:EnterGate('29-BossA')

	return bW
end
