-- Church Ruins Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('19-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(1795, -195, -1889)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(1457, -195, -1372)
	bW:DestroyProp(338)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(-1815, -45, -1810)
	bW:KillMobs(2000)

	bW:WalkTo(-2189, -45, -400)
	bW:DestroyProp(339)
	bW:Wait(2000)
	bW:KillMobs(3000)

	--bW:EnterGate('19-3A')
	bW:WalkTo(-2597, -44, 2445) 

	return bW
end
