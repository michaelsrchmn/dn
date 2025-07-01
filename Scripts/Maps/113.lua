-- Raiders Den Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('13-3A')
	bW:WalkTo(-1997, -1364, 1292)
	bW:DestroyProp(600)

	bW:WalkTo(-1447, -1371, 1712)
	bW:KillMobs(1000)

	bW:WalkTo(50, -1176, 2260)
	bW:KillMobs(1000)

	bW:WalkTo(-1407, -1361, 1838)

	bW:WalkTo(-2536, -1228, 348)
	bW:KillMobs(1000)

	bW:WalkTo(-1211, -887, -1796)
	bW:KillMobs(2000)

	bW:WalkTo(356, -1080, -2540)
	bW:KillMobs(2000)

	bW:WalkTo(-1095, -875, -2202)

	bW:WalkTo(-1960, -1013, -1163)
	bW:KillMobs(10000)

	bW:WalkTo(-2271, -1252, 417) -- gate
	--bW:EnterGate('13-BossA')--]]
	--[[bW:Teleport(-1289, -883, -2051) 
	bW:KillMobs(1500)
	
	bW:Teleport(389, -1083, -2481) 
	bW:KillMobs(1500)

	bW:Teleport(-1325, -1356, 1784) 
	bW:KillMobs(1500)
	
	bW:Teleport(237, -1167, 2163) 
	bW:KillMobs(1500)
	
	bW:Teleport(-2539, -1241, 475) 
	bW:KillMobs(1500)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:Teleport(271, -1076, -2568) 
	bW:KillMobs(2000)--]]
	return bW
end
