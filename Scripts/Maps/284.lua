-- Dark Overlord Keep 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('28_BossA')
	bW:AddMobToIgnoreList(1, 'Gargoyle')
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:KillMobs(10000)
	bW:RemoveMobFromIgnoreList(1)
	bW:KillMobs(10000)
	bW:KillMobByName('Gargoyle')

	--bW:Finish()

	return bW
end
