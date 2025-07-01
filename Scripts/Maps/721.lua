--Tel Noir Temple (721.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('72_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(-2747, -66, -2630) 
	bW:ForwardPropTime(802, 500)
	bW:Wait(20000)
	bW:KillMobs(2000)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:WalkTo(-2288, -68, -1602) 
	bW:ForwardPropTime(802, 3000)
	bW:ForwardPropTime(1014, 20000)
	bW:ForwardPropTime(1115, 10000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-5958, 1581, -9671) 
	bW:KillMobs(2000)
	bW:WalkTo(-5539, 1586, -8836) 
	bW:ForwardPropTime(763, 4000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:WalkTo(-3963, 1541, -5292) 
	bW:ForwardPropTime(371, 10000)
	bW:Wait(22000)
	bW:KillMobs(2000)
	bW:Wait(5000)
	bW:KillMobs(2000)
	bW:WalkTo(-2288, -68, -1602) 
	bW:ForwardPropTime(802, 3000)
	bW:ForwardPropTime(1014, 10000)
	bW:KillMobs(2000)
	bW:ForwardPropTime(1014, 10000)
	bW:ForwardPropTime(1115, 10000)
	bW:KillMobByName("Warlord Hubert")
	bW:KillMobs(2000)
	return bW
end