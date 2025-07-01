-- Sunken Cargo Vessel 3 (463.lua)

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('46_BossA')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(-3020, -233, 687) 
	bW:ForwardTime(500)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-3020, -233, 687) 
	bW:KillMobs(2000)
	return bW
end