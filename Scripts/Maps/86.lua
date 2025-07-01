-- Parelina's Resting Place Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('8-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-2015,-311,-1360)

	--bW:UseProp(200)

	bW:WalkTo(-1625, -309, 332)
	--bW:Teleport(-1625, -309, 332)
	bW:KillMobs(2000)

	bW:WalkTo(-667, 307, 285)
	--bW:Teleport(-667, 307, 285)
	bW:KillMobs(2000)
	
	bW:WalkTo(-1390, -158, 2283) -- gate

	--bW:EnterGate('8-2A')
	return bW
end

