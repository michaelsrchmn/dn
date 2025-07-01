-- Sleepers' Temple Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('16-3A')
	--[[---------Teleport-----------
	bW:Teleport(7, 196, -1044) 
	bW:DestroyProp(715)
	bW:DestroyProp(713)
	bW:DestroyProp(714)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(482)
	bW:Wait(500)
	bW:UseProp(481)
	bW:Wait(500)
	bW:UseProp(485)--]]
	--------NON-Teleport--------
	bW:WalkTo(20, 196, -1108) 
	bW:DestroyProp(713)
	bW:DestroyProp(714)
	bW:DestroyProp(715)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(482)
	bW:Wait(500)
	bW:UseProp(481)
	bW:Wait(500)
	bW:UseProp(485)
	bW:WalkTo(16, 196, 1795)  -- gate
	--bW:EnterGate('16-BossA')

	return bW
end