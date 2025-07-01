-- Ghost Town of Isolated Forest

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('45_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	
	bW:WalkTo(-818, -571, -798) 
	bW:Wait(4000)
	bW:KillMobs(1000)
	bW:WalkTo(-679, -581, -830) 
	bW:WalkTo(-747, -196, 687) 
	bW:WalkTo(-2043, -43, 1667) 
	bW:WalkTo(-1484, 51, 2107) 
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:WalkTo(-61, -319, 446) 
	bW:DestroyProp(116)
	bW:DestroyProp(941)
	bW:DestroyProp(942)
	bW:WalkTo(1411, -606, 140) 
	bW:Wait(3000)
	bW:KillMobs(1500)
	bW:WalkTo(2506, -638, 321) -- gate
	
	return bW
end