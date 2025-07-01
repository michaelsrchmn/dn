-- Dark Overlord Tower Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('40-3A')

	bW:WalkTo(-4757, -1269, -3471)
	bW:Wait(5000)
	bW:KillMobsY(5000,250)

	bW:WalkTo(-4757, -1269, -3471)

	bW:WalkTo(-453, -901, -2188)
	bW:KillMobsY(1500,150)

	bW:WalkTo(-2052, -549, -2131)
	bW:KillMobsY(1500,150)

	bW:WalkTo(-713, -221, -749)
	bW:KillMobsY(2000,150)

	--bW:EnterGate('40_BossA')

	return bW
end
