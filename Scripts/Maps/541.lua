-- Dragon Follower Base Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('54_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	--bW:Teleport(192, -2028, -6016)
	--bW:WalkTo(289, -2024, -5809)
	--bW:Wait(6000)
	--bW:KillMobs(2000)

	--bW:Teleport(140,- 1933, -4363)
	--bW:WalkTo(1140, -1885, -2492)
	--bW:Wait(1000)
	--bW:KillMobs(1500)

	--bW:WalkTo(2416, -1523, 89)
	--bW:Teleport(2416, -1523, 89)
	--bW:Wait(2000)
	--bW:KillMobs(2000)
	bW:Teleport(827, -2018, -1632)
	bW:WalkTo(224, -1994, -1435)
	bW:Wait(3000)

	bW:Teleport(3460, -2070, 8446)
	bW:WalkTo(4399, -2070, 8438)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(6762, -2070, 8430)
	bW:Wait(2000)
	bW:KillMobs(2000)

	--bW:Teleport(3606, -1359, 3745)
	bW:Teleport(8279, -2047, 8451)
	bW:Wait(3000)
	bW:WalkTo(2719, -1154, 3711)
	bW:WalkTo(2384, -1117, 3715)
	bW:WalkTo(1429, -119, 3716)
	bW:Wait(5000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	--bW:WalkTo(317, -2044, -6579) 
	bW:WalkTo(322, -2031, -7368) 
	bW:ForwardTime(3000)
	bW:KillMobs(2000)
	bW:WalkTo(245, -2024, -4945) 
	bW:WalkTo(1014, -1891, -2630) 
	bW:KillMobs(2000)
	bW:WalkTo(2435, -1704, -808) 
	bW:KillMobs(2000)
	--bW:WalkTo(784, -2026, -1602) 
	bW:WalkTo(558, -2000, -1440) 
	bW:ForwardPropTime(163, 1000)
	bW:WalkTo(3758, -2070, 8467) 
	bW:ForwardPropTime(164, 2000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:IgnoreMobs(true)
	bW:WalkTo(6757, -2070, 8402) 
	bW:IgnoreMobs(false)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:WalkTo(7959, -2070, 8488) 
	bW:ForwardPropTime(164, 2000)
	bW:WalkTo(2832, -1181, 3700) 
	bW:ForwardPropTime(254, 3000)
	bW:KillMobs(2000)
	bW:WalkTo(324, -1074, 3683) 
	bW:ForwardPropTime(173, 1000)
	return bW
end