--Nameless Tyrant Tomb Map 4 (444.lua)

require "botWorker"

function GetBotWorker()
	local bW = BotWorker('44-BossA')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--------NON-Teleport--------
	bW:Wait(2000)
	bW:KillMobs(2000)
	return bW
end