-- Catacombs Hall Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('20-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(1298, 0, 3175)
	bW:KillMobs(2000)

	bW:WalkTo(1147, -9, 957)

	bW:WalkTo(208, 0, 961)
	bW:KillMobs(1000)
	bW:UseProp(442)
	bW:WalkTo(-1774, 0, 1008) 
	bW:KillMobs(2000)
	
	bW:WalkTo(-1818, 0, 2654) 
	--[[bW:Teleport(208, 0, 961)
	bW:KillMobs(800)
	bW:Wait(3000)
	bW:UseProp(442)

	bW:WalkTo(-1636, 0, 1059)
	bW:KillMobs(3000)
	bW:Wait(5000)
	bW:KillMobs(3000)

	bW:EnterGate('20-3A')--]]

	return bW
end
