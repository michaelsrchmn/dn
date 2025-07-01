-- Dark Tower Magic Institute Map 2 (153.lua)

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('21-3A')
	AddMobToIgnoreList(0, 'Blizzard Vampire Bat')
	AddMobToIgnoreList(1, 'Blizzard Baby Tarantula')
	AddMobToIgnoreList(2, 'Blizzard Dwarf Tarantula')
	--[[bW:Teleport(-2075, 0, -2190)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:DestroyProp(414)

	bW:Teleport(1431, 0, -1331)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(1494, 0, 716)
	bW:Wait(1000)
	bW:KillMobs(1000)--]]
	bW:WalkTo(-1959, 0, -1617)

	bW:WalkTo(-2075, 0, -2190)
	bW:KillMobs(1000)
	bW:DestroyProp(414)

	bW:WalkTo(-1808, 0, -2695)
	bW:KillMobs(1000)
	bW:WalkTo(1405, 0, -2927)
	bW:UseProp(617)
	bW:WalkTo(1431, 0, -1331)
	bW:KillMobs(1000)

	bW:WalkTo(1800, 0, -295)
	bW:DestroyProp(443)
	bW:KillMobs(2000)
	bW:DestroyProp(546)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:WalkTo(1390, 0, 1217) 
	bW:ForwardPropTime(487, 20000)
	
	--bW:WalkTo(1323, 0, 1618) -- gate
	--bW:EnterGate('21-BossA')

	return bW
end