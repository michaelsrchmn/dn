--Gates to Death City Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('42-3A')
	--[[---------Teleport-----------
	bW:Teleport(3018, -606, -2382) 
	bW:Wait(2000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-2884, -604, -3024) 
	bW:KillMobs(2000)
	bW:WalkTo(-2403, -604, -2749) 
	bW:WalkTo(-1494, -606, -2896) 
	bW:WalkTo(234, -606, -2716) 
	bW:WalkTo(618, -606, -3315) 
	bW:UseProp(358)
	bW:Wait(5000)
	bW:WalkTo(766, -606, -4157) 
	bW:KillMobs(2000)
	bW:WalkTo(1322, -606, -4089) 
	bW:WalkTo(3080, -606, -3843) 
	bW:WalkTo(2963, -606, -2441) 
	bW:KillMobs(2000)
	bW:WalkTo(4649, -606, -2268) 
	return bW
end