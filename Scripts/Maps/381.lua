-- Road to Death City Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('38_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:Teleport(-498, 592, 1277)
	bW:KillMobs(1500)
	bW:UseProp(135)
	bW:Wait(5000)
	bW:Teleport(-1599, 151, 2105)
	bW:WalkTo(-1203, -15, 3441)
	bW:Teleport(137, 25, 4526)
	bW:KillMobs(1500)
	bW:WalkTo(1083, 16, 3401)
	bW:WalkTo(1407, -183, 2197)
	bW:KillMobs(1000)
	bW:WalkTo(1433, -289, 885)
	bW:KillMobs(2500)

	return bW
end
