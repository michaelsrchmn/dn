-- Encroached Temple Ruins Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('62_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	
	bW:WalkTo(547, 255, -4043) 
	bW:KillMobs(1000)
	bW:Wait(5000)
	bW:WalkTo(1063, 192, -2001) 
	bW:KillMobsY(2000, 100)
	bW:WalkTo(419, 191, -1162) 
	bW:WalkTo(446, 365, -2134) 
	bW:KillMobsY(2000, 150)
	bW:WalkTo(-1098, 161, -1825) 
	bW:WalkTo(-1999, 92, -1097) 
	bW:MoveForward(-1879, 81, -425) 
	bW:MoveForward(-105, -129, 184) 
	bW:KillMobs(1500)
	bW:Wait(3000)
	bW:WalkTo(589, -269, 438) 
	bW:KillMobs(1000)
	bW:WalkTo(1166, -382, 835) 
	bW:WalkTo(2277, -257, 1199) 
	bW:KillMobs(1000)
	bW:WalkTo(1244, -235, 2252) 
	bW:WalkTo(292, -428, 1772) 
	bW:MoveForward(-914, -450, 1552) 
	bW:MoveForward(-1972, -449, 1891) 
	bW:MoveForward(-1718, -336, 3191) 
	bW:KillMobs(1500)
	bW:WalkTo(-1354, -328, 3142) 
	bW:WalkTo(-1203, -465, 4295) 
	bW:KillMobs(1500)
	bW:WalkTo(-565, -453, 4599) 
	
	return bW
end