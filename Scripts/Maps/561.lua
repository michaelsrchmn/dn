require "botWorker"
function GetBotWorker()
	local bW = BotWorker('56_1A')
	bW:WalkTo(32, -177, -6726) 
	bW:Wait(5000)
	bW:KillMobs(1500)
	
	bW:WalkTo(-1, -181, -4900) 
	bW:Wait(5000)
	bW:KillMobs(1500)
	
	bW:DestroyProp(981)
	bW:WalkTo(-121, -172, -2161)
	--bW:DestroyProp(987)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	
	bW:WalkTo(-906, -183, -785) --]]
	bW:MoveForward(-1013, -183, -480)
	bW:Wait(2000)
	bW:MoveForward(-1938, -183, 2209)
	return bW
end