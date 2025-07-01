-- Calderock Boss Rush
 
require "botWorker"
 
function GetBotWorker()
	local bW = BotWorker('Event_BossRushCG')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
	--bW:Wait(GetDungeonCompletionWait())
	end
	 
	bW:WalkTo(105, -34, 246) 
	bW:Wait(5000)
	 
	local i
	for i = 1, 100 do
	 
		bW:KillMobs(20000)
		bW:WalkTo(105, -34, 246) 
		bW:Wait(3000)
	 
	end
	 
	bW:WalkTo(302, -42, 215) 
	bW:UseProp(363)
	bW:Wait(10000)
	 
	return bW
end