--Intruder's Forward Base (710.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('71_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(-1462, -919, -5850)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Teleport(263, -874, -4365)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Teleport(1390, -900, -3638) 
	bW:ForwardPropTime(496, 1000)
	bW:KillMobs(2000)
	bW:Teleport(4887, -1024, -250) 
	bW:KillMobs(2000)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(4000)
	bW:Teleport(4127, -1019, 1197)
	bW:ForwardPropTime(424, 3000)
	bW:KillMobs(2000)
	bW:Teleport(1330, -1265, 2804) 
	bW:ForwardPropTime(929, 1000)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:Teleport(-6899, -888, 6231) 
	bW:Wait(4000)
	bW:KillMobs(2000)--]]
	--------NON-Teleport--------
	bW:WalkTo(-1864, -903, -6235) 
	bW:KillMobs(2000)
	bW:WalkTo(-32, -881, -4736) 
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(4919, -1022, -221) 
	bW:KillMobs(2000)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:Wait(4000)
	bW:KillMobs(2000)
	bW:WalkTo(3067, -1260, 1761) 
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(3067, -1260, 1761) 
	bW:WalkTo(751, -1265, 3170) 
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:WalkTo(54, -1264, 3603) 
	bW:ForwardPropTime(929,2000)
	bW:WalkTo(-6715, -891, 6200) 
	bW:KillMobs(2000)
	return bW
end