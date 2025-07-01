-- Dark Overlord Training Camp Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('36_2A')
	bW:WalkTo(-493, -384, -5804) 
	bW:MoveForward(-958, -386, -5194) 
	bW:MoveForward(-1341, -409, -4846) 
	bW:MoveForward(-1482, -504, -4433) 
	bW:MoveForward(-2275, -484, -3666) 
	bW:KillMobsY(1000, 200)
	bW:WalkTo(-2557, -620, -3374) 
	bW:MoveForward(-2293, -851, -1794) 
	bW:MoveForward(-2347, -851, -1317) 
	bW:AttackProp(517)
	bW:Wait(1500)
	bW:AttackProp(517)
	bW:Wait(1500)
	bW:AttackProp(517)
	bW:Wait(1500)
	bW:AttackProp(517)
	bW:KillMobsY(1000, 60)
	bW:WalkTo(-1828, -851, -1891) 
	bW:MoveForward(-1388, -914, -2053) 
	bW:KillMobs(2000)

	return bW
end
