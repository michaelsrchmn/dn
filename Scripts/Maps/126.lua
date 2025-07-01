-- Sleepers' Temple Map 1
require "botWorker"
function GetBotWorker()
	local bW = BotWorker('16-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:UseProp(523)
	bW:Teleport(780, -248, -2489) 
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(523)
	bW:Wait(500)
	bW:UseProp(522)
	bW:Wait(500)
	bW:UseProp(619)
	bW:Teleport(-86, 73, 678)
	bW:KillMobs(2000)
	bW:Teleport(-789, -248, 1804) 
	bW:UseProp(527)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(1000)
	bW:UseProp(527)
	bW:Wait(500)
	bW:UseProp(525)
	bW:Wait(500)
	bW:UseProp(526)--]]
	--------NON-Teleport--------
	bW:WalkTo(14, 73, -1413)
	bW:WalkTo(1899, -248, -1239)
	bW:WalkTo(1636, -248, -2111)
	bW:KillMobs(2000)
	bW:WalkTo(1116, -248, -2380)
	bW:UseProp(523)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:UseProp(523)
	bW:WalkTo(1822, -248, -1263)
	bW:UseProp(522)
	bW:UseProp(619)
	bW:WalkTo(-38, 73, -1297)
	bW:WalkTo(-85, 73, 459)
	bW:KillMobs(2000)
	bW:WalkTo(-52, -248, 2743)
	bW:WalkTo(-1136, -248, 1147)
	bW:UseProp(527)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:UseProp(527)
	bW:Wait(1500)
	bW:UseProp(525)
	bW:UseProp(526)
	bW:WalkTo(-65, -248, 3299) -- gate
	--bW:UseProp(629) -- chest

	--bW:EnterGate('16-3A')

	return bW
end