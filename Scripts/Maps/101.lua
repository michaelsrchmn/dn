-- Marian's Shrine Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('11-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:KillMobs(1000)
	bW:WalkTo(-658, 0, -666)
	bW:KillMobs(1000)

	bW:WalkTo(-758, 0, 712)

	bW:WalkTo(-2084, 0, 725)

	bW:WalkTo(-2146, 0, 1330)
	bW:KillMobs(1000)

	bW:WalkTo(-2084, 0, 725)

	bW:WalkTo(-3098, 0, 652)
	bW:KillMobs(2000)

	--bW:EnterGate('11-2A')
	bW:WalkTo(-3188, 0, -583) -- gate

	return bW
end

