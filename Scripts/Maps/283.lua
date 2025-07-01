-- Dark Overlord Keep 2 (283.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('28_3A')
	bW:WalkTo(-1090, -738, -5407)
	bW:Wait(1000)

	bW:WalkTo(-1191, -1354, -1614)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)
	bW:Wait(4000)
	bW:KillMobsY(8000, 150)

	
	bW:WalkTo(-1280, -1361, -1353) -- center
	
	bW:WalkTo(-1202, -896, 1494) -- gate

	--bW:EnterGate('28_BossA')
	return bW
end