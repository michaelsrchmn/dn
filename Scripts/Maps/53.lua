-- Shadow Forest Trail Map 3

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('1-BossA')
	bW:WalkTo(420, -148, 586) 
	bW:UseProp(171)
	bW:KillMobByName('Orc Kromish')
	bW:KillMobs(10000)
	bW:Wait(5000)
	bW:Finish()


	return bW
end
