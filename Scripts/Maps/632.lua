-- Meteor Crash Site Core Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('63_BossA')
	-- bW:KillMobByName('Death Knight Edmund')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end
