-- Forest Sanctuary Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('15-3A')
	bW:WalkTo(-1459, -427, 749)

	bW:WalkTo(-328, -427, 785)

	bW:WalkTo(-295, -58, 2121)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:UseProp(507)
	bW:Wait(1000)
	bW:UseProp(508)

	bW:WalkTo(-815, -58, -86)
	bW:KillMobs(1000)
	bW:Wait(3000)
	bW:UseProp(509)
	bW:Wait(1000)
	bW:UseProp(510)

	bW:WalkTo(-900, -58, 2084)

	bW:WalkTo(-340, -58, 1862)

	bW:WalkTo(-358, -427, 764)

	--bW:WalkTo(1705, -427, -880)
	--bW:Teleport(955, -427, -367)
	bW:WalkTo(1705, -427, -880)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:WalkTo(2101, -427, -888) -- gate


	return bW
end
