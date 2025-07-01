-- Sanctuary Core Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('25-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-2169, -464, -2397)

	bW:WalkTo(-509, -262, -2436)
	--bW:Teleport(-509, -262, -2436)
	bW:KillMobs(1500)

	bW:WalkTo(122, -262, -2421)

	bW:WalkTo(1011, -262, -2380)

	bW:WalkTo(925, -262, -148)

	bW:WalkTo(485, -262, 290)
	--bW:Teleport(485, -262, 290)
	bW:Wait(3000)

	bW:WalkTo(-361, -262, 876)
	bW:Wait(5000)
	bW:KillMobs(2000)
	--bW:UseProp(495)
	bW:UseProp(509)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:WalkTo(-1239, -262, 1708)

	bW:WalkTo(-2304, 96, 2859)
	--bW:Teleport(-2304, 96, 2859)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:UseProp(102)
	bW:UseProp(508)
	bW:WalkTo(-3373, 394, 4070)
	--bW:MoveForward(-3373, 394, 4070) -- gate

	return bW
end
