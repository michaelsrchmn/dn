-- Floating Island Core

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('65_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(1379, 1104, -2265)
	bW:Wait(5000)
	bW:KillMobs(2000)

	bW:Teleport(-2030, 847, -1902)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:Teleport(-1329, 742, -48)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:Teleport(-1179, 531, 2690)
	bW:Wait(3000)
	bW:KillMobs(2500)

	bW:Teleport(3588, 114, 4776)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:Teleport(5629, -579, 424)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:Teleport(6704, -900, -2804)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:Finish()

	return bW
end
