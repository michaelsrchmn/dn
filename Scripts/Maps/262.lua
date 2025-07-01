-- Prayer's Resting Place Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('26-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	
	bW:WalkTo(-1501, -699, -2710) 
	bW:KillMobs(1000)
	bW:Wait(3000)
	bW:WalkTo(1132, -667, -2743) 
	bW:KillMobs(1000)
	bW:WalkTo(1340, -457, -1155) 
	bW:WalkTo(-1185, 404, -1069) 
	bW:WalkTo(-259, 627, -110) 
	bW:KillMobs(1000)
	bW:Wait(2000)
	bW:KillMobs(1000)
	bW:WalkTo(-223, 761, 252) 
	bW:MoveForward(-179, 1223, 1876) 
	bW:Teleport(-438, 1212, 2134) 
	bW:Wait(600)
	bW:MoveForward(-300, 1213, 2252) 
	bW:Teleport(-78, 1222, 2301) 
	bW:Wait(600)
	bW:MoveForward(-229, 1222, 2454) 
	bW:Teleport(-443, 1300, 2502) 
	bW:Wait(600)
	--bW:MoveForward(-333, 1213, 2213) 
	bW:Teleport(-104, 1222, 2306) 
	bW:Wait(600)
	bW:MoveForward(-192, 1223, 2399) 
	bW:Teleport(-445, 1300, 2508)  
	bW:Wait(600)
	bW:MoveForward(-341, 1301, 2583) 
	bW:Teleport(-194, 1366, 2735) 
	bW:Wait(600)
	bW:MoveForward(-300, 1368, 2836) 
	bW:Teleport(-531, 1423, 2927) 
	bW:Wait(600)
	bW:MoveForward(-442, 1424, 3027) 
	bW:Teleport(-247, 1479, 3237) 
	bW:Wait(600)
	bW:WalkTo(-229, 1510, 3717) 
	bW:DestroyProp(937)
	bW:WalkTo(-239, 1517, 4264) 
	--bW:WalkTo(-68,-1233,-1892)

	--[[bW:WalkTo(-1466, -844, 1906)

	bW:WalkTo(-1511, -699, -2635)
	--bW:Teleport(-1511, -699, -2635)
	bW:KillMobs(800)
	bW:Wait(5000)
	bW:KillMobs(800)
	
	bW:WalkTo(1024, -674, -2755)
	--bW:Teleport(1024, -674, -2755)
	bW:KillMobs(800)
	bW:Wait(5000)
	bW:KillMobs(800)
	bW:Wait(5000)
	bW:KillMobs(800)

	bW:WalkTo(1440, -457, -1197)

	bW:WalkTo(-1199, 404, -1101)

	bW:WalkTo(-1187, 574, -281)

	bW:WalkTo(-422, 624, -130) 
	bW:KillMobs(800)
	bW:Wait(2000)
	--bW:Teleport(-324, 657, -17)
	bW:KillMobs(800)

	bW:WalkTo(-216, 1233, 1652)
	bW:Teleport(-212, 1509, 3694)
	bW:Wait(1000)
	bW:DestroyProp(937)
	bW:Wait(3000)

	bW:WalkTo(-238, 1515, 4293) -- gate
	--bW:EnterGate('26-3A')--]]
	return bW
end

