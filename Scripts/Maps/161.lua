-- Silent Monastery Main Hall Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('22-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--bW:WalkTo(-72, 0, -989)
	bW:WalkTo(-108, 0, -912) 
	--bW:DestroyProp(626)
	bW:DestroyProp(602)
	bW:KillMobs(1500)

	bW:WalkTo(311, 0, -910) 
	bW:WalkTo(490, 30, -935) 
	bW:WalkTo(592, 0, -967) 
	bW:WalkTo(1053, 0, -1013)
	bW:Wait(3000)
	bW:KillMobs(1000)

	bW:WalkTo(1865, 0, -1016)

	bW:WalkTo(1715, 0, 1583)

	bW:WalkTo(158, 0, 1572)

	bW:WalkTo(-42, 0, 1637)
	--bW:Teleport(-42, 0, 1637)
	bW:KillMobs(2000)
	bW:DestroyProp(430)
	bW:Wait(3000)

	bW:KillMobs(2000)

	bW:WalkTo(-47, 0, 2547) 
	--bW:EnterGate('22-3A')

	return bW
end
