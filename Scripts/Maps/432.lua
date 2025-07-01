-- Fortress of the Dark Overlord Army Map 2

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('43_BossA')
	bW:WalkTo(-506, -183, -580)
	bW:KillMobsY(5000, 200)
	bW:KillMobsY(5000, 200)
	bW:KillMobsY(5000, 200)
	bW:Wait(5000)
	bW:KillMobsY(5000, 200)
	bW:KillMobByName('Casitas')

	return bW
end
