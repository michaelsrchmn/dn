-- Dried Marissa Springs Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('35_3A')
	--bW:WalkTo(1211, -530, -4416)

	--bW:WalkTo(777, -634, -1972)
	--bW:KillMobs(1000)

	--bW:WalkTo(-585, -749, -1870)
	--bW:DestroyProp(543)
	--bW:KillMobs(2000)

	--bW:WalkTo(-336, -1460, -3992)
	--bW:KillMobs(2500)
	--bW:Wait(5000)
	--bW:KillMobs(2000)

	--bW:WalkTo(1141, -1621, -3390)
	--bW:DestroyProp(606)
	--bW:DestroyProp(589)
	--bW:DestroyProp(604)
	--bW:DestroyProp(551)
	--bW:DestroyProp(193)
	--bW:WalkTo(2113, -1629, -3195)
	--bW:KillMobByName('Follower Ogre Barbarian')
	--bW:KillMobByName('Follower Spark Skeleton')
	--bW:KillMobs(5000)
	bW:Teleport(-889, -1300, -3840)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:EnterGate('35_BossA')

	return bW
end
