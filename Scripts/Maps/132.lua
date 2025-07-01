-- Forest of Death Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('17-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-963, -56, -677)
	bW:KillMobs(2000)

	bW:WalkTo(1984, -36, 1280)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(416)

	bW:WalkTo(-820, -40, -42)
	bW:WalkTo(-1336, 0, 452) 
	bW:WalkTo(-1820, -156, 1448)
	bW:KillMobs(4000)
	bW:Wait(2000)
	bW:UseProp(418)
	bW:UseProp(421)
	
	bW:WalkTo(-1464, -285, 2539) -- gate
	--bW:EnterGate('17-3A')
	--[[bW:Teleport(-781, -66, -455) 
	bW:KillMobs(2000)
	
	bW:Teleport(1321, -3, 724)
	bW:WalkTo(1984, -36, 1280)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(416)
	
	bW:Teleport(-1171, 0, 286) 
	bW:WalkTo(-1820, -156, 1448)
	bW:KillMobs(4000)
	bW:UseProp(418)
	bW:UseProp(421)--]]

	return bW
end
