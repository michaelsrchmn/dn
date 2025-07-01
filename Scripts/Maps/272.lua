-- Dark Mines Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('27_2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[bW:Wait(3000)
	bW:Teleport(-325, 310, 594)
	bW:WalkTo(-411, 317, -439)
	bW:Wait(2000)
	bW:KillMobs(1500)
	bW:Wait(70000)
	bW:WalkTo(-361, 326, -3508)
	bW:KillMobs(1500)--]]
	
	bW:UseProp(473)
	bW:WalkTo(-380, 325, 2134)

	bW:WalkTo(717, 315, 2113)
	bW:KillMobs(1000)
	bW:Wait(2000)
	bW:KillMobs(1000)

	bW:WalkTo(2054, 308, 211)
	bW:Wait(3000)
	bW:KillMobs(1000)
	bW:UseProp(453)

	bW:WalkTo(2755, 310, 98)
	bW:DestroyProp(215)

	bW:WalkTo(3719, 196, 823)
	bW:DestroyProp(196)
	bW:KillMobs(1000)

	bW:WalkTo(2225, 306, 2773)

	bW:WalkTo(1532, 317, 2996)
	bW:DestroyProp(188)

	bW:WalkTo(-364, 331, 2056)

	bW:WalkTo(-240, 312, 1462) 
	bW:Wait(10000)
	bW:UseProp(175)
	bW:Wait(8000)

	bW:WalkTo(-405, 314, -375)
	bW:Wait(2000)
	bW:KillMobs(1000)

	bW:WalkTo(-51, 322, -3179)
	bW:DestroyProp(456)
	bW:UseProp(473)
	bW:KillMobs(1000)

	bW:WalkTo(-7, 313, -3265)
	bW:DestroyProp(470)

	bW:WalkTo(-720, 315, -3779)
	bW:WalkTo(-714, 316, -3785) 
	--bW:EnterGate('27_3A')
	return bW
end

