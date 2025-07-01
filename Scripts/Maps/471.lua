-- Ruins of Lost Time Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('47_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-524, -17, -1581)
	bW:KillMobs(1000)
	bW:Wait(3000)

	bW:Teleport(295, -93, -3415)
	bW:Wait(1000)
	bW:WalkTo(-238, 178, -4018)
	bW:Wait(1000)

	bW:WalkTo(-941, 269, -5518)
	bW:Teleport(-1053, 626, -3876)
	bW:KillMobs(1000)
	bW:UseProp(101)

	bW:Teleport(-792, 635, -7101)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:UseProp(96)

	bW:Teleport(-632, 239, -5698)
	bW:Wait(1000)
	bW:KillMobs(1500)

	--bW:EnterGate('47_3A')

	return bW
end
