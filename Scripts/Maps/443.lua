--Nameless Tyrant Tomb Map 3 (443.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('44-3A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(77, -451, 4908)
	bW:ForwardTime(500)
	bW:Wait(2000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-1570, -1272, -4839)
	bW:KillMobs(2000)
	bW:WalkTo(776, -798, -1318) 
	bW:Wait(2000)
	bW:WalkTo(708, -706, -561) 
	bW:KillMobs(2000)
	bW:WalkTo(708, -706, -561) 
	bW:ForwardPropTime(2, 3000)
	bW:WalkTo(20, -644, 2743) 
	bW:ForwardPropTime(369, 5000)
	bW:KillMobs(2000)
	bW:WalkTo(701, -466, 4690) 
	bW:ForwardPropTime(113, 4000)
	return bW
end