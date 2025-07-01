-- Road of No Return Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('23-3A')
	bW:WalkTo(1171, -1158, 234)

	bW:WalkTo(-81, -1168, 149)

	bW:WalkTo(-16, -1154, -574)
	bW:DestroyProp(629)
	bW:WalkTo(-149, 1046, -1305)
	bW:KillMobs(1500)

	bW:WalkTo(-105, -1083, -1166)

	bW:WalkTo(9, -1114, 1273)
	bW:DestroyProp(630)

	bW:WalkTo(52, -1055, 1763)
	bW:KillMobs(1500)

	bW:WalkTo(52, -1055, 1763)

	bW:WalkTo(-85, -1167, 143)

	bW:UseProp(664)
	bW:WalkTo(-2297, -1150, 263)
	bW:KillMobs(3000)

	bW:WalkTo(-3699, -1150, 527) -- gate
	--bW:EnterGate('23-BossA')--[[
	--[[bW:Teleport(-217, -989, -1760) 
	bW:KillMobs(2000)
	
	bW:Teleport(-147, -1000, 2208)
	bW:KillMobs(2000)

	bW:Teleport(-3040, -1151, 233) 
	bW:KillMobs(2000)--]]
	return bW
end
