-- Valley of Blindness Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('67_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:Teleport(-3943, 9, -5179)
	bW:WalkTo(-3762, 28, -5259)
	bW:Wait(3000)
	bW:KillMobByName('Jamila Totem Tree')
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)

	bW:Teleport(-1607, 505, -2123)
	bW:WalkTo(-1236, 493, -2125)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:WalkTo(2194, 509, -2203)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)

	bW:Teleport(2280, 612, 1322)
	bW:WalkTo(1463, 904, 2573)
	bW:KillMobs(2000)

	bW:Teleport(-2137, 1173, 3152)
	bW:WalkTo(-2584, 1173, 3488)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:Teleport(-949, 1520, 6281)
	bW:WalkTo(163, 1607, 6319)
	bW:KillMobs(2000)

	return bW
end
