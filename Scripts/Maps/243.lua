-- Death Basin Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('24-3A')
	bW:WalkTo(-2125, 39, -782)
	bW:Wait(2000)
	bW:KillMobs(1000)

	bW:WalkTo(-1866, 13, -499)

	bW:WalkTo(-1158, -148, -1011)

	bW:WalkTo(-117, -353, -2107)
	bW:KillMobs(1000)

	bW:WalkTo(-60, -417, -1460)
	bW:KillMobs(1000)

	bW:WalkTo(-535, -498, -716)

	bW:WalkTo(-575, -493, -697)

	bW:WalkTo(-598, -698, 338)

	bW:WalkTo(-723, -825, 805)
	bW:KillMobs(1000)

	bW:WalkTo(-989, -934, 1723)

	bW:WalkTo(8, -967, 2101)

	bW:WalkTo(916, -989, 913)

	bW:WalkTo(2146, -969, -874)
	bW:KillMobs(1500)

	bW:WalkTo(2643, -966, -1285)
	bW:UseProp(505)
	bW:Wait(3000)

	bW:WalkTo(3139, -956, -1557)

	bW:WalkTo(2540, -968, -1330)

	bW:WalkTo(1778, -969, -198)

	bW:WalkTo(1348, -980, 750)
	bW:KillMobs(2000)

	bW:WalkTo(2655, -1003, 2697)
	bW:UseProp(503)
	bW:Wait(5000)

	bW:WalkTo(2108, -1004, 2000)
	bW:Wait(3000)
	bW:KillMobs(3000)

	bW:WalkTo(2943, -1002, 2825)
	
	bW:WalkTo(2977, -1002, 2759) -- gate

	return bW
end
