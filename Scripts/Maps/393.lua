-- Captain Darlant's Base 3 (393.lua)
require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('39_BossA')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:KillMobByName("Captain Darlant")
	bW:KillMobs(2000)
	return bW
end 