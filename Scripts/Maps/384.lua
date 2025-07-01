-- Road to Death City Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('38_BossA')
	bW:WalkTo(-14, -36, -2615)
	bW:DestroyProp(109)
	bW:WalkTo(27, 14, -57)
	bW:KillMobByName('Freia')
	bW:KillMobByName('Dark Elf Impostor Karen')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end
