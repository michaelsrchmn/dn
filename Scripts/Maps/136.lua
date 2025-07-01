-- Raiders Ambush Point Map 1

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('18-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(245, -1355, 1748)
	bW:KillMobs(1000)
	bW:DestroyProp(383)
	bW:KillMobs(1000)
	bW:DestroyProp(386)

	bW:WalkTo(-932, -1126, 941)
	bW:KillMobs(2000)

	bW:WalkTo(-651, -1148, -1018)
	bW:DestroyProp(384)

	bW:WalkTo(-571, -1173, -1324)
	bW:KillMobs(1000)

	bW:WalkTo(491, -1195, -2205) -- gate
	--bW:EnterGate('18-2A')
	--[[
	bW:Teleport(-42, -1320, 1656) 
	bW:KillMobs(1000)
	
	bW:Teleport(-1473, -1103, 763) 
	bW:KillMobs(1000)
	
	bW:Teleport(-511, -1195, -1906) 
	bW:KillMobs(1500)--]]

	return bW
end
