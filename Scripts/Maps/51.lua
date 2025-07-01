-- Shadow Forest Trail Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('1-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--bW:WalkTo(125, -244, -1530) 
	bW:WalkTo(45, -246, -193) 
	bW:KillMobs(1000)

	--bW:WalkTo(193,-152,-758)
	--bW:KillMobs(1000)

	bW:WalkTo(-158, -203, 913) 
	bW:KillMobs(1000)
	
	bW:WalkTo(1588,-140,1865) 

	--bW:EnterGate('1-2A')
	--bW:Teleport(174, -235, -436)
	--bW:Wait(300)
	--bW:KillMobs(1000)
	
	--bW:Teleport(193, -152, 758)
	--bW:KillMobs(1500)
	
	--bW:Teleport(6, -135, 599)
	--bW:KillMobs(1000)

	return bW
end
