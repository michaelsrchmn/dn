-- Ancient Temple Excavation Site Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('5-1A')
	--
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--bW:Teleport(-2167,-408,-277)
	bW:WalkTo(-2167,-408,-277)
	bW:KillMobs(1000)

	bW:WalkTo(-1178, -394, 145)
	--bW:Teleport(-1178, -394, 145)
	bW:KillMobs(1000)

	bW:WalkTo(-414, -378, 160)

	bW:WalkTo(1324, -336, 1634)
	--bW:Teleport(1324, -336, 1634)
	bW:KillMobs(1000)

	--bW:EnterGate('5-2A')
	bW:WalkTo(2923, -306, 3167) -- gate

  return bW
end
