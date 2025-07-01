-- Sigh Canyon Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('14-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[
	bW:WalkTo(517, 148, 1681)
	bW:DestroyProp(334)
	bW:DestroyProp(328)
	bW:KillMobs(1500)
	bW:DestroyProp(321)
	bW:KillMobs(1000)

	bW:WalkTo(981, -23, 925)

	bW:WalkTo(1561, 16, 1777)
	bW:DestroyProp(319)
	bW:KillMobs(1000)

	bW:WalkTo(2828, 118, 2249)

	bW:WalkTo(3211, 310, 1811)
	bW:KillMobs(500)

	bW:WalkTo(2780, 368, 1052)
	bW:DestroyProp(335)

	bW:WalkTo(2371, 366, 870)
	bW:KillMobs(1000)
	bW:DestroyProp(320)
	bW:KillMobs(1000)

	bW:WalkTo(1705, 15, 2644) -- gate
	--bW:EnterGate('14-3A')--]]
	-- Sigh Canyon Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('14-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[
	bW:WalkTo(517, 148, 1681)
	bW:DestroyProp(334)
	bW:DestroyProp(328)
	bW:KillMobs(1500)
	bW:DestroyProp(321)
	bW:KillMobs(1000)

	bW:WalkTo(981, -23, 925)

	bW:WalkTo(1561, 16, 1777)
	bW:DestroyProp(319)
	bW:KillMobs(1000)

	bW:WalkTo(2828, 118, 2249)

	bW:WalkTo(3211, 310, 1811)
	bW:KillMobs(500)

	bW:WalkTo(2780, 368, 1052)
	bW:DestroyProp(335)

	bW:WalkTo(2371, 366, 870)
	bW:KillMobs(1000)
	bW:DestroyProp(320)
	bW:KillMobs(1000)

	bW:WalkTo(1705, 15, 2644) -- gate
	--bW:EnterGate('14-3A')--]]
	bW:IgnoreMobs(true)
	bW:MoveForward(1063, -27, 894) 
	bW:MoveForward(552, 140, 1663) 
	bW:DestroyProp(334)
	bW:DestroyProp(328)
	bW:MoveForward(583, 275, 2211) 
	bW:DestroyProp(321)
	bW:MoveForward(779, -9, 969)
	bW:MoveForward(1508, 7, 1722) 
	bW:DestroyProp(319)
	bW:MoveForward(2306, 105, 2224) --
	bW:MoveForward(2760, 83, 2377) 
	bW:MoveForward(3384, 319, 1333) 
	bW:MoveForward(2806, 368, 1073) 
	bW:DestroyProp(335)
	bW:MoveForward(2396, 367, 881) 
	bW:DestroyProp(320)
	bW:MoveForward(2806, 368, 1073) 
	bW:MoveForward(3384, 319, 1333) 
	bW:MoveForward(2760, 83, 2377) 
	bW:MoveForward(2306, 105, 2224)
	bW:MoveForward(1667, 24, 2213) 
	bW:ForwardPropTime(342, 10000)
  return bW
end 