-- Frost Wind Forest Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('10-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(1048, -622, -1523)

	bW:WalkTo(2034, -586, -632)
	--bW:Teleport(2034, -586, -632)
	bW:KillMobs(2000)

	bW:WalkTo(514, -651, 633)
	--bW:Teleport(514, -651, 633)
	bW:KillMobs(2000)

	--bW:EnterGate('10-2A')
	bW:WalkTo(2241, -624, 2808) -- gate

	return bW
end

