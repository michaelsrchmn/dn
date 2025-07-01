--Nameless Tyrant Tomb Map 2 (442.lua)

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('44-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(1310, 336, 2621) 
	bW:ForwardTime(500)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-2477, 759, -1449) 
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:WalkTo(-2389, 745, -554) 
	bW:IgnoreMobs(true)
	bW:ForwardPropTime(459,5000)
	bW:WalkTo(-734, 334, 1074) 
	bW:IgnoreMobs(false)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(-184, 339, 3175) 
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:WalkTo(1310, 336, 2621) 
	bW:ForwardPropTime(267, 4000)
	return bW
end