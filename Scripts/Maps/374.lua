-- Spirit Grave Tomb Map 3

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('37_BossA')
	bW:UseProp(60)
	bW:UseProp(61)
	bW:WalkTo(853, -72, -295)
	bW:KillMobByName('Gargoyle Noxius')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end