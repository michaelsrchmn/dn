-- East Ancient Armory Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('55_1A')
	--bW:WalkTo(-397, -404, -4451)
	--bW:Wait(5000)
	--bW:KillMobs(1500)

	--bW:WalkTo(-402, -404, -2613)

	--bW:WalkTo(-380, 204, 1206)
	--bW:Wait(5000)
	--bW:KillMobs(2000)

	--bW:WalkTo(-380, 204, 1206)

	--bW:Teleport(-473, 216, 3680)
	--bW:Wait(5000)
	--bW:UseProp(272)
	--bW:Wait(5000)
	--bW:KillMobs(2000)

	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:Teleport(-1602, 213, 2850)
	bW:WalkTo(-1505, 212, 3106)
	bW:Wait(5000)
	bW:KillMobs(2000)

	bW:Teleport(-1772, 209, 4563)
	bW:WalkTo(-1499, 210, 4878)
	bW:Wait(5000)
	bW:KillMobs(2000)

	bW:Teleport(136, 208, 5128)
	bW:WalkTo(375, 209, 5024)
	bW:Wait(5000)
	bW:KillMobs(2000)

	bW:Teleport(825, 206, 3898)
	bW:WalkTo(765, 214, 3646)
	bW:Wait(5000)
	bW:KillMobs(2000)

	return bW
end
