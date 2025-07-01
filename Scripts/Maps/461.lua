-- Sunken Cargo Vessel (461.lua)

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('46_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(-11289, -1494, 3013) 
	bW:WalkTo(-11141, -1494, 3257) 
	bW:ForwardTime(4000)	
	bW:Teleport(6000, -1934, 2962) 
	bW:IgnoreMobs(true)
	bW:DestroyProp(2079)
	bW:WalkTo(4909, -1955, 2064) 
	bW:IgnoreMobs(false)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(3194, -1958, 2029) 
	bW:ForwardPropTime(2098, 4000)--]]
	--------NON-Teleport--------
	bW:IgnoreMobs(true)
	bW:WalkTo(-9949, -1903, -5483) 
	bW:IgnoreMobs(false)
	bW:KillMobs(2000)
	bW:WalkTo(-10868, -2161, -3224) 
	bW:KillMobs(2000)
	bW:WalkTo(-11167, -1770, -595) 
	bW:DestroyProp(2077)
	bW:WalkTo(-11143, -1634, 481) 
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(-11289, -1494, 3013) 
	bW:WalkTo(-11141, -1494, 3257) 
	bW:ForwardTime(4000)
	bW:IgnoreMobs(true)
	bW:WalkTo(4354, -1946, 3574) 
	bW:DestroyProp(2071)
	bW:DestroyProp(2281)
	bW:IgnoreMobs(false)
	bW:WalkTo(4419, -1967, 2511) 
	bW:KillMobs(2000)
	bW:WalkTo(3194, -1958, 2029) 
	bW:ForwardPropTime(2098, 4000)
	return bW
end