-- Ghost Town of Isolated Forest Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('45_2A')
	
	bW:WalkTo(1820, -216, 2497)  
	bW:Wait(3000)
	bW:WalkTo(2679, -202, 1693) 
	bW:DestroyProp(1241)
	bW:Wait(10000)
	bW:KillMobs(1500)
	bW:Wait(2000)
	bW:KillMobs(1500)
	bW:Wait(2000)
	bW:KillMobs(1500)
	bW:Wait(2000)
	bW:KillMobs(1500)
	bW:WalkTo(2424, -219, 1806) 
	bW:UseProp(1098)
	bW:DestroyProp(1241)
	bW:DestroyProp(851)
	bW:WalkTo(2823, -183, 1056) 
	bW:Wait(2000)
	bW:KillMobs(800)
	bW:WalkTo(3529, -225, 810) 
	bW:WalkTo(4303, -224, 1089) 
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:WalkTo(3370, -206, 2229) 
	bW:DestroyProp(1219)
	bW:WalkTo(2498, -217, 2621) 
	bW:WalkTo(2871, -98, 3090) -- gate
	--[[bW:DestroyProp(1309)
	bW:DestroyProp(996)
	bW:DestroyProp(901)
	bW:DestroyProp(969)
	bW:DestroyProp(1252)
	bW:DestroyProp(1253)--]]
	
	return bW
end