--Gates to Death City Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('42-BossA')
	--[[---------Teleport-----------
	bW:Teleport(3733, 202, -1243) 
	bW:KillMobByName("Rrrumble")
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(3789, 202, -1961) 
	bW:KillMobByName("Rrrumble")
	bW:KillMobs(2000)
	return bW
end