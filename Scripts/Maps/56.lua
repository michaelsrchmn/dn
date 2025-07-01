-- Ancient Temple Ruins Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('2-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-1906,17,-1226)
	bW:KillMobs(3000)

	--bW:UseProp(187)

	bW:WalkTo(-1391,32,-812)
	bW:KillMobs(1000)
	
	bW:WalkTo(1162, 145, 1337)
	--bW:EnterGate('2-2A')
	
	--bW:UseProp(187)
	--bW:Teleport(-1319, 110, 1618)
	--bW:Wait(500)
	--bW:LootItems(1000)
	--[[bW:Teleport(-1352, 15, -688)
	bW:KillMobs(3000)--]]

	return bW
end

