-- Forest Sanctuary Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('15-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(78, 3, -1905)

	bW:WalkTo(137, 3, 739)
	bW:Wait(7000)
	bW:KillMobs(3000)
	
	bW:WalkTo(166, 3, 4065) -- gate
	--[[bW:Teleport(137, 3, 739)
	bW:Wait(7000)
	bW:KillMobs(3000)

	bW:EnterGate('15-3A')--]]

	return bW
end
