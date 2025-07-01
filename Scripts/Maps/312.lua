-- Abandoned Welton Hollow Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('31_2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-4176, -2247, -2688)

	bW:WalkTo(-4396, -2367, -728)
	bW:KillMobs(2000)

	bW:WalkTo(-3196, -2346, 326)

	bW:WalkTo(-2359, -2335, 223)

	bW:WalkTo(-1266, -2068, -1657)
	bW:KillMobs(1000)

	bW:WalkTo(641, -1966, -1302)
	bW:KillMobs(1000)
	bW:UseProp(797)

	bW:WalkTo(732, -1968, -1366)

	bW:WalkTo(1070, -1958, -1655)

	bW:WalkTo(1604, -1965, -1375)

	bW:WalkTo(2010, -1959, -1044)

	bW:WalkTo(2101, -1956, -971)
	bW:KillMobs(2000)

	bW:WalkTo(1663, -1769, 1716) -- gate
	--bW:EnterGate('31_3A')
	return bW
end

