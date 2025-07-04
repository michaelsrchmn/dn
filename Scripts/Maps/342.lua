-- Flooded Downstream Ruins Map 1 (342.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('34_2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-658, -43, -6696)
	bW:UseProp(354)
	bW:WalkTo(-2581, -458, -6258) 
	bW:UseProp(355)
	bW:WalkTo(-3340, -443, -6106)
	bW:WalkTo(-3424, -443, -6579)
	bW:ForwardPropTime(357, 5000)
	bW:WalkTo(-3985, -425, -3725)
	bW:WalkTo(-4039, -408, -2939)
	bW:WalkTo(-4039, -408, -2939) 
	bW:WalkTo(-4067, -416, -2247) 
	bW:KillMobs(1500)
	bW:WalkTo(-4024, -421, -1622) 
	bW:Wait(1000)
	bW:WalkTo(-4353, -426, -728) 
	bW:WalkTo(-6212, -177, -394) 
	bW:WalkTo(-6810, -82, 932)
	bW:WalkTo(-4911, -423, 1065) 
	bW:KillMobs(2000)
	bW:WalkTo(-2507, 54, 1555) 
	bW:UseProp(362)
	bW:Wait(2000)
	bW:ForwardPropTime(361, 5000)
	bW:WalkTo(-53, 359, 3975)
    bW:WalkTo(-334, 284, 4566)
    bW:WalkTo(-830, -402, 6727)
	bW:KillMobs(2000)
	bW:WalkTo(-893, -421, 8008)
	return bW
end 