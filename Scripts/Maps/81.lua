-- Frost Wind Valley Map 1

require "botWorker"

function GetBotWorker()
	local bW = BotWorker('7-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--bW:Teleport(91, -783, -584) 
	bW:WalkTo(184, -744, -1429)
	bW:KillMobs(1000)

	bW:WalkTo(-23, -724, 1088)
	--bW:Teleport(185, -756, 1741)
	bW:KillMobs(2000)

	bW:WalkTo(2154, -609, 2514) -- gate
	--bW:EnterGate('7-2A')

	return bW
end
