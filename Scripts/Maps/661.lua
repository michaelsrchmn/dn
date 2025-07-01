-- Closed Ice Valley Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('66_1A')
	AddMobToIgnoreList(0, 'Isolated Gargoyle Bomber')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-403,-1635,-600)
	bW:KillMobs(5000)
	bW:Wait(2000)
	bW:KillMobs(5000)
	bW:Wait(5000)
	bW:KillMobs(5000)
	
	bW:WalkTo(-208, -1449, 1267)
	bW:KillMobs(5000)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:RemoveMobFromIgnoreList(0)
	--bW:KillMobByName('Isolated Gargoyle Bomber')
	bW:KillMobs(2000)
	bW:Wait(1000)
	
	bW:KillMobs(5000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(-135, -1452, 2120) 
	bW:ForwardPropTime(82, 5000)
	
	return bW
end