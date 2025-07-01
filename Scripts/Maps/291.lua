-- Collapsed Mine Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('29-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-1372, 970, -4368)

	bW:WalkTo(-1258, 957, -3769)
	bW:KillMobs(1000)

	bW:WalkTo(25, 959, -3234)
	bW:KillMobs(1500)
	bW:Wait(5000)
	bW:UseProp(61)
	bW:Wait(3000)

	--bW:WalkTo(186, 957, -2653)
	--bW:Teleport(2175, 199, -2959)
	bW:KillMobs(1500)
	--bW:UseProp(346)
	bW:UseProp(358)

	bW:WalkTo(1626, 962, -2683) 

	bW:MoveForward(2188, 188, -2697) 
	bW:WalkTo(2047, 186, -731)
	bW:KillMobs(1500)

	bW:WalkTo(3418, 183, 240)
	bW:KillMobs(2000)

	--bW:WalkTo(1669, 183, -527)
	bW:WalkTo(1490, 190, -633) 
	bW:MoveForward(1453, 208, -705) 
	bW:Wait(3000)
	bW:UseProp(63)
	bW:Wait(8000)
	
	bW:WalkTo(796, 188, -246) 
	bW:MoveForward(173, -564, -68) 

	--bW:Teleport(-337, -565, -873)
	bW:KillMobs(2000)

	bW:WalkTo(-550, -569, -872)

	bW:WalkTo(-1130, -191, -24)
	bW:Wait(2000)
	
	bW:WalkTo(-446, -570, -865) 
	bW:WalkTo(-841, -531, -844) 
	bW:MoveForward(-1276, -157, -13) 
	bW:MoveForward(-650, 82, 650) 
	--bW:EnterGate('29-2A')

	return bW
end
