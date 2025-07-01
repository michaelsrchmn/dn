-- Orc Base Camp Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('12-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-130, -1453, -655)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:KillMobs(2000)

	--bW:WalkTo(-32, -1457, 127)
	--bW:KillMobs(1000)

	bW:WalkTo(-141, -1455, 1550)
	bW:KillMobs(3000)
	bW:Wait(2000)
	bW:KillMobs(3000)
	bW:Wait(2000)
	bW:KillMobs(3000)
	bW:Wait(2000)
	bW:KillMobs(3000)
	bW:Wait(2000)
	bW:KillMobs(3000)

	--bW:EnterGate('12-BossA')
	bW:WalkTo(-85, -1453, 3198) -- gate

	return bW
end

