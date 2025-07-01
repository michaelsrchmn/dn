-- Prayer's Resting Place Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('26-3A')
	bW:WalkTo(-53, -127, -2605)

	bW:WalkTo(2954, -120, -2686) 
	--bW:Teleport(2774, -123, 2679)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:Wait(5000)
	bW:UseProp(402)

	bW:WalkTo(-122, -123, -2633)
	--bW:Teleport(-122, -123, -2633)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(406)

	bW:WalkTo(-64, 167, 1251)
	--bW:Teleport(-64, 167, 1251)
	bW:Wait(1000)
	bW:KillMobs(2000)

	bW:WalkTo(-64, 167, 1251)

	bW:WalkTo(-64, 462, 3674)
	--bW:Teleport(-64, 462, 3674)
	bW:Wait(1000)
	bW:WalkTo(-56, 473, 3968) -- gate

	--bW:EnterGate('26-BossA')
	return bW
end

