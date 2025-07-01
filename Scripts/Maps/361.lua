-- Dark Overlord Training Camp Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('36_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-3573, -1148, 996) 
	bW:MoveForward(-3253, -931, 1657) 
	bW:MoveForward(-3738, -779, 2174) 
	bW:MoveForward(-4249, -690, 1959) 
	bW:MoveForward(-4299, -618, 1479) 
	bW:MoveForward(-3992, -604, 1165) 
	bW:MoveForward(-3457, -463, 1309) 
	bW:MoveForward(-3399, -362, 1557) 
	bW:MoveForward(-3096, -436, 1506) 
	bW:MoveForward(-2320, -567, 1382) 
	bW:MoveForward(-387, -573, 1319) 
	bW:MoveForward(598, -884, 1005) 
	bW:IgnoreMobs(false)
	bW:UseProp(1176)
	bW:Wait(2000)
	bW:KillMobsY(2000, 200)
	bW:WalkTo(1248, -878, 620) 
	bW:MoveForward(2247, -697, 2099) 
	bW:MoveForward(1406, -525, 2788) 
	bW:MoveForward(941, -452, 3039) 
	bW:MoveForward(304, -211, 4330) 
	bW:Wait(1000)
	bW:UseProp(1225)
	bW:KillMobsY(2000,200)
	bW:WalkTo(827, -205, 4501) -- gate


	return bW
end
