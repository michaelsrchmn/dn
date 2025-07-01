-- Raiders Den Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('13-BossA')
	bW:KillMobByName('Dark Elf Assassin Lydia')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end
