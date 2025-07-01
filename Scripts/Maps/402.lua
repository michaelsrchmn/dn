-- Dark Overlord Tower Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('40-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-2012, -518, -2740)
	bW:KillMobs(1500)
	bW:Wait(5000)

	bW:WalkTo(-1977, -518, -2368) 
	bW:MoveForward(-2575, -514, -1826)  
	bW:AttackProp(260)
	bW:MoveForward(-2102, -518, -2272) 

	bW:WalkTo(-1910, -523, -2691)

	bW:WalkTo(-484, -514, -2345)

	bW:WalkTo(150, -496, -2838)

	bW:WalkTo(1450, -330, -2972)
	bW:KillMobs(1000)
	bW:WalkTo(2033, -276, -3043) 

	--bW:WalkTo(1891, 307, -919)
	bW:MoveForward(1891, 307, -919)
	bW:KillMobs(1000)

	--bW:WalkTo(361, 385, -211)
	bW:WalkTo(1642, 351, -534) 
	bW:MoveForward(383, 385, -198) 
	bW:MoveForward(150, 397, -149) 
	bW:AttackProp(261)

	bW:MoveForward(630, 389, -287) 
	bW:MoveForward(1204, 404, 157) 
	bW:Wait(5000)
	bW:MoveForward(1355, 385, 1756) 
	--bW:WalkTo(1287, 402, 1529)

	bW:WalkTo(1792, 403, 3734)
	bW:KillMobs(2500)
	
	bW:WalkTo(3495, 433, 4769) 

	--bW:EnterGate('40-3A')

	return bW
end
